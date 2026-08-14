window.addEventListener("DOMContentLoaded",function(){

    loadHeaderProfile();

});



async function loadHeaderProfile(){

    const container=document.getElementById("headerRight");

    if(!container) return;

    const response=await fetch("/api/profile");

    if(!response.ok) return;

    const p=await response.json();

    container.innerHTML="";

    if(p.registered){

        const link=document.createElement("a");

        link.className="profilePill";

        link.href="/profile";

        const avatar=document.createElement("span");

        avatar.className="avatarCircle";

        avatar.textContent=(p.name.trim().charAt(0)||"?").toUpperCase();

        const name=document.createElement("span");

        name.textContent=p.name;

        link.appendChild(avatar);

        link.appendChild(name);

        container.appendChild(link);

    }

    else{

        const link=document.createElement("a");

        link.href="/profile/edit";

        const button=document.createElement("button");

        button.className="registerButton";

        button.textContent="Register Profile";

        link.appendChild(button);

        container.appendChild(link);

    }

}
