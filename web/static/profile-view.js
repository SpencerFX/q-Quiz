window.addEventListener("DOMContentLoaded",function(){

    loadProfileView();

});



async function loadProfileView(){

    const container=document.getElementById("profileView");

    const response=await fetch("/api/profile");

    const p=await response.json();

    container.innerHTML="";

    if(!p.registered){

        renderEmptyState(container);

        return;

    }

    container.appendChild(buildHeader(p));

    container.appendChild(buildPersonalInfo(p));

    if(p.experience.length){

        container.appendChild(buildExperienceSection(p.experience));

    }

    if(p.education.length){

        container.appendChild(buildEducationSection(p.education));

    }

    if(p.links.length){

        container.appendChild(buildLinksSection(p.links));

    }

    if(p.skills.length){

        container.appendChild(buildSkillsSection(p.skills));

    }

}



function renderEmptyState(container){

    const heading=document.createElement("h1");

    heading.textContent="No profile yet";

    const text=document.createElement("p");

    text.textContent="You haven't set up a profile.";

    const link=document.createElement("a");

    link.href="/profile/edit";

    const button=document.createElement("button");

    button.textContent="Create Profile";

    link.appendChild(button);

    container.appendChild(heading);

    container.appendChild(text);

    container.appendChild(link);

}



function buildHeader(p){

    const wrap=document.createElement("div");

    wrap.className="profileHeader";

    const avatar=document.createElement("div");

    avatar.className="avatarCircleLarge";

    avatar.textContent=(p.name.trim().charAt(0)||"?").toUpperCase();

    const info=document.createElement("div");

    const name=document.createElement("h1");

    name.textContent=p.name;

    info.appendChild(name);

    if(p.tagline){

        const tagline=document.createElement("p");

        tagline.className="profileTagline";

        tagline.textContent=p.tagline;

        info.appendChild(tagline);

    }

    if(p.location){

        const location=document.createElement("p");

        location.className="meta";

        location.textContent=p.location;

        info.appendChild(location);

    }

    const editLink=document.createElement("a");

    editLink.href="/profile/edit";

    editLink.className="editProfileLink";

    const editButton=document.createElement("button");

    editButton.textContent="Edit Profile";

    editLink.appendChild(editButton);

    info.appendChild(editLink);

    wrap.appendChild(avatar);

    wrap.appendChild(info);

    return wrap;

}



function buildPersonalInfo(p){

    const section=document.createElement("div");

    section.className="profileSection";

    const heading=document.createElement("h2");

    heading.className="chartTitle";

    heading.textContent="Personal Information";

    section.appendChild(heading);

    const list=document.createElement("div");

    list.className="infoList";

    [

        ["Email",p.email],

        ["Phone",p.phone],

        ["Location",p.location]

    ].forEach(function(pair){

        if(!pair[1]) return;

        const row=document.createElement("div");

        row.className="infoRow";

        row.textContent=pair[0]+": "+pair[1];

        list.appendChild(row);

    });

    const resumeRow=document.createElement("div");

    resumeRow.className="infoRow";

    if(p.resumeFilename){

        const label=document.createTextNode("Resume: ");

        const link=document.createElement("a");

        link.href="/uploads/"+encodeURIComponent(p.resumeFilename);

        link.textContent=p.resumeFilename;

        link.target="_blank";

        resumeRow.appendChild(label);

        resumeRow.appendChild(link);

    }

    else{

        resumeRow.textContent="Resume: not uploaded";

    }

    list.appendChild(resumeRow);

    section.appendChild(list);

    return section;

}



function buildExperienceSection(entries){

    const section=document.createElement("div");

    section.className="profileSection";

    const heading=document.createElement("h2");

    heading.className="chartTitle";

    heading.textContent="Work Experience";

    section.appendChild(heading);

    entries.slice().reverse().forEach(function(e){

        const card=document.createElement("div");

        card.className="entryCard";

        const title=document.createElement("div");

        title.className="entryTitle";

        title.textContent=e.title+" — "+e.company;

        const meta=document.createElement("div");

        meta.className="meta";

        meta.textContent=e.startDate+" - "+e.endDate+(e.location? " · "+e.location:"");

        card.appendChild(title);

        card.appendChild(meta);

        if(e.description){

            const desc=document.createElement("div");

            desc.className="entryDescription";

            desc.textContent=e.description;

            card.appendChild(desc);

        }

        section.appendChild(card);

    });

    return section;

}



function buildEducationSection(entries){

    const section=document.createElement("div");

    section.className="profileSection";

    const heading=document.createElement("h2");

    heading.className="chartTitle";

    heading.textContent="Education";

    section.appendChild(heading);

    entries.slice().reverse().forEach(function(e){

        const card=document.createElement("div");

        card.className="entryCard";

        const title=document.createElement("div");

        title.className="entryTitle";

        title.textContent=e.school;

        const meta=document.createElement("div");

        meta.className="meta";

        meta.textContent=e.degree+" · "+e.startDate+" - "+e.endDate;

        card.appendChild(title);

        card.appendChild(meta);

        section.appendChild(card);

    });

    return section;

}



function buildLinksSection(entries){

    const section=document.createElement("div");

    section.className="profileSection";

    const heading=document.createElement("h2");

    heading.className="chartTitle";

    heading.textContent="Links";

    section.appendChild(heading);

    const list=document.createElement("div");

    list.className="linkList";

    entries.forEach(function(e){

        const link=document.createElement("a");

        link.className="linkChip";

        link.href=e.url;

        link.target="_blank";

        link.textContent=e.label;

        list.appendChild(link);

    });

    section.appendChild(list);

    return section;

}



function buildSkillsSection(entries){

    const section=document.createElement("div");

    section.className="profileSection";

    const heading=document.createElement("h2");

    heading.className="chartTitle";

    heading.textContent="Skills";

    section.appendChild(heading);

    const list=document.createElement("div");

    list.className="skillList";

    entries.forEach(function(e){

        const chip=document.createElement("span");

        chip.className="skillChip";

        chip.textContent=e.skill;

        list.appendChild(chip);

    });

    section.appendChild(list);

    return section;

}
