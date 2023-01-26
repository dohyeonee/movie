let seoulTheater = ['강남', '강변', '건대입구', '구로', '명동', '성신여대입구',    '송파', '수유', '압구정', '여의도', '연남', '왕십리', '홍대'];let gyeongiTheater = ['광명역', '구리', '김포', '동탄', '부천', '산본', '수원',    '안산', '오산', '용인', '의정부', '이천', '일산', '평택'];let incheonTheater = ['계양', '부평', '인천', '주안역', '청라'];let gangwonTheater = ['강릉', '원주', '원통', '인제', '춘천'];let daejeonChungcheongTheater = ['논산', '당진', '대전', '서산', '세종', '제천', '천안', '청주', '충북혁신', '홍성'];let daeguTheater = ['대구수성', '대구스타디움', '대구아카데미', '대구연경', '대구월성', '대구한일', '대구현대'];let busanUlsanTheater = ['대연', '동래', '부산명지', '서면', '센텀시티', '울산동구', '울산삼산', '울산신천',    '정관', '해운대', '화명'];let gyeongsangTheater = ['거제', '경산', '고성', '구미', '김해율하', '마산', '북포항', '안동', '진주혁신',    '창원', '창원더시티', '창원상남'];let gwangjuJeonlaJejuTheater = ['광양', '광주터미널', '광주하남', '군산', '나주', '목포', '목포평화광장',    '서전주', '순천', '순천신대', '여수웅천', '익산', '전주고사', '정읍', '제주', '제주노형'];let theaterUl = document.querySelector("#theaterUl");let selectedTheater;function selectList(list) {    list.forEach(li => {        initList(list, li);    })}function initList(list, li) {    li.addEventListener('click', function() {        list.forEach(li => {            li.classList.remove("selected");        })        li.classList.add("selected");    })}function getTheater(city) {    while(theaterUl.hasChildNodes()) {        theaterUl.removeChild(theaterUl.firstChild);    }    if(city == '서울') {        for(let i = 0; i < seoulTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = seoulTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '경기') {        for(let i = 0; i < gyeongiTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = gyeongiTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '인천') {        for(let i = 0; i < incheonTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = incheonTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '강원') {        for(let i = 0; i < gangwonTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = gangwonTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            theaterUl.appendChild(li);            li.onclick = function() {                selectedTheater = this.innerHTML;            }            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '대전/충청') {        for(let i = 0; i < daejeonChungcheongTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = daejeonChungcheongTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '대구') {        for(let i = 0; i < daeguTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = daeguTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '부산/울산') {        for(let i = 0; i < busanUlsanTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = busanUlsanTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '경상') {        for(let i = 0; i < gyeongsangTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = gyeongsangTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }    if(city == '광주/전라/제주') {        for(let i = 0; i < gwangjuJeonlaJejuTheater.length; i ++) {            let li = document.createElement("li");            li.innerHTML = gwangjuJeonlaJejuTheater[i];            li.style.listStyle = "none";            li.style.cursor = "pointer";            li.style.color = "black";            li.classList.add("list-group-item");            li.classList.add("theater");            li.onclick = function() {                selectedTheater = this.innerHTML;            }            theaterUl.appendChild(li);            let theaterList = document.querySelectorAll(".theater");            selectList(theaterList)        }    }}let now = new Date();let month = now.getMonth();let day = now.getDay();let getDate = now.getDate();let fullYear = now.getFullYear();let year = document.querySelector(".year");year.innerHTML = fullYear;let monthCount = 1;let getMonth = document.querySelector(".month");getMonth.innerHTML = month + monthCount++;let dateUl = document.querySelector(".dateUl");let days = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];let dateCount = 0;let saturday = 0;let lastDay;let realMonth = month + 1;for(let j = realMonth; j < realMonth + 1; j++) {    lastDay = new Date(2023, j, 0);    for(let i = 0; i < lastDay.getDate(); i++) {        let li = document.createElement("li");        li.style.listStyle = "none";        li.classList.add("list-group-item");        li.classList.add("date");        dateUl.appendChild(li);        let a = document.createElement("a");        a.href="#";        a.style.cursor = "pointer";        a.style.textDecoration = "none";        a.style.color = "black";        li.appendChild(a);        let dateSpan = document.createElement("span");        dateSpan.style.textAlign = "center";        dateSpan.style.width = "40px";        dateSpan.style.fontSize = "16px";        dateSpan.style.float = "left";        dateSpan.style.padding = "6px";        dateSpan.innerHTML = getDate + dateCount++;        if(dateSpan.innerHTML > lastDay.getDate()) {            getDate = 0;            dateCount = 1;            dateSpan.innerHTML = getDate + dateCount++;            let dateContainer = document.querySelector(".dateContainer");            dateContainer.appendChild(dateUl);            let yearLi = document.createElement("li");            yearLi.style.listStyle = "none";            yearLi.classList.add("list-group-item");            dateUl.appendChild(yearLi);            let yearSpan = document.createElement("span");            yearSpan.style.display = "block";            yearSpan.style.textAlign = "center";            yearSpan.style.fontSize = "13px";            yearSpan.style.fontWeight = "bold";            yearSpan.innerHTML = fullYear;            let nextMonthSpan = document.createElement("span");            nextMonthSpan.style.display = "block";            nextMonthSpan.style.textAlign = "center";            nextMonthSpan.style.fontSize = "30px";            nextMonthSpan.style.fontWeight = "bold";            nextMonthSpan.innerHTML = month + monthCount++;            if (monthCount > 12) {                monthCount = 1;            }            a.appendChild(yearSpan);            a.appendChild(nextMonthSpan);        }            let daySpan = document.createElement("span");            daySpan.style.textAlign = "center";            daySpan.style.width = "40px";            daySpan.style.fontSize = "16px";            daySpan.style.float = "right";            daySpan.style.fontWeight = "bold";            daySpan.style.padding = "6px";            daySpan.innerHTML = days[day++];            if(day > 6 ) {                day = 0;                a.style.color = "blue";            }            if(day == 1) {                a.style.color = "red";            }        a.appendChild(dateSpan);        a.appendChild(daySpan);    }}let movie = document.querySelectorAll(".movie");let city = document.querySelectorAll(".city");let date = document.querySelectorAll(".date");let time = document.querySelectorAll(".time");selectList(movie);selectList(city);selectList(time);selectList(date);