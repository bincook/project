<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@page import="corona.CoronaDto"%>
<%@page import="corona.CoronaDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin:auto;
	}
	#first {
		width:1000px;
		height:40px;
		background:#696969;
		margin:auto;
		
	}
	#first #title {
		font-size:20px;
		text-align:center;
		color:white;
		padding-top:6px;
	}
	#second {
		width:1000px;
		height:150px;
		background:#696969;
		margin:auto;
		color:white;
		text-align:center;
	}
	#second #main >li {
		list-style-type:none;
		display:inline-block;
		font-size:18px;
		width:210px;
		padding-left:20px;
		padding-top:20px;
		
	}
	#second #main {
		padding-left:0px;
	}

	#second .main .sub {
		padding-left:0px;

	}
	#second .main .sub li{
		list-style-type:none;
		padding-top:10px;
	}
	#second #count {
		font-size:25px;
		font-weight:900;
	}
	
	
	#third {
		width:1000px;
		height:50px;
		margin:auto;
	}
	
	#third >ul >li {
		list-style-type:none;
		display:inline-block;
		padding-top:10px;
		padding-left:40px;
		width:180px;
		
	}
	a{
		text-decoration:none;
		color:blue;
	}
	a:hover{color:red; text-decoration:underline;}
	
</style>
</head>
<body>
<%
	
	String date = request.getParameter("date");
	CoronaDao dao = new CoronaDao();
	CoronaDto dto = dao.top();

%>
	<div id="first">  
		<div id="title">코로나바이러스  감염 현황</div>
	</div>
	<div id="second">
		<ul id="main">
			<li class="main">확진환자
				<ul class="sub">
					<li id="count"><%=String.format("%,d",dto.getInfected_count()) %></li>
					<li><%=String.format("%,d",dto.getInfected_count_cha())%>▲</li>
				</ul>
			</li>
			<li class="main">격리해제
				<ul class="sub">
					<li id="count"><%=String.format("%,d",dto.getRelease_from_quarantine_count()) %></li>
					<li><%=String.format("%,d",dto.getRelease_from_quarantine_count_cha()) %>▲</li>
				</ul>	
			</li>
			<li class="main">사망자
				<ul class="sub">
					<li id="count"><%=String.format("%,d",dto.getDeaths_count()) %></li>
					<li><%=String.format("%,d",dto.getDeaths_count_cha()) %>▲</li>
				</ul>
			</li>
			<li class="main">검사진행
				<ul class="sub">
					<li id="count"><%=String.format("%,d",dto.getExamine_count()) %></li>
					<li><%=String.format("%,d",dto.getExamine_count_cha()) %>▲</li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="third">
		<ul id="main">
			<li><a href="../covid_status/gayo.jsp">개요</a></li>
			<li><a href="../covid_status/domestic_status.jsp">국내현황</a></li>
			<li><a href="../covid_status/city_status.jsp">국내도시별현황</a></li>
			<li><a href="../covid_status/distance.jsp">거리두기단계</a></li>
		</ul>
	</div>
	
</body>
</html>
