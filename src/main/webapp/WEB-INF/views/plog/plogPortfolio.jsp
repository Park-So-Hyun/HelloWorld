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
		.card{margin-top:20px;text-align:center;margin-bottom:20px;}
        .myprofile{margin-bottom:30px;padding-right:0px;}
        #mycard{float:none; display:flex;width:200px;height:300px;margin: auto;}
		
/* 		.card{width:200px;height:300px;margin: auto;float :left;} */
		
        
        .wrapportfolio{background-color:white;border: 1px solid rgba(0,0,0,.125);}
        .cardwrap{float:left;}
        .card-text{font-size:12px;}
        a:hover{text-decoration:none;}
		.navi{text-align: center;}
		.line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
		#plogPortfolio{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:13px;}
		.cardheight{transition:all 0.9s, color 0.3;}
		.cardheight:hover {color:lightgray;box-shadow: 500px 0 0 0 rgba(0,0,0,0.25) inset;}
  	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogHeader.jsp"/>
	
 		<div id="plogBaseBackgroundColor">
            <div class=container>
                <div class=row>
                    <div class="col-12" id=plogAroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            
            <div class="container">
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile" style="">
	                    <div>
	                    	<div class="card d-none d-md-block" id="mycard" style="align-items:center;">
		                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 85%;margin:7.5%;">
		                        <div class="card-body">
		                            <div class="card-title line-over" style="text-align: center;font-size:20px;font-weight:bold;margin-bottom:0px;">${ownerInfo.nickName} <span style="font-size:15px;">님</span></div>
		                            <p class="card-text" style="text-align: center;font-size:12px;">POINT <span style="font-size:15px;font-weight:bold;">${point }</span></p>
		                        </div>
	                    	</div>
	                    	<div class="d-md-none" style="background-color:white;border-radius:5px;height:200px;border: 1px solid rgba(0,0,0,.125); padding:5px;margin-right:10px;">
	                    		<div style="float:left">
		                        	<img src="${ownerInfo.profileImg }" style="width:150px;margin:10px;">
	                    		</div>
		                        <div style="float:left;margin-top:100px;margin-left:20px;">
	                            <div class="card-title line-over" style="text-align: center;font-size:17px;font-weight:bold;margin-bottom:0px;">${ownerInfo.nickName} <span style="font-size:12px;">님</span></div>
		                            <p class="card-text" style="text-align: center;font-size:10px;">POINT <span style="font-size:13px;font-weight:bold;">${point }</span></p>
		                        </div>
	                    	</div>
	                    </div>
	                </div>
	                <div class ="col-12 col-md-8 col-lg-9 wrapportfolio" style="min-height:700px;">
	                	<c:forEach items="${list}"  var="dto">
	                		<div class="cardwrap col-6 col-xl-4" onclick=toDetail(${dto.seq})>
		                        <div class="cardheight card cd-h" style="cursor:pointer">
		                            <img src="${dto.image1}" class="card-img-top" alt="..." style="height:20vw;width:85%;margin:7.5%;max-height:250px;">
		                            <div class="card-body" style="padding:5px;width:100%;height:115px;text-align:left;">
		                                <h5 class="card-title" style="text-align:left;font-size:15px;white-space:nowrap;overflow: hidden;text-overflow:ellipsis;width:100%;height:16px;">
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
								<div id="plusbt"style="margin-top:20px;text-align:center;height:30vw">
									<img id="addPF" src="/icon/plus.svg" style="opacity: 0.3;width:35%; position:relative;top:13vw;cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/Portfolio/toInsert.do'">
								</div>
							</div>
						</c:when>
					</c:choose>
					<form action="${pageContext.request.contextPath}/Portfolio/detail.do" method="POST" name="seqFrm" id="seqFrm">
						<input type="hidden" name="seq" id="hiSeq">
					</form>
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
			function toDetail(seq){
				$("#hiSeq").val(seq);
				$("#seqFrm").submit();
			}
            $("#addPF").on("click",function(){
                location.href = "${pageContext.request.contextPath}/Portfolio/toInsert.do";
            })
            $(window).resize(function (){
            	var hei = ($(".cardheight").height())+'px'
            	var hei2 = ($(".cardheight").height())*0.4+'px'
            	$("#plusbt").css("height", hei);
//             	$("#plusbt").css("top". hei2);
           	})
        </script>
</body>
</html>
