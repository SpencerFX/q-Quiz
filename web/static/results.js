const PALETTE={

    surface:"#1a1a19",

    grid:"#2c2c2a",

    axis:"#383835",

    textMuted:"#898781",

    textSecondary:"#c3c2b7",

    textPrimary:"#ffffff",

    blue:"#3987e5",

    good:"#0ca30c",

    critical:"#d03b3b"

};



window.addEventListener("DOMContentLoaded",function(){

    if(document.getElementById("kpiRow")){

        loadDashboard();

    }

});



async function loadDashboard(){

    const response=await fetch("/api/history");

    const history=await response.json();

    renderKpis(history);

    renderAccuracyChart(history);

    renderBreakdownChart(buildTypeGroups(history));

    renderTable(history);

}



const TYPE_LABELS={

    MultipleChoice:"Multiple Choice",

    MultipleChoiceSyntax:"Multiple Choice - Syntax",

    HackerRank:"HackerRank",

    Idioms:"Idioms",

    DiChallenge:"AquaQ Challenges",

    Leetcode:"leetcode",

    QuantRank:"quantRank"

};



function buildTypeGroups(history){

    const types=[];

    history.forEach(function(h){

        if(types.indexOf(h.questionType)===-1) types.push(h.questionType);

    });

    const groups=types.map(function(type){

        const rows=history.filter(function(h){ return h.questionType===type; });

        const correct=rows.filter(function(h){ return h.correct; }).length;

        return {

            label:TYPE_LABELS[type]||type,

            correct:correct,

            incorrect:rows.length-correct

        };

    });

    return groups;

}



function renderKpis(history){

    const container=document.getElementById("kpiRow");

    container.innerHTML="";

    const total=history.length;

    const correct=history.filter(function(h){ return h.correct; }).length;

    const tiles=[

        { label:"Total attempts", value:String(total) },

        { label:"Overall accuracy", value: total? (100*correct/total).toFixed(1)+"%":"—" }

    ];

    buildTypeGroups(history).forEach(function(g){

        tiles.push({ label:g.label, value:g.correct+" / "+(g.correct+g.incorrect) });

    });

    tiles.forEach(function(t){

        const tile=document.createElement("div");

        tile.className="statTile";

        const value=document.createElement("div");

        value.className="statValue";

        value.textContent=t.value;

        const label=document.createElement("div");

        label.className="statLabel";

        label.textContent=t.label;

        tile.appendChild(value);

        tile.appendChild(label);

        container.appendChild(tile);

    });

}



function renderTable(history){

    const tbody=document.getElementById("historyTableBody");

    tbody.innerHTML="";

    history.slice().reverse().forEach(function(row){

        const tr=document.createElement("tr");

        [String(row.questionNo),row.question,row.questionType].forEach(function(text){

            const td=document.createElement("td");

            td.textContent=text;

            tr.appendChild(td);

        });

        const resultTd=document.createElement("td");

        resultTd.className=row.correct? "resultPass":"resultFail";

        resultTd.textContent=row.correct? "✓ Correct":"✗ Incorrect";

        tr.appendChild(resultTd);

        const pctTd=document.createElement("td");

        pctTd.textContent=row.percentCorrect.toFixed(1)+"%";

        tr.appendChild(pctTd);

        tbody.appendChild(tr);

    });

}



function showTooltip(clientX,clientY,title,value){

    const tip=document.getElementById("chartTooltip");

    tip.querySelector(".tipValue").textContent=value;

    tip.querySelector(".tipTitle").textContent=title;

    tip.style.left=(clientX+14)+"px";

    tip.style.top=(clientY+14)+"px";

    tip.style.display="block";

}



function hideTooltip(){

    document.getElementById("chartTooltip").style.display="none";

}



function roundedTopRectPath(x,y,w,h,r){

    r=Math.max(0,Math.min(r,h,w/2));

    return "M "+x+" "+(y+h)+

        " L "+x+" "+(y+r)+

        " Q "+x+" "+y+" "+(x+r)+" "+y+

        " L "+(x+w-r)+" "+y+

        " Q "+(x+w)+" "+y+" "+(x+w)+" "+(y+r)+

        " L "+(x+w)+" "+(y+h)+

        " Z";

}



function renderAccuracyChart(history){

    const svgNS="http://www.w3.org/2000/svg";

    const width=820,height=220,padL=44,padR=16,padT=16,padB=12;

    const plotW=width-padL-padR, plotH=height-padT-padB;

    const container=document.getElementById("accuracyChart");

    container.innerHTML="";

    if(history.length===0){

        container.innerText="No attempts yet.";

        return;

    }

    const n=history.length;

    const xAt=function(i){ return padL+(n===1? plotW/2:(plotW*i)/(n-1)); };

    const yAt=function(p){ return padT+plotH-(plotH*p/100); };

    const svg=document.createElementNS(svgNS,"svg");

    svg.setAttribute("viewBox","0 0 "+width+" "+height);

    svg.setAttribute("width","100%");

    svg.setAttribute("class","chartSvg");

    [0,25,50,75,100].forEach(function(p){

        const y=yAt(p);

        const line=document.createElementNS(svgNS,"line");

        line.setAttribute("x1",padL); line.setAttribute("x2",width-padR);

        line.setAttribute("y1",y); line.setAttribute("y2",y);

        line.setAttribute("stroke",PALETTE.grid);

        line.setAttribute("stroke-width","1");

        svg.appendChild(line);

        const label=document.createElementNS(svgNS,"text");

        label.setAttribute("x",padL-8); label.setAttribute("y",y+4);

        label.setAttribute("text-anchor","end");

        label.setAttribute("fill",PALETTE.textMuted);

        label.setAttribute("font-size","11");

        label.textContent=p+"%";

        svg.appendChild(label);

    });

    let areaPath="M "+xAt(0)+" "+yAt(0);

    history.forEach(function(h,i){ areaPath+=" L "+xAt(i)+" "+yAt(h.percentCorrect); });

    areaPath+=" L "+xAt(n-1)+" "+yAt(0)+" Z";

    const area=document.createElementNS(svgNS,"path");

    area.setAttribute("d",areaPath);

    area.setAttribute("fill",PALETTE.blue);

    area.setAttribute("opacity","0.1");

    area.setAttribute("stroke","none");

    svg.appendChild(area);

    let linePath="";

    history.forEach(function(h,i){

        linePath+=(i===0? "M ":"L ")+xAt(i)+" "+yAt(h.percentCorrect)+" ";

    });

    const line=document.createElementNS(svgNS,"path");

    line.setAttribute("d",linePath);

    line.setAttribute("fill","none");

    line.setAttribute("stroke",PALETTE.blue);

    line.setAttribute("stroke-width","2");

    line.setAttribute("stroke-linejoin","round");

    line.setAttribute("stroke-linecap","round");

    svg.appendChild(line);

    const last=history[n-1];

    const endDot=document.createElementNS(svgNS,"circle");

    endDot.setAttribute("cx",xAt(n-1)); endDot.setAttribute("cy",yAt(last.percentCorrect));

    endDot.setAttribute("r","5");

    endDot.setAttribute("fill",PALETTE.blue);

    endDot.setAttribute("stroke",PALETTE.surface);

    endDot.setAttribute("stroke-width","2");

    svg.appendChild(endDot);

    const endLabel=document.createElementNS(svgNS,"text");

    endLabel.setAttribute("x",xAt(n-1)-8);

    endLabel.setAttribute("y",yAt(last.percentCorrect)-10);

    endLabel.setAttribute("text-anchor","end");

    endLabel.setAttribute("fill",PALETTE.textPrimary);

    endLabel.setAttribute("font-size","12");

    endLabel.setAttribute("font-weight","600");

    endLabel.textContent=last.percentCorrect.toFixed(1)+"%";

    svg.appendChild(endLabel);

    const crosshair=document.createElementNS(svgNS,"line");

    crosshair.setAttribute("y1",padT); crosshair.setAttribute("y2",height-padB);

    crosshair.setAttribute("stroke",PALETTE.axis);

    crosshair.setAttribute("stroke-width","1");

    crosshair.setAttribute("visibility","hidden");

    svg.appendChild(crosshair);

    const hoverDot=document.createElementNS(svgNS,"circle");

    hoverDot.setAttribute("r","5");

    hoverDot.setAttribute("fill",PALETTE.blue);

    hoverDot.setAttribute("stroke",PALETTE.surface);

    hoverDot.setAttribute("stroke-width","2");

    hoverDot.setAttribute("visibility","hidden");

    svg.appendChild(hoverDot);

    const hitLayer=document.createElementNS(svgNS,"rect");

    hitLayer.setAttribute("x",padL); hitLayer.setAttribute("y",padT);

    hitLayer.setAttribute("width",plotW); hitLayer.setAttribute("height",plotH);

    hitLayer.setAttribute("fill","transparent");

    svg.appendChild(hitLayer);

    function pointerMove(evt){

        const rect=svg.getBoundingClientRect();

        const scale=width/rect.width;

        const localX=(evt.clientX-rect.left)*scale;

        let idx=Math.round(n===1? 0:(localX-padL)/plotW*(n-1));

        idx=Math.max(0,Math.min(n-1,idx));

        const point=history[idx];

        const x=xAt(idx), y=yAt(point.percentCorrect);

        crosshair.setAttribute("x1",x); crosshair.setAttribute("x2",x);

        crosshair.setAttribute("visibility","visible");

        hoverDot.setAttribute("cx",x); hoverDot.setAttribute("cy",y);

        hoverDot.setAttribute("visibility","visible");

        showTooltip(evt.clientX,evt.clientY,

            "Question "+point.questionNo+" · "+(point.correct? "correct":"incorrect"),

            point.percentCorrect.toFixed(1)+"% running accuracy");

    }

    function pointerLeave(){

        crosshair.setAttribute("visibility","hidden");

        hoverDot.setAttribute("visibility","hidden");

        hideTooltip();

    }

    hitLayer.addEventListener("pointermove",pointerMove);

    hitLayer.addEventListener("pointerleave",pointerLeave);

    container.appendChild(svg);

}



function renderBreakdownChart(groups){

    const svgNS="http://www.w3.org/2000/svg";

    const width=820,height=240,padL=40,padR=16,padT=28,padB=40;

    const plotW=width-padL-padR, plotH=height-padT-padB;

    const container=document.getElementById("breakdownChart");

    container.innerHTML="";

    if(groups.length===0){

        container.innerText="No attempts yet.";

        return;

    }

    const maxVal=Math.max(1,...groups.map(function(g){ return Math.max(g.correct,g.incorrect); }));

    const yAt=function(v){ return padT+plotH-(plotH*v/maxVal); };

    const barW=24, gap=2;

    const groupW=barW*2+gap;

    // Spread groups to fill the available width (capped so a handful
    // of groups don't drift too far apart), instead of a fixed gap
    // that pushed wider group counts past the plot area and clipped
    // the leftmost bars.
    const groupGap=groups.length>1
        ? Math.min(96,Math.max(16,(plotW-groups.length*groupW)/(groups.length-1)))
        :0;

    const totalW=groups.length*groupW+(groups.length-1)*groupGap;

    const startX=padL+(plotW-totalW)/2;

    const svg=document.createElementNS(svgNS,"svg");

    svg.setAttribute("viewBox","0 0 "+width+" "+height);

    svg.setAttribute("width","100%");

    svg.setAttribute("class","chartSvg");

    const baseline=document.createElementNS(svgNS,"line");

    baseline.setAttribute("x1",padL); baseline.setAttribute("x2",width-padR);

    baseline.setAttribute("y1",yAt(0)); baseline.setAttribute("y2",yAt(0));

    baseline.setAttribute("stroke",PALETTE.axis);

    baseline.setAttribute("stroke-width","1");

    svg.appendChild(baseline);

    groups.forEach(function(g,gi){

        const gx=startX+gi*(groupW+groupGap);

        [["correct",g.correct,PALETTE.good],["incorrect",g.incorrect,PALETTE.critical]]

            .forEach(function(entry,bi){

                const key=entry[0], val=entry[1], color=entry[2];

                const bx=gx+bi*(barW+gap);

                const by=yAt(val);

                const bh=yAt(0)-by;

                const bar=document.createElementNS(svgNS,"path");

                bar.setAttribute("d",roundedTopRectPath(bx,by,barW,Math.max(bh,0),4));

                bar.setAttribute("fill",color);

                bar.classList.add("barMark");

                bar.addEventListener("pointermove",function(evt){

                    bar.classList.add("barHover");

                    showTooltip(evt.clientX,evt.clientY,g.label,val+" "+key);

                });

                bar.addEventListener("pointerleave",function(){

                    bar.classList.remove("barHover");

                    hideTooltip();

                });

                svg.appendChild(bar);

                const label=document.createElementNS(svgNS,"text");

                label.setAttribute("x",bx+barW/2);

                label.setAttribute("y",by-8);

                label.setAttribute("text-anchor","middle");

                label.setAttribute("fill",PALETTE.textPrimary);

                label.setAttribute("font-size","12");

                label.setAttribute("font-weight","600");

                label.textContent=val;

                svg.appendChild(label);

            });

        const groupLabel=document.createElementNS(svgNS,"text");

        groupLabel.setAttribute("x",gx+groupW/2);

        groupLabel.setAttribute("y",height-padB+22);

        groupLabel.setAttribute("text-anchor","middle");

        groupLabel.setAttribute("fill",PALETTE.textMuted);

        groupLabel.setAttribute("font-size","12");

        groupLabel.textContent=g.label;

        svg.appendChild(groupLabel);

    });

    container.appendChild(svg);

}
