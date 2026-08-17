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

        const linkBase=apiBase.replace(/^\/api/,"");

        loadProblemMeta(apiBase,card.dataset.problem);

        loadQuestionInfo(apiBase,card.dataset.problem);

        document
            .getElementById("submitCode")
            .onclick=function(){ submitCode(apiBase,card.dataset.problem); };

        const runButton=document.getElementById("runCode");

        if(runButton){

            runButton.onclick=function(){ runCode(apiBase,card.dataset.problem); };

        }

        const testCasesButton=document.getElementById("testCasesButton");

        if(testCasesButton){

            testCasesButton.onclick=function(){ runTestCases(apiBase,card.dataset.problem); };

        }

        setupNextButton(apiBase,linkBase,card.dataset.problem);

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

            const nameGroup=document.createElement("span");

            nameGroup.className="problemNameGroup";

            const status=document.createElement("span");

            const statusLabel=(p.status||"unattempted").charAt(0).toUpperCase()+(p.status||"unattempted").slice(1);

            status.className="problemStatus status"+statusLabel;

            status.title=statusLabel;

            const name=document.createElement("span");

            name.textContent=p.problem;

            nameGroup.appendChild(status);

            nameGroup.appendChild(name);

            const meta=document.createElement("span");

            meta.className="problemMeta";

            meta.textContent=p.area+" / "+p.difficulty;

            row.appendChild(nameGroup);

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

    const legend=document.createElement("div");

    legend.className="problemStatusLegend";

    [["statusSolved","Solved"],["statusAttempted","Attempted"],["statusUnattempted","Not attempted"]].forEach(function([cls,label]){

        const item=document.createElement("span");

        item.className="problemStatusLegendItem";

        const dot=document.createElement("span");

        dot.className="problemStatus "+cls;

        item.appendChild(dot);

        item.appendChild(document.createTextNode(label));

        legend.appendChild(item);

    });

    list.parentNode.insertBefore(legend,list);

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



async function setupNextButton(apiBase,linkBase,problem){

    const button=document.getElementById("nextProblem");

    if(!button) return;

    const response=await fetch(apiBase);

    const problems=await response.json();

    const index=problems.findIndex(function(p){ return p.problem===problem; });

    const next=(index>=0 && index+1<problems.length)? problems[index+1]:null;

    if(!next){

        button.disabled=true;

        button.title="No more problems in this list";

        return;

    }

    button.onclick=function(){

        window.location=linkBase+"/"+encodeURIComponent(next.problem);

    };

}



async function runCode(apiBase,problem){

    const code=document.getElementById("code").value;

    const output=document.getElementById("runOutput");

    if(!output) return;

    output.className="runOutput";

    output.innerText="Running...";

    const response=await fetch(

        apiBase+"/"+encodeURIComponent(problem)+"/run",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({ code:code })

        }

    );

    const result=await response.json();

    if(!response.ok){

        output.className="runOutput runOutputError";

        output.innerText="Error: "+result.error;

        return;

    }

    output.innerText="Output: "+result.output;

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



// Benchmarks the section's own reference solution (not the codepad
// submission) across a few auto-scaled input sizes, so CPU time /
// space growth is visible - not every section has a reference
// function to run this against, in which case the backend reports
// available:false with a reason instead of rows.
async function runTestCases(apiBase,problem){

    const button=document.getElementById("testCasesButton");

    const container=document.getElementById("testCasesResult");

    if(!container) return;

    if(button) button.disabled=true;

    container.innerHTML="";

    container.textContent="Running...";

    let response;

    try{

        response=await fetch(apiBase+"/"+encodeURIComponent(problem)+"/testcases");

    }

    finally{

        if(button) button.disabled=false;

    }

    const result=await response.json();

    if(!response.ok){

        container.textContent="Error: "+result.error;

        return;

    }

    renderTestCases(container,result);

}



function renderTestCases(container,result){

    container.innerHTML="";

    if(!result.available){

        const msg=document.createElement("p");

        msg.className="meta";

        msg.textContent=result.reason;

        container.appendChild(msg);

        return;

    }

    const table=document.createElement("table");

    table.className="testCasesTable";

    const thead=document.createElement("thead");

    const headRow=document.createElement("tr");

    ["Scale","Input size","CPU time (ms)","Space (bytes)","Status"].forEach(function(h){

        const th=document.createElement("th");

        th.textContent=h;

        headRow.appendChild(th);

    });

    thead.appendChild(headRow);

    table.appendChild(thead);

    const tbody=document.createElement("tbody");

    result.rows.forEach(function(row){

        const tr=document.createElement("tr");

        [row.scale+"x",row.inputSize,row.timeMs.toFixed(4),row.spaceBytes].forEach(function(v){

            const td=document.createElement("td");

            td.textContent=v;

            tr.appendChild(td);

        });

        const statusTd=document.createElement("td");

        statusTd.className=row.errored? "resultFail":"resultPass";

        statusTd.textContent=row.errored? ("Error: "+row.message):"OK";

        tr.appendChild(statusTd);

        tbody.appendChild(tr);

    });

    table.appendChild(tbody);

    container.appendChild(table);

}
