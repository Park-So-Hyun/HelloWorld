<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
</head>
<body>
 <div class=container>
  <c:choose>
			<c:when test="${loginInfo ==null}">
			 <div class="row" id="loginCon">
                <div class="col-12 text-right"><a href="#">로그인</a> | <a href="#">회원가입</a></div>
            </div>
			</c:when>
			<c:otherwise>
			 <div class="row" id="loginCon">
                <div class="col-12 text-right"><a href="#">마이페이지</a> | <a href="#">로그아웃</a></div>
            </div>
			</c:otherwise>
	</c:choose>
           
            
            <div class="row">
                <div class = "d-none d-md-block col-md-2"></div>
                <div class = "col-12 col-md-8" id = "logoCon">
                    <br>
                    <img src="/img/logo7.PNG" id="logo">
                    <br><br>
                </div>
                <div class = "d-none d-md-block col-md-2"></div>
            </div>
        </div>

        <nav class="navbar navbar-expand-md navbar-light" style="background-color: #499ed6;">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav box text-center naviCon">
                    <a class="nav-item nav-link active text-light" href="#">대나무숲</a>
                    <a class="nav-item nav-link active text-light" href="#">코드지식인</a>
                    <a class="nav-item nav-link active text-light" href="#">업계현황</a>
                    <a class="nav-item nav-link active text-light" href="#">IT 뉴스</a>
                    <a class="nav-item nav-link active text-light" href="#">프로젝트</a>
                    <a class="nav-item nav-link active text-light" href="#">P-log</a>
                </div>
            </div>
        </nav>
</body>
</html>