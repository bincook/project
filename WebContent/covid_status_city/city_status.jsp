<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>city_status.jsp</title>
    
<style>
* {
	padding: 0;
	margin: 0;
	list-style: none;
}

body {
	margin: 0;
	background: #eeeeee;
}

table {
	margin: auto;
	border-collapse: collapse;
}

table caption {
	font-size: 32px;
	font-weight: bold;
	padding-bottom: 20px;
}

table .container {
	display: flex;
	align-items: center;
}

table .container .cityName {
	width: 120px;
	height: 60px;
	border-radius: 4px;
	border: none;
	background: yellow;
	margin: 2px 2px 2px 2px;
	font-size: 18px;
	font-weight: bold;
	line-height: 60px;
	text-align: center;
}

table select {
	width: 120px;
	height: 36px;
	text-align: center;
}

table #year_font,
table #month_font {
	font-size: 20px;
}
table .city_info {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid;
}

table .info td{
	height: 40px;
	line-height: 40px;
	text-align: center;
	border-bottom: 1px solid;
	border-right: 1px solid;
}

table .info td:last-child {
	border-right: none;
}

table .data_index {
	border-bottom: 1px solid;
	height: 29px;
	line-height: 29px;
}

table .data td {
	height: 22px;
	line-height: 22px;
	border
}

table .data td[width="25%"] {
	text-align: center;
}

table .data td[width="50%"] {
	text-align: right;
}
</style>
</head>
<body>
<table width="620px" align="center">

  <caption> 코로나 데이터를 확인할 도시를 선택하세요</caption>

  <tr>
    <td colspan="4">
      <div class="container">
        <div class="cityName">서울</div>
        <div class="cityName">부산</div>
        <div class="cityName">대구</div>
        <div class="cityName">인천</div>
        <div class="cityName">광주</div>
        <div class="cityName">대전</div>
      </div>
      
      <div class="container">
        <div class="cityName">울산</div>
        <div class="cityName">세종</div>
        <div class="cityName">경기</div>
        <div class="cityName">강원</div>
        <div class="cityName">충북</div>
        <div class="cityName">충남</div>
      </div>
      
      <div class="container">
        <div class="cityName">전북</div>
        <div class="cityName">전남</div>
        <div class="cityName">경북</div>
        <div class="cityName">경남</div>
        <div class="cityName">제주</div>
        <div class="cityName">비고</div>
      </div>
    </td>
  </tr>
  
  <tr>
    <td colspan="4"> &nbsp;</td>
  </tr>
  
  <tr>
    <td colspan="4" align="center">
    
      <select name="table_year">
        <option value="2021">2021</option>
        <option value="2020">2020</option>
      </select><span id="year_font">년</span>
      
      <select name="table_month">
<%
	for(int i = 1;i < 13;i++){
%>
        <option value="<%=String.format("%02d",i) %>"><%=i %></option>
<%
	}
%>
      </select><span id="month_font">월</span>
      
    </td>
  </tr>
  
  <tr class="city_info">
    <th width="120px"> 도시명</th>
    <th colspan="3" width="490px"> 정보</th>
  </tr>
  
  <tr class="info"><!-- 도시명을 눌렀을 경우 -->
    <td width="25%">
      <div width="100%">감염자 수</div>
    </td>
    
    <td width="25%">
      <div width="100%">격리해제자 수</div>
    </td>
 
    <td width="25%">
      <div width="100%">사망자 수</div>
    </td>
 
    <td width="25%">
      <div width="100%">감염률</div>
    </td>
  </tr>
  
  <tr>
    <td colspan="4"> &nbsp;</td>
  </tr>
  
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
  
  <tr class="data"><!-- 감염자 수 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span>도시명</span>
    </td>
    <td width="50%" colspan="2">
      <span>수치</span>
    </td>
    <td width="25%">
      <span>한달 데이터</span>
    </td>
  </tr>
  
  <tr class="data"><!-- 격리해제자 수 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span>도시명</span>
    </td>
    <td width="50%" colspan="2">
      <span>수치</span>
    </td>
    <td width="25%">
      <span>한달 데이터</span>
    </td>
  </tr>
  
  <tr class="data"><!-- 사망자 수 눌렀을 경우-->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span>도시명</span>
    </td>
    <td width="50%" colspan="2">
      <span>수치</span>
    </td>
    <td width="25%">
      <span>한달 데이터</span>
    </td>
  </tr>
  
  <tr class="data"><!-- 감염률 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span>도시명</span>
    </td>
    <td width="50%" colspan="2">
      <span>수치</span>
    </td>
    <td width="25%">
      <span>한달 데이터</span>
    </td>
  </tr>
  
</table>
</body>
</html>