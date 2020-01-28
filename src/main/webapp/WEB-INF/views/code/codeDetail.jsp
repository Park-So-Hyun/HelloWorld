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
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/themify-icons.css">
<link rel="stylesheet" href="/css/code/codeBase.css" type="text/css"/>
   
<script>
   $(function(){
      $("#codeNavi").attr('class','nav-item nav-link active');
   });
</script>

<!-- 카톡공유 -->
<script type="text/JavaScript"
   src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
Kakao.init("17c512cbe4e17a204cce3c9b7d64d274"); // 사용할 앱의 JavaScript 키를 설정
   function shareKakaotalk() {
      Kakao.Link.sendDefault({
         objectType : "feed",
         content : {
            title : "${qResult.kakaoTitle}", // 콘텐츠의 타이틀
            description : "Code-How", // 콘텐츠 상세설명
            imageUrl : "https://miro.medium.com/max/3840/1*U-R58ahr5dtAvtSLGK2wXg.png", // 썸네일 이미지          
            link : {
               mobileWebUrl : "http://${ip}/code/codeDetail.do?seq="+${qResult.seq}, // 모바일 카카오톡에서 사용하는 웹 링크 URL            
               webUrl : "http://${ip}/code/codeDetail.do?seq="+${qResult.seq} // PC버전 카카오톡에서 사용하는 웹 링크 URL
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
               mobileWebUrl : "http://${ip}/code/codeDetail.do?seq="+${qResult.seq},  // 모바일 카카오톡에서 사용하는 웹 링크 URL
               webUrl : "http://${ip}/code/codeDetail.do?seq="+${qResult.seq} // PC버전 카카오톡에서 사용하는 웹 링크 URL
            }
         } ]
      });
   }
   
</script>
<!-- . -->

<style>
.contentDiv {
   /* 한 줄 자르기 */
   display: block;
   text-align: left;
   width: 100%;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
   /* 여러 줄 자르기 추가 스타일 */
   white-space: normal;
}

a:hover {
   text-decoration: none;
}

.topQ {
   display: block;
   text-align: left;
}

.botD {
   display: block;
   text-align: left;
}

.btnDIv2 {
   margin: 20px;
   padding: 20px;
}

#pageTitle {
   margin-bottom: 20px;
}

#pageTitle h1 {
   display: inline;
   margin-right: 10px;
   font-weight: bold;
}

#pageBody {
   background-color: white;
}

#pHeader, #pageFooter {
   padding-top: 10px;
}

#pHeader #stateLabel {
   color: white;
}

#pHeader label.N {
   background-color: limegreen;
}

#pHeader label.Y {
   background-color: red;
}

#pHeader span:first-of-type {
   font-size: 20px;
}

#pHeader label:nth-of-type(2) {
   width: 200px;
}

#pInfo *, #pBody * {
   font-size: 15px;
}

#pInfo label, #pBody label {
   width: 100px;
   color: darkgray;
}

#baseBackgroundColor {
   margin: auto;
   text-align: center;
}

#btnDIv {
   margin: 20px;
}

span:nth-child(2) {
   font-size: 30px;
   font-weight: 100;
}

span:nth-child(4) {
   font-size: 30px;
   font-weight: 100;
}

.contentDivBot {
   text-align: left;
}

.writerR{
   cursor:pointer; 
   font-size: 30px; 
   font-weight: 100;
}
</style>
</head>
<body>

   <c:if test="${qResult==null}">
      <script>
         alert("삭제되었거나 존재하지 않는 글입니다");
         location.href="${pageContext.request.contextPath}/code/codeQList.do";
      </script>
   </c:if>


	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor style="text-align: left;">
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent1></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		<div class="container eleCon" id="projectPage" style="background-color: white; min-height:380px;">
			<!-- 			<div id="pageTitle"> -->
			<div class="topQ" style="margin-top:20px;">
				<input type="hidden" name="seq" value="${qResult.seq}" id="qSeq">
				<span><img src="/icon/q.png" width=50,height=50></span> <span class="badge badge-pill badge-danger" style="font-size:15px;">${qResult.point}</span>
				<span class="badge badge-pill badge-success"
					style="width: 80px; font-size:15px;">${qResult.division}</span>
					<!-- 영어 길게치면 영역넘어감 style설정해줘야함 -->
				<span style="word-break:break-all; word-break:break-word; font-size:25px;">${qResult.title}</span>
			</div>
<!-- 			<br> -->
			<div>
				<div class="botD">
					<img src="${qResult.profileImg}" width=50,height=50> 
					<span class="hvOrange" style="cursor:pointer" onclick="popUp('${qResult.id}','${qResult.writer}')">${qResult.writer}</span>				
					<span style="color: gray;">${qResult.formedDate} 조회수${qResult.viewCount}</span>
				</div>
				<hr>				
				<br>							
				<div class="contentDiv" style="word-break:break-all; word-break:break-word;">${qResult.content}</div>
				<br>


               	<c:if test="${qResult.id!=sessionScope.loginInfo.id}">
               	  	  <div style="float:left">
               	  		<c:if test="${count==0 && adoptCount==0 && sessionScope.loginInfo.memLevel!=1}" >
	                        <a class="btn btn-outline-dark" href="/code/codeRWrite.do?seq=${qResult.seq}" role="button">답변하기</a>
	                     </c:if>
	                  </div>
	                  <div style="text-align: right;">
	                      <a id="kakao-link-btn" href="javascript:;" onClick="shareKakaotalk();" style="text-decoration:none"> 
	                         <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" height=38/>
	                      </a>
	                     
	<!--                      <a id="kakao-link-btn" href="javascript:;" -->
	<!--                         onClick="shareKakaotalk();">  -->
	<!--                         <img src="/icon/kakaoTalk.png" height=40> -->
	<!--                      </a> -->
	                     <!--    <button class="btn btn-warning" id="sharing">공유</button> -->
	                     <!--    <button type="button" class="btn btn-outline-warning" id="sharing"></button> -->
	                      
	                     <!-- <i class="fa fa-bookmark" id="scrapDone" data-toggle="tooltip" title="스크랩"></i> -->
	                     <c:if test="${sessionScope.loginInfo.id!=null && sessionScope.loginInfo.memLevel!=1}">
		                     <button class="btn btn-success" id="scrap">스크랩</button>
		                     <button class="btn btn-danger" id="report">신고</button>
	                     </c:if>
	                  </div>
               	</c:if>
               
               <c:if test="${qResult.id==sessionScope.loginInfo.id}">
                  <div style="text-align: right;">
                       <a id="kakao-link-btn" href="javascript:;" onClick="shareKakaotalk();" style="text-decoration:none"> 
                         <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" height=38/>
                      </a>
                        <button class="btn btn-success" id="scrap">스크랩</button>
                     <!-- 답변이 있으면 삭제,수정이 안됨. -->
                     <c:if test="${repCount==0}">                        
                        <button class="btn btn-dark" class="btnDIv2" id="modify">수정</button>
                        <button class="btn btn-danger" class="btnDIv2" id="delete">삭제</button>
                     </c:if>
                  </div>
               </c:if>
               
            <br>
            <br>           
            <div class="row">
<!--                <div class="col-12" id=adver style="height:100px;background-color:dodgerblue;color:white; text-align:center; line-height:100px;">광고자리</div> -->
               <div class="col-8" id=adver style="margin:auto;">
                  <img src="/img/${ad}" class="d-block w-100" alt="...">
               </div>
            </div>

            	
				<!-- 답글 시작-->
				<c:forEach items="${rResult}" var="r">
					<div class="topQ">
						<hr>
						<div class="row">
							<div class="col-xl-1 col-md-2">	
								<c:choose>
									<c:when test="${r.memLevel == 3}">
										<div style="padding-top:0px; position: relative; top: 10px;">	
											<img src="${r.profileImg}" width=90,height=200>							 
											<div class="d-md-none" style="float:right">
												<c:if test="${r.adopt=='Y'}">
													<span class="ti-crown text-warning" style="font-size:18px;"></span>
													질문자 채택
												</c:if>
											</div>
										</div>
									</c:when>															
									<c:otherwise>
										<div style="padding-top:0px; position: relative; top: 0px;">
											<img src="${r.profileImg}" width=90,height=200>							 
											<div class="d-md-none" style="float:right">
												<c:if test="${r.adopt=='Y'}">
													<span class="ti-crown text-warning" style="font-size:18px;"></span>
													질문자 채택
												</c:if>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							

							<div class="col-xl-9 col-md-8" style="position: relative; right: 10px;">
							<c:choose>
								<c:when test="${r.memLevel == 3}">
									<div class="row">
										<div class="col-12 pt-0" style="font-size: 30px; font-weight: 100; padding-top:0px;">							
											<c:if test="${r.memLevel == 3}">
												<span style="font-size: 18px; font-weight: 50; color: gray;">실무자</span>
											</c:if>
										</div>
										<div class="col-12" style="padding-top:0px; position: relative; bottom: 10px;">
											<span class="hvOrange writerR" onclick="popUp('${r.id}','${r.writer}')">${r.writer}</span>
											<span style="font-size: 15px; font-weight: 50; color: gray;">님의 답변입니다.</span>
										</div>							
									</div>
								</c:when>
								<c:otherwise>
									<div class="row">										
										<div class="col-12" style="padding-top:0px; position: relative; top: 10px;">
											<span class="hvOrange writerR" onclick="popUp('${r.id}','${r.writer}')">${r.writer}</span>
											<span style="font-size: 15px; font-weight: 50; color: gray;">님의 답변입니다.</span>
										</div>									
									</div>
								</c:otherwise>
							</c:choose>
										
								<%-- 						<c:if test="${r.adopt=='Y'}"> --%>
								<!-- 							<i data-brackets-id="1484" class="fa fa-check-circle-o"  style="font-size:100px;"><h3 style="color:red;">질문자채택</h3></i> -->
								<!-- 							<i data-brackets-id="803" class="fa fa-check" style="font-size:100px;"><h3 style="color:red;">질문자채택</h3></i> -->
								<!-- 							<img src="/icon/check.svg" width=150 height=70><h3 style="color:red;">질문자채택</h3> -->
								<%-- 						</c:if> --%>
							</div>
							
						<c:if test="${r.adopt=='Y'}">
							<div class="col-2 d-none d-md-block">
								<span class="ti-crown text-warning" style="font-size:90px;"></span>
							</div>
						</c:if>	
								
							
						</div>
						<hr>
						<br>
						<div id="content" style="word-break:break-all; word-break:break-word;">${r.content}</div>
						<br>
						<div style="color: gray; font-size:15px;">${r.formedDate}</div>
						<!-- 채택 -->
						<c:if test="${repCount >0 && qResult.id == sessionScope.loginInfo.id}">
							<div style="text-align: right;">
								<c:if test="${r.adopt=='N' && adoptCount == 0}">
									<button type="button" class="btn btn-primary" id="adopt"
										onclick="adopt('${r.id}')">채택하기</button>
								</c:if>
							</div>
						</c:if>
						<br>
						<c:choose>
							<c:when test="${r.id == sessionScope.loginInfo.id}">
								<div style="text-align: right;">
									<button class="btn btn-dark" id="modifyR"
										onclick="modifyRe(${r.seq},${r.queSeq})">수정</button>
									<button class="btn btn-danger" id="deleteR"
										onclick="deleteRe(${r.seq},${r.queSeq})">삭제</button>
								</div>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.loginInfo.id!=null}">
									<div style="text-align: right;">
										<button class="btn btn-danger" onclick="reportR(${qResult.seq}, ${r.seq}, '${r.writer}','${r.id}')" id="reportR${r.seq}">신고</button>
									</div>
								</c:if>
							</c:otherwise>
						</c:choose>
						<br>
						
						<div style="text-align: left;">
								<button class="btn btn-dark" id="commentBtn${r.seq}">댓글</button>
						</div>
						
						<br>
						<div class="contentDivBot dSeq${r.seq}" style="display: none;">
							<div class="pPageComments${r.seq}">
								<c:if test="${cResult.size()>0 }">
									<c:forEach items="${cResult }" var="c">
										<!-- 댓글seq = 답글seq 같은것만 보여지게 -->
										<c:choose>
											<c:when test="${c.repSeq == r.seq}">
												<div
													class="row commentDiv commentBox${r.seq}${c.seq} p-0 pb-2 m-2" style="border:1px solid gray; border-top:none; border-left: none; border-right: none;">													
													<div class="col-12 commentInnerBox">
														<div class="row commentHeader">
															<div class="col-lg-1 d-none d-lg-block profileBox pl-1 pt-2 pr-0"><img src="${c.profileImg }" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>
															<div class="col-7 col-lg-6 pt-1">
																<div class="row commentInfo">
																	<div class="col-12 commentWriter"><span class="hvOrange" style="cursor:pointer;" onclick="popUp('${c.id }','${c.writer }')">${c.writer }</span></div>
																	<div class="col-12 commentWriteDate" style="font-size:12px; color:gray;">${c.formedDate}</div>
																</div>
															</div>
															<div class="col-5 pt-2 text-right commentBtns">
																<c:if test="${c.id==sessionScope.loginInfo.id }">
																	<a class="btn btn-info coModifyBtn" style="color:white;"
																		onclick="coModFunction(${c.queSeq}, ${c.repSeq}, ${c.seq});return false;"
																		role="button">수정</a>
																	<a class="btn btn-danger coDeleteBtn" style="color:white;"
																		onclick="coDelFunction(${c.queSeq}, ${c.repSeq}, ${c.seq});return false;"
																		role="button">삭제</a>
																</c:if>
															</div>
														</div>
														<div class="row commentContent">
															<div class="col-12 pt-1 pl-4" style="word-break:break-all; word-break:break-word;">${c.content }</div>
															<input type="hidden" value="${c.modComment }" id="hiddenModCo${c.seq }">
														</div>
													</div>
												</div>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:if>
							</div>

							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10">
									<textarea class="form-control pCoContents${r.seq}"
										placeholder="댓글 내용을 입력해주세요" maxlength="1300" id="pCoContents${r.seq}"></textarea>
								</div>
								<div class="col-3 col-lg-2">
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary"
												id="coWriteBtn${r.seq}">작성</button>
											<button type="button" class="btn btn-secondary" id="coCancel" onclick="coCancle(${r.seq})">취소</button>
										</div>
									</div>
									<div class="row">
										<div class="col-12"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<script>
				$("#pCoContents${r.seq}").focus(function(){
					if("${sessionScope.loginInfo.id}" == ""){
		    			alert("로그인 후 이용가능합니다.")
		    			$("#pCoContents${r.seq}").blur();
		    		}
		       	})
		       	
		       		$("#coWriteBtn${r.seq}").on("click",function(){			       	
			       			if("${sessionScope.loginInfo.memLevel}" == 1){
			    				alert("권한이 없습니다. 관리자에게 문의하세요.");
			    				return false;
			    			}
			    			else{
			    				
			    			
		       				if($("#pCoContents${r.seq}").val()==""){
						           alert("댓글 내용을 입력해주세요.");
						           return false;
						    }
						
							$.ajax({
						           url : "/code/codeCWriteProc.do",
						           type : "post",
						           dataType : "json",
						           data :{
						        	  queSeq : "${qResult.seq}", 
						              repSeq : "${r.seq}",
						              content : $("#pCoContents${r.seq}").val(),
						              writer: "${sessionScope.loginInfo.nickName}"
						           }
						        }).done(function(resp){
						            $("#pCoContents${r.seq}").val("");
						            $(".pPageComments${r.seq}").html("");
						           
						           //call list
					               var loginInfo = "${sessionScope.loginInfo.id}";
					               for(var i=0;i<resp.length;i++){
					                  var html = [];
					                  html.push(
					                        '<div class="row commentDiv commentBox'+resp[i].repSeq+resp[i].seq+' p-0 pb-2 m-2" style="border:1px solid gray; border-top:none; border-left: none; border-right: none;"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
					                        '<div class="col-lg-1 d-none d-lg-block profileBox pl-1 pt-2 pr-0"><img src="'+resp[i].profileImg+'" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
					                        '<div class="col-7 col-lg-6 pt-1"><div class="row commentInfo">',
					                        '<div class="col-12 commentWriter"><span class="hvOrange" style="cursor:pointer;" onclick="popUp(\''+resp[i].id+'\',\''+resp[i].writer+'\')">'+resp[i].writer+'</span></div>',					                        
					                        '<div class="col-12 commentWriteDate" style="font-size:12px; color:gray;">'+resp[i].formedWriteDate+'</div></div></div>',
					                        '<div class="col-5 pt-2 text-right commentBtns">'
					                        );
					                  if(resp[i].id==loginInfo){                     
					                     html.push(
					                           '<a class="btn btn-info coModifyBtn" style="color:white;" onclick="coModFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">수정</a>\n',
					                           '<a class="btn btn-danger coDeleteBtn" style="color:white;" onclick="coDelFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">삭제</a>'
					                           );
					                  }
					                  html.push(
					                        '</div></div>',
					                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4" style="word-break:break-all; word-break:break-word;">'+resp[i].content+'</div></div></div></div>',
					                        '<input type="hidden" value="'+resp[i].modComment+'" id="hiddenModCo'+resp[i].seq+'">'
					                        );
					                  
					                  $(".pPageComments${r.seq}").append(html.join(""));	 			                      
						          }
						        }).fail(function(resp){
									alert("문제가 발생했습니다. 다시 시도해주세요.");
								}) 
			    		}        
				})			
	       				
							//댓글 숨기기
						 	   flag${r.seq} = true;
							   $("#commentBtn${r.seq}").on("click",function(){
								   var b = $(".dSeq${r.seq}");
									if(flag${r.seq} == true){
										b.show();﻿
							            flag${r.seq} = false;
							        }else{
							        	b.hide();
							            flag${r.seq} = true;
							        }; 
							   })	
				</script>
				
			</c:forEach>
	<!-- 답글끝 -->

				<br>
				<hr>

			</div>
		</div>
		<!--       몸통 끝!!!   -->

		<div class=container>
			<div style="text-align: right; margin-top:5px; margin-left:5px" class="btnDIv">
                   <a class="btn btn-dark" href="/code/codeQList.do" role="button">목록</a>
            </div>
                   
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/code/reportQModal.jsp"/>
	<jsp:include page="/WEB-INF/views/code/reportRModal.jsp"/>
	<jsp:include page="/WEB-INF/views/code/reportSuccessModal.jsp"/>
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
	<script>
	
	//댓글 숨기기
// 	   flag = true;
// 	   $("#commentBtn"+seq).on("click",function(){
// 		   var b = $(".dSeq"+seq);
// 			if(flag == true){
// 				b.show();﻿
// 	            flag = false;
// 	        }else{
// 	        	b.hide();
// 	            flag = true;
// 	        }; 
// 	   })			
	
	//작성 글 신고하기
	$("#report").on("click",function(){
			var check = "해당 게시물을 신고하시겠습니까?";
			if(check){
				$.ajax({
					url:"/code/reportDuplCheck.do",
					type:"post",
					data:{
						seq : "${qResult.seq}"
						}
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
				url:"/code/report.do",
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
	
	//답변 글 신고하기
		function reportR(seq,replySeq,writer,id){
			var check = "해당 게시물을 신고하시겠습니까?";
			if(check){
				$.ajax({
					url:"/code/reportDuplCheckR.do",
					type:"post",
					data:{
						seq : seq,
						replySeq : replySeq
						}
				}).done(function(resp){
					if(resp == 'dupl'){
						alert("해당 게시물을 이미 신고하셨습니다.");
					}else if(resp == 'possible'){
						$("#titleR").val("[답변]"+writer+"("+id+")님의 답변");
						$("#replySeq").val(replySeq);
						$('#reportRModal').modal('show');						
					}
				}).fail(function(resp){
					alert("문제가 발생했습니다. 다시 시도해주세요.");
				});
				return false;
			}
		}
		
// 		$("#reportR${r.seq}").on("click",function(){
// 				var check = "해당 게시물을 신고하시겠습니까?";
// 				if(check){
// 					$.ajax({
// 						url:"/code/reportDuplCheckR.do",
// 						type:"post",
// 						data:{
// 							seq : "${r.seq}"
// 							}
// 					}).done(function(resp){
// 						if(resp == 'dupl'){
// 							alert("해당 게시물을 이미 신고하셨습니다.");
// 						}else if(resp == 'possible'){
// 							console.log("[답변]${r.writer}(${r.id})님의 답변");
// 							$("#titleR").val("[답변]${r.writer}(${r.id})님의 답변");
// 							$('#reportRModal').modal('show');						
// 						}
// 					}).fail(function(resp){
// 						console.log("실패");
// 						console.log(resp);
// 					});
// 					return false;
// 				}
// 			});
	
			$("#reportRFrm").on("submit",function(){
				$("#reportReasonInputR").val($.trim($("#reportReasonInputR").val()));
				if($("#reportReasonInputR").val()==""){
					alert("신고사유를 작성해주세요.");
					return false;
				}
				$.ajax({
					url:"/code/reportR.do",
					type:"post",				
					data:$("#reportRFrm").serialize()
				}).done(function(resp){
					$("#reportReasonInputR").val("");
					$('#reportRModal').modal('hide');
					$("#rSuccessModal").modal('show');				
				}).fail(function(resp){
					alert("문제가 발생했습니다. 다시 시도해주세요.");
				});
				return false;
			});
			
			$("#reportCancelBtnR").on("click",function(){
				$("#reportReasonInputR").val("");
			});
		
		
	// 카톡 공유하기
	$("#sharing").on("click",function(){
		location.href="${pageContext.request.contextPath}/code/sharing.do";
	})
	
	//스크랩
	$("#scrap").on("click",function(){
		var result = confirm("스크랩하시겠습니까?");
		if(result){
			//이미 했는지 검사
			$.ajax({
				url:"${pageContext.request.contextPath}/code/scrap.do",
				type:"post",
				data:{
					category : "codeQuestion",
					categorySeq : "${qResult.seq}"
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
			});
		}
	})
	
		// 채택
		function adopt(replyId){
		var cf = confirm("채택하시겠습니까?");
			if(cf){		
				location.href="${pageContext.request.contextPath}/code/adopt.do?adoptPoint="+${qResult.point}+"&queSeq="+${qResult.seq}+"&writerId="+'${qResult.id}'+"&replyId="+replyId;
			}	
		}	
	
		$("#modify").on("click",function(){
			if("${sessionScope.loginInfo.memLevel}" == 1){
				alert("권한이 없습니다. 관리자에게 문의하세요.");
				return false;
			}
			else{
				location.href="${pageContext.request.contextPath}/code/modify.do?seq=${qResult.seq}"; 
			}	
		})
		
// 			$.ajax({
// 		        url : "/code/memLevel.do",
// 		        type : "post",
// 		        dataType : "json",
// 		        data : {
// 		           id : "${sessionScope.loginInfo.id}"	           
// 		        }
// 		     }).done(function(resp){
// 		        if(resp > 1){
// 		        	location.href="${pageContext.request.contextPath}/code/modify.do?seq=${qResult.seq}";  
// 		        }else{
// 		           alert("권한이 없습니다. 관리자에게 문의하세요.")
// 		           return false;
// 		        }    
// 		     }).fail(function(resp){
// 		        console.log("실패");
// 		     })		
		
		$("#delete").on("click",function(){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/delete.do?seq=${qResult.seq}&point=${qResult.point}";
			}
		})
	
		function modifyRe(seq,queSeq){
			if("${sessionScope.loginInfo.memLevel}" == 1){
				alert("권한이 없습니다. 관리자에게 문의하세요.");
				return false;
			}
			else{
				location.href="${pageContext.request.contextPath}/code/modifyR.do?seq="+seq+"&queSeq="+queSeq;
			}				
        }
		
		 function deleteRe(seq,queSeq){
	         var cf = confirm("삭제하시겠습니까?");
	         if(cf){
	            location.href="${pageContext.request.contextPath}/code/deleteR.do?seq="+seq+"&queSeq="+queSeq;
	         }
	       }
      
      //닉네임 눌렀을때 새창 띄우기
      function popUp(id,writer){
         if(writer == null){
            alert("탈퇴한 회원입니다.");
            return false;
         }
         else{
            window.open("/Portfolio/toPlog.do?owner="+id+"&other=Y", "pLogPopUp", "width=600,height=600");
         }
        }


    	
	//답글-댓글 삭제
		function coDelFunction(queSeq, repSeq, seq){
			 var check = confirm("정말 삭제하시겠습니까?");
             if(check){
                $.ajax({
                   url : "/code/codeCDeleteProc.do",
                   type : "post",
                   dataType : "json",
                   data :{
                      queSeq : queSeq,
                      repSeq : repSeq,
                      seq:seq
                   }
                }).done(function(resp){
               $(".pPageComments"+repSeq).html("");
               
             //call list

	               var loginInfo = "${sessionScope.loginInfo.id}";
	               for(var i=0;i<resp.length;i++){
	                  var html = [];
	                  html.push(
	                		    '<div class="row commentDiv commentBox'+resp[i].repSeq+resp[i].seq+' p-0 pb-2 m-2" style="border:1px solid gray; border-top:none; border-left: none; border-right: none;"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
		                        '<div class="col-lg-1 d-none d-lg-block profileBox pl-1 pt-2 pr-0"><img src="'+resp[i].profileImg+'" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
		                        '<div class="col-7 col-lg-6 pt-1"><div class="row commentInfo">',
		                        '<div class="col-12 commentWriter"><span class="hvOrange" style="cursor:pointer;" onclick="popUp(\''+resp[i].id+'\',\''+resp[i].writer+'\')">'+resp[i].writer+'</span></div>',
		                        '<div class="col-12 commentWriteDate" style="font-size:12px; color:gray;">'+resp[i].formedWriteDate+'</div></div></div>',
		                        '<div class="col-5 pt-2 text-right commentBtns">'
	                        );
	                  if(resp[i].id==loginInfo){
	                     
	                     html.push(
	                           '<a class="btn btn-info coModifyBtn" style="color:white;" onclick="coModFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">수정</a>\n',
	                           '<a class="btn btn-danger coDeleteBtn" style="color:white;" onclick="coDelFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">삭제</a>'
	                           );
	                  }
	                  
	                  html.push(
	                        '</div></div>',
	                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4" style="word-break:break-all; word-break:break-word;">'+resp[i].content+'</div></div></div></div>',
	                        '<input type="hidden" value="'+resp[i].modComment+'" id="hiddenModCo'+resp[i].seq+'">'
	                        );
	                  $(".pPageComments"+repSeq).append(html.join(""));   
		        }
		        }).fail(function(resp){
		        	alert("문제가 발생했습니다. 다시 시도해주세요.");
		        })
            }
		}
	
	//답글-댓글 수정
		function coModFunction(queSeq,repSeq,seq){	
			if("${sessionScope.loginInfo.memLevel}" == 1){
				alert("권한이 없습니다. 관리자에게 문의하세요.");
				return false;
			}
			else{

			if($("#pCoModContents").length>0){
				alert("현재 열려있는 댓글 수정창이 있습니다.");
				return false;
			}
			var checkContents = $("#hiddenModCo"+seq).val().replace(/modF'Fdom/gi,'"');
			$(".commentBox"+repSeq+seq).find(".commentBtns").css("display","none");
			$(".commentBox"+repSeq+seq).find(".commentContent").css("display","none");
       		$(".commentBox"+repSeq+seq).wrap('<form action="/code/codeCModifyProc.do" method="post" id="coModFrm"></form>');
			var html = [];
			html.push(
					'<div class="col-12 coModBox mt-2 mb-2"><div class="row">',
					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" maxlength="1300" id="pCoModContents" style="height:80px;" name="content">'+checkContents+'</textarea></div>',
					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="repSeq" value="'+repSeq+'"><input type="hidden" name="queSeq" value="'+queSeq+'">',
					'<div class="row">',
					'<div class="col-12 text-center p-0">',
					'<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
					'</div></div>',
					'<div class="row"><div class="col-12 text-center p-0">',
					'<button type="button" class="btn btn-warning" style="width:80%;" id="coMoConfirmBtn">수정</button>',
					'</div></div></div></div></div>'
			);
			$(".commentBox"+repSeq+seq).append(html.join(""));  			
		}
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
       				
       	$(document).on("click","#coMoConfirmBtn",function(){
			$("#pCoModContents").val($.trim($("#pCoModContents").val()));			
				if($("#pCoModContents").val()==""){
					alert("댓글 내용을 입력해주세요.");
					return false;
				}
				
				$.ajax({
					url : "/code/codeCModifyProc.do",
					type : "post",
					dataType : "json",
					data : $("#coModFrm").serialize()
				}).done(function(resp){
		               $(".pPageComments"+resp[0].repSeq).html("");               
		               //call list
		  	               var loginInfo = "${sessionScope.loginInfo.id}";
		  	               for(var i=0;i<resp.length;i++){   	  
		  	                  var html = [];
		  	                  html.push(
		  	                		'<div class="row commentDiv commentBox'+resp[i].repSeq+resp[i].seq+' p-0 pb-2 m-2" style="border:1px solid gray; border-top:none; border-left: none; border-right: none;"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
			                        '<div class="col-lg-1 d-none d-lg-block profileBox pl-1 pt-2 pr-0"><img src="'+resp[i].profileImg+'" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
			                        '<div class="col-7 col-lg-6 pt-1"><div class="row commentInfo">',
			                        '<div class="col-12 commentWriter"><span class="hvOrange" style="cursor:pointer;" onclick="popUp(\''+resp[i].id+'\',\''+resp[i].writer+'\')">'+resp[i].writer+'</span></div>',
			                        '<div class="col-12 commentWriteDate" style="font-size:12px; color:gray;">'+resp[i].formedWriteDate+'</div></div></div>',
			                        '<div class="col-5 pt-2 text-right commentBtns">'
		  	                        );
		  	                  if(resp[i].id==loginInfo){
		  	                     
		  	                     html.push(
		  	                           '<a class="btn btn-info coModifyBtn" style="color:white;" onclick="coModFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">수정</a>\n',
		  	                           '<a class="btn btn-danger coDeleteBtn" style="color:white;" onclick="coDelFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">삭제</a>'
		  	                           );
		  	                  }
		  	                  
		  	                  html.push(
		  	                        '</div></div>',
		  	                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4" style="word-break:break-all; word-break:break-word;">'+resp[i].content+'</div></div></div></div>',
		  	                        '<input type="hidden" value="'+resp[i].modComment+'" id="hiddenModCo'+resp[i].seq+'">'   
		  	                  	);
		  	                  $(".pPageComments"+resp[0].repSeq).append(html.join(""));   
		  		        }
				}).fail(function(resp){
					alert("문제가 발생했습니다. 다시 시도해주세요.");
				})
	      });       	
	
       	function coCancle(seq){
       		var check = confirm("정말 취소하시겠습니까?");
			if(check){
				$("#pCoContents"+seq).val("");
			}
       	}
       	
		
		//닉네임 눌렀을때 새창 띄우기
		function popUp(id,writer){
			if(writer == null){
				alert("탈퇴한 회원입니다.");
				return false;
			}
			else{
				window.open("/Portfolio/toPlog.do?owner="+id+"&other=Y", "pLogPopUp", "width=600,height=600");
			}
	      
	     }

	</script>
</body>
</html>