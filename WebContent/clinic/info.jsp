<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="clinic.ClinicReplyDao"%> 
<%@page import="clinic.ClinicReplyDto"%> 
<%@page import="java.util.List"%>

<%
ClinicReplyDao clinicReplyDao = new ClinicReplyDao();
List<ClinicReplyDto> replies = clinicReplyDao.findall();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
width:1100px;
height:1000px;
margin:auto;
}
.title{
width:400px;
box-shadow:15px 10px 5px 5px #E8D9FF;
color:#3F0099; 
}
.sub_title > h2{
 color:#F361A6
}
.line{
    margin-bottom: 10px;
	padding-top:50px;
	font-size:20px;
	color:gray;
}
.first
{
 	box-shadow: 5px 5px 7px 3px #c3c3c3;
    padding-top: 50px;
    color: #000000;
    border: 1px solid #868686;
    padding: 8px;
    border-radius: 20px;
}
.end{
 padding-top:50px;
 padding-bottom:100px;
 font-size:18px;
 margin:auto;
}
.btn-like {
  color: transparent;
  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
}
.btn-like:hover {
  text-shadow: 0 0 0 #ea0;
}
.btn-like.done {
  color: inherit;
  text-shadow: 0;
}
.btn-like.done:hover {
  color: transparent;
  text-shadow: 0 0 0 #777;
}
.evaluation {
	margin: 0px -0.46875px 0px 0px;
    width: 439px;
    height: 225px;
}
.details {
	padding: 16px;
	color: #868686;
}
.btn {
	background-color: inherit;
    border: 1px solid #868686;
    padding: 8px;
    border-radius: 5px;
}

.p-2 {
	padding: 10px;
	
	
}

li:not(.sub_title) {
	text-align: justify;
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(".btn-like").click(function() {
	$(this).toggleClass("done");
})
</script>
</head>
<body>

<div class="covid_info_container" style="width:100%">

	<div>
		<div>
			<h1 class="title">추석 연휴 생활방역수칙</h1>
		</div>
	 
	 	<div class="line">
	  		<h2 class="sub_title">추석연휴 ‘문 여는 병원·약국’ 120, 119로 미리 알아두세요.</h2>
	  	</div>
	
		<div class="first">
	연휴기간 우리 동네에 문 여는 병·의원, 약국은 인터넷, 전화, 스마트폰 앱을 통해 쉽게 확인할 수 있다.<br>
	119구급상황관리센터, 서울시, 25개 자치구, 중앙응급의료센터 각 홈페이지에서 볼 수 있으며,<br>
	 국번 없이 120(다산콜센터)나 119(구급상황관리센터)로 전화해 안내 받거나, 스마트폰 앱 ‘응급의료정보제공(e-gen)’을 통해서도 알 수 있다.<br>
	안전상비의약품(소화제, 해열진통제, 감기약, 파스 등 4종류 13개 품목)은 편의점 등 안전상비의약품 판매업소 7,252곳(**시홈페이지→안전상비의약품)에서 쉽게 구입할 수 있다.
	 	</div>
	</div>
	
	<div class="line">
		<ul>
	 		<li class="sub_title"><h2>이동할 때 (귀성, 귀경)</h2></li>
	   		<li>출발 전 예방접종 및 진단검사 실시</li>
	   		<li>코로나19 이상증상(발열, 후각·미각 상실, 근육통 등) 있을 시 방문 및 여행 취소 ·연기<br>
	   		※ 38도 이상 고열 지속, 증상 악화 시 콜센터(1399, 지역번호+120)나 보건소 문의하기</li>
	   		<li>다중이용시설 출입 자제</li>
	   		<li>가급적 개인차량 이용 ▸휴게소에 머무르는 시간 최소화</li>
	   		<li>휴게소 실내, 실외에서 다른 사람과 2m이상 거리 두기 어려운 경우 마스크 상시 착용</li>
	   		<li>휴게소에서도 사람 간 간격 2m(최소 1m) 이상 유지</li>
	  	</ul>
	</div>
	
	<div class="line">
	  <ul>
		  	<li class="sub_title"><h2>고향 집에서</h2></li>
		   	<li>접종 완료자 4명 포함하여 8인까지 직계가족 모임 허용(가정 내 모임만 허용)</li>
		   	<li>어르신 등 고위험군을 만나는 경우에는 반드시 마스크 착용, 손 씻기 등 개인방역 철저</li>
		   	<li>집안에서도 가족들의 건강을 위해 마스크 착용 권고<br>
		   	※ 각 지역에서 모인 가족이 밀접하게 지내므로 가족 보호를 위해 마스크 착용 권고</li>
		   	<li>직계가족만 만날 것을 권고</li>
		   	<li>식사 시 개인 접시와 배식 수저 등 사용하여 덜어 먹기</li>
		   	<li>반가움은 악수·포옹보다는 목례로 표현하기 ▸하루에 2번 이상 자주 환기하기</li>
		   	<li>손이 많이 닿는 곳(리모컨, 방문 손잡이, 욕실 등)은 하루에 1번 이상 소독하기</li>
	  	</ul>
	</div>
	
	<div class="end">
	 	<div class="details"> 해당 내용이 도움이 되셨나요? </div>
	<form method="post" action="/clinic/evaluation.jsp">
		<textarea name="evaluation" placeholder="한 줄 평" class="evaluation"></textarea>
	 	
	 	<p class="p-2"></p>
	 	
	 	<button class="btn-like btn">♥</button>
	 	
	 	<input class="btn" type="submit" value="저장">
	</form>
	</div>
	
	
	<div class="replies">
		
		<%
		for (int i=0; i<replies.size(); i++) {
			ClinicReplyDto dto = replies.get(i);
		%>
		<ul>
		 <li><%=dto.getContent() %></li>
		 <li><%=dto.getEmail() %></li>
		 <li><%=dto.getWriteday() %></li>
		</ul>
		<%
		}
		%>
	</div>
</div>




</body>
</html>