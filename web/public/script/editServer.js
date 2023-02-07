$(document).ready(() => {
    document.getElementById("datePicker").min = "01/01/2023";
    dragElement(document.querySelector(".cart"));
    function dragElement(elmnt) {
        var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        if (document.getElementById(elmnt.id + "header")) {
            document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
        } else {
            elmnt.onmousedown = dragMouseDown;
        }

        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            pos3 = e.clientX;
            pos4 = e.clientY;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
            elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }

    const datePicker = document.getElementById("datePicker");
    datePicker.min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    datePicker.value = datePicker.value;

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const selectOS = document.querySelector(".form-select");
    let personId = urlParams.get('personId');
    let serverId = urlParams.get('serverId');
    let customer = document.getElementById("customer").innerText;
    let defaultValues = document.querySelectorAll("input[type=radio]:checked");
    let cpu = defaultValues[0].value;
    let ram = defaultValues[1].value;
    let diskSpace = defaultValues[2].value;
    let bandwidth = defaultValues[3].value;
    let raid = defaultValues[4].value;
    let endDate = datePicker.value;
    let cpuPrice = parseFloat(defaultValues[0].dataset.price);
    let ramPrice = parseFloat(defaultValues[1].dataset.price);
    let diskSpacePrice = parseFloat(defaultValues[2].dataset.price);
    let bandwidthPrice = parseFloat(defaultValues[3].dataset.price);
    let raidPrice = parseFloat(defaultValues[4].dataset.price);
    let os = selectOS.options[selectOS.selectedIndex].innerText;
    let endDatePrice = 1;
    const radioButtons = document.querySelectorAll("input[type=radio]");

    endDatePrice = new Date(datePicker.value).getTime() - new Date(datePicker.dataset.started).getTime();
    endDatePrice = (Math.ceil(endDatePrice / (1000 * 3600 * 24)));
    datePicker.min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];

    selectOS.addEventListener("change", () => {
        os = selectOS.options[selectOS.selectedIndex].innerText;
        cart(personId, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
    });

    datePicker.addEventListener("change", () => {
        endDate = datePicker.value;
        endDatePrice = Date.parse(datePicker.value) - new Date().getTime();
        endDatePrice = (Math.ceil(endDatePrice / (1000 * 3600 * 24)));
        calculatePrice();
        cart(personId, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
    });

    for (let radioButton of radioButtons) {
        radioButton.addEventListener("change", () => {
            checkButton(radioButton);
            calculatePrice(radioButton.dataset.price, radioButton);
            cart(personId, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
        });
    }

    const saveValues = () => {
        const select = document.querySelector(".form-select");
        const p = document.querySelector(".response");
        $.post("../EditServerServlet", {personId, serverId, price, cpu, ram, diskSpace, bandwidth, raid, os, endDate}, () => {
            p.style.color = "#28A745";
            p.innerText = "Successfully updated.";
        });
    }

    const cart = (personId, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate) => {
        const cartDiv = document.querySelector(".cart");

        cartDiv.innerHTML = `
                             <p>Customer: ${customer}</p>
                             <p>CPU: ${cpu}</p>
                             <p>RAM: ${ram}</p>
                             <p>Disk Space: ${diskSpace}</p>
                             <p>Bandwidth: ${bandwidth}</p>
                             <p>RAID: ${raid}</p>
                             <p>OS: ${os}</p>
                             <p>End Date: ${endDate}</p>
                             <h5>Price: €${calculatePrice()}</h5>
                             <div class="card-footer d-flex justify-content-center">
                                <button class="btn-confirm btn btn-primary mb-3">Update</button>
                             </div>
                             <p class="response"></p>`;

        const button = cartDiv.querySelector('.btn-confirm');
        button.addEventListener("click", saveValues);
    };

    const checkButton = (button, value = 0) => {
        if (button.name == "radioCpu") {
            cpu = button.value;
            cpuPrice = value;
            return;
        }
        if (button.name == "radioRam") {
            ram = button.value;
            ramPrice = value;
            return;
        }
        if (button.name == "radioDiskSpace") {
            diskSpace = button.value;
            diskSpacePrice = value;
            return;
        }
        if (button.name == "radioBandwidth") {
            bandwidth = button.value;
            bandwidthPrice = value;
            return;
        }
        if (button.name == "radioRaid") {
            raid = button.value;
            raidPrice = value;
            return;
    }
    }

    const calculatePrice = (newValue, radioButton) => {
        newValue = parseFloat(newValue);
        if (radioButton != undefined)
            checkButton(radioButton, newValue);
        price = cpuPrice + ramPrice + diskSpacePrice + bandwidthPrice + raidPrice + (endDatePrice * 0.7);
        return price.toFixed(2);
    }
    calculatePrice();
    cart(personId, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);


});