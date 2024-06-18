let value = -2;

function changeText() {
    document.getElementById("inner").innerText = value + " ";
    value += 1;
    if (value == 11) {
        const para = document.createElement("p");
        para.innerHTML = "wow you really like clicking";
        document.getElementById("outer").appendChild(para);
    }
}