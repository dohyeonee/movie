<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
  <div class="row">
    <div class="col-lg-12">
      <h1 class="page-header">게시물 등록</h1>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <div class="card">

        <div class="card-body">
          <form role="form" action="/board/register" method="post">

            <div class="form-group">
              <label>제목</label> <input class="form-control" name="title">
            </div>

            <div class="form-group">
              <label>내용</label> <textarea class="form-control" rows="3" name="content"></textarea>
            </div>

            <div class="form-group">
              <label>작성자</label> <input class="form-control" name="writer">
            </div>

            <button type="submit" class="btn btn-primary">Submit Button</button>
            <button type="reset" class="btn btn-danger">Reset Button</button>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>
<!-- /.container-fluid -->


<%@include file="../includes/footer.jsp"%>
