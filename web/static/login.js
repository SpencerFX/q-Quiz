document.addEventListener("DOMContentLoaded",function(){

    wireAuthStub("googleSignInButton","googleSignInNote","/auth/google","Google sign-in is not available.");

    wireAuthStub("appleSignInButton","appleSignInNote","/auth/apple","Apple sign-in is not available.");

    wireAuthStub("linkedinSignInButton","linkedinSignInNote","/auth/linkedin","LinkedIn sign-in is not available.");

});



function wireAuthStub(buttonId,noteId,endpoint,fallbackMessage){

    const button=document.getElementById(buttonId);

    const note=document.getElementById(noteId);

    if(!button) return;

    button.addEventListener("click",async function(){

        const response=await fetch(endpoint);

        const data=await response.json();

        note.textContent=data.error||fallbackMessage;

        note.style.display="block";

    });

}



// Called by Google Identity Services once the user picks an account in
// the real Google sign-in button (see login.html's #g_id_onload -
// data-callback references this by name). response.credential is a
// signed ID token JWT - verified server-side in /api/auth/google, never
// trusted client-side.
async function handleGoogleCredential(response){

    const note=document.getElementById("googleSignInNote");

    const result=await fetch("/api/auth/google",{

        method:"POST",

        headers:{ "Content-Type":"application/json" },

        body:JSON.stringify({ credential:response.credential })

    });

    const data=await result.json();

    if(!result.ok){

        if(note){

            note.textContent=data.error||"Google sign-in failed.";

            note.style.display="block";

        }

        return;

    }

    // /login?next=... is how the "sign in first" redirect (app.py's
    // _require_login_for_gated_pages) sends the user here - honor it
    // so signing in with Google lands back on the page they wanted,
    // same as the plain handle form (which passes it as a hidden
    // field instead, since that's a normal POST).
    const next=new URLSearchParams(window.location.search).get("next");

    window.location=(next&&next.startsWith("/")&&!next.startsWith("//"))? next:"/";

}
