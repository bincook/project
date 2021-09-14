<%@page import="corona.CityDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
         
<style>

	#city {
		width:1000px;
		margin:auto;
	}
	#city #main {
		padding-left:50px;
	}
	#city #main > li {
		display:inline-block;
		width:250px;
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
	}
	#city #new #sub >li {
		color:#FF6C6C;
	}
	h3 {
		color:#333333;
	}
</style>
<div>
<%@ include file="..\\top.jsp" %>
<%

	CoronaDao Cdao = new CoronaDao();

	ArrayList<CityDto> list = Cdao.city_status();
	
	ArrayList<CityDto> list2 = Cdao.city_status_new();
%>
<div id ="city">
<ul id="main">
	<li><h3>지역</h3>
		<ul id="sub">
			<%for(int i=0 ; i<list.size();i++) {%>
		<li>
		<% if(list.get(i).getCity_id()==2){
		%><a href="https://www.jeju.go.kr/corona19.jsp"
		     onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
		><%out.print("제주"); %></a><%
		}else if(list.get(i).getCity_id()==3){
		%><a href="http://xn--19-q81ii1knc140d892b.kr/main/main.do"
			  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
			><%out.print("경남"); %></a><%
		}else if(list.get(i).getCity_id()==4){
		%><a href="https://www.gb.go.kr/Main/open_contents/section/wel/page.do?mnu_uid=5857&LARGE_CODE=360&MEDIUM_CODE=90&SMALL_CODE=10&mnu_order=2"
				  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
				><%out.print("경북"); %></a><%
		}else if(list.get(i).getCity_id()==5){
			%><a href="https://www.jeonnam.go.kr/coronaMainPage.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("전남"); %></a><%
		}else if(list.get(i).getCity_id()==6){
			%><a href="https://www.jeonbuk.go.kr/board/list.jeonbuk?boardId=BBS_0000105&menuCd=DOM_000000110001000000&contentsSid=1219&cpath="
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("전북"); %></a><%
		}else if(list.get(i).getCity_id()==7){
			%><a href="http://www.chungnam.go.kr/coronaStatus.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("충남"); %></a><%
		}else if(list.get(i).getCity_id()==8){
			%><a href="http://www1.chungbuk.go.kr/covid-19/index.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("충북"); %></a><%
		}else if(list.get(i).getCity_id()==9){
			%><a href="http://www.provin.gangwon.kr/covid-19.html"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("강원"); %></a><%
		}else if(list.get(i).getCity_id()==10){
			%><a href="https://www.gg.go.kr/contents/contents.do?ciIdx=1150&menuId=2909"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("경기"); %></a><%
		}else if(list.get(i).getCity_id()==11){
			%><a href="https://www.sejong.go.kr/covid19.do;jsessionid=EBebbaJVZcWFMl3oImFOXver1BBnVvnsFICRpsaB0JBp3YgZplqxoS89RzbaHHRF.Portal_WAS1_servlet_engine5"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("세종"); %></a><%
		}else if(list.get(i).getCity_id()==12){
			%><a href="http://covid19.ulsan.go.kr/index.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("울산"); %></a><%
		}else if(list.get(i).getCity_id()==13){
			%><a href="https://www.daejeon.go.kr/corona19/index.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("대전"); %></a><%
		}else if(list.get(i).getCity_id()==14){
			%><a href="https://www.gwangju.go.kr/c19/"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("광주"); %></a><%
		}else if(list.get(i).getCity_id()==15){
			%><a href="https://www.incheon.go.kr/covid19/index"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("인천"); %></a><%
		}else if(list.get(i).getCity_id()==16){
			%><a href="http://covid19.daegu.go.kr/"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("대구"); %></a><%
		}else if(list.get(i).getCity_id()==17){
			%><a href="https://www.busan.go.kr/covid19/Corona19.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("부산"); %></a><%
		}else if(list.get(i).getCity_id()==18){
			%><a href="https://www.seoul.go.kr/coronaV/coronaStatus.do"
					  onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
					><%out.print("서울"); %></a><%
		}
		%></li><%} %>
		</ul>
	</li>
	
	<li><h3>누적수</h3>
		<ul id="sub">
			<%for(int i=0 ; i<list.size();i++) {%>
			<li><%=String.format("%,d",list.get(i).getInfected_count()) %>명</li>
		<%} %>
		</ul>
	</li>
	
	<li id ="new"><h3>신규확진자</h3>
		<ul id="sub">
			<%for(int i =0;i<list2.size();i++) {%>
				<li><%=list2.get(i).getA2() %>▲</li>
				<li><%=list2.get(i).getA3() %>▲</li>
				<li><%=list2.get(i).getA4() %>▲</li>
				<li><%=list2.get(i).getA5() %>▲</li>
				<li><%=list2.get(i).getA6() %>▲</li>
				<li><%=list2.get(i).getA7() %>▲</li>
				<li><%=list2.get(i).getA8() %>▲</li>
				<li><%=list2.get(i).getA9() %>▲</li>
				<li><%=list2.get(i).getA10() %>▲</li>
				<li><%=list2.get(i).getA11() %>▲</li>
				<li><%=list2.get(i).getA12() %>▲</li>
				<li><%=list2.get(i).getA13() %>▲</li>
				<li><%=list2.get(i).getA14() %>▲</li>
				<li><%=list2.get(i).getA15() %>▲</li>
				<li><%=list2.get(i).getA16() %>▲</li>
				<li><%=list2.get(i).getA17() %>▲</li>
				<li><%=list2.get(i).getA18() %>▲</li>
			<%} %>
		</ul>
	</li>
	
</ul>
		
</div>

</div>