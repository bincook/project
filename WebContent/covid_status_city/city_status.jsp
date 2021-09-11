<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="covid_status_city.covid_status_cityDao" %>
<%@ page import="covid_status_city.covid_status_cityDto" %>
<%@ page import="java.util.ArrayList" %>
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
	/* display: none; */
	border-bottom: 1px solid;
	height: 29px;
	line-height: 29px;
}

table .data td {
	height: 22px;
	line-height: 22px;
}

table .data_infected_count,
table .data_healing_count,
table .data_deaths_count,
table .data_infected_rate {
	
}

table .data_healing_count .date_info {
	/* display: none; */
	background: white;
}

table .data_infected_count td[width="25%"],
table .data_infected_count td[width="50%"],
table .data_healing_count td[width="25%"],
table .data_healing_count td[width="50%"],
table .data_deaths_count td[width="25%"],
table .data_deaths_count td[width="50%"],
table .data_infected_rate td[width="25%"],
table .data_infected_rate td[width="50%"] {
	text-align: right;
}

table .data_infected_count #date,
table .data_healing_count #date,
table .data_deaths_count #date,
table .data_infected_rate #date {
	text-align: center;
}
</style>
<script>
function cityName(n){
	/* (숨겨진)년/월 밑에 내용 보이게 하기 */	 // 작동함
	// history.pushState(null, null, '?city_id='+[n]);
	location = 'city_status.jsp?city_id=' + [n];
	/* ok.jsp를 만들어서 sql에서 데이터 읽어오기 */
}

function get_date(n){
	
	var parsedUrl = new URL(window.location.href);
	//console.log(parsedUrl)

	parsedUrl.searchParams.set('year', n)
	
/* 	console.log(parsedUrl.href)
	console.log('-----------')
	
	for (var data of parsedUrl.searchParams.entries()) {
		console.log(data)
	} */
	
	
}

function get_date2(n) {
	// var new_URL = window.location.href + "?month=" + [n];
	// history.pushState(null, null, new_URL);
	var parsedUrl = new URL(window.location.href);
	parsedUrl.searchParams.set('month', n)
	location.href = parsedUrl.href
}
/* 
function get_info1() {
	document.getElementsByClassName("data_index")[0].style.display="table-row";
	document.getElementsByClassName("data_infected_count")[0].style.visibility="visible";
	document.getElementsByClassName("data_healing_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_deaths_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_infected_rate")[0].style.visibility="hidden";
	documetn.getElementById("show_table").innerHTML="<strong> 감염자 수</strong>";
}

function get_info2() {
	document.getElementsByClassName("data_index")[0].style.display="table-row";
	document.getElementsByClassName("data_infected_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_healing_count")[0].style.visibility="visible";
	document.getElementsByClassName("data_deaths_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_infected_rate")[0].style.visibility="hidden";
	documetn.getElementById("show_table").innerHTML="<strong> 격리해제자 수</strong>";
}

function get_info3() {
	document.getElementsByClassName("data_index")[0].style.display="table-row";
	document.getElementsByClassName("data_infected_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_healing_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_deaths_count")[0].style.visibility="visible";
	document.getElementsByClassName("data_infected_rate")[0].style.visibility="hidden";
	documetn.getElementById("show_table").innerHTML="<strong> 사망자 수</strong>";
}

function get_info4() {
	document.getElementsByClassName("data_index")[0].style.display="table-row";
	document.getElementsByClassName("data_infected_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_healing_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_deaths_count")[0].style.visibility="hidden";
	document.getElementsByClassName("data_infected_rate")[0].style.visibility="visible";
	documetn.getElementById("show_table").innerHTML="<strong> 감염률</strong>";
}

function date_info(){
	onmouseover를 이용 해당하는 날짜에 정보가 있다면 div를 통해서 내용 보여주기
	div는 날짜 위에 바로 보일수 있게 만들기 
	document.getElementsByClassName("date_info")[0].style.display="block";
	onclick을 이용하여 div 숨기기 
}

function date_infoClose(){
	document.getElementsByClassName("date_info")[0].style.display="none";
}
*/
</script>
</head>
<body>

<table width="620px" align="center">

  <caption> 코로나 데이터를 확인할 도시를 선택하세요</caption>

  <tr>
    <td colspan="4">
      <div class="container"><!-- 서울(18)인데 이것을 value 값으로 전달이 가능한가? -->
        <div class="cityName" onclick="cityName(18)">서울</div>
        <div class="cityName" onclick="cityName(17)">부산</div>
        <div class="cityName" onclick="cityName(16)">대구</div>
        <div class="cityName" onclick="cityName(15)">인천</div>
        <div class="cityName" onclick="cityName(14)">광주</div>
        <div class="cityName" onclick="cityName(13)">대전</div>
      </div>
      
      <div class="container">
        <div class="cityName" onclick="cityName(12)">울산</div>
        <div class="cityName" onclick="cityName(11)">세종</div>
        <div class="cityName" onclick="cityName(10)">경기</div>
        <div class="cityName" onclick="cityName(9)">강원</div>
        <div class="cityName" onclick="cityName(8)">충북</div>
        <div class="cityName" onclick="cityName(7)">충남</div>
      </div>
      
      <div class="container">
        <div class="cityName" onclick="cityName(6)">전북</div>
        <div class="cityName" onclick="cityName(5)">전남</div>
        <div class="cityName" onclick="cityName(4)">경북</div>
        <div class="cityName" onclick="cityName(3)">경남</div>
        <div class="cityName" onclick="cityName(2)">제주</div>
        <div class="cityName">비고</div>
      </div>
    </td>
  </tr>

  <tr>
    <td colspan="4"> &nbsp;</td>
  </tr>
<%	
	covid_status_cityDao dao = new covid_status_cityDao();
	if(request.getParameter("city_id") != null){
		String city_id = request.getParameter("city_id");
		ArrayList<covid_status_cityDto> list = dao.city_list(city_id);
%>
  <!-- 처음에 숨겨져 있다가 위에 도시명 버튼을 클릭시 보이게 함 -->
  <tr class="table_date"><!-- 한달치 데이터만 볼 수 있도록 연도와 월만 체크 가능 db에서 꺼내올때 가져올 수 있는가? -->
    <td colspan="4" align="center">
    
      <select name="table_year" onchange="javascript:get_date(this.value)" >
        <option> 연도선택 </option>
        <option value="2021">2021</option> <!-- 데이터값이 변경되었으면 좋겠음 /선택한 연도로 -->
        <option value="2020">2020</option>
      </select><span id="year_font">년</span>
      
      <select name="table_month" onchange="javascript:get_date2(this.value)">
        <option> 월 선택</option>
<%
		for(int m = 1;m < 13;m++){
%>
        <option value="<%=m %>"><%=m %></option>
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
      <div width="100%" onclick="get_info1()">감염자 수</div>
    </td>
    
    <td width="25%">
      <div width="100%" onclick="get_info2()">격리해제자 수</div>
    </td>
 
    <td width="25%">
      <div width="100%" onclick="get_info3()">사망자 수</div>
    </td>
 
    <td width="25%">
      <div width="100%" onclick="get_info4()">감염률</div>
    </td>
  </tr>

  <tr>
    <td colspan="4" > <span id="show_table"></span></td>
  </tr>
  
  <!-- 정보란을 누른 이후 보이게 하기 -->
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
  <!-- 정보란을 눌렀을 때 보이게 하기 -->
<%		
		for(int i = 0;i < list.size();i++ ){
%>
  <tr class="data_infected_count"><!-- 감염자 수 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span> <%=list.get(i).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span> <%=list.get(i).getInfected_count() %></span>
    </td>
    <td width="25%" id="date">
      <span> <%=list.get(i).getDate() %></span>
    </td>
  </tr>
<%
		}
		for(int j = 0;j < list.size();j++){
%>
  <tr class="data_healing_count"><!-- 격리해제자 수 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span> <%=list.get(j).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span> <%=list.get(j).getHealing_count() %></span>
    </td>
    <td width="25%">
      <span onmouseover="date_info()" onclick="date_infoClose()"> <%=list.get(j).getDate() %></span>
      <div class="date_info">
      	 <h4><%=list.get(j).getTitle() %></h4><br>
      	 <%=list.get(j).getDescription() %><!-- 이거 넣고 안나옴 -->
      </div>
    </td>
  </tr>
<%
		}
		for(int k = 0;k < list.size();k++){
%>
  <tr class="data_deaths_count"><!-- 사망자 수 눌렀을 경우-->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span> <%=list.get(k).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span> <%=list.get(k).getDeaths_count() %></span>
    </td>
    <td width="25%">
      <span> <%=list.get(k).getDate() %></span>
    </td>
  </tr>
<%
		}
		for(int l = 0;l < list.size();l++){
%>
  <tr class="data_infected_rate"><!-- 감염률 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span> <%=list.get(l).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span> <%=list.get(l).getInfected_rate() %></span>
    </td>
    <td width="25%">
      <span> <%=list.get(l).getDate() %></span>
    </td>
  </tr>
<%
		}
	}
%>
</table>
</body>
</html>