window.addEventListener("DOMContentLoaded",function(){

    loadJobs();

});



var COUNTRY_ORDER=["USA","HK","Singapore","Japan","India","UK"];



async function loadJobs(){

    const response=await fetch("/api/jobs");

    const allJobs=await response.json();

    const filterBar=document.getElementById("jobFilterBar");

    const list=document.getElementById("jobList");

    let activeCountry="all";

    function renderList(){

        list.innerHTML="";

        const filtered=activeCountry==="all"
            ? allJobs
            : allJobs.filter(function(j){ return j.country===activeCountry; });

        if(filtered.length===0){

            list.textContent="No jobs found for this country.";

            return;

        }

        filtered.forEach(function(j){

            const card=document.createElement("div");

            card.className="jobCard";

            const title=document.createElement("div");

            title.className="jobTitle";

            title.textContent=j.title;

            const meta=document.createElement("div");

            meta.className="jobMeta";

            meta.textContent=j.company+" — "+j.location+" ("+j.country+")";

            const desc=document.createElement("div");

            desc.className="jobDescription";

            desc.textContent=j.description;

            card.appendChild(title);

            card.appendChild(meta);

            card.appendChild(desc);

            list.appendChild(card);

        });

    }

    const countries=COUNTRY_ORDER.filter(function(c){

        return allJobs.some(function(j){ return j.country===c; });

    });

    filterBar.className="filterBar";

    ["all"].concat(countries).forEach(function(c){

        const chip=document.createElement("button");

        chip.type="button";

        chip.className="filterChip"+(c===activeCountry? " filterChipActive":"");

        chip.textContent=c==="all"? "All":c;

        chip.onclick=function(){

            activeCountry=c;

            filterBar.querySelectorAll(".filterChip").forEach(function(el){

                el.classList.remove("filterChipActive");

            });

            chip.classList.add("filterChipActive");

            renderList();

        };

        filterBar.appendChild(chip);

    });

    renderList();

}
