<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

<style>
    .selected {
        background-color: burlywood;
    }
</style>

<div style="white-space: nowrap; width: 1600px; height: 800px; display: flex;">
    <!-- contents -->
    <div style="width: 300px; height: 485px; display: inline-block; margin-right: 10px;">
        <h3 style="text-align: center; background-color: #333333; color:white;">영화</h3>
        <ul class="list-group">
            <c:forEach items="${getMovie}" var="movie">
                <li class="list-group-item movie" style="cursor: pointer;"><a href="#" style="text-decoration: none; color:black;"><c:out value="${movie.title}" /></a></li>
            </c:forEach>
        </ul>
    </div>
    <div style="width: 300px; height: 485px; display: inline-block; margin-right: 10px; color: black;">
        <h3 style="text-align: center; background-color: #333333; color:white;">지역</h3>
        <ul class="list-group">
            <li onclick="getTheater('서울', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">서울</a></li>
            <li onclick="getTheater('경기', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">경기</a></li>
            <li onclick="getTheater('인천', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">인천</a></li>
            <li onclick="getTheater('강원', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">강원</a></li>
            <li onclick="getTheater('대전/충청', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">대전/충청</a></li>
            <li onclick="getTheater('대구', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">대구</a></li>
            <li onclick="getTheater('부산/울산', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">부산/울산</a></li>
            <li onclick="getTheater('경상', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">경상</a></li>
            <li onclick="getTheater('광주/전라/제주', this)" style="list-style: none; cursor:pointer;" class="list-group-item city"><a href="#" style="text-decoration: none; color: black;">광주/전라/제주</a></li>
        </ul>
    </div>
    <div style="width: 300px; height: 485px; display: inline-block; margin-right: 10px;">
            <h3 style="text-align: center; background-color: #333333; color:white;">극장</h3>
        <div style="overflow-y: scroll; overflow-x: hidden; height: 485px;">
            <ul class="list-group" id="theaterUl" style="height: 485px;">
                <li class="list-group-item">지역을 선택해주세요.</li>
            </ul>
        </div>
    </div>
    <div style="width: 170px; height: 485px; display: inline-block; margin-right: 10px;">
        <h3 style="text-align: center; background-color: #333333; color:white;" class="reserve-title">날짜</h3>
        <div class="dateContainer" style="overflow-y: scroll; overflow-x: hidden; height: 485px;">
            <ul class="list-group">
                <li style="list-style:none; cursor: pointer;" class="list-group-item">
                    <span class="year" style="display: block; text-align: center; font-size: 13px; font-weight: bold;"></span>
                    <span class="month" style="display: block; text-align: center; font-size: 30px; font-weight: bold;" ></span>
                </li>
            </ul>

            <ul class="dateUl list-group" style="height: 485px;">

            </ul>
        </div>
    </div>
    <div style="width: 300px; height: 485px; display: inline-block; margin-right: 10px;">
        <h3 style="text-align: center; background-color: #333333; color:white;">시간</h3>
        <ul class="list-group" id="test">
            <li class="list-group-item time" style="cursor: pointer"><a href="#" style="text-decoration: none; color: black;">14시 20분</a></li>
            <li class="list-group-item time" style="cursor: pointer"><a href="#" style="text-decoration: none; color: black;">16시 40분</a></li>
            <li class="list-group-item time" style="cursor: pointer"><a href="#" style="text-decoration: none; color: black;">18시 30분</a></li>
            <li class="list-group-item time" style="cursor: pointer"><a href="#" style="text-decoration: none; color: black;">20시 55분</a></li>
        </ul>
    </div>
</div>
<div>
    <button class="btn btn-primary btn-lg btn-block" id="selectSeat">좌석선택</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        var selectedMovie;
        var selectedCity;
        var selectedDate;
        var selectedTime;

        $(".movie").click(function(){
            selectedMovie = $(this).children().text();
        })
        $(".city").click(function(){
            selectedCity = $(this).children().text();
        })

        $(".date").click(function(){
            selectedDate = fullYear + "." + realMonth + "." + $(this).children().text();
        })
        $(".time").click(function(){
            selectedTime = $(this).children().text();
        })

        $("#selectSeat").click(function(){
            $.ajax({
                type: "POST",
                url: "/selectSeat",
                data: { movie: selectedMovie, city : selectedCity, theater: selectedTheater, date: selectedDate, time: selectedTime},
                dataType: "text",
                success: function(result) {
                    console.log(window.location);
                    window.location.href="seat";
                },
                error: function(err) {
                    alert("모든 항목을 선택해주세요.");
                }
            })
        })


    })
</script>
<script src="js/reservation.js"></script>
<%@include file="../includes/footer.jsp" %>