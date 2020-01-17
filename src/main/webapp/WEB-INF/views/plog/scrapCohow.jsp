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
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/css/project/list.css" type="text/css"/>
	<style>
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
        .scrapnavi>div>a:hover{color:gray;}
        .scrapnavi{background-color: lightgray;border-radius:5px;margin-top:30px;width:200px;display:inline-block;border-right:1px solid gray;}	
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
	</style>
	<script>
	$(function(){
		$("#plogNavi").attr('class','nav-item nav-link active');
	});
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogHeader.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            
            <div class="container">
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div>
	                    	<div class="card d-none d-md-block" id="mycard">
		                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
		                        <div class="card-body">
		                            <div class="card-title line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
		                            <p class="card-text" style="text-align: center;font-size:15px;">point : ${ownerInfo.point }</p>
		                        </div>
	                    	</div>
	                    </div>

	                </div>
	                <div class="col-12 col-md-8 col-lg-9 scraptwrap">
	                	<div style="margin-top:20px;margin-buttom:20px;">
	    	 				<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-flat btn-xs btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/itNews.do'">IT 뉴스</button>
								<button type="button" class="btn btn-flat btn-xs btn-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/cohow.do'">코드 지식인</button>
								<button type="button" class="btn btn-flat btn-xs btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/industryStatus.do'">업계 현황</button>
								<button type="button" class="btn btn-flat btn-xs btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/project.do'">프로젝트</button>
			           		</div>
	                	</div>
	                	<div class="tableDiv">
							<div class="row tableHead">
								<div class="col-2 col-lg-1">구분</div>
							    <div class="col-5 col-lg-7">제목</div>
							    <div class="col-2 col-lg-1">작성자</div>
							    <div class="col-3 col-lg-2">작성일</div>	
							    <div class="col-1 d-none d-lg-block">조회수</div>					    
							</div>
							
						  	<c:choose>
						  		<c:when test="${clist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">스크랩한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${clist }" var="dto">
						  				<div class="row tableBody p-0">
						  					<div class="col-2 col-lg-1" style="color:dodgerblue;">${dto.division}</div>
											<div style="cursor:pointer;"class="col-5 col-lg-7 " >
							  					<div class="line-over text-decoration-none" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${dto.seq}'">${dto.title} 
								  					<c:if test="${dto.replyCount>0 }">
								  						<span class="pComment font-weight-bold">${dto.replyCount}</span>
								  					</c:if>	
							  					</div>				  					
											</div>
											<div class="col-2 col-lg-1" style="text-align:center;">${dto.writer}</div>
											<div class="col-3 col-lg-2">${dto.scrapDate}</div>
											<div class="col-1 d-none d-lg-block">${dto.viewCount}</div>
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
