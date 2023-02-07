$(document).ready(() => {
    const modal = document.querySelector(".modal");
    const buttons = document.getElementsByTagName("button");
    const span = document.getElementsByClassName("close")[0];

    for (let b of buttons) {
        b.addEventListener("click", () => {
            modal.style.display = "block";
            const price = (b.parentNode.parentNode.children[1].children[0].innerText).split("€")[1].split("/")[0];
            const cpu = b.parentNode.parentNode.children[2].children[0].innerText;
            const ram = b.parentNode.parentNode.children[2].children[1].innerText;
            const diskSpace = b.parentNode.parentNode.children[2].children[2].innerText;
            const bandwidth = b.parentNode.parentNode.children[2].children[3].innerText;
            const raid = b.parentNode.parentNode.children[2].children[4].innerText;
            const os = b.parentNode.parentNode.children[2].children[5].innerText;
            const div = document.querySelector(".selected-server");
            div.innerHTML = selectedServer(price, cpu, ram, diskSpace, bandwidth, raid, os);
            const button = document.querySelector(".btn-confirm");
            sendValues(button, "dedicated", price, cpu, ram, diskSpace, bandwidth, raid, os);
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

    const selectedServer = (price, cpu, ram, diskSpace, bandwidth, raid, os) => {
        return `<ul class="d-flex justify-content-center align-items-center">
                    <li>€${price}<small>/month</small></li>
                    <li>${cpu}</li>
                    <li>${ram}</li>
                    <li>${diskSpace}</li>
                    <li>${bandwidth}</li>
                    <li>${raid}</li>
                    <li>${os}</li>
                </ul>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn-confirm btn btn-primary mb-3">Buy</button>
                </div>
                <p class="response"></p>`;
    }

    const sendValues = (button, serverType, price, cpu, ram, diskSpace, bandwidth, raid, os) => {
        button.addEventListener("click", () => {
            const select = document.querySelector(".form-select");
            const id = select.options[select.selectedIndex].dataset.id;
            const p = document.querySelector(".response");
            if (id == -1) {
                p.style.color = "#DC3545";
                p.innerText = "Select one of the Persons.";
                return;
            }
            $.post("../NewServerServlet", {serverType, id, price, cpu, ram, diskSpace, bandwidth, raid, os}, () => {
                p.style.color = "#28A745";
                p.innerText = "Successfully added a Server to Person.";
            });
        });
    }

});