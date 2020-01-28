<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
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
<link rel="stylesheet" href="/css/industry/industryBase.css"
	type="text/css" />
	<script type="text/JavaScript"
   src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
   $(function(){
      $("#indusNavi").attr('class','nav-item nav-link active');
   });
</script>
<script type="text/javascript">
Kakao.init("17c512cbe4e17a204cce3c9b7d64d274"); // 사용할 앱의 JavaScript 키를 설정
   function shareKakaotalk() {
      Kakao.Link.sendDefault({
         objectType : "feed",
         content : {
            title : "${iPage.kakaoTitle}", // 콘텐츠의 타이틀 
            description : "HELLo", // 콘텐츠 상세설명
            imageUrl : "https://miro.medium.com/max/3840/1*U-R58ahr5dtAvtSLGK2wXg.png", // 썸네일 이미지          
            link : {
               mobileWebUrl : "http://${ip}/industry/industryStatusDetailView.do?seq="+${iPage.seq}, // 모바일 카카오톡에서 사용하는 웹 링크 URL            
               webUrl : "http://${ip}/industry/industryStatusDetailView.do?seq="+${iPage.seq} // PC버전 카카오톡에서 사용하는 웹 링크 URL
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
               mobileWebUrl : "http://${ip}/industry/industryStatusDetailView.do?seq="+${iPage.seq},  // 모바일 카카오톡에서 사용하는 웹 링크 URL
               webUrl : "http://${ip}/industry/industryStatusDetailView.do?seq="+${iPage.seq} // PC버전 카카오톡에서 사용하는 웹 링크 URL
            }
         } ]
      });
   }
   
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
#contentCon{
		min-height: 450px;
	}
	#cateTitle{
		font-size:60px;
	}
	#cateCmt{
	color:gray;
	font-size: 15px;
	}
	.commentInnerBox{
	background-color:#ededed;
	border-radius: 10px;
	padding-top: 15px;
	padding-bottom: 20px;
	} 
	.commentWriteDate{
		color:#c2c2c2;
		font-size: 14px;
	}
</style>
</head>
<body>
<c:if test="${iPage.seq==null}">
      <script>
         alert("삭제되었거나 존재하지 않는 글입니다");
         location.href="${pageContext.request.contextPath}/industry/industryStatusList.do";
      </script>
   </c:if>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />
	
	<div id=baseBackgroundColor>
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent1></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		 <div class="container">	
				<div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom"><h1 class="fontBold titleClick cursorPointer">HELL<span style="opacity:0.5">o</span></h1></td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">     재직자만 사용가능한 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;"><h1 class="fontBold titleClick cursorPointer">HELL<span style="opacity:0.5">o</span></h1></div>
					<div style="font-size: 15px; color: gray;">재직자만 사용가능한 게시판입니다.</div>
				</div>
			</div>
			<div class=row>
					<div class=col-12><br></div>
				</div>	
          </div>
		<div class="container eleCon">
		

		<c:if test="${iPage.seq !=null }">
            	<div class=row>
            		<div class="col-12" style="word-break:break-all;
      word-break:break-word;"><h3><br>${iPage.title}</h3></div>
            	</div>
            	<div class=row>
            		<div class="col-12" style="font-size: 15px;color:#707070;"><br>${iPage.field } / ${iPage.duty }</div>
            	</div>
            	<div class="row">
            		<input type="hidden" name="seq" value="${iPage.seq}" id="iPageSeq">
            		<input type="hidden" name="id" value="${iPage.id}">
            		
            		<div class="col-12" style="font-size: 13px;color:#707070;"><hr><img src="${iPage.profileImg }" width=40,height=40><span class="hvOrange" style="cursor:pointer" onclick="popUpPlog('${iPage.id}','${iPage.writer}')"> ${iPage.writer}</span>&emsp;작성일 : ${iPage.formedWriteDate}&emsp;조회수 : ${iPage.viewCount}<hr></div>
            	</div>
            	<div class="row">
            		<div class="col-12" id=contentCon style="word-break:break-all;
      word-break:break-word;">${iPage.content}</div>
            	</div>
        </c:if>
        					
			<div class=row>
            		<div class="col-12 text-right">
        				<a id="kakao-link-btn" href="javascript:;" onClick="shareKakaotalk();" style="text-decoration:none;"> 
						<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" height=38 style="margin-right:2px;"/>
					</a>
       					<button type="button" class="btn btn-success text-right" id="scrap">스크랩</button> 
        	</div>
        	</div>
        	<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
        	<div class="row">
            		<div class="col-12 text-center" id=adver>
            			<img src="/img/ad${ad}.png">
            		</div>
            	</div>
            	<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
        <div class="pPageComments">
					<c:if test="${comments.size()>0 }">
						<c:forEach items="${comments }" var="c">
							<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2">
								<div class="col-12 commentInnerBox">
									<div class="row commentHeader">
										<div class="d-none d-md-block col-1 profileBox pl-1 pt-2"><img src="${c.profileImg }" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>
										<div class="col-8 col-md-7 pt-1">
											<div class="row commentInfo">
												<div class="col-12 commentWriter"><span class="hvOrange" style="cursor:pointer" onclick="popUpPlog('${c.id}','${c.writer}')">${c.writer }</span></div>
												<div class="col-12 commentWriteDate">${c.formedWriteDate }</div>
											</div>
										</div>
										<div class="col-4 pt-2 text-right commentBtns">
											<c:if test="${c.id==sessionScope.loginInfo.id }">
												<a class="btn btn-info coModBtn"
													href="/bamboo/comment/modifyProc.do?seq=${c.seq }&bamSeq=${c.indSeq}"
													onclick="coModFunction(${c.seq},${c.indSeq });return false;"
													role="button">수정</a>
												<a class="btn btn-danger coDelBtn"
													href="/bamboo/comment/deleteProc.do?seq=${c.seq }&bamSeq=${c.indSeq}"
													onclick="coDelFunction(${c.seq});return false;"
													role="button">삭제</a>
											</c:if>
										</div>
									</div>
									<div class="row commentContent">
										<div class="col-12 pt-1 pl-4" style="word-break:break-all;
      word-break:break-word;">${c.content }</div>
      <input type="hidden" value="${c.modComment }" id="hiddenModCo${c.seq }">
									</div>
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:if>
				</div>
				
				<div id="pCoInput" class="row">
            		<div class="col-9 col-lg-10" style="padding:0px;padding-left:22px;">
            			<textarea style="width:100%;height:100%;border:1px solid #d1d1d1;" placeholder="댓글내용을 입력해주세요" id="pCoContents" maxlength="1300"></textarea>
            		</div>
            		<div class="col-3 col-lg-2">
            			<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-secondary" style="margin-bottom:10px;width:95%" id="coCancel">취소</button>
							</div>										
						</div>
						<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-primary" style="width:95%" id="coWriteBtn">작성</button>
							</div>										
						</div>					
            		</div>
            	</div> 
            	<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
        </div>
        <div class=container>
		
					<div class="row">
					<div class="col-12 text-right pt-2">
					<c:if test="${iPage.id != sessionScope.loginInfo.id}">
						<button type="button" class="btn btn-danger" id="report">신고하기</button>
						</c:if>
					<c:if test="${iPage.id == sessionScope.loginInfo.id}">
					<a class="btn btn-info"
							href="/industry/industryStatusModify.do?seq=${iPage.seq }"
							role="button">수정</a>
					<button type="button" class="btn btn-danger" id=delete>삭제</button>
				</c:if>
				<a class="btn btn-secondary" href="/industry/industryStatusList.do"
						role="button">목록</a>
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
    			}).fail(function(resp){
    				alert("문제가 발생했습니다. 다시 시도해주세요.");
    			})
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
				url : "/industry/memLevel.do",
				type : "post",
				dataType : "json",
				data : {
					id : "${sessionScope.loginInfo.id}"
				}
			}).done(function(resp){
				if(resp > 1){
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
						alert("문제가 발생했습니다. 다시 시도해주세요.");
					})
				}else{
					alert("권한이 없습니다. 관리자에게 문의해주세요.")
					return false;
				}	
			}).fail(function(resp){
				alert("문제가 발생했습니다. 다시 시도해주세요.");
			})
        });
    	$("#coCancel").on("click",function(){
			var check = confirm("정말 취소하시겠습니까?");
			if(check){
				$("#pCoContents").val("");
			}
		});
			function coModFunction(seq,indSeq){
				$.ajax({
					url : "/industry/memLevel.do",
					type : "post",
					dataType : "json",
					data : {
						id : "${sessionScope.loginInfo.id}"
					}
				}).done(function(resp){
					if(resp > 1){
				var checkContents = $("#hiddenModCo"+seq).val().replace(/modF'Fdom/gi,'"');
				$(".commentBox"+seq).find(".commentBtns").css("display","none");
				$(".commentBox"+seq).find(".commentContent").css("display","none");
           		$(".commentBox"+seq).wrap('<form action="/industry/comment/modifyProc.do" method="post" id="coModFrm"></form>');
				var html = [];
    			html.push(
    					'<div class="col-12 coModBox mt-2"><div class="row">',
    					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea maxlength="1300" class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="content">'+checkContents+'</textarea></div>',
    					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="indSeq" value="'+indSeq+'">',
    					'<div class="row">',
    					'<div class="col-12 text-center p-0">',
    					'<button type="button" class="btn btn-secondary" style="margin-bottom:10px;width:95%;" id="coMoCancel">취소</button>',
    					'</div></div>',
    					'<div class="row"><div class="col-12 text-center p-0">',
    					'<button type="button" class="btn btn-warning" style="width:95%;" id="coMoBtn">수정</button>',
    					'</div></div></div></div></div>');
    			$(".commentBox"+seq).append(html.join(""));
					}else{
						alert("권한이 없습니다. 관리자에게 문의해주세요.")
						return false;
					}	
				}).fail(function(resp){
					alert("문제가 발생했습니다. 다시 시도해주세요.");
				})
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
					alert("문제가 발생했습니다. 다시 시도해주세요.");
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
           				alert("문제가 발생했습니다. 다시 시도해주세요.");
           			})
           		}
           	}
           	function commentRecall(resp){
				var loginInfo = "${sessionScope.loginInfo.id}";
				for(var i=0;i<resp.length;i++){
					var html = [];
					html.push(
							'<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
							'<div class="d-none d-md-block col-1 profileBox pl-1 pt-2"><img src="'+resp[i].profileImg+'"class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
							'<div class="col-8 col-md-7 pt-1"><div class="row commentInfo">',
							'<div class="col-12 commentWriter"><span class="hvOrange" style="cursor:pointer" onclick="popUpPlog(\''+resp[i].id+'\',\''+resp[i].writer+'\')">'+resp[i].writer+'</span></div>',
							'<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
							'<div class="col-4 pt-2 text-right commentBtns">'
							);
					if(resp[i].id==loginInfo){
					html.push(
								'<a class="btn btn-info coModBtn" href="/industry/comment/modifyProc.do?seq='+resp[i].seq+'&indSeq='+resp[i].indSeq+'" onclick="coModFunction('+resp[i].seq+','+resp[i].indSeq+');return false;" role="button">수정</a>\n',
								'<a class="btn btn-danger coDelBtn" href="/industry/comment/deleteProc.do?seq='+resp[i].seq+'&indSeq='+resp[i].indSeq+'" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
								);
					}
					html.push(
							'</div></div>',
							'<div class="row commentContent"><div class="col-12 pt-1 pl-4" style="word-break:break-all;word-break:break-word;">'+resp[i].content+'</div></div></div></div><hr>',
							'<input type="hidden" value="'+resp[i].modComment+'" id="hiddenModCo'+resp[i].seq+'">'
							);
					$(".pPageComments").append(html.join(""));	
           		}
			}
          //닉네임 눌렀을때 새창 띄우기
        	function popUpPlog(id,writer){
        		if(writer == null){
        			alert("탈퇴한 회원입니다.");
        			return false;
        		}
        		else{
        			window.open("/Portfolio/toPlog.do?owner="+id+"&other=Y", "pLogPopUp", "width=600,height=600");
        		}
              
             }
            //신고하기
        	function popUp(link){
    			window.open(link, "pLogPopUp", "width=800,height=600");
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
    					alert("문제가 발생했습니다. 다시 시도해주세요.");
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
    				alert("문제가 발생했습니다. 다시 시도해주세요.");
    			});
    			return false;
    		});
    		
    		$("#reportCancelBtn").on("click",function(){
    			$("#reportReasonInput").val("");
    		});
    		$("#delete").on("click",function(){
    			var check = confirm("정말 삭제하시겠습니까?");
    			if(check){
    				location.href="/industry/industryStatusDeleteProc.do?seq=${iPage.seq}";
    			}
    		});
    		$(".titleClick").on("click",function(){
    			location.href="/industry/industryStatusList.do";
    		})
        </script>
</body>
</html>