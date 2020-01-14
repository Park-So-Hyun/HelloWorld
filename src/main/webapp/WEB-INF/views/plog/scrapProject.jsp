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
<link rel="stylesheet" href="/css/project/list.css" type="text/css"/>
	<style>
		h1{text-align: center;padding-top: 50px;padding-bottom: 50px;}
		ul{background-color: lightgray;font-size: 13px;}
		.card{width:200px;height:300px;margin: auto;;float :left;}
		.myprofile{float: left;margin-top: 20px;width:200px;text-align:center;}
		#mycard{ float:none;display:flex;align-items:center;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		#writer{text-underline-position: auto;margin-right: 30px;}
		#page${page}{color:blue;}
		.coltheme{margin:30px;}
		.navi{text-align: center;}
		.nvlink1{height:45px;line-height:45px;font-size:14px;}
		.nvlink2{height:45px;line-height:45px;font-size:10px;}
        a:hover{text-decoration:none;}	
        .scrapnavi>div{height:50px;line-height:50px;}
        .scrapnavi>div>a{color:black;}
        .scrapnavi>div>a:hover{font-weight:bold;color:gray;}
        .scrapnavi{background-color: lightgray;border-radius:5px;margin-top:30px;width:200px;display:inline-block;border-right:1px solid gray;}	
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        .pg{background-color:white;border-radius:5px 0px 0px 5px;border:1px solid gray;}
	</style>
	<script>
	$(function(){
		$("#plogNavi").attr('class','nav-item nav-link active');
	});
	</script>
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
				<h1 class="d-none d-sm-block"> Programming-Log</h1>
				<h3 class="d-sm-none"> Programming-Log</h3>
	            <div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id }">
							<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
							<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a></div>
						</c:when>
					</c:choose>
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
				<div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id }">
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a></div>
						</c:when>
					</c:choose>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <div class="card-title line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
	                            <p class="card-text" style="text-align: center;font-size:15px;">point : ${ownerInfo.point }</p>
	                        </div>
	                    </div>
	                    <div class="scrapnavi" >
	                		<div><a href="${pageContext.request.contextPath}/Scrap/itNews.do"> IT 뉴스</a> </div>
	                		<div><a href="${pageContext.request.contextPath}/Scrap/cohow.do"> 코드 지식인</a></div>
	                		<div><a href="${pageContext.request.contextPath}/Scrap/industryStatus.do"> 업계현황</a></div>
	                		<div class="pg"><a href="${pageContext.request.contextPath}/Scrap/project.do"> 프로젝트</a> </div>
	                	</div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 scraptwrap">
	                	<div class="coltheme"> 프로젝트 </div>
			         	<div class="tableDiv">
							<div class="row tableHead">
							    <div class="col-2">모집상태</div>
							    <div class="col-7 col-lg-4">제목</div>
							    <div class="col-1" style="text-align:center;">지역</div>
							    <div class="col-lg-1 d-none d-lg-block">인원</div>
							    <div class="col-2">작성자</div>
							    <div class="col-2 d-none d-lg-block">작성일</div>					    
							</div>
						  	<c:choose>
						  		<c:when test="${plist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">작성된 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${plist }" var="p">
						  				<div class="row tableBody p-0">
											<div class="col-2 ${p.state }" style="text-align:center;">${p.stateInKor }</div>
												<div class="col-7 col-lg-4 line-over" onclick="location.href='${pageContext.request.contextPath}/project/detailView?seq=${p.seq }'" class="text-decoration-none">${p.title } 
							  						<c:if test="${p.commentCount>0 }">
							  							<span class="pComment font-weight-bold">${p.commentCount }</span>
							  						</c:if>					  					
												</div>
											<div class="col-1" style="text-align:center">${p.location1 }</div>
											<div class="col-lg-1 d-none d-lg-block">${p.capacity }명</div>
											<div class="col-2 line-over">${p.writer }</div>
											<div class="col-2 d-none d-lg-block">${p.formedWriteDate }</div>
										</div>	
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>				    
						</div>
						<div class="naviwrap"style="width:100%;text-align:center;margin-top:20px;">
		                    <c:forEach items="${pageNavi}" var="navi">									
								${navi}
							</c:forEach>
	               		</div>
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
</body>
</html>
