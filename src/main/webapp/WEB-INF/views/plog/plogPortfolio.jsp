<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

	<style>
		h1{text-align: center;padding-top: 50px;padding-bottom: 50px;}
        .card{margin-top:20px;width:200px;text-align:center;}
        .myprofile{float: left; margin-top: 20px;margin-bottom: 30px; }
        #mycard{ height: 300px; float:none; display:flex; margin: auto;align-items:center;}
        .cardwrap{float:left;}
        .card-text{font-size:12px;}
        .card-img-top{width: 80%;margin:10%;}
        a:hover{text-decoration:none;}
		.navi{text-align: center;}
		.nvlink{height:45px;line-height:45px;}       
  	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            
            <div class="container">
				<h1> Programming-Log</h1>
 				<div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/toScrap.do">내 스크랩</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="/img/profileSample.jpg" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">${ownerInfo.nickName} 님</h3>
	                            <p class="card-text" style="text-align: center;font-size:18px;">point : ${ownerInfo.point }</p>
	                        </div>
	                    </div>
						<div style = "text-align: end;margin-top: 10px;">
                       		<button id="addPF">포트폴리오 추가하기</button>
                    	</div>
	                </div>
	                <div class ="col-12 col-md-8 col-lg-9 wrapportfolio">
	                	<c:forEach items="${list}"  var="dto">
	                		<div class="cardwrap col-6 col-xl-4">
		                        <div class="card">
		                            <img src="${dto.image1}" class="card-img-top" alt="..." style="height: inherit;width: 160px;height: 170px;margin:15px;">
		                            <div class="card-body" style="padding: 5px;width:190px;height:115px;text-align:left;">
		                                <h5 class="card-title" style="font-size:15px;white-space:nowrap;overflow: hidden;text-overflow:ellipsis;width:100%;height:16px;">
		                                	<a href="${pageContext.request.contextPath}/Portfolio/detail.do?seq=${dto.seq}">${dto.portfolioTitle}</a>
		                                </h5>
		                                <p class="card-text" style="overflow: hidden;width:100%;height:60%;text-overflow: ellipsis;">${dto.purpose }</p>
	                                <div style="text-align: end;">
	                                </div>
		                            </div>
		                        </div>
	                    	</div>
						</c:forEach>
	                </div>
	            </div>
            </div>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        
		<script>
            $("#addPF").on("click",function(){
                location.href = "${pageContext.request.contextPath}/Portfolio/toInsert.do";
            })
        </script>
</body>
</html>
