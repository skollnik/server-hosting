$(document).ready(() => {
    const spans = document.querySelectorAll("span");
    for (const span of spans) {
        if (span.textContent.includes("days")) {
            const expiresIn = span.textContent.split(" ")[0];
            if (parseInt(expiresIn) <= 7) {
                span.style.color = "#DC3545";
            } else {
                span.style.color = "#43A047";
            }
        }
    }

    const modal = document.querySelector(".modal");
    const buttons = document.getElementsByTagName("button");
    const span = document.getElementsByClassName("close")[0];
    let serverId;
    let personId;
    for (let b of buttons) {
        b.addEventListener("click", () => {
            modal.style.display = "block";
            serverId = b.getAttribute("data-id");
            personId = b.getAttribute("data-person");
        });
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    const startDate = document.querySelectorAll("input[type=date]")[0];
    const endDate = document.querySelectorAll("input[type=date]")[1];
    let p = document.querySelector(".response");

    startDate.value = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    endDate.value = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];

    startDate.addEventListener("change", () => {
        let personId = startDate.dataset.id;
        let dateStart = startDate.value;
        let dateEnd = endDate.value;
        $.post("../DetailsServlet", {personId, dateStart, dateEnd}, (response) => {
            $(".servers").html(response);
        }, "html");
    });

    endDate.addEventListener("change", () => {
        let personId = endDate.dataset.id;
        let dateStart = startDate.value;
        let dateEnd = endDate.value;
        $.post("../DetailsServlet", {personId, dateStart, dateEnd}, (response) => {
            $(".servers").html(response);
        }, "html");
    });

    let leasedVirtualServers = document.querySelector(".virtual-servers-list");
    let dates = document.querySelectorAll(".server");
    let arrayOfDates = [];
    for (let date of dates) {
        arrayOfDates.push("<div class='server'>" + date.innerHTML + "</div>");
    }
    let select = document.querySelector("#sort");
    select.addEventListener("change", () => {
        let value = document.querySelector("#sort").value;
        if (value.startsWith("-")) {
            for (let i = 0; i < arrayOfDates.length - 1; i++) {
                for (let j = i + 1; j < arrayOfDates.length; j++) {
                    if (arrayOfDates[i].split(';\">')[1].split(" days")[0] < arrayOfDates[j].split(';\">')[1].split(" days")[0]) {
                        let x = arrayOfDates[i];
                        arrayOfDates[i] = arrayOfDates[j];
                        arrayOfDates[j] = x;
                    }
                }
            }
        } else {
            for (let i = 0; i < arrayOfDates.length - 1; i++) {
                for (let j = i + 1; j < arrayOfDates.length; j++) {
                    if (arrayOfDates[i].split(';\">')[1].split(" days")[0] > arrayOfDates[j].split(';\">')[1].split(" days")[0]) {
                        let x = arrayOfDates[i];
                        arrayOfDates[i] = arrayOfDates[j];
                        arrayOfDates[j] = x;
                    }
                }
            }
        }
        leasedVirtualServers.innerHTML = arrayOfDates.join("");
    });
});