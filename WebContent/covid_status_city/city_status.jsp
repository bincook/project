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
	padding-bottom: 60px;
	padding-top: 60px;
}

table .container {
	display: flex;
	align-items: center;
}

table .container .cityName {
	width: 120px;
	height: 80px;
	border-radius: 4px;
	border: none;
	background: yellow;
	margin: 2px 2px 2px 2px;
	font-size: 18px;
	font-weight: bold;
	line-height: 80px;
	text-align: center;
}

table .container .cityName:hover {
	border-radius: 0px 20px 0px 0px;
	background: orange;
	font-size: 22px;
	cursor: pointer;
}

table select {
	width: 120px;
	height: 36px;
	text-align: center;
}

table select:hover {
	cursor: pointer;
}

table #year_font,
table #month_font {
	font-size: 20px;
}

table .table_date {
	height: 70px;
}

table .city_info {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid;
	border-top: 1px solid;
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
	border-top: 1px solid;
	border-bottom: 1px solid;
	height: 29px;
	line-height: 29px;
}

table .info div[width="100%"]:hover {
	background: orange;
	cursor: pointer;
}

table .show_table {
	height: 50px;
	line-height: 50px;
}

table #show_table {
	font-size: 28px;
	font-weight: bold;
}

table .data td {
	height: 22px;
	line-height: 22px;
}

table .data_infected_count,
table .data_healing_count,
table .data_deaths_count,
table .data_infected_rate {
	height: 22px;
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
	height: 32px;
	text-align: right;
}

table .data_infected_count #date,
table .data_healing_count #date,
table .data_deaths_count #date,
table .data_infected_rate #date {
	text-align: center;
}

table .admin_command {
	border-top: 1px solid;
}
</style>
<script>
function cityName(n){
	/* (숨겨진)년/월 밑에 내용 보이게 하기 */	 // 작동함
	// history.pushState(null, null, '?city_id='+[n]);
	location = 'city_status.jsp?city_id=' + [n]; 
	/* ok.jsp를 만들어서 sql에서 데이터 읽어오기 */
	/* var parsedUrl = new URL(window.location.href);
	//console.log(parsedUrl)

	parsedUrl.searchParams.set('city_id', n)
	location.href = parsedUrl.href */
}

function get_date(n){
	
	var parsedUrl = new URL(window.location.href);
	//console.log(parsedUrl)

	parsedUrl.searchParams.set('year', n)
	location.href = parsedUrl.href
	
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

function get_info(n) {
	window.location.href + "&chk=";
	var parsedUrl = new URL(window.location.href);
	parsedUrl.searchParams.set('chk', n+1);
	location.href = parsedUrl.href;
}

function win_open() {
	open("issue_insert.jsp","","width=450,height=300");
}

function del_issue() {
	open("issue_delete.jsp","","width=450,height=300");
}
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
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	if (yearStr == null ||  monthStr== null) {
%>
  <tr class="table_date"><!-- 한달치 데이터만 볼 수 있도록 연도와 월만 체크 가능 db에서 꺼내올때 가져올 수 있는가? -->
    <td colspan="4" align="center">
    
      <select name="table_year" onchange="javascript:get_date(this.value)" >
        <option> 연도선택 </option>
        <option value="2021" <% if ("2021".equals(yearStr)) {%> selected <%}%>>2021</option> <!-- 데이터값이 변경되었으면 좋겠음 /선택한 연도로 -->
        <option value="2020" <% if ("2020".equals(yearStr)) {%> selected <%}%>>2020</option>
      </select><span id="year_font">년</span>
      
      <select name="table_month" onchange="javascript:get_date2(this.value)">
        <option disabled> 월 선택</option>
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
<%
	}
	else {
%>
  <tr class="table_date"><!-- 한달치 데이터만 볼 수 있도록 연도와 월만 체크 가능 db에서 꺼내올때 가져올 수 있는가? -->
    <td colspan="4" align="center">
    
      <select name="table_year" onchange="javascript:get_date(this.value)">
        <option> 연도선택 </option>
        <option value="2021" <% if ("2021".equals(yearStr)) {%> selected <%}%>>2021</option> <!-- 데이터값이 변경되었으면 좋겠음 /선택한 연도로 -->
        <option value="2020" <% if ("2020".equals(yearStr)) {%> selected <%}%>>2020</option>
      </select><span id="year_font">년</span>
      
      <select name="table_month" onchange="javascript:get_date2(this.value)">
        <option> 달 선택 </option>
 		<option value="1" <% if ("1".equals(monthStr)) {%> selected <%}%>>1</option>
        <option value="2" <% if ("2".equals(monthStr)) {%> selected <%}%>>2</option>
        <option value="3" <% if ("3".equals(monthStr)) {%> selected <%}%>>3</option>
        <option value="4" <% if ("4".equals(monthStr)) {%> selected <%}%>>4</option>
        <option value="5" <% if ("5".equals(monthStr)) {%> selected <%}%>>5</option>
        <option value="6" <% if ("6".equals(monthStr)) {%> selected <%}%>>6</option>
        <option value="7" <% if ("7".equals(monthStr)) {%> selected <%}%>>7</option>
        <option value="8" <% if ("8".equals(monthStr)) {%> selected <%}%>>8</option>
        <option value="9" <% if ("9".equals(monthStr)) {%> selected <%}%>>9</option>
        <option value="10" <% if ("10".equals(monthStr)) {%> selected <%}%>>10</option>
        <option value="11" <% if ("11".equals(monthStr)) {%> selected <%}%>>11</option>
        <option value="12" <% if ("12".equals(monthStr)) {%> selected <%}%>>12</option>
      </select><span id="month_font">월</span>
      
    </td>
  </tr>	
<%
		String year = request.getParameter("table_year");
		String month = request.getParameter("table_month");
%>
  <tr class="city_info">
    <th colspan="4" width="100%"> 정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보</th>
  </tr>
  
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
<%
	}
%>
<%

    String chkStr = request.getParameter("chk");


	if(chkStr == null){
		out.print("");
		return;
	}
	
	int chk = Integer.parseInt(chkStr);
	 
	if(chk == 1){
%>
  <tr class="show_table">
    <td colspan="4" > <span id="show_table"> 감염자 수</span></td>
  </tr>
  
  <!-- 정보란을 누른 이후 보이게 하기 -->
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
  <!-- 정보란을 눌렀을 때 보이게 하기 -->
<%
		covid_status_cityDao dao = new covid_status_cityDao();
		String city_id = request.getParameter("city_id");
		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);
		ArrayList<covid_status_cityDto> list = dao.city_list(city_id, year, month);

		for(int i = 0;i < list.size();i ++){
%>
  <tr class="data_infected_count"><!-- 감염자 수 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span><%=list.get(i).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span><%=list.get(i).getInfected_count() %></span>
    </td>
    <td width="25%" id="date">
      <span><%=list.get(i).getDate() %></span>
    </td>
  </tr>
<%
		}
	}
	else if(chk == 2){
%>
  <tr class="show_table">
    <td colspan="4" > <span id="show_table"> 격리 해제자 수</span></td>
  </tr>
  
  <!-- 정보란을 누른 이후 보이게 하기 -->
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
<%
		covid_status_cityDao dao = new covid_status_cityDao();
		String city_id = request.getParameter("city_id");
		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);
		ArrayList<covid_status_cityDto> list = dao.city_list(city_id, year, month);

		for(int j = 0;j < list.size();j ++){
%>
  <tr class="data_healing_count"><!-- 격리해제자 수 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span><%=list.get(j).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span><%=list.get(j).getHealing_count() %></span>
    </td>
    <td width="25%" id="date">
      <span ><%=list.get(j).getDate() %></span>
    </td>
  </tr>
<%
		}
	}
	else if(chk == 3){
%>
  <tr class="show_table">
    <td colspan="4" > <span id="show_table"> 사망자 수</span></td>
  </tr>
  
  <!-- 정보란을 누른 이후 보이게 하기 -->
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
<%
		covid_status_cityDao dao = new covid_status_cityDao();
		String city_id = request.getParameter("city_id");
		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);
		ArrayList<covid_status_cityDto> list = dao.city_list(city_id, year, month);

		for(int k = 0;k < list.size();k ++){
%>
  <tr class="data_deaths_count"><!-- 사망자 수 눌렀을 경우-->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span><%=list.get(k).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span><%=list.get(k).getDeaths_count() %></span>
    </td>
    <td width="25%" id="date">
      <span><%=list.get(k).getDate() %></span>
    </td>
  </tr>
<%
		}
	}
	else if(chk == 4){
%>
  <tr class="show_table">
    <td colspan="4" > <span id="show_table"> 감염률</span></td>
  </tr>
  
  <!-- 정보란을 누른 이후 보이게 하기 -->
  <tr class="data_index">
    <th width="25%"> 도&nbsp;시&nbsp;명</th>
    <th width="50%" colspan="2"> 수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
    <th width="25%"> 날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
  </tr>
<%
		covid_status_cityDao dao = new covid_status_cityDao();
		String city_id = request.getParameter("city_id");
		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);
		ArrayList<covid_status_cityDto> list = dao.city_list(city_id, year, month);

		for(int l = 0;l < list.size();l ++){
%>
  <tr class="data_infected_rate"><!-- 감염률 눌렀을 경우 -->
    <td width="25%"><!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 -->
      <span> <%=list.get(l).getName_ko() %></span>
    </td>
    <td width="50%" colspan="2">
      <span><%=list.get(l).getInfected_rate() %>%</span>
    </td>
    <td width="25%" id="date">
      <span> <%=list.get(l).getDate() %></span>
    </td>
  </tr>
  
<%		
		}
		// if(session.getAttribute("userid")!=null) {
			// if(session.getAttribute("userid").toString().equals("admin")) {
%>

<%		
			//}
		//}
	}
%>
  <tr class="admin_command">
    <td colspan="4">
      <button type="button" onclick="win_open()"> IssueUpdate</button>
      <button type="button" onclick="del_issue()"> IssueDelete</button>
    </td>
  </tr>
</table>

</body>
</html>