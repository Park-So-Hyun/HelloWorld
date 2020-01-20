<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

	<style>
        .card{margin-top:20px;text-align:center;}
        .myprofile{margin-top: 20px;margin-bottom: 30px;padding-right:0px;}
        #mycard{float:none; display:flex;width:200px;height:300px;margin: auto;}
        .cardwrap{float:left;}
        .card-text{font-size:12px;}
        a:hover{text-decoration:none;}
		.navi{text-align: center;}
		.line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
		#plogPortfolio{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:12px;}
  	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogHeader.jsp"/>
	
 		<div id="plogBaseBackgroundColor">
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
		                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 85%;margin:7.5%;">
		                        <div class="card-body">
		                            <div class="card-title line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
		                            <p class="card-text" style="text-align: center;font-size:15px;">point : ${ownerInfo.point }</p>
		                        </div>
	                    	</div>
	                    	<div class="d-md-none" style="background-color:white;border-radius:5px;height:200px;border: 1px solid rgba(0,0,0,.125); padding:15px;margin-right:10px;">
	                    		<div style="float:left">
		                        	<img src="${ownerInfo.profileImg }" style="width:150px;margin:10px;">
	                    		</div>
		                        <div style="float:left;margin-top:100px;margin-left:20px;">
		                            <div class="line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
		                            <p style="text-align: center;font-size:15px;">point : ${ownerInfo.point }</p>
		                        </div>
	                    	</div>
	                    </div>
	                </div>
	                <div class ="col-12 col-md-8 col-lg-9 wrapportfolio">
	                	<c:forEach items="${list}"  var="dto">
	                		<div class="cardwrap col-6 col-xl-4">
		                        <div class="card">
		                            <img src="${dto.image1}" class="card-img-top" alt="..." style="height:20vw;width:20vs;width:85%;margin:7.5%;">
		                            <div class="card-body" style="padding: 5px;width:95%;height:115px;text-align:left;">
		                                <h5 class="card-title" style="font-size:15px;white-space:nowrap;overflow: hidden;text-overflow:ellipsis;width:100%;height:16px;">
		                                	<a href="${pageContext.request.contextPath}/Portfolio/detail.do?seq=${dto.seq}">${dto.portfolioTitle}</a>
		                                </h5>
		                                <p class="card-text" style="overflow: hidden;width:100%;height:55px;text-overflow: ellipsis;margin-buttom:5px;">${dto.purpose }</p>
		                            </div>
		                        </div>
	                    	</div>
						</c:forEach>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id}">
							<div class="cardwrap col-6 col-xl-4">
								<div style="margin-top:20px;text-align:center;line-height:31.4vw;height:31.4vw;width:20vs;">
									<img id="addPF" src="/icon/plus.svg" style="opacity: 0.3;width:35%;vertical-align:middle;cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/Portfolio/toInsert.do'">
								</div>
							</div>
						</c:when>
					</c:choose>
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
            function popUp(id,writer){
        		if(writer == null){
        			alert("탈퇴한 회원입니다.");
        			return false;
        		}
        		else{
        			window.open("/Portfolio/toPlog.do?owner="+id, "pLogPopUp", "width=600,height=600");
        		}
             }
        </script>
</body>
</html>
