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
<style>
	#contentCon{
		min-height: 450px;
	}
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


            <div class="container eleCon">
            	<div class=row>
            		<div class="col-12"><h3><br>${result.title}</h3></div>
            	</div>
            	<div class=row>
            		<div class="col-12"><hr>${result.writer}&emsp;${result.writeDate}&emsp;${result.viewCount}<hr></div>
            	</div>
            	<div class="row">
            		<div class="col-12" id=contentCon>${result.content}</div>
            	</div>
            	
            	<c:choose>
            	<c:when test="${loginInfo==result.writer}">
            	<div class="row">
            		<div class="col-12 text-center">
            			<button id=modify>수정</button><button id=remove>삭제</button>
            		</div>
            	</div>
            	</c:when>
            	</c:choose>
            	
            	<div class="row">
            		<div class="col-12" id=adver style="height:200px;background-color:green;color:white;">광고자리</div>
            	</div>
            	
            	<div class="coContainer">
	            	<c:if test="${list.size()>0 }">
								<c:forEach items="${list}" var="dto">
									<div class="row commentDiv commentBox${dto.seq} p-0 pb-2 m-2">
										<div class="col-12 commentInnerBox">
											<div class="row commentHeader">
												<div class="col-1 profileBox pl-1 pt-2"><img src="/img/profileSample.jpg" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>
												<div class="col-7 pt-1">
													<div class="row commentInfo">
														<div class="col-12 commentWriter">${dto.writer }</div>
														<div class="col-12 commentWriteDate">${dto.writeDate }</div>
													</div>
												</div>				
												<div class="col-4 pt-2 text-right commentBtns">
													<c:if test="${dto.writer==sessionScope.loginInfo }">
														<a class="btn btn-info coModBtn" href="#" onclick="coModFunction(${dto.seq},'${dto.content}');return false;" role="button">수정</a>
														<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction(${dto.seq});return false;" role="button">삭제</a>
													</c:if>
												</div>								
											</div>											
											<div class="row commentContent">
												<div class="col-12 pt-1 pl-4">${dto.content}</div>
											</div>
										</div>
									</div>								
								</c:forEach>
							</c:if>
            	</div>
            	
            	<div class="row">
            		<div class="col-10">
            			<textarea style="width:100%;height:100%;" placeholder="댓글 입력" id="coContent"></textarea>
            		</div>
            		<div class="col-2">
            			<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-secondary" style="margin-bottom:10px;" id="coCancel">취소</button>
							</div>										
						</div>
						<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-primary" id="coWrite">작성</button>
							</div>										
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
        
        <script>
        			//게시글삭제
            		$("#remove").on("click",function(){
            			var result = confirm("정말 삭제하시겠습니까?");
            			if(result){
            				location.href="${pageContext.request.contextPath}/itnews/remove?seq=${result.seq}&page=${page}";
            			}
            		})
            		$("#modify").on("click",function(){
            			location.href="${pageContext.request.contextPath}/itnews/modify?seq=${result.seq}&page=${page}";
            		})
            		
            		//댓글
            		$("#coWrite").on("click",function(){
            			$("#coContent").val($.trim($("#coContent").val()));
            			if($("#coContents").val()==""){
        					alert("댓글 내용을 입력해주세요.");
        					return false;
        				}
            			$.ajax({
            				url:"${pageContext.request.contextPath}/itnews/coWrite",
            				data:{
            					content : $("#coContent").val(),
            					seq : ${result.seq}
            				},
            				dataType:"json",
            				type:"post"
            			}).done(function(resp){
            				$("#coContent").val("");
            				$(".coContainer").html("");
            				commentRecall(resp);
            			}).fail(function(resp){
            				console.log("실패");
            				console.log(resp);
            			});
            			
            		})
            		
            		//댓글 삭제
            		function coDelFunction(seq){
		           		var check = confirm("정말 삭제하시겠습니까?");
			           		if(check){
			           			$.ajax({
			           				url : "${pageContext.request.contextPath}/itnews/coRemove",
			           				type : "post",
			           				dataType : "json",
			           				data :{
			           					seq: seq,
			           					itSeq : "${result.seq}"
			           				}
			           			}).done(function(resp){
			    					$(".coContainer").html("");
			    					commentRecall(resp);
			           			}).fail(function(resp){
			    					console.log("실패");
			    					console.log(resp);
			           			})
			           		}
		           	}
            		
            		
            		//댓글 에이작스 후 리콜
            		function commentRecall(resp){
						var loginInfo = "${sessionScope.loginInfo}";
						for(var i=0;i<resp.length;i++){
							var html = [];
							html.push(
									'<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
									'<div class="col-1 profileBox pl-1 pt-2"><img src="/img/profileSample.jpg" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
									'<div class="col-7 pt-1"><div class="row commentInfo">',
									'<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
									'<div class="col-12 commentWriteDate">'+resp[i].witeDate+'</div></div></div>',
									'<div class="col-4 pt-2 text-right commentBtns">'
									);
							if(resp[i].writer==loginInfo){
								html.push(
										'<a class="btn btn-info coModBtn" href="#" onclick="coModFunction('+resp[i].seq+',\''+resp[i].content+'\');return false;" role="button">수정</a>\n',
										'<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
										);
							}
							html.push(
									'</div></div>',
									'<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].content+'</div></div></div></div>'
									);
							$(".coContainer").append(html.join(""));	
							}
					}	
        </script>
</body>
</html>
