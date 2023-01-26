<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/header.jsp" %>

<!-- contents -->

<div class="card-group">
    <div class="card" style="width: 18rem;">
        <img src="/static/ThorLoveAndThunder.jpg" class="card-img-top" alt="..." style="width: 400px; height: 450px;">
        <div class="card-body text-center">
            <a href="/reservationForm" class="btn btn-primary">예매하기</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="/static/Forrest%20Gump.jpg" class="card-img-top" alt="..." style="width: 400px; height: 450px;">
        <div class="card-body text-center">
            <a href="/reservationForm" class="btn btn-primary">예매하기</a>
        </div>
    </div>

    <div class="card" style="width: 14rem;">
        <img src="/static/Schindler's%20List.jpg" class="card-img-top" alt="..." style="width: 400px; height: 450px;">
        <div class="card-body text-center">
            <a href="/reservationForm" class="btn btn-primary">예매하기</a>
        </div>
    </div>

</div>

<div class="card-group">
    <div class="card" style="width: 18rem;">
        <img src="/static/The%20Dark%20Knight.jpg" class="card-img-top" alt="..." style="width: 400px; height: 450px;">
        <div class="card-body text-center">
            <a href="/reservationForm" class="btn btn-primary">예매하기</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="/static/The%20Godfather.jpg" class="card-img-top" alt="..." style="width: 400px; height: 450px;">
        <div class="card-body text-center">
            <a href="/reservationForm" class="btn btn-primary">예매하기</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="/static/The%20Shawshank%20Redemption.jpg" class="card-img-top" alt="..." style="width: 400px; height: 450px;">
        <div class="card-body text-center">
            <a href="/reservationForm" class="btn btn-primary">예매하기</a>
        </div>
    </div>

</div>

<%
    if(session.getAttribute("id") == null) {

%>
<script>
    location.href="/loginForm";
</script>

<%
    }
%>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>