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
	#dropdownMenuButton{
		border: 1px solid transparent !important;
		background-color:transparent !important;
		color: black;
	}
	.dropdown-toggle::after{
		background-color:transparent;
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
                            <h4 class="page-title pull-left">회원관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>회원관리</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="${pageContext.request.contextPath }/adRsc/images/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Administrator <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
                <!-- MAIN CONTENT GOES HERE -->
                
                <!-- Hoverable Rows Table start -->
                    <div class="col-lg-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">회원목록</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                	<th scope="col"><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
                                                	<th scope="col">닉네임(아이디)</th>
                                                    <th scope="col">레벨</th>
                                                    <th scope="col">가입일</th>  
                                                    <th scope="col">최종방문일</th>  
                                                    <th scope="col">성별</th>  
                                                    <th scope="col">활동점수</th>  
                                                    <th scope="col">신고횟수</th>                                             
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${list }" var="dto">
                                            		<tr>
                                            		<td class="align-self-center"><input type="checkbox"></td>
	                                                    <td scope="row">
	                                                    <div class="dropdown col-lg-6 col-md-4 col-sm-6">
	   														<button class="btn btn-flat btn-primary dropdown-toggle pt-0 pb-1" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        													${dto.nickName }(${dto.id })
	    													</button>
	    												<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													        <a class="dropdown-item" href="#">회원정보</a>
													        <a class="dropdown-item" href="#">강제탈퇴</a>
													        <a class="dropdown-item" href="#">활동정지</a>
													    </div>
														</div>
                                                    </td>
                                                    <td>${dto.memLevel}</td>
                                                    <td>dto.joinDate</td>
                                                    <td>dto.lastLogin</td>
                                                    <td>${dto.gender}</td>
                                                    <td>${dto.point}</td>
                                                    <td>${dto.reportCount}</td>
                                               		</tr>
                                            	</c:forEach>                                                                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>    
                            </div> 
                            <div class="card-body pt-0">
                            	<p class="ml-5 mt-0">선택 멤버를 <button>강제탈퇴</button></p>
                            </div>                        
                        </div> 
                                              
                         <div class="card">
                            <div class="card-body">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
										<c:forEach items="${pageNavi}" var="navi">									
											<li class="page-item pageNavi">${navi}</li>
										</c:forEach>


                                    </ul>
                                </nav>
                            </div>
                        </div>
                        
				</div>
                    <!-- Hoverable Rows Table end -->
                
            </div>
        </div>
        <!-- main content area end -->
		<!-- footer area start-->
		<jsp:include page="/WEB-INF/views/standard/adminFooter.jsp" />
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
	 <script>
	 window.onload = function(){
		 var element = document.getElementsByClassName("pageNavi");
		 element[${page - 1}].className += " active";
	 }
	 
	 function checkAll(){
		 if($("#checkAll").is(':checked')){
			 $("input[type=checkbox]").prop("checked", true);
		 }else{
			 $("input[type=checkbox]").prop("checked", false);
		 }
	 }
	</script>
</body>
</html>