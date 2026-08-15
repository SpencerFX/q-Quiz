window.addEventListener("DOMContentLoaded",function(){

    loadLeaderboard();

});



async function loadLeaderboard(){

    const response=await fetch("/api/leaderboard");

    const entries=await response.json();

    const tbody=document.getElementById("leaderboardBody");

    tbody.innerHTML="";

    entries.forEach(function(e){

        const tr=document.createElement("tr");

        [String(e.place),e.handle,String(e.score),String(e.solved),e.accuracy.toFixed(1)+"%"].forEach(function(text){

            const td=document.createElement("td");

            td.textContent=text;

            tr.appendChild(td);

        });

        tbody.appendChild(tr);

    });

}
