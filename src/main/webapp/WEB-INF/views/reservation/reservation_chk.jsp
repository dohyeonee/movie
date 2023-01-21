<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp" %>

<!-- contents -->
<div style="width: 1200px; height: 800px; display: inline-block;">
  <h3 style="text-align: center; background-color: #333333; color:white;">예매확인</h3>
    <img src="/static/Forrest%20Gump.jpg" style="width: 400px; height: 400px; display: inline-block;">
    <c:forEach items="${reservation_list}" var="res_list">
        <div><span><c:out value="${res_list.no}" /></span></div>
        <div><span><c:out value="${res_list.movie}" /></span></div>
        <div><span><c:out value="${res_list.day}" /> </span></div>
        <div><span><c:out value="${res_list.time}" /> </span></div>
    </c:forEach>
</div>
<%@include file="../includes/footer.jsp" %>