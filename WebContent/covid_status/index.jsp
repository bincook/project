<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.time.LocalDate"%>
<%@page import="corona.CoronaDto"%>
<%@page import="corona.CoronaDao"%>


<%
	CoronaDao dao = new CoronaDao();
	CoronaDao cdao = new CoronaDao();
	CoronaDto cdto =  dao.dstatus();
%>

<html>
<head>
    <title>Covid 19 분석 및 게시판</title>
    <link rel="stylesheet" href="/static/index.css">
    <script src="/static/index.js"></script>
	<style>
		.content-list > div{
			display:none;
		}
		
		.card-content.active {
			display: block;
		}
		
		
		hr.active {
			background-color: rgba(0, 123, 255, 0.7);
			height: 1px;
			box-shadow: 0 1px 2px rgba(0, 123, 255, 0.7);
	    	border-radius: 5px;
		}
		
		hr.animation {
			transform: scaleX();
			transition-duration: 1s;
			transition-timing-function: ease;
		}
		
		button {
		    color: rgb(20, 186, 20);
		    background-color: inherit;
		    border: 1px solid rgba(20, 186, 20, 0.314);
		    border-radius: 20px;
		    padding: 8px;
		    cursor: pointer;
		}
	</style>
	<script>
		function changePage(obj) {
			var order = obj.querySelector('option:checked').value;
			
			if (order == 0) {
				return;
			}
			
			var child = document.getElementById('content-list').querySelectorAll('div.card-content');
				
			for (var c of child) {
				c.classList.remove('active');
			}
			
			
			
			document.getElementById('content-list').querySelector('div.card-content:nth-of-type(' + order + ')').classList.add('active');
			
		}
	</script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>

<div id="modal-section"></div>
<div id="root" style="width:100%; overflow: inherit;">
    <main class="covid-main pt-5">

        <jsp:include page="../header.jsp" />

        
        <div class="card mb-4-2">
	        <div class="card-content text-center">
	            <div class="left" style="height: fit-content; padding: 8px;">
	               	<h1 style="color: #070707;">코로나바이러스 감염 현황</h1>
	            </div>
	        </div>  
	        
	        <!-- 구분선 -->
           	<hr style="margin:0" class="active animation active" />
           
           
						
                    	
        	<div class="card-content text-center mt-4" style="place-content: center;">
        		<button id="details_btn" class="mr-2" onclick="document.getElementById('city_status_modal').style.display='block'">국내도시별현황</button>
        		<button id="details_btn" class="mr-2" onclick="document.getElementById('covid_19_modal').style.display='block'">코로나 19</button>
        		<button id="details_btn" class="mr-2" onclick="document.getElementById('korea_status_modal').style.display='block'">국내현황</button>
        	</div>
        </div>

        
        <!-- <button id="details_btn" onclick="document.getElementById('distance_modal').style.display='block'">거리두기단계</button> -->
        
        <div class="card mb-4-2">
	        <div class="card-content text-center">
	        	<jsp:include page="/covid_status/distance.jsp"/>
	        </div>
        </div>
    </main>
</div>


<!-- 코로나 상태 모달 -->
<div class="w3-container">

	<div id="city_status_modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:400px">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('city_status_modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			<div class="card-content text-center mt-3" style="place-content: center;">
            	<div id="details" align="center">
					<jsp:include page="/covid_status/city_status.jsp"/>
				</div>
            </div>
    	</div>
  	</div>
</div>


<!-- 코로나 19 모달 -->
<div class="w3-container">

	<div id="covid_19_modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('covid_19_modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			<div class="card-content text-center" style="place-content: center;">
            	<div id="details" align="center">
					<jsp:include page="/covid_status/gayo.jsp"/>
				</div>
            </div>
    	</div>
  	</div>
</div>


<!-- 국내 상태 모달 -->
<div class="w3-container">

	<div id="korea_status_modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px; min-height: 480px;">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('korea_status_modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			
			<div class="card-content text-center" style="place-content: center; width: 100%; display: flex; flex-direction: column;">
				<div align="center" class="mb-3"><h3>국내 현황</h3></div>	
            	<div id="details" align="center" style="width: 100%;">
					<%-- <jsp:include page="/covid_status/domestic_status.jsp"/> --%>
					<div id="chartContainer" style="height: 300px; width: 100%; position: relative; left: 4px;"></div>
				</div>
            </div>
    	</div>
  	</div>
</div>

<!-- 거리두기 모달 -->
<script>

	window.onload = function () {
		var date = new Date();
		
		var M = date.getMonth()+1;
		var D = date.getDate();
		
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "light", // "light1", "light2", "dark1", "dark2"
			title:{
				text: "국내 코로나 현황"
			},
			axisY: {
				title: ""
			},
			data: [{
				type: "column",  
				showInLegend: true, 
				legendMarkerColor: "#FF6C6C",
				color: "#FF6C6C",
				legendText: "국내 발생자",
				dataPoints: [    
					{ y: <%=cdto.getSeven()%>,  label: M+"."+(D-10) },
					{ y: <%=cdto.getSix()%>, label: M+"."+(D-9) },
					{ y: <%=cdto.getFive()%>,  label: M+"."+(D-8) },
					{ y: <%=cdto.getFour()%>,  label: M+"."+(D-7) },
					{ y: <%=cdto.getThree()%>,  label: M+"."+(D-6)},
					{ y: <%=cdto.getTwo()%>,  label: M+"."+(D-5) },
					{ y: <%=cdto.getOne()%>,label: M+"."+(D-4)}
				]
			}]
		});
		chart.render();
	};
</script>

</body>
</html>


