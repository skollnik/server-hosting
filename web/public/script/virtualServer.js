$(document).ready(() => {
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
    datePicker.value = datePicker.min;

    const select = document.querySelectorAll(".form-select")[0];
    const selectOS = document.querySelectorAll(".form-select")[1];
    let id = select.options[select.selectedIndex].dataset.id;
    let customer = select.options[select.selectedIndex].innerText;
    let defaultValues = document.querySelectorAll("input[type=radio]:checked");
    let cpu = defaultValues[0].value;
    let ram = defaultValues[1].value;
    let diskSpace = defaultValues[2].value;
    let bandwidth = defaultValues[3].value;
    let raid = defaultValues[4].value;
    let endDate = datePicker.value;
    let [cpuPrice, ramPrice, diskSpacePrice, bandwidthPrice, raidPrice] = Array(5).fill(0);
    let os = selectOS.options[selectOS.selectedIndex].innerText;
    let endDatePrice = 1;
    const radioButtons = document.querySelectorAll("input[type=radio]");

    select.addEventListener("change", () => {
        customer = select.options[select.selectedIndex].innerText;
        id = select.options[select.selectedIndex].dataset.id;
        cart(id, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
    });

    selectOS.addEventListener("change", () => {
        os = selectOS.options[selectOS.selectedIndex].innerText;
        cart(id, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
    });

    datePicker.addEventListener("change", () => {
        endDate = datePicker.value;
        endDatePrice = Date.parse(datePicker.value) - new Date().getTime();
        endDatePrice = (Math.ceil(endDatePrice / (1000 * 3600 * 24)));
        calculatePrice();
        cart(id, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
    });

    for (let radioButton of radioButtons) {
        radioButton.addEventListener("change", () => {
            checkButton(radioButton);
            calculatePrice(radioButton.dataset.price, radioButton);
            cart(id, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
        });
    }

    const saveValues = () => {
        const select = document.querySelector(".form-select");
        const p = document.querySelector(".response");
        if (id == -1) {
            p.style.color = "#DC3545";
            p.innerText = "Select one of the Persons.";
            return;
        }
        $.post("../NewServerServlet", {serverType: "virtual", id, price, cpu, ram, diskSpace, bandwidth, raid, os, endDate}, () => {
            p.style.color = "#28A745";
            p.innerText = "Successfully added a Server to Person.";
        });
    }

    const cart = (id, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate) => {
        const cartDiv = document.querySelector(".cart");
        if (customer == "Choose Person") {
            customer = "";
        }
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
                                <button class="btn-confirm btn btn-primary mb-3">Buy</button>
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
    cart(id, customer, cpu, ram, diskSpace, bandwidth, raid, os, endDate);
});