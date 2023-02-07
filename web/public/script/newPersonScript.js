let selected = document.querySelector("select");
let forms = document.querySelectorAll("form");

selected.addEventListener("change", () => {
    if (selected.value == "1") {
        forms[0].style.display = "block";
        forms[1].style.display = "none";
    } else {
        forms[0].style.display = "none";
        forms[1].style.display = "block";
    }
});