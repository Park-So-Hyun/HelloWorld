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

<!-- 데이트피커 -->
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<style>
	.arrow{
		width:12px;
	}
	#startInputDate{
	width:130px;
	}
	* {font-family: "NanumgothicBold";}
	#finalCheckCon{
		font-size: 11px;
		color: gray;
		width: 90%;
		height: 150px;
		overflow: auto;
		position: relative;
		left:14px;
		margin-top: 8px;
		margin-bottom: 8px;
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
            		<h3><img src="/icon/whiteArrow.svg" style="position:relative;bottom:3px;right:4px;">회원가입</h3>
            		<p class=redP>&emsp;&emsp;* 은 필수표기정보입니다.</p> 
           		</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<img src="/icon/arrow.svg" class="arrow" style="position:relative;bottom:3px;right:3px;"><h5 style="display:inline;">아이디</h5><p class=redP style="display:inline">*</p><br>
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
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">이름</h5><p class=redP style="display:inline">*</p><br>
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
            	<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">비밀번호</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=password name=pw id=pw placeholder="비밀번호 입력">
            		<div id=pwMsg></div>
            	</div>
            	<div class="col-12 d-sm-none"></div>
            	<div class="col-12 col-sm-6">
            	<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">비밀번호 확인</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=password name=pwRe id=pwRe placeholder="비밀번호 재입력">
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
            	<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">이메일</h5><p class=redP style="display:inline">*</p><br><br>
            		<input type=radio name=empCheck value=unemployee class=emp><p style="display:inline;font-size:17px;">일반</p>
            	</div>
            	<div class=col-12>
            		<br>
            		<input type=radio name=empCheck value=employee class=emp><p style="display:inline;font-size:17px;">재직자</p>
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
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">회사 메일</h5><div class="d-sm-none"></div><p class="redP" style="display:inline">* 메일을 전송하는데 다소 시간이 걸립니다. 메일 전송 알림창이 뜰 때 까지 기다려 주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=empEmail id=empEmail placeholder="메일 주소 입력">
		            		<button type=button id=sendMail1>인증 메일 발송</button>
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">인증 코드</h5><p class=redP style="display:inline">*</p>
		            	<div class="d-sm-none"></div><p style="display:inline;" class="pl-2 pl-sm-0">-메일로 전송된 코드를 공백없이 입력해주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=empCode id=empCode placeholder="인증 코드 입력">
		            		<button type=button id = "certification1">인증</button>
		            		<img id=empEmailCheck style="display:inline;" src="/icon/x.svg">
	            	</div>
           		 </div>
            </div>
            <div id=unempEle style="display:none">
             	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">개인 메일</h5><div class="d-sm-none"></div><p class=redP style="display:inline">* 메일을 전송하는데 다소 시간이 걸립니다. 메일 전송 알림창이 뜰 때 까지 기다려 주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=unempEmail id=unempEmail placeholder="메일 주소 입력">
		            		<button type=button id=sendMail2>인증 메일 발송</button>
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow  style="position:relative;bottom:3px;right:3px;">인증 코드</h5><p class=redP style="display:inline">*</p>
		            	<div class="d-sm-none"></div><p style="display:inline;" class="pl-2 pl-sm-0">-메일로 전송된 코드를 공백없이 입력해주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=unempCode id=unempCode placeholder="인증 코드 입력">
		            		<button type=button id = "certification2">인증</button>
		            		<img id=unempEmailCheck style="display:inline;" src="/icon/x.svg">
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
            		<h5><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">개인정보 공개여부</h5>
            		&emsp;Programming Log(포트폴리오, 프로젝트 참여현황, 방명록)를 타인이 열람하는 것에 동의합니다.<br>
            		&emsp;비동의 하실경우 Programmming Log에서 프로필 정보만 공개됩니다.<br>
            		&emsp;동의합니다.<input type="checkbox" name="ifmOpenCheck" id="ifmOpenCheck" value="Y">
            		<input type="checkbox" name="ifmOpenCheck" id="ifmOpenCheckNone" value="N" style="display:none">
            	</div>
            </div> 
            
<!--             <div class=row> -->
<!--             	<div class=col-12> -->
<!--             		<br> -->
<!--             	</div> -->
<!--             </div> -->
<!--             <div class=row> -->
<!--             	<div class=col-12> -->
<!--             		<h5><img src="/icon/arrow.svg" class=arrow>프로필 사진</h5> -->
<!--             		<div id=imgCon></div> -->
<!--             		<input type=file id=img> -->
<!--             	</div> -->
<!--             </div> -->

              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">닉네임</h5><p class=redP style="display:inline">*</p><br>
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
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">생년월일</h5><p class=redP style="display:inline">*</p><br>
<!--             		<input type="text" id="startInputDate" class="form-control form-control-sm datePicker" placeholder="생년월일" name="startInputDate"> -->
<!--             		<input type="hidden" id="startDate" name="startDate"> -->
						&emsp;<select id="birthdayYear" name=birthdayYear></select>
						<select id="birthdayMonth" name=birthdayMonth></select>
						<select id="birthdayDay" name=birthdayDay></select>
						<input name="birthday" id="birthday" style="display:none"> 
						<img id=birthCheck src="/icon/x.svg">
            		</div>
            </div>
              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">주소</h5>
            		&emsp;<input type="text" id="postcode" name="postcode" placeholder="우편번호" onclick="sample4_execDaumPostcode()" readonly>
            		<input type="button" onclick="sample4_execDaumPostcode()" value="찾기"><br>
            		&emsp;<input type="text" id="addr1" name=addr1 placeholder="도로명주소" onclick="sample4_execDaumPostcode()" readonly>
            		<input type=text name=addr2 id=addr2 placeholder="상세주소" maxlength="15">
            	</div>
            </div>  <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">휴대전화</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=text name=phone id=phone placeholder="-을 빼고 숫자만 입력">
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
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">가입 경로</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=radio name=joinPath value="jp1">지인 추천<br>
            		&emsp;<input type=radio name=joinPath value="jp2">'Hello World!' 검색<br>
            		&emsp;<input type=radio name=joinPath value="jp3">'프로젝트 모집' 검색<br>
            		&emsp;<input type=radio name=joinPath value="jp4">기타
            		<input type="text" placeholder="15자 이내의 사유를 입력해주세요" id="otherJoinPath" name="otherJoinPath" maxlength="14" readonly>
            		<p class=redP style="display:none" id=jp4Reason>* 기타가입사유를 꼭 입력해주세요.</p>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">성별</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=radio name="gender" value="W">여성<br>
            		&emsp;<input type=radio name="gender" value="M">남성
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h1><br></h1>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">개인정보 수집동의</h5><p class=redP style="display:inline">*</p><br>
            		<div id=finalCheckCon>
            		정보통신망법 규정에 따라 'Hello World!'에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
					<br><br>
					1. 수집하는 개인정보
					이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 'Hello World!' 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 'Hello World!'는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
					<br><br>
					회원가입 시점에 'Hello World!'가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
					- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
					- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
					서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
					'Hello World!' 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
					<br><br>
					서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
					구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
					2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
					'Hello World!'에서 제공하는 위치기반 서비스에 대해서는 'Hello World!' 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
					이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
					<br><br>
					2. 수집한 개인정보의 이용
					'Hello World!' 및 'Hello World!' 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
					<br><br>
					- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
					- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
					- 법령 및 'Hello World!' 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
					- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
					- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
					- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
					- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
					3. 개인정보의 파기
					회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
					단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
					<br><br>
					이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
					부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
					부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다. QR코드 서비스에서 연락처를 등록한 이후 QR코드 삭제 시, 복구 요청 대응을 위해 삭제 시점으로 부터 6개월 보관합니다. 스마트 플레이스 서비스에서 휴대전화번호를 등록한 경우 분쟁 조정 및 고객문의 등을 목적으로 업체 등록/수정 요청시, 또는 등록 이후 업체 삭제 요청 시로부터 최대 1년간 보관 할 수 있습니다.
					<br><br>
					전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 'Hello World!'는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
					- 전자상거래 등에서 소비자 보호에 관한 법률
					계약 또는 청약철회 등에 관한 기록: 5년 보관
					대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
					소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
					- 전자금융거래법
					전자금융에 관한 기록: 5년 보관
					- 통신비밀보호법
					로그인 기록: 3개월
					회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.
					<br><br>
					전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.
					<br><br>
					참고로 'Hello World!'는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.
					<br><br>
            		</div>
            		<div style="position:relative;left:14px;">동의합니다.<input type="checkbox" id="finalCheck" style="position:relative;left:10px;"></div>
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
        var nameTest = 0;
        var pwTest = 0;
        var emailTest = 0;
        var nickTest = 0;
        var birthYearTest = 0;
        var birthMonthTest = 0;
        var birthDayTest = 0;
        var phoneTest = 0;
        var jpTest = 0;
        var genderTest = 0;
        var emailTest2 = 0;
        var emailTestEmp = 0;
        var emailTestUnemp = 0;
        var finalTest = 0;
        
        //프로필 이미지 등록
        
        //인증버튼 클릭전 메일보냈는지 확인
        $("#empEmail").on("focusout",function(){
        	emailTest2 = 0;
        })
         $("#unempEmail").on("focusout",function(){
        	emailTest2 = 0;
        })
        
        //실무자 비실무자 체크
	        $("input:radio[name=empCheck]").click(function(){
	            if($("input:radio[name=empCheck]:checked").val()=='employee'){
	            	emailTestEmp = 0;
	            	emailTestUnemp = 0;
	                $("#empEle").css("display","block");
	                $("#unempEle").css("display","none");
	            }else if($("input:radio[name=empCheck]:checked").val()=='unemployee'){
	            	emailTestEmp = 0;
	            	emailTestUnemp = 0;
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
                        idTest = 0;
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
										idTest = 0;
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
                	var regex = /^[0-8a-zA-Z]{4,12}$/;
                	var data = $("#pw").val();
                	var result = regex.exec(data);
                	
                	if(result == null){
                		 $("#pwMsg").html("&emsp;4~12자의 영문 대/소문자, 숫자만 사용 가능");
                		 $("#pwCheck").css("display","inline");
   						 $("#pwCheck").attr("src","/icon/x.svg");
                         pwTest = 0;
                	}else{
                		 $("#pwMsg").html("");
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
          						pwTest = 0;
                              }
                     	}
                	}
                }) 
                
                $("#pwRe").on("focusout",function(){
                	var regex = /^[0-8a-zA-Z]{4,12}$/;
                    var data = $("#pwRe").val();
                    var result = regex.exec(data);
                    
                    if(result == null){
               		 $("#pwMsg").html("&emsp;4~12자의 영문 대/소문자, 숫자만 사용 가능");
               		 $("#pwCheck").css("display","inline");
					 $("#pwCheck").attr("src","/icon/x.svg");
                     pwTest = 0;
               		}else{
               		 $("#pwMsg").html("");
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
               		}
                }) 
                
        	
        
            //닉네임 중복검사
           		  $("#nickName").on("focusout",function(){
                   var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,7}$/g;
                   var data =$("#nickName").val();
                   var result = regex.exec(data);

                    if(result == null){
                        $("#nickMsg").html("&emsp;닉네임은 한글,영문자,숫자를 조합하여 2-7자로 입력해 주세요.");
                    	nickTest = 0;
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
										nickTest = 0;
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
                   var regex = /^[가-힣]{2,15}$/gm;
                   var data =$("#name").val();
                   var result = regex.exec(data);

                    if(result == null){
                    	$("#nameCheck").css("display","inline");
						$("#nameCheck").attr("src","/icon/x.svg");
						nameTest = 0;
                    }else{
						$("#nameCheck").css("display","inline");
						$("#nameCheck").attr("src","/icon/check.svg");
						nameTest = 1;
                    }
                })
                $("#nameName").on("input",function(){
                	$("#nameCheck").css("display","none");
                	nameTest = 0;
                })
                
            //휴대폰 번호 중복,유효성 검사
            	$("#phone").on("focusout",function(){
                   var regex = /^01\d\d{3,4}\d{4}$/g;
                   var data =$("#phone").val();
                   var result = regex.exec(data);

                    if(result == null){
                        $("#phoneMsg").html("&emsp;올바른 휴대폰번호 형식이 아닙니다.");
                        phoneTest = 0;
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
										 phoneTest = 0;
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
	            	$("#jp4Reason").css("display","inline");
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
 					if(($("input:radio[name=joinPath]:checked").val()=='jp1')||($("input:radio[name=joinPath]:checked").val()=='jp2')||($("input:radio[name=joinPath]:checked").val()=='jp3')){
 					 jpTest = 1;
 					 return false;
            		 }
            		 jpTest = 0;
            	 }
            });
            
            
            //성별체크
              $("input:radio[name=gender]").click(function(){
	           genderTest = 1;
	        	});
            
            //이메일 유효성 검사
         	 $("input:radio[name=empCheck]").click(function(){
 	            if($("input:radio[name=empCheck]:checked").val()=='employee'){
 	            	$("#unempEmail").val("");
					$("#empCode").val("");	
					$("#unempCode").val("");	
 	               //실무자 체크했을때
 	            	 $("#sendMail1").on("click",function(){
 	            		 if(emailTestEmp == 2){
 	            			 alert("이미 메일을 전송하였습니다. 메일 재전송을 원하시면 회원가입 절차를 다시 진행해주십시오.");
 	            			 return false;
 	            		 }else if(emailTestEmp == 1){
 	            			alert("메일 전송 절차가 진행중입니다. 알림창이 뜰때까지 기다려 주십시오.");
 	            			 return false;
 	            		 }
 	                     var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/g;
 	                     var data = $("#empEmail").val();
 	                     var result = regex.exec(data);

 	                     if(result == null){
							//이메일 형식 아닌경우
							alert("올바른 이메일 형식이 아닙니다. 확인부탁드립니다.");
							return false;
 	                     }else{
 	                    	//이메일 형식 맞는 경우
 	                    	
 	                    	//디비에 있는지 먼저 확인
 	                    	$.ajax({
 	 	 	              			url:"${pageContext.request.contextPath}/member/isEmailALready",
 	 	 	              			type:"post",
 	 	 	              			data:{
 	 	 	              				email : $("#empEmail").val()
 	 	 	              			}
 	 	 	              		}).done(function(resp){
 	 	 	              			if(resp == "true"){
 	 	 	              				alert("이미 등록된 이메일입니다.");
 	 	 	              			}else{
	 	 	 	              			var regex = /^\w+@\w+.co.kr$/g;
	 	 	 	                    	var data = $("#empEmail").val();
	 	 	 	 	                    var result = regex.exec(data);
	 	 	 	 	                    
	 	 	 	 	                    
	 	 	 	 	                    //실무자 : 네이버만 임시로 풀기
 	 	 	              				var regexNaver = /^\w+@naver.com$/g;
 	 	 	              				var resultNaver = regexNaver.exec(data);
	 	 	 	 	                    if(resultNaver != null){
	 	 	 	              				emailTestEmp = 1;
		 	 	 	 	                    emailTest2 = 1;
	 	 	 	 	                    	$.ajax({
	 	 	 	 	              			url:"${pageContext.request.contextPath}/member/mailSending",
	 	 	 	 	              			type:"post",
	 	 	 	 	              			data:{
	 	 	 	 	              				email : $("#empEmail").val()
	 	 	 	 	              			}
	 	 	 	 	              			}).done(function(data){
	 	 	 	 	              			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.");
	 	 	 	 	              			emailTestEmp = 2;
 	 	 	 	              			});
	 	 	 	 	                    	return false;
	 	 	 	 	                    }
	 	 	 	 	                    //----------
	 	 	 	 	                    
	 	 	 	 	                    var regex2 = /^\w+@\w+.pe.kr$/g;
	 	 		 	                    var result2 = regex2.exec(data);
	 	 		 	                    
	 	 		 	                    if(result2 != null){
	 	 		 	                    	alert("개인 도메인(예. pe.kr)을 상업적 목적으로 이용하실 경우 일반회원으로 가입후 일대일문의를 통해 재직자 인증부탁드립니다.");
	 	 		 	                    	return false;
	 	 		 	                    }
	 	 		 	                    
	 	 	 	 	                    if(result == null){
	 	 	 	 	                    	alert("영리 단체 도메인(co.kr)이 아닙니다. 일반회원으로 가입부탁드립니다.");
	 	 	 	 	                    }else{
	 	 	 	              				emailTestEmp = 1;
	 	 	 	 	                    	emailTest2 = 1;
	 	 	 	 	                    	$.ajax({
	 	 	 	 	              			url:"${pageContext.request.contextPath}/member/mailSending",
	 	 	 	 	              			type:"post",
	 	 	 	 	              			data:{
	 	 	 	 	              				email : $("#empEmail").val()
	 	 	 	 	              			}
	 	 	 	 	              			}).done(function(data){
	 	 	 	 	              			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.");
	 	 	 	 	              			emailTestEmp = 2;
	 	 	 	 	              			});
	 	 	 	 	                    }
 	 	 	              			}
 	 	 	              		});
 	                    	
 	                    	
 	 	                    
 	                     }
 	                 })

 	            }else if($("input:radio[name=empCheck]:checked").val()=='unemployee'){
 	            	$("#empEmail").val("");
					$("#empCode").val("");	
					$("#unempCode").val("");
 	            	//비실무자 체크했을때
 	            	  $("#sendMail2").on("click",function(){
 	            		 if(emailTestUnemp == 2){
 	            			 alert("이미 메일을 전송하였습니다. 메일 재전송을 원하시면 회원가입 절차를 다시 진행해주십시오.");
 	            			 return false;
 	            		 }else if(emailTestUnemp == 1){
 	            			alert("메일 전송 절차가 진행중입니다. 알림창이 뜰때까지 기다려 주십시오.");
 	            			 return false;
 	            		 }
 	                     var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/g;
 	                     var data = $("#unempEmail").val();
 	                     var result = regex.exec(data);

 	                    if(result == null){
							//이메일 형식 아닌경우
							alert("올바른 이메일 형식이 아닙니다. 확인부탁드립니다.");
							return false;
 	                     }else{
 	                    	//이메일 형식 맞는 경우
 	                    	
 	                    	//디비에 있는지 먼저 확인
 	                    	$.ajax({
 	 	 	              			url:"${pageContext.request.contextPath}/member/isEmailALready",
 	 	 	              			type:"post",
 	 	 	              			data:{
 	 	 	              				email : $("#unempEmail").val()
 	 	 	              			}
 	 	 	              		}).done(function(data){
 	 	 	              			if(data == "true"){
 	 	 	              				alert("이미 등록된 이메일입니다.");
 	 	 	              				return false;
 	 	 	              			}else{
 	 	 	              			var regex = /^\w+@\w+.co.kr$/g;
 	 	 	                    	var data = $("#unempEmail").val();
 	 	 	 	                    var result = regex.exec(data);
 	 	 	 	                    if(result == null){
 	 	 	 	                    	emailTestUnemp = 1;
 	 	 	 	                    	emailTest2 = 1;
 	 	 	 	                    	$.ajax({
 	 	 	 	 	              			url:"${pageContext.request.contextPath}/member/mailSending",
 	 	 	 	 	              			type:"post",
 	 	 	 	 	              			data:{
 	 	 	 	 	              				email : $("#unempEmail").val()
 	 	 	 	 	              			}
 	 	 	 	 	              		}).done(function(data){
 	 	 	 	 	              			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.\n개인 도메인(예시. pe.kr)을 상업적 목적으로 이용하실 경우 일반회원으로 가입후 일대일문의를 통해 재직자 인증부탁드립니다.");
 	 	 	 	 	              			emailTestUnemp = 2;
 	 	 	 	 	              		});
 	 	 	 	                    }else{
 	 	 	 	                    	alert("영리단체 도메인(co.kr)은 재직자로 가입부탁드립니다.");
 	 	 	 	                    	return false;
 	 	 	 	                    }
 	 	 	              			}
 	 	 	              		});	
 	                    	
 	                    	
 	 	                    
 	                     }
 	                 })
 	            }
 	        });
            
            //이메일 인증코드 확인 - 실무자
            $("#certification1").on("click",function(){
            	if(emailTest2 == 0){
            		alert("인증 메일 발송부터 진행하여 주십시오.");
            		emailTest = 0;
            		return false;
            	}else{
            		$.ajax({
            			url:"${pageContext.request.contextPath}/member/ctfCodeProc",
            			type:"post",
            			data:{
            				email : $("#empEmail").val(),
            				code : $("#empCode").val()
            			}
            		}).done(function(data){
            			if(data == "true"){
            				alert("인증에 성공하셨습니다. 계속 진행하여 주십시오.");
            				$("#empEmailCheck").css("display","inline");
							$("#empEmailCheck").attr("src","/icon/check.svg");
                			emailTest = 1;
                			var empEleReal1 = document.getElementById('empEmail');
                			var empEleReal2 = document.getElementById('empCode');
                			empEleReal1.readOnly = true;
                			empEleReal2.readOnly = true;
                			$("input[name='empCheck']").attr('disabled',true);
            			}else{
            				alert("인증에 실패하였습니다. 코드를 다시 확인해주시기 바랍니다.");
            				$("#empEmailCheck").css("display","inline");
							$("#empEmailCheck").attr("src","/icon/x.svg");
            				emailTest = 0;
            				return false;
            			}
            		});
            	}
            	})
            	
            //이메일 인증코드 확인 - 비실무자
            	$("#certification2").on("click",function(){
            		if(emailTest2 == 0){
                		alert("인증 메일 발송부터 진행하여 주십시오.");
                		emailTest = 0;
                		return false;
                	}else{
                		$.ajax({
                			url:"${pageContext.request.contextPath}/member/ctfCodeProc",
                			type:"post",
                			data:{
                				email : $("#unempEmail").val(),
                				code : $("#unempCode").val()
                			}
                		}).done(function(data){
                			if(data == "true"){
                				alert("인증에 성공하셨습니다. 계속 진행하여 주십시오.");
                				$("#unempEmailCheck").css("display","inline");
    							$("#unempEmailCheck").attr("src","/icon/check.svg");
                    			emailTest = 1;
                    			var empEleReal1 = document.getElementById('unempEmail');
                    			var empEleReal2 = document.getElementById('unempCode');
                    			empEleReal1.readOnly = true;
                    			empEleReal2.readOnly = true;
                    			$("input[name='empCheck']").attr('disabled',true);
                			}else{
                				alert("인증에 실패하였습니다. 코드를 다시 확인해주시기 바랍니다.");
                				$("#unempEmailCheck").css("display","inline");
    							$("#unempEmailCheck").attr("src","/icon/x.svg");
                				emailTest = 0;
                				return false;
                			}
                		});
                	}
            	})
            
//             //생년월일
//             $('.datePicker').datepicker({
// 			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
// 			    startDate: '-200y',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
// 			    endDate: '+0y',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
// 			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
// 			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
// 			    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true			    
// 			    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
// 			    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
// 			    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
// 			    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
// 			    templates : {
// 			        leftArrow: '&laquo;',
// 			        rightArrow: '&raquo;'
// 			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
// 			    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
// 			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
// 			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
// 			    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
// 			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.			    
// 			}).on("changeDate", function(e) {
//                 changeDate : true	//사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
// 				birthTest = 1;
// 			});	
            	
            //생년월일 2
            //생년월일 select
			window.onload = function(){

				var toDay = new Date();
				var year  = toDay.getFullYear();
				var month = (toDay.getMonth()+1);
				var day   = toDay.getDate();

				var str = "";
				// 년도 설정
				for (var i=year-90; i<=year-1; i++) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				}
				str += "<option value='N' selected='selected'>년</option>";	
				$("#birthdayYear").html(str);
				
				
				// 월, 일 설정
				str = "";
				for (var i=12; i > 9; i--) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				}
				for (var i=9; i > 0; i--) {
					str += "<option value='0" + i + "' selected='selected'>" + i + "</option>";
				}
				str += "<option value='N' selected='selected'>월</option>";	
				$("#birthdayMonth").html(str);
				
				str = "";
				for (var i=31; i > 9; i--) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				}
				for (var i=9; i > 0; i--) {
					str += "<option value='0" + i + "' selected='selected'>" + i + "</option>";
				}
				str += "<option value='N' selected='selected'>일</option>";	
				$("#birthdayDay").html(str);
			}

			//생년월일 유효성 검사
			$("#birthdayYear").on("change",function(){
				if($("#birthdayYear").val() != "N"){
					birthYearTest = 1;
				}else{
					birthYearTest = 0;
				}
				
				if((birthMonthTest==1)&&(birthDayTest==1)){
					$("#birthCheck").attr("src","/icon/check.svg");
				}
			})
			$("#birthdayMonth").on("change",function(){
				if($("#birthdayMonth").val() != "N"){
					birthMonthTest = 1;
				}else{
					birthMonthTest = 0;
				}
				
				if((birthYearTest==1)&&(birthDayTest==1)){
					$("#birthCheck").attr("src","/icon/check.svg");
				}
			})
			$("#birthdayDay").on("change",function(){
				if($("#birthdayDay").val() != "N"){
					birthDayTest = 1;
				}else{
					birthDayTest = 0;
				}
				
				if((birthMonthTest==1)&&(birthYearTest==1)){
					$("#birthCheck").attr("src","/icon/check.svg");
				}
			})
			
			//파이널 체크
			$("#finalCheck").change(function(){
				if($("#finalCheck").is(":checked")){
					finalTest = 1;
				}else{
					finalTest = 0;
				}
			});
            
            	
            //가입버튼 누르기전 마지막 체크
            	$("#send").on("click",function(){
                
             		if((idTest*pwTest*birthYearTest*birthMonthTest*birthDayTest*nickTest*phoneTest*jpTest*genderTest*nameTest*emailTest*finalTest) != 1){
                     	alert("조건에 만족하지 않는 문항이 있습니다. 확인부탁드립니다.");
                     	return false;
                     	 }else{
                    	var result = confirm("이대로 회원가입하시겠습니까?");
                    	if(result){
                    		//empCheck 다시해주기
                    		if(($("#empEmail").val() == null)||($("#empEmail").val() == "")){
                    			$("input[name='empCheck']").attr('disabled',false);
                    			$('input:radio[name=empCheck]:input[value=unemployee]').attr("checked", true);
                    		}else{
                    			$("input[name='empCheck']").attr('disabled',false);
                    			$('input:radio[name=empCheck]:input[value=employee]').attr("checked", true);
                    		}
                    		//날짜 다시 2009-03-20 10:20:30.0
                    		var date = $("#birthdayYear").val()+"-"+ $("#birthdayMonth").val()+"-"+ $("#birthdayDay").val()+" 00:00:00.0";
                    		$("#birthday").val(date);
                    		if($("#postcode").val()==""||$("#postcode").val()==null){
                    			$("#postcode").val("");
                    		}
							//체크 안돼있으면 ifmOpenCheckNone으로 바꾸기
							var ifmChk = $("#ifmOpenCheck").prop("checked");
							if(ifmChk == false){
								$("#ifmOpenCheckNone").prop("checked", true);
							}
                    		$("#frm").submit();
                    	}
                    }
            	})
            	
        </script>
</body>
</html>
