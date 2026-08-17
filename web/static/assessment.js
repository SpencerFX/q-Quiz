// base.html loads quiz.js on every page, which declares its own
// top-level `selectedAnswer`/`submitting` and wires itself onto a
// `#submitAnswer` button if one exists - so this file's globals and
// button id are prefixed/renamed to avoid colliding with it (a plain
// name clash here is a SyntaxError that silently kills this whole
// script, not just a runtime bug).
let asmtCurrent=null;

let asmtSelectedAnswer=null;

let asmtSubmitting=false;



// Coding questions reuse each section's own existing /info and /run
// endpoints directly (no assessment-awareness needed there - info is
// a read, run doesn't grade/record). Only /submit is assessment-aware,
// since it has to grade against whichever question is currently
// active server-side and advance the sequence.
const CODING_API_BASE={

    HackerRank:"/api/problems",

    Idioms:"/api/qidioms",

    DiChallenge:"/api/aquaq",

    Leetcode:"/api/leetcode",

    QuantRank:"/api/quantrank",

    Fundamentals:"/api/fundamentals"

};



const ASMT_TYPE_LABELS={

    MultipleChoice:"Multiple Choice",

    HackerRank:"HackerRank Problems",

    Idioms:"qIdioms",

    DiChallenge:"AquaQ Challenges",

    Leetcode:"leetcode",

    QuantRank:"quantRank",

    Fundamentals:"Fundamentals"

};



window.addEventListener("DOMContentLoaded",function(){

    const card=document.getElementById("assessmentCard");

    if(!card) return;

    document.getElementById("assessmentSubmit").onclick=submitCurrent;

    const runButton=document.getElementById("runCode");

    if(runButton) runButton.onclick=runCurrent;

    startAssessment(card.dataset.difficulty);

});



async function startAssessment(difficulty){

    const response=await fetch(

        "/api/assessment/start",

        {

            method:"POST",

            headers:{ "Content-Type":"application/json" },

            body:JSON.stringify({ difficulty:difficulty })

        }

    );

    const data=await response.json();

    if(!response.ok){

        document.getElementById("questionText").innerText="Error: "+data.error;

        return;

    }

    renderQuestion(data);

}



function renderQuestion(data){

    asmtCurrent=data;

    if(data.finished){

        renderSummary(data);

        return;

    }

    document.getElementById("assessmentIndex").innerText=data.index;

    document.getElementById("assessmentTotal").innerText=data.total;

    document.getElementById("assessmentTypeLabel").innerText=ASMT_TYPE_LABELS[data.questionType]||data.questionType;

    const mcView=document.getElementById("mcView");

    const codingView=document.getElementById("codingView");

    const outputConsole=document.getElementById("outputConsole");

    const runButton=document.getElementById("runCode");

    if(data.kind==="mc"){

        mcView.style.display="";

        codingView.style.display="none";

        outputConsole.style.display="none";

        if(runButton) runButton.style.display="none";

        renderMcQuestion(data);

    }

    else{

        mcView.style.display="none";

        codingView.style.display="";

        outputConsole.style.display="";

        if(runButton) runButton.style.display="";

        renderCodingQuestion(data);

    }

}



function renderMcQuestion(data){

    asmtSelectedAnswer=null;

    document.getElementById("questionText").innerText=data.question;

    const div=document.getElementById("answers");

    div.innerHTML="";

    Object.entries(data.answers).forEach(function([key,value]){

        const answer=document.createElement("div");

        answer.className="answer";

        answer.innerHTML="<b>"+key.toUpperCase()+"</b> "+value;

        answer.onclick=function(){

            document.querySelectorAll(".answer").forEach(function(x){ x.classList.remove("selected"); });

            answer.classList.add("selected");

            asmtSelectedAnswer=key;

        };

        div.appendChild(answer);

    });

}



async function renderCodingQuestion(data){

    document.getElementById("code").value="";

    document.getElementById("runOutput").innerText="";

    const infoPanel=document.getElementById("questionInfo");

    infoPanel.textContent="Loading...";

    const apiBase=CODING_API_BASE[data.questionType];

    const response=await fetch(apiBase+"/"+encodeURIComponent(data.problem)+"/info");

    const result=await response.json();

    infoPanel.textContent=response.ok? (result.info||"No description available for this problem yet."):"Error: "+result.error;

}



async function runCurrent(){

    if(!asmtCurrent || asmtCurrent.kind!=="coding") return;

    const code=document.getElementById("code").value;

    const output=document.getElementById("runOutput");

    output.className="runOutput";

    output.innerText="Running...";

    const apiBase=CODING_API_BASE[asmtCurrent.questionType];

    const response=await fetch(

        apiBase+"/"+encodeURIComponent(asmtCurrent.problem)+"/run",

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



async function submitCurrent(){

    if(!asmtCurrent || asmtSubmitting) return;

    let answer;

    if(asmtCurrent.kind==="mc"){

        if(asmtSelectedAnswer==null) return;

        answer=asmtSelectedAnswer;

    }

    else{

        answer=document.getElementById("code").value;

    }

    asmtSubmitting=true;

    document.getElementById("assessmentSubmit").disabled=true;

    let response;

    try{

        response=await fetch(

            "/api/assessment/submit",

            {

                method:"POST",

                headers:{ "Content-Type":"application/json" },

                body:JSON.stringify({ answer:answer })

            }

        );

    }

    finally{

        asmtSubmitting=false;

        document.getElementById("assessmentSubmit").disabled=false;

    }

    if(!response.ok) return;

    const result=await response.json();

    renderQuestion(result);

}



function renderSummary(data){

    document.getElementById("mcView").style.display="none";

    document.getElementById("codingView").style.display="none";

    document.getElementById("outputConsole").style.display="none";

    document.getElementById("assessmentSubmit").style.display="none";

    const runButton=document.getElementById("runCode");

    if(runButton) runButton.style.display="none";

    const progress=document.querySelector(".progress");

    if(progress) progress.style.display="none";

    const summary=document.getElementById("assessmentSummary");

    summary.innerHTML="";

    const heading=document.createElement("h2");

    heading.textContent="Assessment complete";

    const score=document.createElement("p");

    score.className="meta";

    score.textContent=data.correct+" / "+data.total+" correct";

    const button=document.createElement("button");

    button.textContent="Home";

    button.onclick=function(){ window.location="/"; };

    summary.appendChild(heading);

    summary.appendChild(score);

    summary.appendChild(button);

}
