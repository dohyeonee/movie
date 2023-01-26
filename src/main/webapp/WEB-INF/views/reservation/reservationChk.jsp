<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>
<div style="height: 800px; display: flex">
    <c:forEach items="${reservationList}" var="list">
    <div class="card" style="width: 18rem; margin: 10px; color: black; height: 400px;">
            <div class="card-body">
                <h5 class="card-title">
                    <span>제목 : </span>
                    <span class="title">${list.title}</span>
                </h5>
                <p class="card-text">
                    <span>예매번호 : </span>
                    <span class="rno">${list.rno}</span>
                </p>
                <p class="card-text">
                    <span>지역 : </span>
                    <span class="city">${list.city}</span>
                </p>
                <p class="card-text">
                    <span>극장 : </span>
                    <span class="theater">${list.theater}</span>
                </p>
                <p class="card-text">
                    <span>날짜 : </span>
                    <span class="date">${list.date}</span>
                </p>
                <p class="card-text">
                    <span>시간 : </span>
                    <span class="time">${list.time}</span>
                </p>
                <p class="card-text">
                    <span>좌석 : </span>
                    <span class="seat">${list.seat}</span>
                </p>
                <p class="card-text">
                    <span>가격 : </span>
                    <span class="price">${list.price}</span>
                </p>
                <a href="#" class="btn btn-primary cancel">예매취소</a>
            </div>
    </div>
    </c:forEach>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $(".cancel").each(function(i) {
          $(this).click(function(e) {
              e.preventDefault();
              var rno;
              $(".rno").each(function() {
                  rno = $(this).text();
              })
              $.ajax({
                  type: "POST",
                  data: {rno: rno},
                  url: "/cancelReservation",
                  dataType: "text",
                  success: function(result) {
                      alert("예매취소가 완료되었습니다.");
                      location.reload();
                  },
                  error: function(err) {
                      console.log(err);
                  },
              })
          })
        })
    })
</script>
<%@include file="../includes/footer.jsp" %>