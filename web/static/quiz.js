let currentQuestion=null;

let selectedAnswer=null;

let submitting=false;



window.onload=function(){

    if(document.getElementById("startQuiz")){

        document
            .getElementById("startQuiz")
            .onclick=startQuiz;

    }

    if(document.getElementById("submitAnswer")){

        document
            .getElementById("submitAnswer")
            .onclick=submitAnswer;

        loadQuestion();

    }

    if(document.getElementById("score")){

        loadResults();

    }

}



async function loadResults(){

    const response=await fetch("/api/results");

    const data=await response.json();

    document
        .getElementById("score")
        .innerText=data.correct+" / "+data.total;

}



function startQuiz(){

    window.location="/quiz";

}



async function loadQuestion(){

    const response=await fetch("/api/question");

    if(!response.ok){

        window.location="/results";

        return;

    }

    const question=await response.json();

    currentQuestion=question;

    document
        .getElementById("questionText")
        .innerText=question.question;

    document
        .getElementById("questionNumber")
        .innerText=question.number;

    const div=document
        .getElementById("answers");

    div.innerHTML="";

    Object.entries(question.answers)
        .forEach(

            ([key,value])=>{

                let answer=document
                    .createElement("div");

                answer.className="answer";

                answer.innerHTML=

                    "<b>"+key.toUpperCase()+"</b> "

                    +value;

                answer.onclick=function(){

                    document

                        .querySelectorAll(".answer")

                        .forEach(

                            x=>x.classList.remove("selected")

                        );

                    answer.classList.add("selected");

                    selectedAnswer=key;

                };

                div.appendChild(answer);

            }

        );

}



async function submitAnswer(){

    if(selectedAnswer==null || submitting)

        return;

    submitting=true;

    document.getElementById("submitAnswer").disabled=true;

    const answer=selectedAnswer;

    selectedAnswer=null;

    let response;

    try{

        response=await fetch(

            "/api/answer",

            {

                method:"POST",

                headers:{

                    "Content-Type":"application/json"

                },

                body:JSON.stringify(

                    {

                        answer:answer

                    }

                )

            }

        );

    }

    finally{

        submitting=false;

        document.getElementById("submitAnswer").disabled=false;

    }

    if(!response.ok){

        return;

    }

    const result=await response.json();

    if(result.finished){

        window.location="/results";

    }

    else{

        loadQuestion();

    }

}