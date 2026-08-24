window.addEventListener("DOMContentLoaded",function(){

    loadProfileView();

});



// Elemental-table progression for badges: every 4th milestone rolls the
// badge on to the next element; the 1-4 stars track how far through the
// current element's 4 milestones you are. Milestone size is per-category
// (see BADGE_CATEGORIES) - the Challenges section has far fewer questions
// than the Multiple Choice banks, so it earns a star every 10 correct
// instead of every 50.
const BADGE_ELEMENTS=[
    ["H","Hydrogen",1],["He","Helium",2],["Li","Lithium",3],["Be","Beryllium",4],
    ["B","Boron",5],["C","Carbon",6],["N","Nitrogen",7],["O","Oxygen",8],
    ["F","Fluorine",9],["Ne","Neon",10],["Na","Sodium",11],["Mg","Magnesium",12],
    ["Al","Aluminium",13],["Si","Silicon",14],["P","Phosphorus",15],["S","Sulfur",16],
    ["Cl","Chlorine",17],["Ar","Argon",18],["K","Potassium",19],["Ca","Calcium",20]
];

// Alphabetical by label, 12 entries -> two 5-item rows plus two on a
// third row (see .badgesGrid) - grid wrapping handles that fine.
const BADGE_CATEGORIES=[
    {key:"AdventOfCode",label:"Advent of Code",color:"#ef4444",milestone:10},
    {key:"DiChallenge",label:"AquaQ Challenges",color:"#38bdf8",milestone:10},
    {key:"MultipleChoiceDebug",label:"Debug It",color:"#a78bfa",milestone:10},
    {key:"Fundamentals",label:"Fundamentals",color:"#fb923c",milestone:50},
    {key:"HackerRank",label:"HackerRank",color:"#22c55e",milestone:10},
    {key:"Leetcode",label:"leetcode",color:"#fbbf24",milestone:10},
    {key:"Lisp99",label:"Lisp-99",color:"#6366f1",milestone:10},
    {key:"MultipleChoiceSyntax",label:"MC - Syntax",color:"#81c784",milestone:50},
    {key:"MultipleChoice",label:"Multiple Choice",color:"#4fc3f7",milestone:50},
    {key:"Euler",label:"Project Euler",color:"#22d3ee",milestone:10},
    {key:"Idioms",label:"qIdioms",color:"#c084fc",milestone:50},
    {key:"QuantRank",label:"quantRank",color:"#f472b6",milestone:10}
];



async function loadProfileView(){

    const container=document.getElementById("profileView");

    const [profileResponse,badgesResponse]=await Promise.all([

        fetch("/api/profile"),

        fetch("/api/profile/badges")

    ]);

    const p=await profileResponse.json();

    const badgeCounts=badgesResponse.ok?await badgesResponse.json():{};

    container.innerHTML="";

    if(!p.registered){

        renderEmptyState(container);

        return;

    }

    container.appendChild(buildEditProfileButton());

    container.appendChild(buildHeader(p));

    container.appendChild(buildBadgesBox(badgeCounts||{}));

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



function buildAvatar(p,circleClass){

    if(p.photoFilename){

        const img=document.createElement("img");

        img.className=circleClass+" avatarImage";

        img.src="/uploads/"+encodeURIComponent(p.photoFilename);

        img.alt=p.name;

        return img;

    }

    const circle=document.createElement("div");

    circle.className=circleClass;

    circle.textContent=(p.name.trim().charAt(0)||"?").toUpperCase();

    return circle;

}



function computeBadge(correctCount,milestoneSize){

    const milestones=Math.floor(correctCount/milestoneSize);

    if(milestones===0) return null;

    const elementIndex=Math.min(Math.floor((milestones-1)/4),BADGE_ELEMENTS.length-1);

    const stars=((milestones-1)%4)+1;

    return {element:BADGE_ELEMENTS[elementIndex],stars:stars};

}



function buildBadgeTile(category,badge){

    const tile=document.createElement("div");

    tile.className=badge?"badgeTile":"badgeTile badgeTileLocked";

    tile.style.setProperty("--badgeColor",category.color);

    tile.title=category.label+(badge?(" — "+badge.element[1]+", "+badge.stars+"/4 stars"):(" — locked ("+category.milestone+" correct to unlock)"));

    const number=document.createElement("div");

    number.className="badgeAtomicNumber";

    number.textContent=badge?badge.element[2]:"";

    const symbol=document.createElement("div");

    symbol.className="badgeSymbol";

    symbol.textContent=badge?badge.element[0]:"?";

    const elementName=document.createElement("div");

    elementName.className="badgeElementName";

    elementName.textContent=badge?badge.element[1]:"Locked";

    const stars=document.createElement("div");

    stars.className="badgeStars";

    stars.textContent=badge?"★".repeat(badge.stars)+"☆".repeat(4-badge.stars):"☆☆☆☆";

    const label=document.createElement("div");

    label.className="badgeLabel";

    label.textContent=category.label;

    tile.appendChild(number);

    tile.appendChild(symbol);

    tile.appendChild(elementName);

    tile.appendChild(stars);

    tile.appendChild(label);

    return tile;

}



function buildBadgesBox(badgeCounts){

    const box=document.createElement("div");

    box.className="badgesBox";

    const heading=document.createElement("h3");

    heading.className="badgesBoxTitle";

    heading.textContent="Badges";

    box.appendChild(heading);

    const grid=document.createElement("div");

    grid.className="badgesGrid";

    BADGE_CATEGORIES.forEach(function(category){

        const badge=computeBadge(badgeCounts[category.key]||0,category.milestone);

        grid.appendChild(buildBadgeTile(category,badge));

    });

    box.appendChild(grid);

    return box;

}



function buildHeader(p){

    const wrap=document.createElement("div");

    wrap.className="profileHeader";

    const avatar=buildAvatar(p,"avatarCircleLarge");

    const info=document.createElement("div");

    info.className="profileInfo";

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

    wrap.appendChild(avatar);

    wrap.appendChild(info);

    return wrap;

}



function buildEditProfileButton(){

    const editLink=document.createElement("a");

    editLink.href="/profile/edit";

    editLink.className="editProfileLink";

    const editButton=document.createElement("button");

    editButton.textContent="Edit Profile";

    editLink.appendChild(editButton);

    return editLink;

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
