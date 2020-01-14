<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css"
	type="text/css" />
<link rel="stylesheet" href="/css/project/projectBase.css"
	type="text/css" />
<link rel="stylesheet" href="/css/project/detailView.css"
	type="text/css" />
<script>
   $(function(){
      $("#indusNavi").attr('class','nav-item nav-link active');
   });
</script>
<style>
.table {
	background-color: white;
	padding: 0;
	text-align: center;
}

.contentDiv {
	/* 한 줄 자르기 */
	display: block;
	text-align: left;
	width: 800px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	/* 여러 줄 자르기 추가 스타일 */
	white-space: normal;
}

.btn btn-primary {
	text-align: left;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />
	
	<div id=baseBackgroundColor>
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		<div class="container eleCon">
		

		<c:if test="${iPage.seq !=null }">
            	<div class=row>
            		<div class="col-12"><h3><br>${iPage.title}</h3></div>
            	</div>
            	<div class=row>
            		<div class="col-12"><h5><br>분야 : ${iPage.field } / 직무 : ${iPage.duty }</h5></div>
            	</div>
            	<div class=row>
            		<input type="hidden" name="seq" value="${iPage.seq}">
            		<input type="hidden" name="id" value="${iPage.id}">
            		
            		<div class="col-12"><hr><a href="/Portfolio/toPlog.do?owner=${iPage.id }">${iPage.writer}</a>&emsp;${iPage.formedWriteDate}&emsp;${iPage.viewCount}<hr></div>
            	</div>
            	<div class="row">
            		<div class="col-12" id=contentCon>${iPage.content}</div>
            	</div>
        </c:if>
        <a class="btn btn-primary" href="/industry/industryStatusList.do"
						role="button">돌아가기</a>
		<c:if test="${iPage.id == sessionScope.loginInfo.id}">
					<div class="row">
					<div class="col-12 text-center">
					<a class="btn btn-primary"
							href="/industry/industryStatusModify.do?seq=${iPage.seq }"
							role="button">수정하기</a>
						<a class="btn btn-primary"
							href="/industry/industryStatusDeleteProc.do?seq=${iPage.seq}"
							role="button">삭제하기</a>
					</div>
					</div>
				</c:if>					
			<div class=row>
            		<div class="col-12 text-center">
        			<i class="fa fa-share-alt"></i><a class="btn btn-primary" href="#"
						role="button">공유하기</a> <i class="fa fa-bookmark-o" id="scrap"
						data-toggle="tooltip" title="스크랩"></i> 
						<c:if test="${iPage.id != sessionScope.loginInfo.id}">
						<button type="button" class="btn btn-primary" id="report">신고하기</button>
						</c:if>
        	</div>
        	</div>
        	<div class="row">
            		<div class="col-12" id=adver style="height:200px;background-color:green;color:white;">광고자리</div>
            	</div>
        <div class="pPageComments">
					<c:if test="${comments.size()>0 }">
						<c:forEach items="${comments }" var="c">
							<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2">
								<div class="col-12 commentInnerBox">
									<div class="row commentHeader">

										<div class="col-8 pt-1">
											<div class="row commentInfo">
												<div class="col-12 commentWriter">${c.writer }</div>
												<div class="col-12 commentWriteDate">${c.formedWriteDate }</div>
											</div>
										</div>
										<div class="col-4 pt-2 text-right commentBtns">
											<c:if test="${c.id==sessionScope.loginInfo.id }">
												<a class="btn btn-info coModBtn"
													href="/bamboo/comment/modifyProc.do?seq=${c.seq }&bamSeq=${c.indSeq}"
													onclick="coModFunction(${c.seq},'${c.content}',${c.indSeq });return false;"
													role="button">수정</a>
												<a class="btn btn-danger coDelBtn"
													href="/bamboo/comment/deleteProc.do?seq=${c.seq }&bamSeq=${c.indSeq}"
													onclick="coDelFunction(${c.seq});return false;"
													role="button">삭제</a>
											</c:if>
										</div>
									</div>
									<div class="row commentContent">
										<div class="col-12 pt-1 pl-4">${c.content }</div>
									</div>
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:if>
				</div>
				
				<div id="pCoInput" class="row">
            		<div class="col-10">
            			<textarea style="width:100%;height:100%;" placeholder="댓글 입력" id="pCoContents" maxlength="1300"></textarea>
            		</div>
            		<div class="col-2">
            			<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-secondary" style="margin-bottom:10px;" id="coCancel">취소</button>
							</div>										
						</div>
						<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-primary" id="coWriteBtn">작성</button>
							</div>										
						</div>					
            		</div>
            	</div> 
        </div>

			<!--       몸통 끝!!!   -->

			<div class=container>
				<div class=row>
					<div class="col-12" id=aroundContent></div>
				</div>
			</div>
	</div>
	<jsp:include page="/WEB-INF/views/industry/jsp/reportModal.jsp"/>
	<jsp:include page="/WEB-INF/views/industry/jsp/reportSuccessModal.jsp"/>
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />

	<script>
      //스크랩하기
    	
    	$("#scrap").on("click",function(){
    		var result = confirm("스크랩하시겠습니까?");
    		if(result){
    			//이미 했는지 검사
    			$.ajax({
    				url:"${pageContext.request.contextPath}/industry/scrap.do",
    				type:"post",
    				data:{
    					category : "industryStatus",
    					categorySeq : ${iPage.seq}
    				}
    			}).done(function(resp){
    				if(resp == "success"){//스크랩 성공
    					alert("스크랩에 성공하셨습니다. P-log의 마이스크랩에서 확인해주세요.");
    				}else if(resp == "already"){//이미스크랩
    					alert("이미 스크랩된 글입니다. P-log의 마이스크랩에서 확인해주세요.");
    				}else{//실패
    					alert("오류발생. 일대일문의에 문의해주세요.");
    				}
    			});
    		}
    		})
    		
        $("#coWriteBtn").on("click",function(){
        	if("${sessionScope.loginInfo.id}" == ""){
        		alert("로그인을 해주세요.");
        		return false;
        	}
			$("#pCoContents").val($.trim($("#pCoContents").val()));
			if($("#pCoContents").val()==""){
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
        	
			$.ajax({
				url : "/industry/comment/writeProc.do",
				type : "post",
				dataType : "json",
				data :{
					indSeq : "${iPage.seq}",
					content : $("#pCoContents").val(),
					writer: "${sessionScope.loginInfo.nickName}",
					id:"${sessionScope.loginInfo.id}"
				}
			}).done(function(resp){
				$("#pCoContents").val("");
 				$(".pPageComments").html("");
				commentRecall(resp);
			}).fail(function(resp){
			
			})
        });
         	
			function coModFunction(seq,contents,indSeq){     
				$(".commentBox"+seq).find(".commentBtns").css("display","none");
				$(".commentBox"+seq).find(".commentContent").css("display","none");
           		$(".commentBox"+seq).wrap('<form action="/industry/comment/modifyProc.do" method="post" id="coModFrm"></form>');
				var html = [];
    			html.push(
    					'<div class="col-12 coModBox mt-2"><div class="row">',
    					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea maxlength="1300" class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="content">'+contents+'</textarea></div>',
    					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="indSeq" value="'+indSeq+'">',
    					'<div class="row">',
    					'<div class="col-12 text-center p-0">',
    					'<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
    					'</div></div>',
    					'<div class="row"><div class="col-12 text-center p-0">',
    					'<button type="button" class="btn btn-warning" style="width:80%;" id="coMoBtn">수정</button>',
    					'</div></div></div></div></div>');
    			$(".commentBox"+seq).append(html.join(""));    			
           	}
           	
           	$(document).on("click","#coMoCancel",function(){
           		var check = confirm("수정을 취소하시겠습니까?");
           		if(check){
           			$(this).closest(".commentDiv").unwrap();
           			$(this).closest(".commentDiv").find(".commentInnerBox").find(".commentHeader").find(".commentBtns").show();
           			$(this).closest(".commentDiv").find(".commentInnerBox").find(".commentContent").show();           			
           			$(this).closest(".coModBox").remove();           			
           		}
           	});
           	
           	$(document).on("click","#coMoBtn",function(){
				$("#pCoModContents").val($.trim($("#pCoModContents").val()));
				if($("#pCoModContents").val()==""){
					alert("댓글 내용을 입력해주세요.");
					return false;
				}
				
				$.ajax({
					url : "/industry/comment/modifyProc.do",
					type : "post",
					dataType : "json",
					data : $("#coModFrm").serialize()
				}).done(function(resp){
					$(".pPageComments").html("");
					commentRecall(resp);
				}).fail(function(resp){
					
				})
           	});
           	function coDelFunction(seq){
           		var check = confirm("정말 삭제하시겠습니까?");
           		if(check){
           			$.ajax({
           				url : "/industry/comment/deleteProc.do",
           				type : "post",
           				dataType : "json",
           				data :{
           					seq : seq,
           					indSeq : "${iPage.seq}"
           				}
           			}).done(function(resp){
    					$(".pPageComments").html("");
    					commentRecall(resp);
           			}).fail(function(resp){
    				
           			})
           		}
           	}
           	function commentRecall(resp){
				var loginInfo = "${sessionScope.loginInfo.id}";
				for(var i=0;i<resp.length;i++){
					var html = [];
					html.push(
							'<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
							'<div class="col-7 pt-1"><div class="row commentInfo">',
							'<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
							'<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
							'<div class="col-4 pt-2 text-right commentBtns">'
							);
					if(resp[i].id==loginInfo){
					html.push(
								'<a class="btn btn-info coModBtn" href="/industry/comment/modifyProc.do?seq='+resp[i].seq+'&indSeq='+resp[i].indSeq+'" onclick="coModFunction('+resp[i].seq+',\''+resp[i].content+'\','+resp[i].indSeq+');return false;" role="button">수정</a>\n',
								'<a class="btn btn-danger coDelBtn" href="/industry/comment/deleteProc.do?seq='+resp[i].seq+'&indSeq='+resp[i].indSeq+'" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
								);
					}
					html.push(
							'</div></div>',
							'<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].content+'</div></div></div></div><hr>'
							);
					$(".pPageComments").append(html.join(""));	
           		}
			}
            //신고하기
        	function popUp(link){
    			window.open(link, "pLogPopUp", "width=600,height=600");
    		}
    		$("#report").on("click",function(){
    			var check = "해당 게시물을 신고하시겠습니까?";
    			if(check){
    				$.ajax({
    					url:"/industry/reportDuplCheck.do",
    					type:"post",
    					data:{seq : $("#iPageSeq").val()}
    				}).done(function(resp){
    					if(resp == 'dupl'){
    						alert("해당 게시물을 이미 신고하셨습니다.");
    					}else if(resp == 'possible'){
    						$('#reportModal').modal('show');						
    					}
    				}).fail(function(resp){
    					console.log("실패");
    					console.log(resp);
    				});
    				return false;
    			}
    		});
			
    		$("#reportFrm").on("submit",function(){
    			$("#reportReasonInput").val($.trim($("#reportReasonInput").val()));
    			if($("#reportReasonInput").val()==""){
    				alert("신고사유를 작성해주세요.");
    				return false;
    			}
    			$.ajax({
    				url:"/industry/report.do",
    				type:"post",				
    				data:$("#reportFrm").serialize()
    			}).done(function(resp){
    				$("#reportReasonInput").val("");
    				$('#reportModal').modal('hide');
    				$("#rSuccessModal").modal('show');				
    			}).fail(function(resp){
    				console.log(resp);
    			});
    			return false;
    		});
    		
    		$("#reportCancelBtn").on("click",function(){
    			$("#reportReasonInput").val("");
    		});
        </script>
</body>
</html>