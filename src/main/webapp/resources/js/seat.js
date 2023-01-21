let content = document.querySelector(".content");

let adultValue = document.querySelector(".adult_value_button");
let teenagerValue = document.querySelector(".teenager_value_button");
let olderValue = document.querySelector(".older_value_button");

let price;
function countButton(button) {
    if(button.innerHTML === "-" && button.classList.value === "adult_minus_button") {
        if(Number(adultValue.innerHTML) > 0) {
            adultValue.innerHTML = Number(adultValue.innerHTML) - 1;
        }
    }

    if(button.innerHTML === "-" && button.classList.value === "teenager_minus_button") {
        if(Number(teenagerValue.innerHTML) > 0) {
            teenagerValue.innerHTML = Number(teenagerValue.innerHTML) - 1;
        }
    }

    if(button.innerHTML === "-" && button.classList.value === "older_minus_button") {
        if(Number(olderValue.innerHTML) > 0) {
            olderValue.innerHTML = Number(olderValue.innerHTML) - 1;
        }
    }

    if(button.innerHTML === "+" && button.classList.value === "adult_plus_button") {
        adultValue.innerHTML = Number(adultValue.innerHTML) + 1;
    }

    if(button.innerHTML === "+" && button.classList.value === "teenager_plus_button") {
        teenagerValue.innerHTML = Number(teenagerValue.innerHTML) + 1;
    }

    if(button.innerHTML === "+" && button.classList.value === "older_plus_button") {
        olderValue.innerHTML = Number(olderValue.innerHTML) + 1;
    }

    allMoney = Number(adultValue.innerHTML) * 13000 + Number(teenagerValue.innerHTML) * 10000 + Number(olderValue.innerHTML) * 7000;

    price = document.querySelector(".price");
    price.innerHTML = allMoney +"원";
}



for(let i = 0; i < 10; i++) {
    let div = document.createElement("div");
    div.classList = "buttonWrapper";
    div.style.textAlign = "center";
    content.appendChild(div);


    for(let j = 0; j < 12; j++) {
        let input = document.createElement("input");
        input.type = "button";
        input.name = "seats";
        input.classList = "seat";
        input.style.width = "50px";
        input.style.height = "30px";
        input.style.margin = "3px";
        input.style.cursor = "pointer";
        input.style.border = "1px solid black";
        input.style.borderRadius = "4px";
        input.style.backgroundColor = "#fff";
        input.style.fontWeight = "bold";
        inputValue(i, j, input);
        div.appendChild(input);
        clickEvent(input);
    }
}

function inputValue(i, j, input) {
    if (i === 0) {
        input.value = 'A' + j;
    } else if (i === 1) {
        input.value = 'B' + j;
    } else if (i === 2) {
        input.value = 'C' + j;
    } else if (i === 3) {
        input.value = 'D' + j;
    } else if (i === 4) {
        input.value = 'E' + j;
    } else if (i === 5) {
        input.value = 'F' + j;
    } else if (i === 6) {
        input.value = 'G' + j;
    } else if (i === 7) {
        input.value = 'H' + j;
    } else if (i === 8) {
        input.value = 'I' + j;
    } else if (i === 9) {
        input.value = 'J' + j;
    } else if (i === 10) {
        input.value = 'K' + j;
    }
}

let seats = document.querySelectorAll(".seat");
let selected;
let selectedSeat = [];
let array = [];
let realSeat = document.querySelector(".real_seat");

function clickEvent(input) {
    input.addEventListener('click', function(){

        if(Number(adultValue.innerHTML) === 0 && Number(teenagerValue.innerHTML) === 0 && Number(olderValue.innerHTML) === 0) {
            alert("관람하실 인원을 먼저 선택해 주세요.");
            return false;
        }
        selectedSeat = selectedSeat.filter((element, index) => selectedSeat.indexOf(element) != index );

        if(input.classList.contains('selected')) {
            input.classList.remove('selected');
            selected = document.querySelectorAll('.selected');

            selected.forEach(data => {
                selectedSeat.push(data.value);
            })
        } else {
            input.classList.add('selected');
            selected = document.querySelectorAll('.selected');

            if(selected.length > Number(adultValue.innerHTML) + Number(teenagerValue.innerHTML) + Number(olderValue.innerHTML)) {
                input.classList.remove('selected');
                alert("지정한 인원수를 넘었습니다.");
                return;
            }

            selected.forEach(data => {
                selectedSeat.push(data.value);
            });
        }

        realSeat.innerHTML = selectedSeat.join("/");
    })
}


let resetButton = document.querySelector(".reset_button");

resetButton.addEventListener("click", function() {
    adultValue.innerHTML = 0;
    teenagerValue.innerHTML = 0;
    olderValue.innerHTML = 0;
    realSeat.innerHTML = "";
    price.innerHTML = "";
    seats.forEach(seat => {
        seat.classList.remove("selected");
    })
})