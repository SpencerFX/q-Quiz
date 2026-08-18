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

        // Places beyond however many real users have any history yet
        // come back with an empty handle and zeroed stats - show those
        // as dashes rather than a misleading "0%"/"0".
        const filled=!!e.handle;

        const cells=filled
            ? [String(e.place),e.handle,String(e.score),String(e.solved),e.accuracy.toFixed(1)+"%"]
            : [String(e.place),"—","—","—","—"];

        cells.forEach(function(text){

            const td=document.createElement("td");

            td.textContent=text;

            tr.appendChild(td);

        });

        if(!filled) tr.className="leaderboardEmptyRow";

        tbody.appendChild(tr);

    });

}
