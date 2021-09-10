<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="covid_status_city.covid_status_cityDao" %>
<%@ page import="covid_status_city.covid_status_cityDto" %>
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

table .table_date,
table .city_info,
table .info,
table .data_index,
table .data {
	/* visibility: hidden; */
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
<script>
function city_Name(){
	/* (숨겨진)년/월 밑에 내용 보이게 하기 */	
	// alert("123"); // 작동함
	// document.getElementsByClassName("table_date").style.visibility="visible"; // 작동안함 이유 모름
	// alert("456");
	/* ok.jsp를 만들어서 sql에서 데이터 읽어오기 */
}

function get_info(n){
	/* (숨겨진) 정보들 보이게 하기 */
	/* 지정된 기간의 데이터 출력하기 */
}

function date_info(){
	/* onmouseover를 이용 해당하는 날짜에 정보가 있다면 div를 통해서 내용 보여주기 */
	/* div는 날짜 위에 바로 보일수 있게 만들기 */
	/* onclick을 이용하여 div 숨기기 */
}
</script>
</head>
<body>

<table width="620px" align="center">

  <caption> 코로나 데이터를 확인할 도시를 선택하세요</caption>

  <tr>
    <td colspan="4">
      <div class="container"><!-- 서울(18)인데 이것을 value 값으로 전달이 가능한가? -->
        <div class="cityName" onclick="city_Name()">서울</div>
        <div class="cityName" onclick="cityName(1)">부산</div>
        <div class="cityName" onclick="cityName(2)">대구</div>
        <div class="cityName" onclick="cityName(3)">인천</div>
        <div class="cityName" onclick="cityName(4)">광주</div>
        <div class="cityName" onclick="cityName(5)">대전</div>
      </div>
      
      <div class="container">
        <div class="cityName" onclick="cityName(6)">울산</div>
        <div class="cityName" onclick="cityName(7)">세종</div>
        <div class="cityName" onclick="cityName(8)">경기</div>
        <div class="cityName" onclick="cityName(9)">강원</div>
        <div class="cityName" onclick="cityName(10)">충북</div>
        <div class="cityName" onclick="cityName(11)">충남</div>
      </div>
      
      <div class="container">
        <div class="cityName" onclick="cityName(12)">전북</div>
        <div class="cityName" onclick="cityName(13)">전남</div>
        <div class="cityName" onclick="cityName(14)">경북</div>
        <div class="cityName" onclick="cityName(15)">경남</div>
        <div class="cityName" onclick="cityName(16)">제주</div>
        <div class="cityName">비고</div>
      </div>
    </td>
  </tr>
<%	
	if(request.getParameter("city_id") != null){
	covid_status_cityDao dao = new covid_status_cityDao();
	covid_status_cityDto dto = dao.city_list(request.getParameter("city_id"));
%>
  <tr>
    <td colspan="4"> &nbsp;</td>
  </tr>
  <!-- 처음에 숨겨져 있다가 위에 도시명 버튼을 클릭시 보이게 함 -->
  <tr class="table_date"><!-- 한달치 데이터만 볼 수 있도록 연도와 월만 체크 가능 db에서 꺼내올때 가져올 수 있는가? -->
    <td colspan="4" align="center">
    
      <select name="table_year"><!-- onchange="city_status.jsp?year=2021" -->
        <option value="2021">2021</option> <!-- 데이터값이 변경되었으면 좋겠음 /선택한 연도로 -->
        <option value="2020">2020</option>
      </select><span id="year_font">년</span>
      
      <select name="table_month"><!-- onchange="city_status.jsp?year=2021&month=08 -->
<%
	for(int i = 1;i < 13;i++){
%>
        <option value="<%=i %>"><%=i %></option>
<%
	}
%>
      </select><span id="month_font">월</span>
      
    </td>
  </tr>
  <!-- 도시명을 눌렀을 경우 보이게 함 -->
  <tr class="city_info">
    <th colspan="4" width="100%"> 정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보</th>
  </tr>
  <!-- 도시명을 눌렀을 경우 보이게 함-->
  <tr class="info">
    <td width="25%"><!-- submit 효과 부여하여 데이터 전송하기 -->
      <div width="100%" onclick="get_info(0)">감염자 수</div>
    </td>
    
    <td width="25%">
      <div width="100%" onclick="get_info(1)">격리해제자 수</div>
    </td>
 
    <td width="25%">
      <div width="100%" onclick="get_info(2)">사망자 수</div>
    </td>
 
    <td width="25%">
      <div width="100%" onclick="get_info(3)">감염률</div>
    </td>
  </tr>
  
  <tr>
    <td colspan="4"> &nbsp;</td>
  </tr>
  
  <!-- 정보란을 누른 이후 보이게 하기 -->
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
  
  <!-- 정보란을 눌렀을 때 보이게 하기 -->
  
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
<%
	}
%>
</table>
</body>
</html>