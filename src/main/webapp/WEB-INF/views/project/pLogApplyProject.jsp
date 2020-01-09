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
<style>
body{background-color:#f2f2f2;}
</style>
</head>
<body>

				<div id="pageTitle" class="row">
					<div class="col-12 col-lg-4"><h4>내가 지원한 프로젝트</h4></div>
					<div class="col-12 col-lg-8 pt-2">
					
					</div>
				</div>
				<div class="tableDiv" style="width:100%;">
					<div class="row tableHead">					    
					    <div class="col-2">모집상태</div>
					    <div class="col-3">제목</div>
					    <div class="col-1">작성자</div>
					    <div class="col-1">지역</div>
					    <div class="col-3">기간</div>
					    <div class="col-1">인원</div>
					    <div class="col-1">승인상태</div>					    
					</div>
					
				  	<c:choose>
				  		<c:when test="${makeProjectList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">모집한 프로젝트가 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${makeProjectList }" var="m">
				  				<div class="row tableBody p-0">
									<div class="col-2 ${m.state }">${m.stateInKor }</div>
										<div class="col-3" onclick="location.href='/project/detailView?seq=${m.seq }'" class="text-decoration-none">${m.title } 
					  						<c:if test="${m.commentCount>0 }">
					  							<span class="pComment font-weight-bold">${m.commentCount }</span>
					  						</c:if>					  					
										</div>
									<div class="col-1">${m.location1 }</div>
									<div class="col-1">${m.capacity }명</div>
									<div class="col-3">${m.formedAllDate }</div>
									<div class="col-1">${m.formedWriteDate }</div>
									<div class="col-1">${m.viewCount }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-6">
						  <form class="form-inline">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" name="searchOption" style="margin-right:5px;">
								<option selected disabled>선택</option>
							    <option value="제목">제목</option>
							    <option value="내용">내용</option>
							    <option value="지역">지역</option>								    
							</select>
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
						    <button class="btn btn-dark my-2 my-sm-0" type="submit">검색</button>
						  </form>
					</div>								
					<div class="col-6 text-right">
						<a class="btn btn-success" href="/project/write" role="button">글쓰기</a>					
					</div>
				</div>
				<nav aria-label="List navi" id="pPageNavi">${makePageNavi }</nav>
		<script>
        	$(".pNavi${makeCurrentPage}").addClass("active");
        </script>
</body>
</html>