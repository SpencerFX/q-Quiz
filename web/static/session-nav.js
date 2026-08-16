window.addEventListener("DOMContentLoaded",function(){

    loadSessionNav();

});



async function loadSessionNav(){

    const container=document.getElementById("sessionNav");

    if(!container) return;

    const response=await fetch("/api/session");

    if(!response.ok) return;

    const s=await response.json();

    container.innerHTML="";

    if(s.loggedIn){

        const pill=document.createElement("span");

        pill.className="sessionPill";

        pill.textContent=s.handle;

        const logout=document.createElement("a");

        logout.href="/logout";

        logout.className="sessionLogout";

        logout.textContent="Log out";

        container.appendChild(pill);

        container.appendChild(logout);

    }

    else{

        const link=document.createElement("a");

        link.href="/login";

        const button=document.createElement("button");

        button.className="navButton";

        button.textContent="Sign in";

        link.appendChild(button);

        container.appendChild(link);

    }

}
