window.addEventListener("DOMContentLoaded",function(){

    loadHeaderProfile();

});



async function loadHeaderProfile(){

    const container=document.getElementById("headerRight");

    if(!container) return;

    const [profileResponse,sessionResponse]=await Promise.all([
        fetch("/api/profile"),
        fetch("/api/session")
    ]);

    if(!profileResponse.ok) return;

    const p=await profileResponse.json();

    const s=sessionResponse.ok? await sessionResponse.json():{loggedIn:false};

    container.innerHTML="";

    if(s.loggedIn){

        // The pill only shows the signed-in name now, not a fallback
        // to the locally-registered profile name - previously this
        // fell back to p.name whenever not logged in, which meant
        // signing out still left the previous identity showing here
        // (only the session pill next to it changed), looking like
        // sign-out hadn't actually taken effect.
        const displayName=s.handle;

        const link=document.createElement("a");

        link.className="profilePill";

        link.href="/profile";

        const avatar=p.photoFilename?document.createElement("img"):document.createElement("span");

        avatar.className=p.photoFilename?"avatarCircle avatarImage":"avatarCircle";

        if(p.photoFilename){

            avatar.src="/uploads/"+encodeURIComponent(p.photoFilename);

            avatar.alt=displayName;

        }

        else{

            avatar.textContent=(displayName.trim().charAt(0)||"?").toUpperCase();

        }

        const name=document.createElement("span");

        name.textContent=displayName;

        link.appendChild(avatar);

        link.appendChild(name);

        container.appendChild(link);

    }

    else if(!p.registered){

        const link=document.createElement("a");

        link.href="/profile/edit";

        const button=document.createElement("button");

        button.className="registerButton";

        button.textContent="Register Profile";

        link.appendChild(button);

        container.appendChild(link);

    }

    // else: registered locally but not signed in - leave empty, so
    // "Sign in" (session-nav.js) is the only thing shown here rather
    // than a name that looks like an active identity when it isn't.

}
