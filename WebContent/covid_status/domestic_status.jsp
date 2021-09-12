<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<!-- javascript -->

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<div>
<%@ include file="..\\top.jsp" %>

<%

		CoronaDao cdao = new CoronaDao();

		CoronaDto cdto =  dao.dstatus();
		

%>


<div align="center"><h3>국내 현황</h3></div>	
<div id="chartContainer" style="height: 370px; width:700px; padding-top:100px; padding-left:400px;"></div>

	

<script>

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
			{ y: <%=cdto.getSeven()%>,  label: M+"."+(D-6) },
			{ y: <%=cdto.getSix()%>, label: M+"."+(D-5) },
			{ y: <%=cdto.getFive()%>,  label: M+"."+(D-4) },
			{ y: <%=cdto.getFour()%>,  label: M+"."+(D-3) },
			{ y: <%=cdto.getThree()%>,  label: M+"."+(D-2)},
			{ y: <%=cdto.getTwo()%>,  label: M+"."+(D-1) },
			{ y: <%=cdto.getOne()%>,label: M+"."+D}
			
		]
	}]
});
chart.render();


</script>

</div>