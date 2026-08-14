window.addEventListener("DOMContentLoaded",function(){

    if(document.getElementById("problemList")){

        loadProblems();

    }

    const card=document.getElementById("problemCard");

    if(card){

        loadProblemMeta(card.dataset.problem);

        document
            .getElementById("submitCode")
            .onclick=function(){ submitCode(card.dataset.problem); };

    }

});



async function loadProblems(){

    const response=await fetch("/api/problems");

    const problems=await response.json();

    const list=document.getElementById("problemList");

    list.innerHTML="";

    problems.forEach(function(p){

        const row=document.createElement("a");

        row.className="problemRow";

        row.href="/problems/"+encodeURIComponent(p.problem);

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



async function loadProblemMeta(problem){

    const response=await fetch("/api/problems");

    const problems=await response.json();

    const match=problems.find(function(p){ return p.problem===problem; });

    if(match){

        document
            .getElementById("problemMeta")
            .innerText=match.area+" / "+match.difficulty;

    }

}



async function submitCode(problem){

    const code=document.getElementById("code").value;

    const verdict=document.getElementById("verdict");

    verdict.innerText="Judging...";

    const response=await fetch(

        "/api/problems/"+encodeURIComponent(problem)+"/submit",

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
