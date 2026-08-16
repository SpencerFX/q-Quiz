document.addEventListener("DOMContentLoaded",function(){

    wireAuthStub("googleSignInButton","googleSignInNote","/auth/google","Google sign-in is not available.");

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
