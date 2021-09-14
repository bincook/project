<%@page import="corona.CityDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@page import="corona.CoronaDto"%>
<%@page import="corona.CoronaDao"%>
<style>

	.fixed_headers {
		 table-layout: fixed;
		 border-collapse: collapse;
		 width: 100%;
	}
	.fixed_headers th, .fixed_headers td {
		 padding: 8px;
		 text-align: left;
		 white-space: nowrap;
	}
	
	.fixed_headers th {
		background-color: #333;
		 color: #FDFDFD;
	}

	 .fixed_headers thead {
		 background-color: #333;
		 color: #FDFDFD;
	}
	 .fixed_headers thead tr {
		 display: block;
		 position: relative;
	}
	
	 .fixed_headers tr > th:nth-child(2) {
	 	width: 50%;
	 }
 	 .fixed_headers tr td:nth-child(2) {
	 	width: 50%;
	 }
 	 .fixed_headers tr > th:nth-child(3) {
	 	width: 20%;
	 }
 	 .fixed_headers tr td:nth-child(3) {
	 	width: 20%;
	 	color:#FF6C6C;
	 }
 
	 .fixed_headers tbody {
		 display: block;
		 overflow: auto;
		 width: 100%;
	}
	.fixed_headers tbody tr {
		width: 100%;	
	}
	 .fixed_headers tbody tr:nth-child(even) {
		 background-color: #DDD;
	}
	/* #city {
		width:100%;
		margin:auto;
	}
	#city #main {
		padding-left:50px;
	}
	#city #main > li {
		display:inline-block;
		padding-left:20px;
		font-size:20px;
		text-align:center;
	}
	#city #sub {
		padding-left:0px;
	}
	#city #sub > li {
		list-style-type:none;
		padding-top:5px;
	} */
	#city #new #sub >li {
		color:#FF6C6C;
	}
	h3 {
		color:#333333;
	}
</style>

<script>
	function openWindow(event) {
		event.preventDefault();
		window.open(event.target.href, '_blank', 'width=800, height=600'); 
		return false;
	}
</script>
<div>
<%

	CoronaDao Cdao = new CoronaDao();

	ArrayList<CityDto> list = Cdao.city_status();
	
	ArrayList<CityDto> list2 = Cdao.city_status_new();
%>
<div id ="city">


	<table class="fixed_headers">
		<tr>
			<th>지역</th>
			<th>누적수</th>
			<th>신규확진자</th>
		</tr>
		
	<%for(int i=0 ; i<list.size();i++) {%>
		<tr>
			
			<% if(list.get(i).getCity_id()==2) { %>
				<td><a href="https://www.jeju.go.kr/corona19.jsp">제주</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA2() %>▲</td>
			<% } else if(list.get(i).getCity_id()==3) { %>
				<td><a href="http://xn--19-q81ii1knc140d892b.kr/main/main.do">경남</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA3() %>▲</td>
			<% } else if(list.get(i).getCity_id()==4) { %>
				<td><a href="https://www.gb.go.kr/Main/open_contents/section/wel/page.do?mnu_uid=5857&LARGE_CODE=360&MEDIUM_CODE=90&SMALL_CODE=10&mnu_order=2">경북</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA4() %>▲</td>
			<% } else if(list.get(i).getCity_id()==5) { %>
				<td><a href="https://www.jeonnam.go.kr/coronaMainPage.do">전남</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA5() %>▲</td>
			<% } else if(list.get(i).getCity_id()==6) { %>
				<td><a href="https://www.jeonbuk.go.kr/board/list.jeonbuk?boardId=BBS_0000105&menuCd=DOM_000000110001000000&contentsSid=1219&cpath=">전북</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA6() %>▲</td>
			<% } else if(list.get(i).getCity_id()==7) { %>
				<td><a href="http://www.chungnam.go.kr/coronaStatus.do">충남</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA7() %>▲</td>
			<% } else if(list.get(i).getCity_id()==8) { %>
				<td><a href="http://www1.chungbuk.go.kr/covid-19/index.do">충북</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA8() %>▲</td>
			<% } else if(list.get(i).getCity_id()==9) { %>
				<td><a href="http://www.provin.gangwon.kr/covid-19.html">강원</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA9() %>▲</td>
			<% } else if(list.get(i).getCity_id()==10) { %>
				<td><a href="https://www.gg.go.kr/contents/contents.do?ciIdx=1150&menuId=2909">경기</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA10() %>▲</td>
			<% } else if(list.get(i).getCity_id()==11){ %>
				<td><a href="https://www.sejong.go.kr/covid19.do;jsessionid=EBebbaJVZcWFMl3oImFOXver1BBnVvnsFICRpsaB0JBp3YgZplqxoS89RzbaHHRF.Portal_WAS1_servlet_engine5">세종</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA11() %>▲</td>
			<% } else if(list.get(i).getCity_id()==12) { %>
				<td><a href="http://covid19.ulsan.go.kr/index.do">울산</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA12() %>▲</td>
			<% } else if(list.get(i).getCity_id()==13) { %>
				<td><a href="https://www.daejeon.go.kr/corona19/index.do">대전</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA13() %>▲</td>
			<% } else if(list.get(i).getCity_id()==14) { %>
				<td><a href="https://www.gwangju.go.kr/c19/">광주</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA14() %>▲</td>
			<% } else if(list.get(i).getCity_id()==15) { %>
				<td><a href="https://www.incheon.go.kr/covid19/index">인천</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA15() %>▲</td>
			<% } else if(list.get(i).getCity_id()==16){ %>
				<td><a href="http://covid19.daegu.go.kr/">대구</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA16() %>▲</td>
			<% } else if(list.get(i).getCity_id()==17) { %>
				<td><a href="https://www.busan.go.kr/covid19/Corona19.do">부산</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA17() %>▲</td>
			<% } else if(list.get(i).getCity_id()==18) { %>
				<td><a href="https://www.seoul.go.kr/coronaV/coronaStatus.do">서울</a></td>
				<td><%=String.format("%,d",list.get(i).getInfected_count()) %>명</td>
				<td><%=list2.get(0).getA18() %>▲</td>
			<% } %>
		
		</tr>
	<%} %>
		
		
		
		
		
	</table>
	<script>
		var aTags = document.querySelectorAll('table.fixed_headers a');
		
		for (var a of aTags) {
			a.addEventListener('click', openWindow);
		}
	</script>

		
</div>

</div>