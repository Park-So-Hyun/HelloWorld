<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/chart.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script>
   $(function(){
      $("#proNavi").attr('class','nav-item nav-link active');      
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
            <section class="projectContainer" style="min-height: 100px;">        
               
	            <div class=container id="projectPage">
					<div id="pageTitle" class="row">
						<div class="col-12 col-md-6 col-lg-5 m-0 p-0"><h1 onclick="location.href='/project/chart'" style="cursor:pointer">프로젝트 모집</h1><span class="badge badge-pill ml-2" id="stateCountLabel">${projectList.size() }</span></div>
						<div class="col-12 col-md-6 col-lg-7 m-0 p-0 pt-2 pb-1 text-right">
							<div style="width:180px;height:35px;display:inline-block;border-bottom:2px solid #99000030;cursor:pointer" class="text-center pt-1" onclick="location.href='/project/list'"><span style="color:black;font-weight:bold;font-size:18px;opacity:30%;">게시판</span></div>
							<div style="margin-left:-5px;width:180px;height:35px;display:inline-block;border-bottom:2px solid crimson;cursor:pointer" class="text-center pt-1" onclick="location.href='/project/chart'"><span style="color:black;font-weight:bold;font-size:18px;">일정</span></div>
						</div>
					</div>	
					
					<div class="projectChartDiv d-none d-xl-block">
						<div class="row mb-3">
							<div class="col-5 col-md-3 col-lg-2 p-0">
								<div class="btn-group btn-group-sm" role="group" aria-label="projectOrderBtns">
									<button type="button" class="btn btn-outline-warning btn-sm active" id="latestOrder" style="font-size:14px;">최신순</button>
									<button type="button" class="btn btn-outline-warning btn-sm" id="deadlineOrder" style="font-size:14px;">마감임박순</button>								
								</div>							
							</div>
							<div class="col-7 col-md-9 col-lg-10 p-0">
								<div class="pt-1" style="color:#8a8a8a;display:inline-block;"><small>모집중인 프로젝트만 표시됩니다</small></div>
<!-- 								<input type="hidden" name="pageOrder" id="pageOrder"> -->
								
								
								<div class="float-right" style="display:inline-block;">
									  <form class="form-inline" action="/project/chart" method="post" id="searchFrm">
										<select class="form-control searchSelect" name="searchOption" id="searchOption" style="margin-right:5px;">
											<option value="all" selected>제목+내용</option>
										    <option value="title">제목</option>
										    <option value="nonTagContents">내용</option>
										    <option value="location">지역</option>
										    <option value="capacity">인원</option>
										    <option value="languages">사용언어</option>
										    <option value="writer">작성자</option>									    
										</select>
										<input type="hidden" name="pageOrder" id="pageOrder">
										<input type="hidden" id="searchChoice" value="${searchChoice }">
										<input type="hidden" id="keywordChoice" value="${keywordChoice }">										
									    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요(20자 이내)" aria-label="Search" name="keyword" id="keyword" style="margin-right:5px;min-width:285px;" maxlength="20">
									    <button class="btn btn-dark my-2 my-sm-0 ml-1" type="submit" id="searchBtn">검색</button>
									  </form>
								</div>
							
							
							</div>	
						</div>
											
					<div class="projectContainer">
						<c:choose>
							<c:when test="${not empty searchChoice && projectList.size()==0}">
								<div class="row"><div class="col-12 text-center mt-2">검색 결과가 없습니다.</div></div>
							</c:when>
							<c:when test="${empty searchChoice && projectList.size()==0 }">
					  			<div class="row"><div class="col-12 text-center mt-2">모집중인 프로젝트가 없습니다.</div></div>
					  		</c:when>
					  		<c:otherwise>					  		
					  			<c:forEach items="${projectList }" var="p">
									<div class="row projectList" data-aos="fade-up">
										<div class="col-xl-5 d-none d-xl-block pTextInfo">
											<label class="${p.state } badge badge-pill ml-0 stateLabel">${p.stateInKor }</label>
											<i class="fa fa-share-alt kakaoSharing" data-toggle="tooltip" title="카카오톡 공유하기" onclick="shareKakaotalk(${p.kakaoTitle},${p.seq })"></i>
											<c:choose>
												<c:when test="${p.scrap==1 }">
													<i class="fa fa-bookmark scrapDone" id="scrap${p.seq }" data-toggle="tooltip" title="스크랩" onclick="unScrapFunc(${p.seq})"></i>									
												</c:when>
												<c:otherwise>
													<i class="fa fa-bookmark-o scrapNull" id="scrap${p.seq }" data-toggle="tooltip" title="스크랩" onclick="scrapFunc(${p.seq})"></i>									
												</c:otherwise>
											</c:choose>
											<span class="float-right"><i class="fa fa-calendar-check-o"></i> <small>${p.formedAllDate }</small></span>
											<div class="pTitleBox mt-1 mb-1" style="max-width:430px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" onclick="popUp('/project/detailView?seq=${p.seq }')">${p.title }</div>
											<div class="pInfoBox mt-1" style="height:50px;">
												<div>
													<span><i class="fa fa-map-marker"></i> ${p.location1 } ${p.location2 }</span>
													<span><i class="fa fa-group"></i> ${p.capacity }명</span>
													<span><i class="fa fa-user"></i> ${p.writer }</span>
												</div>
												<div>
													<div style="max-width:430px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block"><i class="fa fa-check"></i> ${p.languages }</div>
												</div>
											</div>
										</div>
										
										
										<div class="col-xl-7 d-none d-xl-block pGraphBar p-0">
											<ul class="nav graphNavi">
											<c:set var="month" value="${fn:split(p.today,'-')[0] }"></c:set>
											  <c:forEach begin="0" end="5" step="1" var="m">
											  	<c:choose>
											  		<c:when test="${month+m >12}">
											  			<li class="nav-item graphNaviItem">${month+m-12 }월</li>
											  		</c:when>
												  	<c:otherwise>
												  		<li class="nav-item graphNaviItem">${month+m }월</li>
												  	</c:otherwise>
											  	</c:choose>											  	
											  </c:forEach>
											</ul>
											<div class="todayBar" style="transform: translate(${fn:split(p.today,'-')[1]*3 -331}px, -50%);"><div class="todayFlag" data-toggle="tooltip" title="${fn:split(p.today,'-')[0] }월 ${fn:split(p.today,'-')[1] }일" style="cursor:pointer;">오늘</div></div>												
											<div class="progressBar text-decoration-none" id="pBar${p.seq }" style="transform: translate(${p.distance -331}px, -50%);width:${p.width}px;" onclick="popUp('/project/detailView?seq=${p.seq }')" data-toggle="tooltip" title="${p.formedAllDate }"></div>											
										</div>										
									</div>					
								</c:forEach>																	
							</c:otherwise>							
						</c:choose>			
						<input type="hidden" id="pageCheckOrder" value="${pageOrder}">			
					</div>
	            </div>
	            <div class="d-xl-none text-center">해당 서비스는 PC 전체화면에서 지원됩니다</div>
            </div>		
            </section>           
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
       
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
     
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="/js/project/chart.js"></script>        
<script>
AOS.init();
//카카오톡
  function shareKakaotalk(title,seq) {
		Kakao.init("17c512cbe4e17a204cce3c9b7d64d274"); // 사용할 앱의 JavaScript 키를 설정
		Kakao.Link.sendDefault({
         objectType : "feed",
         content : {
            title : title, // 콘텐츠의 타이틀 
            description : "프로젝트 모집", // 콘텐츠 상세설명
            imageUrl : "https://miro.medium.com/max/3840/1*U-R58ahr5dtAvtSLGK2wXg.png", // 썸네일 이미지          
            link : {
               mobileWebUrl : "http://${ip}/project/detailView?seq="+seq, // 모바일 카카오톡에서 사용하는 웹 링크 URL		            		   
               webUrl : "http://${ip}/project/detailView?seq="+seq // PC버전 카카오톡에서 사용하는 웹 링크 URL
            }
         },
         social : {
            likeCount : 0 // LIKE 개수
            ,
            commentCount : 0 // 댓글 개수
            ,
            sharedCount : 0
         // 공유 회수
         },
         buttons : [ {
            title : "링크 이동하기" // 버튼 제목
            ,
            link : {
               mobileWebUrl : "http://${ip}/project/detailView?seq="+seq,  // 모바일 카카오톡에서 사용하는 웹 링크 URL
               webUrl : "http://${ip}/project/detailView?seq="+seq // PC버전 카카오톡에서 사용하는 웹 링크 URL
            }
         } ]
      });
   }  
</script>
	
</body>
</html>
