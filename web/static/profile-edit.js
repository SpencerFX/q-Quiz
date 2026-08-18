window.addEventListener("DOMContentLoaded",function(){

    if(!document.getElementById("saveBasics")) return;

    loadProfile();

    document.getElementById("saveBasics").onclick=saveBasics;

    document.getElementById("uploadResume").onclick=uploadResume;

    document.getElementById("uploadAutofillResume").onclick=uploadAndAutofillResume;

    document.getElementById("uploadPhoto").onclick=uploadPhoto;

    document.getElementById("addExperience").onclick=addExperience;

    document.getElementById("addEducation").onclick=addEducation;

    document.getElementById("addLink").onclick=addLink;

    document.getElementById("addSkill").onclick=addSkill;

});



async function loadProfile(){

    const response=await fetch("/api/profile");

    const p=await response.json();

    applyProfile(p);

}



function applyProfile(p){

    document.getElementById("fieldName").value=p.name;

    document.getElementById("fieldTagline").value=p.tagline;

    document.getElementById("fieldEmail").value=p.email;

    document.getElementById("fieldPhone").value=p.phone;

    document.getElementById("fieldLocation").value=p.location;

    document.getElementById("resumeStatus").textContent=

        p.resumeFilename? ("Current resume: "+p.resumeFilename):"No resume uploaded yet.";

    renderPhotoPreview(p);

    renderList(

        "experienceList",

        p.experience,

        function(e){ return e.title+" — "+e.company+" ("+e.startDate+" - "+e.endDate+")"; },

        removeExperience

    );

    renderList(

        "educationList",

        p.education,

        function(e){ return e.school+" — "+e.degree; },

        removeEducation

    );

    renderList(

        "linksList",

        p.links,

        function(e){ return e.label+": "+e.url; },

        removeLink

    );

    renderList(

        "skillsList",

        p.skills,

        function(e){ return e.skill; },

        removeSkill

    );

}



function renderPhotoPreview(p){

    const container=document.getElementById("photoPreview");

    container.innerHTML="";

    if(p.photoFilename){

        const img=document.createElement("img");

        img.src="/uploads/"+encodeURIComponent(p.photoFilename)+"?t="+Date.now();

        img.alt="Profile picture";

        container.appendChild(img);

    }

    else{

        const placeholder=document.createElement("span");

        placeholder.textContent="No photo uploaded yet.";

        placeholder.className="meta";

        container.appendChild(placeholder);

    }

}



function renderList(containerId,entries,labelFn,removeFn){

    const container=document.getElementById(containerId);

    container.innerHTML="";

    entries.forEach(function(e){

        const row=document.createElement("div");

        row.className="editableRow";

        const label=document.createElement("span");

        label.textContent=labelFn(e);

        const remove=document.createElement("button");

        remove.className="removeButton";

        remove.textContent="Remove";

        remove.onclick=function(){ removeFn(e.id); };

        row.appendChild(label);

        row.appendChild(remove);

        container.appendChild(row);

    });

}



function clearFields(ids){

    ids.forEach(function(id){ document.getElementById(id).value=""; });

}



async function saveBasics(){

    const response=await fetch(

        "/api/profile",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({

                name:document.getElementById("fieldName").value,

                tagline:document.getElementById("fieldTagline").value,

                email:document.getElementById("fieldEmail").value,

                phone:document.getElementById("fieldPhone").value,

                location:document.getElementById("fieldLocation").value

            })

        }

    );

    const p=await response.json();

    if(response.ok) applyProfile(p);

}



async function uploadResume(){

    const fileInput=document.getElementById("resumeFile");

    if(!fileInput.files.length) return;

    const formData=new FormData();

    formData.append("resume",fileInput.files[0]);

    const response=await fetch("/api/profile/resume",{ method:"POST", body:formData });

    const p=await response.json();

    if(response.ok) applyProfile(p);

}



async function uploadAndAutofillResume(){

    const fileInput=document.getElementById("resumeFile");

    const status=document.getElementById("autofillStatus");

    if(!fileInput.files.length){

        status.textContent="Choose a resume file first.";

        return;

    }

    status.textContent="Reading resume...";

    const formData=new FormData();

    formData.append("resume",fileInput.files[0]);

    const response=await fetch("/api/profile/resume/autofill",{ method:"POST", body:formData });

    const p=await response.json();

    if(!response.ok){

        status.textContent=p.error||"Couldn't auto-fill from that resume.";

        return;

    }

    applyProfile(p);

    const a=p.autofill||{};

    const found=(a.experience||0)+(a.education||0)+(a.links||0)+(a.skills||0);

    status.textContent=found

        ? "Auto-filled "+a.experience+" experience, "+a.education+" education, "+a.links+" link(s), "+a.skills+" skill(s) - review below and remove/edit anything that's off."

        : "Uploaded, but couldn't find recognizable Experience/Education/Links/Skills sections to auto-fill - add them in manually below.";

}



async function uploadPhoto(){

    const fileInput=document.getElementById("photoFile");

    if(!fileInput.files.length) return;

    const formData=new FormData();

    formData.append("photo",fileInput.files[0]);

    const response=await fetch("/api/profile/photo",{ method:"POST", body:formData });

    const p=await response.json();

    if(response.ok) applyProfile(p);

}



async function addExperience(){

    const response=await fetch(

        "/api/profile/experience",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({

                company:document.getElementById("expCompany").value,

                title:document.getElementById("expTitle").value,

                startDate:document.getElementById("expStart").value,

                endDate:document.getElementById("expEnd").value,

                location:document.getElementById("expLocation").value,

                description:document.getElementById("expDescription").value

            })

        }

    );

    const p=await response.json();

    if(response.ok){

        applyProfile(p);

        clearFields(["expCompany","expTitle","expStart","expEnd","expLocation","expDescription"]);

    }

}



async function removeExperience(id){

    const response=await fetch("/api/profile/experience/"+id,{ method:"DELETE" });

    const p=await response.json();

    if(response.ok) applyProfile(p);

}



async function addEducation(){

    const response=await fetch(

        "/api/profile/education",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({

                school:document.getElementById("eduSchool").value,

                degree:document.getElementById("eduDegree").value,

                startDate:document.getElementById("eduStart").value,

                endDate:document.getElementById("eduEnd").value

            })

        }

    );

    const p=await response.json();

    if(response.ok){

        applyProfile(p);

        clearFields(["eduSchool","eduDegree","eduStart","eduEnd"]);

    }

}



async function removeEducation(id){

    const response=await fetch("/api/profile/education/"+id,{ method:"DELETE" });

    const p=await response.json();

    if(response.ok) applyProfile(p);

}



async function addLink(){

    const response=await fetch(

        "/api/profile/links",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({

                label:document.getElementById("linkLabel").value,

                url:document.getElementById("linkUrl").value

            })

        }

    );

    const p=await response.json();

    if(response.ok){

        applyProfile(p);

        clearFields(["linkLabel","linkUrl"]);

    }

}



async function removeLink(id){

    const response=await fetch("/api/profile/links/"+id,{ method:"DELETE" });

    const p=await response.json();

    if(response.ok) applyProfile(p);

}



async function addSkill(){

    const input=document.getElementById("skillInput");

    if(!input.value.trim()) return;

    const response=await fetch(

        "/api/profile/skills",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({ skill:input.value })

        }

    );

    const p=await response.json();

    if(response.ok){

        applyProfile(p);

        input.value="";

    }

}



async function removeSkill(id){

    const response=await fetch("/api/profile/skills/"+id,{ method:"DELETE" });

    const p=await response.json();

    if(response.ok) applyProfile(p);

}
