<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/adRsc/images/icons/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/metisMenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/typography.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/default-css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/responsive.css">
<!-- modernizr css -->
<script src="${pageContext.request.contextPath }/adRsc/vendor/modernizr-2.8.3.min.js"></script>
<style>
#home-tab:hover{
cursor:default;
}
	.contentCard{
		max-width: 1000px;
	}
	.sign{
		display: inline-block;
		width: 90px;
	}
</style>
</head>
<body>
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<!-- preloader area end -->
	<!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
        <jsp:include page="/WEB-INF/views/standard/adminSidebar.jsp"/>
        <!-- sidebar menu area end -->
                <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <jsp:include page="/WEB-INF/views/standard/adminHeader.jsp"/>
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">IT뉴스</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>IT뉴스</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="${pageContext.request.contextPath }/adRsc/images/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Administrator <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/logout">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
                <!-- MAIN CONTENT GOES HERE -->
                	<div class="main-content-inner">
	                <div class="row">
	                    <div class="col-lg-12 mt-5 contentCard">
	                        <div class="card">
	                            <div class="card-body">
	                                <div class="invoice-area">
	                                    <div class="invoice-head">
	                                        <div class="row">
	                                            <div class="iv-left col-6">
	                                                <span>글읽기</span>
	                                            </div>
	                                            <div class="iv-right col-6 text-right">
	                                                <span>#${dto.seq}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                   	<c:choose>
	                                   		<c:when test="${dto.title != null}">
			                                    <div class="row align-items-center">
			                                        <div class="col-12">
			                                            <div class="invoice-address">
			                                                <h3>${dto.title}</h3>
			                                                <h5>${dto.writer}(${dto.id})</h5>
			                                                <p>${dto.formedWriteDateForAdmin}
			                                                <hr>
			                                                <p>${dto.content}</p>
			                                                <hr>
			                                            </div>
			                                        </div>
			                                    </div>
	                                    	</c:when>
	                                    	<c:otherwise>
			                                    <div class="row align-items-center">
			                                        <div class="col-12">
			                                            <div class="invoice-address">
			                                               <p class="text-center">삭제된 글 입니다.</p>
			                                               <hr>
			                                            </div>
			                                        </div>
			                                    </div>	                                    	
	                                    	</c:otherwise>
	                                   	</c:choose>
	                                </div>
	                                <div class="invoice-buttons text-right">
	                                    <a href="${pageContext.request.contextPath}/adBoard/itnewsList?page=${page}" class="invoice-btn">돌아가기</a>
	                                    <c:if test="${dto.title != null}">
	                                    <a href="${pageContext.request.contextPath}/adBoard/delItnews?seq=${dto.seq}" class="invoice-btn">삭제하기</a>
	                                    </c:if>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                                         <!-- basic form start -->
                            <div class="col-12 mt-5 contentCard">
                                <div class="card" id="replyAppend">
                                	<c:choose>
                                		<c:when test="${list.size() > 0}">
		                                	<c:forEach items="${list}" var="reply">
		                             					<div class="card-body">
		            										<ul class="nav nav-tabs" id="myTab" role="tablist">
		                										<li class="nav-item">
		                    										<a class="nav-link active" id="home-tab" data-toggle="tab" href="#" role="tab" aria-controls="home" aria-selected="true"><strong>${reply.writer}(${reply.id})</strong> <small>${reply.formedWriteDateForAdmin}</small></a>
		               											</li>  
		                    										<li class="text-center mt-2 pl-2"><a href="${pageContext.request.contextPath}/adBoard/delItnewsCo?page=${page}&seq=${reply.seq}&itSeq=${reply.itSeq}">
		                    										<i data-brackets-id="23054" class="fa fa-trash"></i></a></li>    
		           											</ul>
			            									<div class="tab-content mt-3" id="myTabContent">
			                									<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			                    									<p>${reply.content}</p>
			                									</div>              
			           										</div>
		       											</div>
		                                	</c:forEach>
                                		</c:when>
                                		<c:otherwise>
                                			<div class="card-body">
                                				<p class="text-center">작성된 댓글이 없습니다.</p>
                                			</div>                                		
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                            </div>
                            <!-- basic form end -->  
	                    
	                </div>
	                </div>
	                </div>
        </div>
        <!-- main content area end -->

        <!-- footer area start-->
        <jsp:include page="/WEB-INF/views/standard/adminFooter.jsp"/>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->

    <!-- jquery latest version -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- bootstrap 4 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
        zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="${pageContext.request.contextPath }/adRsc/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="${pageContext.request.contextPath }/adRsc/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="${pageContext.request.contextPath }/adRsc/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/scripts.js"></script>
</body>
</html>