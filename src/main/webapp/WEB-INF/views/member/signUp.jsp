<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>
	.arrow{
		width:12px;
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
            <form action="${pageContext.request.contextPath}/member/signUpProc" method="post" id=frm>
            <div class="container eleCon">
            
            <div class="row">
            	<div class="col-12">
            		<h4><br></h4>
            		<h3><img src="/icon/whiteArrow.svg">회원가입</h3>
           		</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>아이디</h5>
            		&emsp;<input type=text name=id id=id placeholder="아이디 입력">
            		<img id=idCheck style="display:none;">
            		<div id=idMsg></div>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>이름</h5>
            		&emsp;<input type=text name=name id=name placeholder="이름 입력">
            		<img id=nameCheck style="display:none;">
            		<div id=nameMsg></div>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class="col-12 col-sm-6">
            	<h5><img src="/icon/arrow.svg" class=arrow>비밀번호</h5>
            		&emsp;<input type=text name=pw id=pw placeholder="비밀번호 입력">
            	</div>
            	<div class="col-12 col-sm-6">
            	<h5><img src="/icon/arrow.svg" class=arrow>비밀번호 확인</h5>
            		&emsp;<input type=text name=pwRe id=pwRe placeholder="비밀번호 재입력">
            		<img id=pwCheck style="display:none;">
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<input type=radio name=empCheck value=unemployee class=emp><h5 style="display:inline">비실무자</h5>
            	</div>
            	<div class=col-12>
            		<br>
            		<input type=radio name=empCheck value=employee class=emp><h5 style="display:inline">실무자</h5>
            		<hr>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div id=empEle style="display:none;">
            	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow>회사 메일</h5>
		            	<p style="display:inline;">- 일반 메일일 경우  비실무자로 가입됩니다.</p>
		            		&emsp;<br>&emsp;<input type=text name=empEmail id=empEmail placeholder="메일 주소 입력">
		            		<img id=empEmailCheck style="display:none;">
		            		<button type=button id=sendMail1>인증 메일 발송</button>
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow>인증 코드</h5>
		            	<p style="display:inline;">-메일로 전송된 코드를 입력해주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=empCode id=empCode placeholder="인증 코드 입력">
		            		<button type=button id = "certification1">인증</button>
	            	</div>
           		 </div>
            </div>
            <div id=unempEle style="display:none">
             	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5><img src="/icon/doubleArrow.svg" class=arrow>개인 메일</h5>
		            		&emsp;<input type=text name=unempEmail id=unempEmail placeholder="메일 주소 입력">
		            		<img id=unempEmailCheck style="display:none;">
		            		<button type=button id=sendMail2>인증 메일 발송</button>
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow>인증 코드</h5>
		            	<p style="display:inline;">-메일로 전송된 코드를 입력해주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=unempCode id=unempCode placeholder="인증 코드 입력">
		            		<button type=button id = "certification2">인증</button>
	            	</div>
           		 </div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/doubleArrow.svg" class=arrow>개인정보 공개여부</h5>
            		&emsp;Programming Log(포트폴리오, Ko-How, 프로젝트 참여현황)를 타인이 열람하는 것에 동의합니다.<br>
            		&emsp;비동의 하실경우 Programmming Log에서 프로필 정보만 공개됩니다.<br>
            		&emsp;동의합니다.<input type="checkbox" name="ifmOpenCheck" id="ifmOpenCheck" value="true">
            	</div>
            </div>
              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>닉네임</h5>
            		&emsp;<input type=text name=nickName id=nickName placeholder="닉네임 입력">
            		<img id=nickCheck style="display:none;">
            		<div id=nickMsg></div>
            	</div>
            </div>
              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>주소</h5>
            		&emsp;<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
            		<input type="button" onclick="sample4_execDaumPostcode()" value="찾기"><br>
            		&emsp;<input type="text" id="addr1" name=addr1 placeholder="도로명주소">
            		<input type=text name=addr2 id=addr2 placeholder="상세주소">
            	</div>
            </div>  <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>연락처</h5>
            		&emsp;<input type=text name=phone id=phone placeholder="연락처 입력">
            		<img id=phoneCheck style="display:none;">
            		<div id=phoneMsg></div>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>가입 경로</h5>
            		&emsp;<input type=radio name=joinPath value="jp1">지인 추천<br>
            		&emsp;<input type=radio name=joinPath value="jp2">'Hello World!' 검색<br>
            		&emsp;<input type=radio name=joinPath value="jp3">'프로젝트 모집' 검색<br>
            		&emsp;<input type=radio name=joinPath value="jp4">기타
            		<input type="text" placeholder="사유를 입력해주세요" id=otherJoinPath name=otherJoinPath readonly><br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>성별</h5>
            		&emsp;<input type=radio name="gender" value="men">여성<br>
            		&emsp;<input type=radio name="gender" value="women">남성
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h1><br></h1>
            	</div>
            </div>
            <div class=row>
            	<div class="col-12 text-center">
            		<button type = button id=send>가입하기</button>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h1><br></h1>
            	</div>
            </div>
            
            </div>
            </form>
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
        var idTest = 0;
        var pwTest = 0;
        var emailTest = 0;
        var nickTest = 0;
        var phoneTest = 0;
        var jpTest = 0;
        var genderTest = 0;
        var nameTest = 0;
        
        
        //실무자 비실무자 체크
	        $("input:radio[name=empCheck]").click(function(){
	            if($("input:radio[name=empCheck]:checked").val()=='employee'){
	                $("#empEle").css("display","block");
	                $("#unempEle").css("display","none");
	            }else if($("input:radio[name=empCheck]:checked").val()=='unemployee'){
	            	$("#unempEle").css("display","block");
		            $("#empEle").css("display","none");
	            }
	        });
        
        //우편번호 api
         function sample4_execDaumPostcode() {
        		new daum.Postcode({
            		oncomplete: function(data) {
                		var roadAddr = data.roadAddress;
                		document.getElementById('postcode').value = data.zonecode;
                		document.getElementById("addr1").value = roadAddr;
            		}
        		}).open();
    		}
        
        //유효성 검사
        	//아이디
        	 //1. ID는 영어소문자,숫자만 가능해야함(4~12자리,소문자로 시작해야함)
                $("#id").on("focusout",function(){
                    var regex = /^[a-z][a-z0-9]{6,11}$/g;
                    var data =$("#id").val();
                    var result = regex.exec(data);

                    if(result == null){
                        $("#idMsg").html("&emsp;아이디는 소문자로 시작해야하며 숫자,소문자를 이용해  7-14자로 입력하십시오.");
                    }else{
                    	 $("#idMsg").html("");
                    	$.ajax({
                    		url : "${pageContext.request.contextPath}/member/duplCheck",
							type : "post",
							data : {id : $("#id").val()},
							dataType : "json"
								}).done(function(data){
									if (data.result == "true") {
										$("#idCheck").css("display","inline");
										$("#idCheck").attr("src","/icon/x.svg");
									}else{
										$("#idCheck").css("display","inline");
										$("#idCheck").attr("src","/icon/check.svg");
										idTest = 1;
									}
								})
                    }
                })
                $("#id").on("input",function(){
                	$("#idCheck").css("display","none");
                })
        
               //비밀번호 
                $("#pw").on("focusout",function(){
                    var pw =$("#pw").val();
                    var pwRe =$("#pwRe").val();

                    if((pw != "")||(pwRe != "")){
                    	 if(pw == pwRe){
                         	$("#pwCheck").css("display","inline");
     						$("#pwCheck").attr("src","/icon/check.svg");
     						pwTest = 1;
                         }else{
                         	$("#pwCheck").css("display","inline");
     						$("#pwCheck").attr("src","/icon/x.svg");
                         }
                	}
                }) 
                $("#pwRe").on("focusout",function(){
                    var pw =$("#pw").val();
                    var pwRe =$("#pwRe").val();

					if((pw != "")||(pwRe != "")){
						 if(pw == pwRe){
		                    	$("#pwCheck").css("display","inline");
								$("#pwCheck").attr("src","/icon/check.svg");
								pwTest = 1;
		                    }else{
		                    	$("#pwCheck").css("display","inline");
								$("#pwCheck").attr("src","/icon/x.svg");
		                    }
                	}
                }) 
                
        	//이메일 유효성 검사
        	 $("input:radio[name=empCheck]").click(function(){
	            if($("input:radio[name=empCheck]:checked").val()=='employee'){
	            	$("#unempEmail").val("");
	            	 $("#unempEmailCheck").css("display","none");
	               //실무자 체크했을때
	            	 $("#empEmail").on("focusout",function(){
	                     var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/gm;
	                     var data = $("#empEmail").val();
	                     var result = regex.exec(data);

	                     if(result == null){
	                    	 $("#empEmailCheck").css("display","inline");
	 						 $("#empEmailCheck").attr("src","/icon/x.svg");
	                     }else{
	                    	 $("#empEmailCheck").css("display","none");
	                     }
	                 })

	            }else if($("input:radio[name=empCheck]:checked").val()=='unemployee'){
	            	$("#empEmail").val("");
	            	 $("#empEmailCheck").css("display","none");
	            	//비실무자 체크했을때
	            	 $("#unempEmail").on("focusout",function(){
	                     var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/gm;
	                     var data = $("#unempEmail").val();
	                     var result = regex.exec(data);

	                     if(result == null){
	                    	 $("#unempEmailCheck").css("display","inline");
	 						 $("#unempEmailCheck").attr("src","/icon/x.svg");
	                     }else{
	                    	 $("#unempEmailCheck").css("display","none");
	                     }
	                 })
	            }
	        });
        
            //닉네임 중복검사
           		  $("#nickName").on("focusout",function(){
                   var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/gm;
                   var data =$("#nickName").val();
                   var result = regex.exec(data);

                    if(result == null){
                        $("#nickMsg").html("&emsp;닉네임은 한글,영문자를 조합하여 2-10자로 입력해 주세요.");
                    }else{
                    	$("#nickMsg").html("");
                    	$.ajax({
                    		url : "${pageContext.request.contextPath}/member/nickDuplCheck",
							type : "post",
							data : {nickName : $("#nickName").val()},
							dataType : "json"
								}).done(function(data){
									if (data.result == "true") {
										$("#nickCheck").css("display","inline");
										$("#nickCheck").attr("src","/icon/x.svg");
									}else{
										$("#nickCheck").css("display","inline");
										$("#nickCheck").attr("src","/icon/check.svg");
										nickTest = 1;
									}
								})
                    }
                })
                $("#nickName").on("input",function(){
                	$("#nickCheck").css("display","none");
                })
                
            //이름
             $("#name").on("focusout",function(){
                   var regex = /^[ㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/gm;
                   var data =$("#name").val();
                   var result = regex.exec(data);

                    if(result == null){
                    	$("#nameCheck").css("display","inline");
						$("#nameCheck").attr("src","/icon/x.svg");
                    }else{
						$("#nameCheck").css("display","inline");
						$("#nameCheck").attr("src","/icon/check.svg");
						nameTest = 1;
                    }
                })
                $("#nameName").on("input",function(){
                	$("#nameCheck").css("display","none");
                })
                
            //휴대폰 번호 중복,유효성 검사
            	$("#phone").on("focusout",function(){
                   var regex = /^\d{10,11}$/gm;
                   var data =$("#phone").val();
                   var result = regex.exec(data);

                    if(result == null){
                        $("#phoneMsg").html("&emsp;올바른 휴대폰번호 형식이 아닙니다.");
                    }else{
                    	$("#phoneMsg").html("");
                    	$.ajax({
                    		url : "${pageContext.request.contextPath}/member/phoneDuplCheck",
							type : "post",
							data : {phone : $("#phone").val()},
							dataType : "json"
								}).done(function(data){
									if (data.result == "true") {
										$("#phoneCheck").css("display","inline");
										$("#phoneCheck").attr("src","/icon/x.svg");
									}else{
										$("#phoneCheck").css("display","inline");
										$("#phoneCheck").attr("src","/icon/check.svg");
										phoneTest = 1;
									}
								})
                    }
                })
                $("#phone").on("input",function(){
                	$("#phoneCheck").css("display","none");
                })
                
            //가입경로 체크
           	  $("input:radio[name=joinPath]").click(function(){
	            if($("input:radio[name=joinPath]:checked").val()=='jp4'){
	            	jpTest = 0;
	            	var Ele1 = document.getElementById('otherJoinPath') ;
	            	Ele1.readOnly = false;
	            }else{
	            	var Ele1 = document.getElementById('otherJoinPath') ;
	            	Ele1.readOnly = true;
	            	$("#otherJoinPath").val("");
	            	jpTest = 1;
	            }
	        });
            
            $("#otherJoinPath").on("focusout",function(){
            	 if($("#otherJoinPath").val() != ""){
            		 jpTest = 1;
            	 }else{
            		 jpTest = 0;
            	 }
            });
            
            
            
            //성별체크
              $("input:radio[name=gender]").click(function(){
	           genderTest = 1;
	        	});
            
            //이메일 인증코드 - 실무자
            $("#sendMail1").on("click",function(){
            		$.ajax({
            			url:"${pageContext.request.contextPath}/member/mailSending",
            			type:"post",
            			data:{
            				email : $("#empEmail").val()
            			}
            		}).done(function(data){
            			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.");
            		});
            	})
            $("#certification1").on("click",function(){
            		$.ajax({
            			url:"${pageContext.request.contextPath}/member/ctfCodeProc",
            			type:"post",
            			data:{
            				email : $("#empEmail").val(),
            				code : $("#empCode").val()
            			}
            		}).done(function(data){
            			console.log(data);
            			if(data == "true"){
            				alert("인증에 성공하셨습니다. 계속 진행하여 주십시오.");
                			emailTest = 1;
            			}else{
            				alert("인증에 실패하였습니다. 코드를 다시 확인해주시기 바랍니다.");
            			}
            		});
            	})
            	
            //이메일 인증코드 - 비실무자
            $("#sendMail2").on("click",function(){
            		$.ajax({
            			url:"${pageContext.request.contextPath}/member/mailSending",
            			type:"post",
            			data:{
            				email : $("#unempEmail").val()
            			}
            		}).done(function(data){
            			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.");
            		});
            	})
            	$("#certification2").on("click",function(){
            		$.ajax({
            			url:"${pageContext.request.contextPath}/member/ctfCodeProc",
            			type:"post",
            			data:{
            				email : $("#unempEmail").val(),
            				code : $("#unempCode").val()
            			}
            		}).done(function(data){
            			console.log(data);
            			if(data == "true"){
            				alert("인증에 성공하셨습니다. 계속 진행하여 주십시오.");
                			emailTest = 1;
            			}else{
            				alert("인증에 실패하였습니다. 코드를 다시 확인해주시기 바랍니다.");
            			}
            		});
            	})
            
            //가입버튼 누르기전 마지막 체크
            	$("#send").on("click",function(){
            		if((idTest*pwTest*nickTest*phoneTest*jpTest*genderTest*nameTest) != 1){
                    	alert("조건에 만족하지 않는 문항이 있습니다. 확인부탁드립니다.")
                    }else{
                    	var result = confirm("이대로 회원가입하시겠습니까?");
                    	if(result){
                    		$("#frm").submit();
                    	}
                    }
            	})
            	
            
        </script>
</body>
</html>
