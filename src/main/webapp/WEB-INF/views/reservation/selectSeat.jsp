<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--<link rel="stylesheet" href="css/reset.css">--%>
<link rel="stylesheet" href="css/seat.css">

<div class="all_container">
    <div>
        <h1>예매</h1>
        <hr>
        <div class="flex_container">
            <div>
                <span>관람인원선택</span>
            </div>
            <div>
                <button class="reset_button">초기화</button>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="main_container">
            <div class="select_people">
                <div>
                    <span>성인</span>
                    <span>
                            <button class="adult_minus_button" onclick="countButton(this)">-</button>
                            <button class="adult_value_button">0</button>
                            <button class="adult_plus_button" onclick="countButton(this)">+</button>
                        </span>
                </div>

                <div>
                    <span>청소년</span>
                    <span>
                            <button class="teenager_minus_button" onclick="countButton(this)">-</button>
                            <button class="teenager_value_button">0</button>
                            <button class="teenager_plus_button" onclick="countButton(this)">+</button>
                        </span>
                </div>

                <div>
                    <span>우대</span>
                    <span>
                            <button class="older_minus_button" onclick="countButton(this)">-</button>
                            <button class="older_value_button">0</button>
                            <button class="older_plus_button" onclick="countButton(this)">+</button>
                        </span>
                </div>
            </div>

            <div class="content">
                <div class="content_text">
                    screen
                </div>
            </div>
        </div>
    </div>
</div>

    <div style="display:flex; background-color: darkgray; height: 70px; align-items: center; justify-content: center;">
        <div style="color: black; display: flex; margin: 10px; width: 225px; border-right: 1px solid black; align-items: center; justify-content: center;">
            <div>
                영화제목 : <span class="movie">${movie}</span>
            </div>
        </div>
        <div>
            <div>
                <div>
                    <span>지역 :</span>
                    <span>${city}</span>
                </div>
                <div>
                    <span>극장 :</span>
                    <span class="theater">${theater}점</span>
                </div>
                <div>
                    <span>날짜 :</span>
                    <span class="date">${date}</span>
                </div>
            </div>
        </div>
        <div style="display: flex; color: black; margin: 10px; width: 225px; border-right: 1px solid black; border-left: 1px solid black; justify-content: center; align-items: center;">
            <div>
                <span>시간 : </span>
                <span class="time">${time}</span>
            </div>
        </div>
        <div style="display: flex; color: black; margin: 10px; width: 225px; border-right: 1px solid black; justify-content: center; align-items: center;">
            <div>
                <span>좌석 : </span>
                <span class="real_seat">선택된 좌석이 없습니다.</span>
            </div>
        </div>
        <div style="display: flex; color: black; margin: 10px; width: 225px; border-right: 1px solid black; justify-content: center; align-items: center;">
            <div>
                <span>가격 : </span>
                <span class="price">0원</span>
            </div>
        </div>
        <div>
            <div style="display: flex; color: black; margin: 10px; width: 225px; justify-content: center; align-items: center;">
                <button id="reservation">예매하기</button>
            </div>
        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        var movie = $(".movie").text();
        var theater = $(".theater").text();
        var date = $(".date").text();
        var time = $(".time").text();
        console.log(movie);
        console.log(theater);
        console.log(date);
        console.log(time);

        $("#reservation").click(function() {
            $.ajax({
                type: "POST",
                url: "/movieReservation",
                data: JSON.stringify({movie: movie, theater: theater, date: date, time: time, price: allMoney, seat: realSeat}),
                dataType: "text",
                processData: false,
                // contentType: false,
                success: function(result) {
                    console.log(result);
                },
                error: function(err) {
                    console.log(err);
                }
            })
        })

    })
</script>
<script src="js/seat.js"></script>

