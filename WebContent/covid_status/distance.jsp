<%@page import="corona.DistanceDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<%

	request.setCharacterEncoding("utf-8");
	CoronaDao cdao = new CoronaDao();

	ArrayList<DistanceDto> list  = cdao.distance();

%>

<style>
	table {
		padding-left: 100px;	
	}
	#distance_1{
		font-size:20px;
	}
	.aa {
		visibility:hidden;
		position: absolute;
		padding-left:650px;
		align:center;
		text-align:center;
		
	}
	.aa > h4 {
		text-align:center;
	}
</style>

<script>
	
	function view(n){
		var view = document.getElementsByClassName("aa")[n]

		var view2 = document.getElementsByClassName("aa")[n-1]

		
		if(view.style.visibility=="visible"){
			view.style.visibility="hidden";
		}else{
			view.style.visibility="visible";
		}
		
		if (view2.style.visibility=="visible"){
			view2.style.visibility="hidden";
		}

	}
	
	function over(n){
		document.getElementsByClassName("city")[n].style.color="red";
	}
	
	function out(n){
		document.getElementsByClassName("city")[n].style.color="black";
		
		var view = document.getElementsByClassName("aa")[n]

	}
	
</script>

<body >

<div>
<%@ include file="..\\top.jsp" %>

<table width="400" align="center" >
	<caption><h3>지역별 거리두기 단계</h3></caption>
	<% 
	for(int i =0; i<list.size();i++){ %>
	<tr>
		<td class ="city" onclick="view(<%=i%>)" onmouseover="over(<%=i%>)" onmouseout="out(<%=i%>)"><%=list.get(i).getCity_id() %></td>
		<%if(list.get(i).getStep()==4){ %>
			<td style="color:red;font-size:20px;"><%=list.get(i).getStep() %>단계</td>
		<%}else{ %>
			<td style="color:#CC6600;font-size:15px;"><%=list.get(i).getStep() %>단계</td>
		<%} %>
	</tr>
	<%} %>
</table>

<%for(int i=0;i<list.size();i++){ %>
<div class="aa">
	<div>
		<h4 style="text-align:center"><%=list.get(i).getCity_id() %> | 
		<%if(list.get(i).getStep()==4){ %>
		<span style="color:red;font-size:20px;"><%=list.get(i).getStep() %>단계</span></h4>	 
		<%}else{ %>
		<span style="color:#CC6600;font-size:15px;"><%=list.get(i).getStep() %>단계</span></h4>	 
		<%} %>
		<p><%=list.get(i).getContent() %></p>
		<p>국내현황 2021.09.13. 00:00 집계 기준</p>
		<p>코로나19 감염이 의심되면 즉시 보건소 및 콜센터(전화 1339)에 신고바랍니다.</p>
		<p>출처 <a href="http://ncov.mohw.go.kr/"
		onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
		>중앙재난안전대책본부</a>
		,<a href="http://www.mohw.go.kr/react/index.jsp"
		onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
		>중앙사고수습본부</a>
		,<a href="http://152.99.73.154/index.html"
		onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
		>중앙방역대책본부</a>
		,<a href="https://www.arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6"
		onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
		>Johns Hopkins CSSE</a></p>
	</div>
</div>
<%} %>





















</div>
</body>