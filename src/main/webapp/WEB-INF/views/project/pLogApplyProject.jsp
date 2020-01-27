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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/pLogList.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
</head>

<body>
			<div style="width:96%;">
				<div id="pageTitle" class="row">
					<div class="col-12" onclick="location.href='/project/pLog/applyProjectList'" style="cursor:pointer"><h4>내가 <span style="color:crimson;">신청</span>한 프로젝트</h4></div>					
				</div>
				<div class="tableDiv">
					<div class="row tableHead">		
						<div class="col-3 col-md-2 col-lg-1">승인</div>
						<div class="col-2 col-md-1">신청서</div>
						<div class="d-none col-md-2 d-md-block col-lg-1">신청일</div>		
					    <div class="d-none col-md-1 d-md-block">상태</div>								    					    
					    <div class="d-none col-lg-1 d-lg-block">인원</div>						    
					  	<div class="d-none col-md-2 d-md-block col-lg-1">지역</div>
					    <div class="d-none col-lg-2 d-lg-block">프로젝트 기간</div>
					    <div class="col-7 col-md-4 col-lg-3">제목</div>
					    <div class="d-none col-lg-1 d-lg-block">작성자</div>

				    				    
					</div>
					
				  	<c:choose>
						<c:when test="${not empty searchChoice && applyProjectList.size()==0}">
							<div class="row text-center tableBodyNull"><div class="col-12">검색 결과가 없습니다.</div></div>
						</c:when>	  					  	
				  		<c:when test="${empty searchChoice && applyProjectList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">지원한 프로젝트가 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${applyProjectList }" var="a">
				  				<div class="row applyTableBody tableBody p-0">
				  					<div class="col-3 col-md-2 col-lg-1 approve${a.approve }">${a.approveInKor }</div>
				  					<div class="col-2 col-md-1"><button type="button" class="btn btn-outline-dark btn-sm mb-1" style="width:60px;font-size:13px;" onclick="openApplyPage('frmPopup${a.seq }',${a.seq })">신청글</button></div>									
									<div class="d-none col-md-2 d-md-block col-lg-1">${a.formedWriteDate }</div>	
									<div class="d-none col-md-1 d-md-block state${a.state }"><strong>${a.stateInKor }</strong></div>										
									<div class="d-none col-lg-1 d-lg-block">${a.capacity }명</div>
									<div class="d-none col-md-2 d-md-block col-lg-1"><small>${a.location1 } ${a.location2 }</small></div>
									<div class="d-none col-lg-2 d-lg-block"><small>${a.formedAllDate }</small></div>																											
									<div class="col-7 col-md-4 col-lg-3 text-decoration-none" onclick="detailPopUp('/project/detailView?seq=${a.projectSeq}')">
										<div class="row pl-1">
											<div style="max-width:75%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">${a.title }</div>
											<c:if test="${a.imageCount>0 }">
												<i class="fa fa-photo ml-1 mr-1" style="font-size:13px;margin-top:20px;color:#757575;"></i>
											</c:if> 												 
											<c:if test="${a.commentCount>0 }">
												<div class="pComment font-weight-bold ml-1" style="display:inline-block;">${a.commentCount }</div>
											</c:if>
										</div>
									</div>
									<div class="d-none col-lg-1 d-lg-block text-decoration-none" style="cursor:pointer;" onclick="pLogPopUp('/Portfolio/toPlog.do?owner=${a.leaderId}&other=Y')"><small>${a.writer }</small></div>
								</div>
								<form id="frmPopup${a.seq }" method="post"><input type="hidden" name="seq" value="${a.seq }"></form>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-12">
						  <form class="form-inline" action="/project/pLog/applyProjectList" method="post" id="searchFrm">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" style="margin-right:5px;">
								<option value="all" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="nonTagContents">내용</option>
							    <option value="location">지역</option>
							    <option value="capacity">인원</option>
							    <option value="languages">사용언어</option>
							    <option value="writer">작성자</option>								    
							</select>
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요(20자 이내)" aria-label="Search" name="keyword" id="keyword" style="margin-right:5px;min-width:285px;" maxlength="20">
						    <button class="btn btn-dark my-2 my-sm-0" type="submit" id="searchBtn">검색</button>
						  </form>
					</div>													
				</div>
				<nav aria-label="List navi" id="aPageNavi">${applyPageNavi }</nav>
			</div>
		<script>
	        $("#searchFrm").on("submit",function(){
	        	$("#keyword").val($.trim($("#keyword").val()));
	        	if($("#keyword").val()==""){
	        		alert("검색어를 입력해주세요");	
	        		return false;
	        	}
	        });
	        $("#searchOption option").filter(function(){
	        	return this.value == "${searchChoice}";
	        }).attr('selected',true);
	        $("#keyword").val("${keywordChoice}");
        	function openApplyPage(frmName,seq){      
        		var target = 'applyPopUp';
        		window.open('', target, "width=1000,height=750");
        		var frmDetail = document.getElementById(frmName);
				frmDetail.action = '/project/apply/detailView';
				frmDetail.target = target;
				frmDetail.submit();
        	}			
	        function detailPopUp(link){
	        	window.open(link, "applyListPopUp", "width=1000,height=840");	
	        }
        	function pLogPopUp(link){
				window.open(link, "pLogPopUp", "width=800,height=600");
			}
        	$(".pNavi${applyCurrentPage}").addClass("active");        	
        </script>
</body>
</html>