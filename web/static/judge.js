window.addEventListener("DOMContentLoaded",function(){

    const list=document.getElementById("problemList");

    if(list){

        loadProblems(
            list.dataset.apiBase||"/api/problems",
            list.dataset.linkBase||"/problems"
        );

    }

    const card=document.getElementById("problemCard");

    if(card){

        const apiBase=card.dataset.apiBase||"/api/problems";

        loadProblemMeta(apiBase,card.dataset.problem);

        loadQuestionInfo(apiBase,card.dataset.problem);

        document
            .getElementById("submitCode")
            .onclick=function(){ submitCode(apiBase,card.dataset.problem); };

    }

});



async function loadQuestionInfo(apiBase,problem){

    const panel=document.getElementById("questionInfo");

    panel.textContent="Loading...";

    const response=await fetch(apiBase+"/"+encodeURIComponent(problem)+"/info");

    const result=await response.json();

    if(!response.ok){

        panel.textContent="Error: "+result.error;

        return;

    }

    panel.textContent=result.info || "No description available for this problem yet.";

}



async function loadProblems(apiBase,linkBase){

    const response=await fetch(apiBase);

    const problems=await response.json();

    const list=document.getElementById("problemList");

    const state={area:"all",difficulty:"all"};

    function renderList(){

        list.innerHTML="";

        const filtered=problems.filter(function(p){

            return (state.area==="all"||p.area===state.area)
                && (state.difficulty==="all"||p.difficulty===state.difficulty);

        });

        filtered.forEach(function(p){

            const row=document.createElement("a");

            row.className="problemRow";

            row.href=linkBase+"/"+encodeURIComponent(p.problem);

            const name=document.createElement("span");

            name.textContent=p.problem;

            const meta=document.createElement("span");

            meta.className="problemMeta";

            meta.textContent=p.area+" / "+p.difficulty;

            row.appendChild(name);

            row.appendChild(meta);

            list.appendChild(row);

        });

    }

    function buildFilterBar(stateKey,values){

        const filterBar=document.createElement("div");

        filterBar.className="filterBar";

        ["all"].concat(values).forEach(function(v){

            const chip=document.createElement("button");

            chip.type="button";

            chip.className="filterChip"+(v===state[stateKey]? " filterChipActive":"");

            chip.textContent=v==="all"? "All":v.charAt(0).toUpperCase()+v.slice(1);

            chip.onclick=function(){

                state[stateKey]=v;

                filterBar.querySelectorAll(".filterChip").forEach(function(c){

                    c.classList.remove("filterChipActive");

                });

                chip.classList.add("filterChipActive");

                renderList();

            };

            filterBar.appendChild(chip);

        });

        list.parentNode.insertBefore(filterBar,list);

    }

    const areas=Array.from(new Set(problems.map(function(p){ return p.area; }))).sort();

    const difficulties=["easy","medium","hard"].filter(function(d){

        return problems.some(function(p){ return p.difficulty===d; });

    });

    if(areas.length>1){

        buildFilterBar("area",areas);

    }

    if(difficulties.length>1){

        buildFilterBar("difficulty",difficulties);

    }

    renderList();

}



async function loadProblemMeta(apiBase,problem){

    const response=await fetch(apiBase);

    const problems=await response.json();

    const match=problems.find(function(p){ return p.problem===problem; });

    if(match){

        document
            .getElementById("problemMeta")
            .innerText=match.area+" / "+match.difficulty;

    }

}



async function submitCode(apiBase,problem){

    const code=document.getElementById("code").value;

    const verdict=document.getElementById("verdict");

    verdict.innerText="Judging...";

    const response=await fetch(

        apiBase+"/"+encodeURIComponent(problem)+"/submit",

        {

            method:"POST",

            headers:{

                "Content-Type":"application/json"

            },

            body:JSON.stringify(

                {

                    code:code

                }

            )

        }

    );

    const result=await response.json();

    if(!response.ok){

        verdict.innerText="Error: "+result.error;

        return;

    }

    renderVerdict(verdict,result);

}



function renderVerdict(verdict,result){

    verdict.innerHTML="";

    const summary=document.createElement("div");

    summary.className=result.passed? "verdictPass":"verdictFail";

    summary.innerText=(result.passed? "Passed ":"Failed ")

        +result.cases.filter(function(c){ return c.passed; }).length

        +"/"+result.cases.length+" cases";

    verdict.appendChild(summary);

    result.cases.forEach(function(c){

        const row=document.createElement("div");

        row.className="caseRow";

        row.innerText="Case "+c.case_no+": "+(c.passed? "pass":"fail")

            +" — actual: "+c.actual+", expected: "+c.expected;

        verdict.appendChild(row);

    });

}
