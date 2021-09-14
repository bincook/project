<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ page import="covid_status_city.CovidStatusCityDao"%>
<%@ page import="covid_status_city.CovidStatusCityDto"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>city_status.jsp</title>
<link rel="stylesheet" href="css/style.css">
<style>
.issueOn {
	position: absolute;
	width: 500px;
	height: 200px;
	top: -500%;
	left: -230%;
	background: white;
	border-radius: 8px;
	display: none;
	z-index: 3;
}
</style>
<script>
	function cityName(n) {
		location = 'city_status.jsp?city_id=' + [ n ];
	}

	function get_date(n) {
		var parsedUrl = new URL(window.location.href);
		parsedUrl.searchParams.set('year', n)
		location.href = parsedUrl.href
	}

	function get_date2(n) {
		var parsedUrl = new URL(window.location.href);
		parsedUrl.searchParams.set('month', n)
		location.href = parsedUrl.href
	}

	function get_info(n) {	
		window.location.href + "&chk=";
		var parsedUrl = new URL(window.location.href);
		parsedUrl.searchParams.set('chk', n + 1);
		location.href = parsedUrl.href;
		
	}

	function win_open() {
		open("issue_insert.jsp", "", "width=450,height=450");
	}

	function del_issue() {
		open("issue_delete.jsp", "", "width=800,height=300");
	}

	function showSource() {
		alert("출처 및 참고 자료 입니다.");
		open("source.jsp", "", "width=500,height=500");
	}

	function showIssue(td) {
		td.getElementsByClassName('IssueOn')[0].style.display = "block";

	}

	function hiddenIssue(td) {
		td.getElementsByClassName('IssueOn')[0].style.display = "none";
	}
</script>
</head>
<body>
	<div class="title"><h1>코로나 데이터 및 이슈</h1></div>
	<ul class="imglist_ul">

		<li><a href="javascript:cityName(18)">
				<div class="screen">
					<span></span><span></span><span></span><span></span>
					<div class="cityName">서울</div>
					<img src="pic/seoulpicture.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(17)">
				<div class="screen">
					<span></span><span></span><span></span><span></span>
					<div class="cityName">부산</div>
					<img src="pic/busanpicture.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(16)">
				<div class="screen">
					<span></span><span></span><span></span><span></span>
					<div class="cityName">대구</div>
					<img src="pic/daegupicture.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(15)">
				<div class="screen">
					<span></span><span></span><span></span><span></span>
					<div class="cityName">인천</div>
					<img src="pic/incheon.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(14)">
				<div class="screen">
					<span></span><span></span><span></span><span></span>
					<div class="cityName">광주</div>
					<img src="pic/gwangju.png">
				</div>
		</a></li>

		<li><a href="javascript:cityName(13)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">대전</div>
					<img src="pic/daejon.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(12)">
				<div class="screen">
					<span></span><span></span><span></span><span></span>
					<div class="cityName">울산</div>
					<img src="pic/daegupicture.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(11)">
				<div class="screen">
					<span></span><span></span> <span></span><span></span>
					<div class="cityName">세종</div>
					<img src="pic/sejong.png">
				</div>
		</a></li>

		<li><a href="javascript:cityName(10)">
				<div class="screen">
					<span></span><span></span> <span></span><span></span>
					<div class="cityName">경기</div>
					<img src="pic/gungi.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(9)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">강원</div>
					<img src="pic/gangwon.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(8)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">충북</div>
					<img src="pic/chungbuk.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(7)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">충남</div>
					<img src="pic/chungnam.png">
				</div>
		</a></li>

		<li><a href="javascript:cityName(6)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">전북</div>
					<img src="pic/jeonbuk.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(5)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">전남</div>
					<img src="pic/jeonnam.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(4)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">경북</div>
					<img src="pic/gyongbuk.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(3)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">경남</div>
					<img src="pic/gyongnam.jpg">
				</div>
		</a></li>

		<li><a href="javascript:cityName(2)">
				<div class="screen">
					<span></span> <span></span> <span></span> <span></span>
					<div class="cityName">제주</div>
					<img src="pic/jeju.jpg">
				</div>
		</a></li>

		<li><a href="javascript:showSource()">
				<div class="screen">
					<span></span><span></span> <span></span><span></span>
					<div class="cityName">비고</div>
				</div>
		</a></li>

	</ul>

	<table width="800px" align="center">

		<%
			String city_id = request.getParameter("city_id");
			String yearStr = request.getParameter("year");
			String monthStr = request.getParameter("month");
			if (city_id == null || yearStr == null || monthStr == null) {
		%>

		<tr class="table_date">
			<!-- 한달치 데이터만 볼 수 있도록 연도와 월만 체크 가능 db에서 꺼내올때 가져올 수 있는가? -->
			<td colspan="4" align="center"><select name="table_year"
				onchange="javascript:get_date(this.value)">
					<option>연도선택</option>
					<option value="2021" <%if ("2021".equals(yearStr)) {%> selected
						<%}%>>2021년</option>
					<!-- 데이터값이 변경되었으면 좋겠음 /선택한 연도로 -->
					<option value="2020" <%if ("2020".equals(yearStr)) {%> selected
						<%}%>>2020년</option>
			</select> <select name="table_month"
				onchange="javascript:get_date2(this.value)">
					<option disabled>월 선택</option>
					<%
						for (int m = 1; m < 13; m++) {
					%>
					<option value="<%=m%>"><%=m%>월
					</option>
					<%
						}
					%>
			</select></td>
		</tr>
		<%
			} else {
		%>
		<tr class="table_date">
			<!-- 한달치 데이터만 볼 수 있도록 연도와 월만 체크 가능 db에서 꺼내올때 가져올 수 있는가? -->
			<td colspan="4" align="center"><select class="table_year"
				name="table_year" onchange="javascript:get_date(this.value)">
					<option>연도선택</option>
					<option value="2021" <%if ("2021".equals(yearStr)) {%> selected
						<%}%>>2021년</option>
					<!-- 데이터값이 변경되었으면 좋겠음 /선택한 연도로 -->
					<option value="2020" <%if ("2020".equals(yearStr)) {%> selected
						<%}%>>2020년</option>
			</select> <select name="table_month"
				onchange="javascript:get_date2(this.value)">
					<option>달 선택</option>
					<option value="1" <%if ("1".equals(monthStr)) {%> selected <%}%>>1월</option>
					<option value="2" <%if ("2".equals(monthStr)) {%> selected <%}%>>2월</option>
					<option value="3" <%if ("3".equals(monthStr)) {%> selected <%}%>>3월</option>
					<option value="4" <%if ("4".equals(monthStr)) {%> selected <%}%>>4월</option>
					<option value="5" <%if ("5".equals(monthStr)) {%> selected <%}%>>5월</option>
					<option value="6" <%if ("6".equals(monthStr)) {%> selected <%}%>>6월</option>
					<option value="7" <%if ("7".equals(monthStr)) {%> selected <%}%>>7월</option>
					<option value="8" <%if ("8".equals(monthStr)) {%> selected <%}%>>8월</option>
					<option value="9" <%if ("9".equals(monthStr)) {%> selected <%}%>>9월</option>
					<option value="10" <%if ("10".equals(monthStr)) {%> selected <%}%>>10월</option>
					<option value="11" <%if ("11".equals(monthStr)) {%> selected <%}%>>11월</option>
					<option value="12" <%if ("12".equals(monthStr)) {%> selected <%}%>>12월</option>
			</select></td>
		</tr>
	</table>
	<%
		String year = request.getParameter("table_year");
			String month = request.getParameter("table_month");
	%>
	<div class="info">
		<div>정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보</div>
		<!-- submit 효과 부여하여 데이터 전송하기 -->
		<ul class="btnlist_ul">
			<li>
				<button class="btn" type="button" href="#" onclick="get_info(0)">감염자수</button>
			</li>
			<li>
				<button class="btn" type="button" onclick="get_info(1)">격리해제자</button>
			</li>
			<li>
				<button class="btn" type="button" onclick="get_info(2)">사망자수</button>
			</li>
			<li>
				<button class="btn" type="button" onclick="get_info(3)">감염률</button>
			</li>
		</ul>
	</div>
	<%
		}
	%>
	<table width="800px" align="center">
		<%
			String chkStr = request.getParameter("chk");
			if (chkStr == null) {
				out.print("");
				return;
			}
			int chk = Integer.parseInt(chkStr);
			if (chk == 1) {
				CovidStatusCityDao dao = new CovidStatusCityDao();
				int year = Integer.parseInt(yearStr);
				int month = Integer.parseInt(monthStr);
				ArrayList<CovidStatusCityDto> list = dao.city_list(city_id, year, month);
		%>
		<tr class="show_table">
			<td colspan="4"><span id="show_table"> 감염자 수</span></td>
		</tr>
		<!-- 정보란을 누른 이후 보이게 하기 -->
		<tr class="data_index">
			<th width="25%">도&nbsp;시&nbsp;명</th>
			<th width="50%" colspan="2">수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
			<th width="25%">날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
		</tr>
		<!-- 정보란을 눌렀을 때 보이게 하기 -->
		<%
			for (CovidStatusCityDto dto : list) {
		%>
		<tr class="data_infected_count showData">
			<!-- 감염자 수 눌렀을 경우 -->
			<td width="25%">
				<!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 --> <span><%=dto.getName_ko()%></span>
			</td>
			<td width="50%" colspan="2"><span><%=dto.getInfected_count()%>명</span>
			</td>

			<%
				boolean existedContent = dto.getTitle() != null;
			%>

			<td width="25%" id="date"
				<%=existedContent ? "onmouseover='showIssue(this)' onmouseout='hiddenIssue(this)'" : ""%>>
				<span> <%=dto.getDate()%></span> <%
 	if (existedContent) {
 %>
				<div class="issueOn">
					<h3>
						<%=dto.getTitle()%></h3>
					<p>
						<%=dto.getDescription()%>
					</p>
					<span> <%=dto.getDate()%>
					</span>
				</div> <%
 	}
 %>
			</td>
		</tr>
		<%
			}
			} else if (chk == 2) {
		%>
		<tr class="show_table">
			<td colspan="4"><span id="show_table"> 격리 해제자 수</span></td>
		</tr>

		<!-- 정보란을 누른 이후 보이게 하기 -->
		<tr class="data_index">
			<th width="25%">도&nbsp;시&nbsp;명</th>
			<th width="50%" colspan="2">수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
			<th width="25%">날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
		</tr>
		<%
			CovidStatusCityDao dao = new CovidStatusCityDao();
				int year = Integer.parseInt(yearStr);
				int month = Integer.parseInt(monthStr);
				ArrayList<CovidStatusCityDto> list = dao.city_list(city_id, year, month);

				for (CovidStatusCityDto dto : list) {
		%>
		<tr class="data_healing_count showData">
			<!-- 격리해제자 수 눌렀을 경우 -->
			<td width="25%">
				<!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 --> <span><%=dto.getName_ko()%></span>
			</td>
			<td width="50%" colspan="2"><span><%=dto.getHealing_count()%>명</span>
			</td>

			<%
				boolean existedContent = dto.getTitle() != null;
			%>

			<td width="25%" id="date"
				<%=existedContent ? "onmouseover='showIssue(this)' onmouseout='hiddenIssue(this)'" : ""%>>
				<span> <%=dto.getDate()%></span> <%
 	if (existedContent) {
 %>
				<div class="issueOn">
					<h3>
						<%=dto.getTitle()%></h3>
					<p>
						<%=dto.getDescription()%>
					</p>
					<span> <%=dto.getDate()%>
					</span>
				</div> <%
 	}
 %>
			
		</tr>
		<%
			}
			} else if (chk == 3) {
		%>
		<tr class="show_table">
			<td colspan="4"><span id="show_table"> 사망자 수</span></td>
		</tr>

		<!-- 정보란을 누른 이후 보이게 하기 -->
		<tr class="data_index">
			<th width="25%">도&nbsp;시&nbsp;명</th>
			<th width="50%" colspan="2">수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
			<th width="25%">날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
		</tr>
		<%
			CovidStatusCityDao dao = new CovidStatusCityDao();
				int year = Integer.parseInt(yearStr);
				int month = Integer.parseInt(monthStr);
				ArrayList<CovidStatusCityDto> list = dao.city_list(city_id, year, month);

				for (CovidStatusCityDto dto : list) {
		%>
		<tr class="data_deaths_count showData">
			<!-- 사망자 수 눌렀을 경우-->
			<td width="25%">
				<!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 --> <span><%=dto.getName_ko()%></span>
			</td>
			<td width="50%" colspan="2"><span><%=dto.getDeaths_count()%>명</span>
			</td>

			<%
				boolean existedContent = dto.getTitle() != null;
			%>

			<td width="25%" id="date"
				<%=existedContent ? "onmouseover='showIssue(this)' onmouseout='hiddenIssue(this)'" : ""%>>
				<span> <%=dto.getDate()%></span> <%
 	if (existedContent) {
 %>
				<div class="issueOn">
					<h3>
						<%=dto.getTitle()%></h3><br>
						
					<p>
						<%=dto.getDescription()%>
					</p><br>
					
					<span> <%=dto.getDate()%>
					</span>
				</div> <%
 	}
 %>
			
		</tr>
		<%
			}
			} else if (chk == 4) {
		%>
		<tr class="show_table">
			<td colspan="4"><span id="show_table"> 감염률</span></td>
		</tr>

		<!-- 정보란을 누른 이후 보이게 하기 -->
		<tr class="data_index">
			<th width="25%">도&nbsp;시&nbsp;명</th>
			<th width="50%" colspan="2">수&nbsp;&nbsp;&nbsp;&nbsp;치</th>
			<th width="25%">날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
		</tr>
		<%
			CovidStatusCityDao dao = new CovidStatusCityDao();
				int year = Integer.parseInt(yearStr);
				int month = Integer.parseInt(monthStr);
				ArrayList<CovidStatusCityDto> list = dao.city_list(city_id, year, month);

				for (CovidStatusCityDto dto : list) {
		%>
		<tr class="data_infected_rate showData">
			<!-- 감염률 눌렀을 경우 -->
			<td width="25%">
				<!-- 한달간 데이터 중 수치만 나오게 하기 / 할 수 있으면 그래프 그리기 --> <span> <%=dto.getName_ko()%></span>
			</td>
			<td width="50%" colspan="2"><span><%=dto.getInfected_rate()%>%</span>
			</td>

			<%
				boolean existedContent = dto.getTitle() != null;
			%>

			<td width="25%" id="date"
				<%=existedContent ? "onmouseover='showIssue(this)' onmouseout='hiddenIssue(this)'" : ""%>>
				<span> <%=dto.getDate()%></span> <%
 	if (existedContent) {
 %>
				<div class="issueOn">
					<h3>
						<%=dto.getTitle()%></h3>
					<p>
						<%=dto.getDescription()%>
					</p>
					<span> <%=dto.getDate()%>
					</span>
				</div> <%
 	}
 %>

			</td>
		</tr>

		<%
			}
			}
			// if(session.getAttribute("userid")!=null) {
			// if(session.getAttribute("userid").toString().equals("admin")) {
		%>
		<tr class="admin_command">
			<td colspan="4">
				<button type="button" onclick="win_open()">IssueUpdate</button>
				<button type="button" onclick="del_issue()">IssueDelete</button>
			</td>
		</tr>
	</table>
	<%
		//}
		//}
	%>

</body>
</html>