<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">

<script>
   $(function(){
      $("#codeNavi").attr('class','nav-item nav-link active');
   });
</script>

<style>
.division {
	padding: 0px;
	margin: 0px;
}

.sele{
	width:200px;
}
.btn{
	margin:5px;
}

</style>
<script>
$(function(){
	$("#writeForm").on("submit",function(){
		$("#content").val($(".note-editable").html());
	})
})
</script>
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
		<form action="modifyRProc.do" method="post" id="writeForm">
		<input type="hidden" name="seq" value="${dto.seq}">
		<input type="hidden" name="writer" value="${dto.writer}">
		<input type="hidden" name="queSeq" value="${parent_seq}">
			<div class=container>
				<div class=row>
					<div class="col-12 title">
						<h4>${dto.writer}님의 답변입니다.</h4>
					</div>
				</div>

				<div class=row>
					<div class="col-12 content">
						<textarea name="content" id="content" style="display:none" class="summernote">${dto.content}</textarea>
<%-- 						<div id="summernote">${dto.content}</div> --%>
					</div>
				</div>
				
				<br>
				
				<div class=row>
					<div class="col-12 btn" style="text-align:right;">
						<button class="btn btn-primary cursorPointer" type="button" id="modify">수정완료</button>
						<button class="btn btn-danger cursorPointer" type="button" id="cancle">작성취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--       몸통 끝!!!   -->

	<div class=container>
		<div class=row>
			<div class="col-12" id=aroundContent></div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
	
	<script>
		$("#cancle").on("click",function(){
			location.href="${pageContext.request.contextPath}/code/codeDetail.do?seq=${parent_seq}";
		})
		
		$('.summernote').summernote({
			height : 500,
			lang: 'ko-KR'
		})
      
      $("#modify").on("click", function(){
// 		   regex = /^[(<p><br></p>)(<p>(&nbsp; ){1,}</p>)]{0,}$/g;
           var regex = /^[(<p><br></p>)(<p>(&nbsp; )+</p>)]{0,}$/g;

 		   var content = $(".summernote").val();
		   var result = regex.exec(content);

		   if(result!=null){
		      alert("내용을 작성하지 않았습니다. 다시 한번 확인해주세요.");
		      return false;
		   }
		   else{
			   var result = confirm("이대로 수정 하시겠습니까?");
				if (result) {
					$("#writeForm").submit();
				}
		   }
		})
	</script>
</body>
</html>