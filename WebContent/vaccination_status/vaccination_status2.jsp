<%@page import="vaccination_status.VaccinationStatusDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vaccination_status.VaccinationStatusDao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>vaccination_status</title>
</head>
<body>


	<%
		VaccinationStatusDao dao = new VaccinationStatusDao();
		ArrayList<VaccinationStatusDto> list = dao.getVaccination();
	%> 

	<script>

	var list = [
		<%for (VaccinationStatusDto dto : list) {%>
		{
			vaccination_id: '<%=dto.getVaccination_status_id()%>',
			city_id: '<%=dto.getCity_id()%>',
			total_count: '<%=dto.getTotal_count()%>',
			primary_count: '<%=dto.getPrimary_count()%>',
			secondary_count: '<%=dto.getSecondary_count()%>',
			date: '<%=dto.getDate()%>',
			city_name: '<%=dto.getCityNameKo() %>',
			population_count: '<%=dto.getPopulation_count()%>'
			
		},
	
		<%}%>
	];
	var groupBy = function(xs, key) {
	  return xs.reduce(function(rv, x) {
	    (rv[x[key]] = rv[x[key]] || []).push(x);
	    return rv;
	  }, {});
	};
	
	var vaccination_list_groupby = groupBy(list,'city_id');
	
	
	function view(obj)
	{
		
		var sido = document.querySelector('select[name=sido] option:checked');
		var collect = vaccination_list_groupby[sido.value];
		var text = '';
		
		
		var last = collect[collect.length - 1];
		var title = '';
		
		// <수집한 날의 마지막 날짜> 까지의 <(최종)접종률>
		title += '<tr>';
		title += '		<th>' + last['date'] + "까지 " + last['city_name'] + "의 접종률 : " + '</td>';		
		title += '		<th>' + (parseInt(last['total_count']) / 
				parseInt(last['population_count'])*100 ).toFixed(2) + ' % </td>';	
		title += '		<hr>' 

		
		title += '</tr>';
		console.log(last);
		document.getElementById('last').innerHTML = title;
		
		
// 		specific += '<tr>';



// 		specific += '		&nbsp;<p>&nbsp<p>&nbsp;<p>&nbsp;<p>';
// 		specific += '</tr>';

// 		colsole.log(specific);
// 		document.getElementById('specific').innerHTML = title;
		

		text += '<caption id="title" width="100%" align="center"><h3>' 
				+ sido.innerText + '</h3></caption>';
		
		text += '<tr>'
		//text += '	<th>' + "지역명" + '</td>';
		text += '	<th>' + "날짜" + '</td>';
		text += '	<th>' + "1차 접종수" + '</td>';
		text += '	<th>' + "2차 접종수" + '</td>';
		text += '	<th>' + "전체 접종수" + '</td>';
		text += '	<th>' + "지역인구수" + '</td>';
		text += '	<th>' + "접종률" + '</td>';
		text += '</tr>'

		
		// 반복문
		for (var i=0; i<collect.length; i++) {
			
			
			text += '<tr>';
			//text += '<td>' + collect[i]['city_name'] + '</td>';
			text += '<td>' + collect[i]['date'] + '</td>';
			text += '<td>' + parseInt(collect[i]['primary_count']).toLocaleString() + '</td>';
			text += '<td>' + parseInt(collect[i]['secondary_count']).toLocaleString() + '</td>';
			text += '<td>' + parseInt(collect[i]['total_count']).toLocaleString() + '</td>';
			text += '<td>' + parseInt(collect[i]['population_count']).toLocaleString() + '</td>';
			text += '<td>' + (parseInt(collect[i]['total_count']) / 
					parseInt(collect[i]['population_count'])*100 ).toFixed(2) + ' % </td>';
					
		
		

		}

		
		// 테이블 접었다 펼치기 (innerHTML, details, outerHTML 사용)
		var table = document.getElementById('result');
		
		table.innerHTML = text;
		
		var detailsDiv = document.getElementById('details')
		
		
		var details = document.createElement('details')
		
		details.appendChild(table)
		
		detailsDiv.innerHTML = details.outerHTML
	
	}
	

</script>



	<!-- 	새로고침하면 나타나는 메인페에지 -->
	<div align="center">

		시도별 백신현황 <select name="sido" onchange="view(this)" id="sidoid"
			style="font-size: 19px;">
			<option value="2">제주특별자치도</option>
			<option value="3">경상남도</option>
			<option value="4">경상북도</option>
			<option value="5">전라남도</option>
			<option value="6">전라북도</option>
			<option value="7">충청남도</option>
			<option value="8">충청북도</option>
			<option value="9">강원도</option>
			<option value="10">경기도</option>
			<option value="11">세종특별자치시</option>
			<option value="12">울산광역시</option>
			<option value="13">대전광역시</option>
			<option value="14">광주광역시</option>
			<option value="15">인천광역시</option>
			<option value="16">대구광역시</option>
			<option value="17">부산광역시</option>
			<option value="18">서울특별시</option>
		</select>

		<hr>
	</div>


	<table align="center" id="last">
	</table>



	<div id="details" align="center">
		<table id="result" border="1" align="center">
			<tr>
				<td>시도별 백신 접종 현황</td>
			</tr>
		</table>
	</div>

	
	
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" align="">
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawVisualization);
				
				
				
				console.log(vaccination_list_groupby);
				
				var last_vaccination_by_city = [['시도명', '접종률']];
				var group_key = Object.keys(vaccination_list_groupby);
				
				for (var i=0; i<group_key.length; i++) {
					var data = vaccination_list_groupby[group_key[i]][vaccination_list_groupby[group_key[i]].length - 1];
					
					last_vaccination_by_city.push([ data['city_name'],  Math.floor((data['total_count'] / data['population_count']) * 100) ]);
				}
				
				console.log(last_vaccination_by_city)
			
				function drawVisualization() { 
					var data = google.visualization.arrayToDataTable(last_vaccination_by_city);
					var options = {
							title : '시도별 백신접종 현황 ',
							vAxis: {title: '시도명'},
							hAxis: {title: '비율'}, 
							seriesType: 'bars',
							series: {5: {type: 'line'}}
						};
					
					var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
					chart.draw(data, options);
				}
			</script>
	</head>
	
	<div id="chart_div" style="width: 800px; height: 2000px;"></div>


</body>
</html>



<!--
	원그래프 그리기 (막대그래프로 변경)
 <html>
    <head>
        <meta charset="utf-8">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    </head>

    <body>
        <div class="chart-div">
            <canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
        </div>

        <script src="script.js"></script>
    </body>
</html>	


<script>

window.onload = function () {
    pieChartDraw();
}

let pieChartData = {
    labels: ['제주특별자치도', '경상남도', '경상북도', '전라남도', '전라북도', '충청남도'],
    datasets: [{
        data: [95, 12, 13, 7, 13, 10],
        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
    }] 
};

let pieChartDraw = function () {
    let ctx = document.getElementById('pieChartCanvas').getContext('2d');
    
    window.pieChart = new Chart(ctx, {
        type: 'pie',
        data: pieChartData,
        options: {
            responsive: false
        }
    });
};

</script> -->














