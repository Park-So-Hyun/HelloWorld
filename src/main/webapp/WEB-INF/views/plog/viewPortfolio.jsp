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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/mainBase.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
        h1{
            text-align: center;
        }
        .interval{
            margin-top: 10px;
            margin-bottom: 10px;
            background-color:lightgray;
            border-radius: 8px;
            height:10px;
        }
        textarea{
            border :0px;
            width:100%;
            height: 100px;
            resize: none;
        }
        input{
            width:100%;
        }
        #datepicker,#datepicker2{
            width:20%
        }
        .theme{
            line-height: 100px;
        }
        h4{
            text-align: center;
            background-color:lightgray;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #funcname, #funcexpl{
            text-align: center;
            font-size:10px;
            line-height:20px;
        }
        #funcexpl{
            line-height: 150px;
        }
        #funcname1,#funcname2,#funcname3{
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

            <form action="${pageContext.request.contextPath}/Portfolio/update.do" method="post">
	            <div class="container">
		            <h1> 포 트 폴 리 오</h1>
		            <div class="row">
		                <div class="col-3 col-md-2"> 프로젝트명  </div>
		                <div class="col-9 col-md-10"><div name="portfolioTitle"> ${pdto.portfolioTitle } </div> </div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2"> 수행 기간  </div>
		                <div class="col-9 col-md-10"> ${str} ~ ${end } </div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2"> 개발 목표 </div>
		                <div class="col-9 col-md-10"> <div name="purpose">${pdto.purpose } </div> </div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 개발 환경 </div>
		                <div class="col-9 col-md-10"> <textarea name="environment"> ${pdto.environment }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 구현 기능 </div>
		                <div class="col-9 col-md-10"> <textarea name="allFunction">${pdto.allFunction }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme">  DB 설계 </div>
		                <div class="col-9 col-md-10"> <textarea name="dbUnitPlan">${pdto.dbUnitPlan }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 담당 역할 </div>
		                <div class="col-9 col-md-10"> <textarea name="role">${pdto.role }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 참여/기여도 </div>
		                <div class="col-9 col-md-10"> <textarea name="contribution">${pdto.contribution }</textarea></div>               
		            </div>
		            <h4>구현 기능</h4>
		            <div class="row">
		                <div class="col-3"><img src="${pdto.image1}" style="height: 100%;width:100%;max-height: 180px;"><input type="hidden" name ="image1"></div>
		                <div class="col-9">
		                    <div class="row">
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"></div>
		                        <div class="col-10 col-sm-10 col-lg-11" id="funcname1"><div name="function1" style="height:18px margin-bottom:">${pdto.function1 } </div> </div>
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
		                        <div class="col-10 col-sm-10 col-lg-11"><textarea name="explanation1" style="height:150px;">${pdto.explanation1 }</textarea>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3"><img src="lion.png" style="height: 100%;width:100%;max-height: 180px;"><input type="hidden" name ="image2"></div>
		                <div class="col-9">
		                    <div class="row">
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
		                        <div class="col-10 col-sm-10 col-lg-11" id="funcname2"><div name="function2" style="height:18px margin-bottom:">${pdto.function2 } </div></div>
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
		                        <div class="col-10 col-sm-10 col-lg-11"><textarea name="explanation2" style="height:150px;">${pdto.explanation2 }</textarea>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3"><img src="lion.png" style="height: 100%;width:100%;max-height: 180px;"> <input type="hidden" name ="image3"></div>
		                <div class="col-9">
		                    <div class="row">
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
		                        <div class="col-10 col-sm-10 col-lg-11 " id="funcname3"><div name="function3" style="height:18px margin-bottom:">${pdto.function3 } </div> </div>
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
		                        <div class="col-10 col-sm-10 col-lg-11"><textarea name="explanation3" style="height:150px;">${pdto.explanation3 }</textarea>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="interval"></div>
		             <div class="row">
		                <div class="col-3 col-md-2"> 깃 링크  </div>
		                <div class="col-9 col-md-10"><div name="git">${pdto.git }</div></div>               
		            </div>
		            <div class="interval"></div>
		            <div style="text-align: end;"><button type="button" id="return">돌아가기</button><button id="update">수정 완료</button></div>
		            
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
        
        
        <script>
                
                $("#return").on("click",function(){
                	location.href="${pageContext.request.contextPath}/Portfolio/selectList.do";
                })
		</script>	
</body>
</html>
