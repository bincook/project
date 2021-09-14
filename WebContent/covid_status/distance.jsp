<%@page import="corona.DistanceDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@page import="corona.CoronaDto"%>
<%@page import="corona.CoronaDao"%>

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
	
		.fixed_headers {
		 table-layout: fixed;
		 border-collapse: collapse;
		 width: 100%;
	}
	.fixed_headers th, .fixed_headers td {
		 padding: 8px;
		 text-align: center;
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
 	 .fixed_headers tr > td:nth-child(2) {
	 	width: 50%;
	 }
	 
	 
	 
	 /* .fixed_headers tr > th:nth-child(2) {
	 	width: 50%;
	 }
 	 .fixed_headers tr td:nth-child(2) {
	 	width: 50%;
	 }
 */
 

	 
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
</style>

<script>
	
	function openModal(city, stair, content){
		document.getElementById('modal_city').innerText = city;
		document.getElementById('modal_content').innerText = content;
		if (stair == 4 || stair == 3) {
			document.getElementById('modal_stair').innerHTML = '<b style="color:red">' + stair + '단계' + '</b>';
		} else {
			document.getElementById('modal_stair').innerText = stair + '단계';
		}
		
		
		
		document.getElementById('distance_modal').style.display='block'
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

<div style="width: 100%; position: relative;">
	<h3 class="model_title mb-2">지역별 거리두기 단계</h3>
	
	
	<div style="width: inherit; display: flex;">
		<table class="fixed_headers">
			<tr>
				<th>지역</th>
				<th>단계</th>
			</tr>
			<%  for (int i =0; i<list.size();i++) { %>
				<tr>
					<td class ="city" onclick="openModal('<%=list.get(i).getCity_id() %>', '<%=list.get(i).getStep() %>', '<%=list.get(i).getContent() %>')" onmouseover="over(<%=i%>)" onmouseout="out(<%=i%>)"><%=list.get(i).getCity_id() %></td>
					<% if (list.get(i).getStep()==4) { %>
						<td style="color:red;font-size:20px;"><%=list.get(i).getStep() %>단계</td>
					<% } else { %>
						<td style="color:#CC6600;font-size:15px;"><%=list.get(i).getStep() %>단계</td>
					<% } %>
			
				</tr>
			<%} %>
		</table>
		<div style="width:300px;">
			<img style="width:300px; position: absolute;bottom: 0; right: 0;" src="/covid_status/stair.jpg"/>
		</div>
	</div>

<!-- distance 모달 -->
<div class="w3-container">

	<div id="distance_modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('distance_modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			<div id="modal_title" class="card-content text-center" style="place-content: center;"></div>
      
			<div class="card-content text-center" style="place-content: center;">
            	<div id="details" align="center">
          			<div>
						<h4 style="text-align:center">
							<span id="modal_city" style="font-size: 30px; color: #070707;"></span> 
							<span id="modal_stair" style="font-size: 24px;"></span>
						</h4>
						<p id="modal_content" style="padding: 16px;"></p>
						<p>국내현황 2021.09.13. 00:00 집계 기준</p>
						<p>코로나19 감염이 의심되면 즉시 보건소 및 콜센터(전화 1339)에 신고바랍니다.</p>
						<p>출처 : <a href="http://ncov.mohw.go.kr/"
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
            </div>
    	</div>
  	</div>
</div>
























</div>
</body>