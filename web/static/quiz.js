let currentQuestion=null;

let selectedAnswer=null;



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

}



function startQuiz(){

    window.location="/quiz";

}



async function loadQuestion(){

    const response=await fetch("/api/question");

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

    if(selectedAnswer==null)

        return;

    const response=await fetch(

        "/api/answer",

        {

            method:"POST",

            headers:{

                "Content-Type":"application/json"

            },

            body:JSON.stringify(

                {

                    answer:selectedAnswer

                }

            )

        }

    );

    const result=await response.json();

    if(result.finished){

        window.location="/results";

    }

    else{

        loadQuestion();

    }

}