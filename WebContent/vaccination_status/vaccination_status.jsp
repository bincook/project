<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@page import="vaccination_status.VaccinationStatusDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vaccination_status.VaccinationStatusDao"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	VaccinationStatusDao dao = new VaccinationStatusDao();
	ArrayList<VaccinationStatusDto> list = dao.getVaccination();
%> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Covid 19 분석 및 게시판</title>
<style>	
	.fixed_headers {
		 table-layout: fixed;
		 border-collapse: collapse;
		 width: 100%;
	}
	.fixed_headers th, .fixed_headers td {
		 padding: 8px;
		 text-align: left;
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
	 .old_ie_wrapper {
		 width: 100%;
		 overflow-x: hidden;
		 overflow-y: auto;
	}
	 .old_ie_wrapper tbody {
		 height: auto;
	}
	
	button {
		color: rgb(20, 186, 20);
		background-color: inherit;
		border: 1px solid rgba(20, 186, 20, 0.314);
		border-radius: 20px;
		padding: 8px;
		cursor: pointer;
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
}
	

</style>
</head>
<body>
<!-- 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	var groupBy = function(xs, key) {
	  return xs.reduce(function(rv, x) {
	    (rv[x[key]] = rv[x[key]] || []).push(x);
	    return rv;
	  }, {});
	};


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
	var vaccination_list_groupby = groupBy(list,'city_id');
	
	
	function view(obj)
	{
		// 시도별 진행 현황을 다시 그립니다.
		var sido = document.querySelector('select[name=sido] option:checked');
		var collect = vaccination_list_groupby[sido.value];
		var text = '';
		
		
		var last = collect[collect.length - 1];
		var title = '';
		title += last['date'] + "까지 " + last['city_name'] + "의 접종률 : ";
		title += (parseInt(last['total_count']) / parseInt(last['population_count'])*100 ).toFixed(2) + ' %';
		document.getElementById('title').innerHTML = title;
		document.getElementById('modal_title').innerHTML = '<h2>' + sido.innerText + '</h2>';
		
		//text += '<thead>'
		text += '	<tr>'
		text += '		<th>' + "날짜" + '</td>';
		text += '		<th>' + "1차 접종수" + '</td>';
		text += '		<th>' + "2차 접종수" + '</td>';
		text += '		<th>' + "전체 접종수" + '</td>';
		text += '		<th>' + "지역인구수" + '</td>';
		text += '		<th>' + "접종률" + '</td>';
		text += '	</tr>'
		//text += '</thead>'
		//text += '<tbody>'

		
		for (var i=0; i<collect.length; i++) {
			
	        var vaccination_rate = 
	            (parseInt(collect[i]['total_count']) / parseInt(collect[i]['population_count'])*100 ).toFixed(2)
	         
           	var weekend = new Date(collect[i]['date']);
            
         	var style = "";
         	if (weekend.getDay() == 6 ) {
            	style="primary--text"
            
         	}
         	else if(weekend.getDay() == 0 ) {
            	style="error--text"
         	}
            
         	text += '<tr>'
         	text += '	<td class="' + style + ' ">' + collect[i]['date']  + '</td>';
			text += '	<td>' + parseInt(collect[i]['primary_count']).toLocaleString() + '</td>';
			text += '	<td>' + parseInt(collect[i]['secondary_count']).toLocaleString() + '</td>';
			text += '	<td>' + parseInt(collect[i]['total_count']).toLocaleString() + '</td>';
			text += '	<td>' + parseInt(collect[i]['population_count']).toLocaleString() + '</td>';
			text += '<td>' + vaccination_rate + ' % </td>';
		}
		//text += '</tbody>'

		var table = document.getElementById('result');
		document.getElementById('details_btn').style.display = 'block';
		
		
		table.innerHTML = text;
		
		// 차트를 다시 그립니다.
		var name = cityIdToName(sido.value);
		
		last_vaccination_by_city_new = [['시도명', '접종률'], ...last_vaccination_by_city.filter(s => {
			if (s[0] == name)
				return true;
			else
				return false;
		})];
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		
		
		// 프로그래스 진행바를 다시 그립니다.
		resetProgress();
	}
	

	// 구글 차트 시작	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	
	var last_vaccination_by_city = [['시도명', '접종률']];
	var last_vaccination_by_city_new;
	var group_key = Object.keys(vaccination_list_groupby);
	
	for (var i=0; i<group_key.length; i++) {
		var data = vaccination_list_groupby[group_key[i]][vaccination_list_groupby[group_key[i]].length - 1];
		
		last_vaccination_by_city.push([ data['city_name'],  Math.floor((data['total_count'] / data['population_count']) * 100) ]);
	}
	last_vaccination_by_city_new = last_vaccination_by_city;

	function drawVisualization() { 
		var data = google.visualization.arrayToDataTable(last_vaccination_by_city_new);
		var options = {
				title : '시도별 백신접종 현황 ',
				vAxis: {title: '시도명'},
				hAxis: {title: '비율'}, 
				seriesType: 'bars',
				series: {5: {type: 'line'}},
				animation: {
					startup: true,
			        duration: 600,
			        easing: 'out',
			    },
				height: last_vaccination_by_city_new.length * 20 + 40
			};
		
		var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	function cityIdToName(id) {

		var result = '';
		switch (id){
	      case '2' :
	    	  result = '제주';
	          break;
	      case '3':
	          result = '경남';
	          break;
	      case '4' :
	    	  result = '경북';
	          break;
	      case '5' :
	    	  result = '전남';
	          break;
	      case '6' :
	    	  result = '전북';
	          break;
	      case '7' :
	    	  result = '충남';
	          break;
	      case '8' :
	    	  result = '충북';
	          break;
	      case '9' :
	    	  result = '강원';
	          break;
	      case '10' :
	    	  result = '경기';
	          break;
	      case '11' :
	    	  result = '세종';
	          break;
	      case '12' :
	    	  result = '울산';
	          break;
	      case '13' :
	    	  result = '대전';
	          break;
	      case '14' :
	    	  result = '광주';
	          break;
	      case '15' :
	    	  result = '인천';
	          break;
	      case '16' :
	    	  result = '대구';
	          break;
	      case '17' :
	    	  result = '부산';
	          break;
	      case '18' :
	    	  result = '서울';
	          break;
	          
	    }
		return result;

	}
	
	function resetProgress() {
		document.getElementById('progress-bar').classList.remove('animation')
		document.getElementById('progress-bar').style.width = 0;
		
		setInterval(function() {
			document.getElementById('progress-bar').classList.add('animation');
			document.getElementById('progress-bar').style.width = '100%';
		},100);
		
	}
</script>

<div id="modal-section"></div>
<div id="root">
    <main class="covid-main pt-5">

        <jsp:include page="../header.jsp" />

        <div class="card mb-4-2">
        
            <div class="card-content text-center">
               	<div class="left" style="height: fit-content; padding: 8px;">
               		<h1 style="color: #070707;">시도별 백신현황</h1>
               	</div>
               	
               	<div class="right">
               		<select name="sido" onchange="view(this)" id="sidoid" style="font-size: 19px;">
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
               	</div>
               	
            </div>
            
            <hr style="margin:0" class="active animation progress-0" id="progress-bar"/>
            
            
            <div class="card-content text-center mt-4" style="place-content: center;">
               	<table id="title" ></table>
            </div>
            
                    	
        	<div class="card-content text-center mt-4" style="place-content: center;">
        		<button id="details_btn" style="display: none;" onclick="document.getElementById('modal').style.display='block'">상세정보</button>
        	</div>
        </div>
        
        
        
        <div class="card mb-4-2">
        	<div class="card-content text-center mt-4" style="place-content: center;">
        		<div id="chart_div" style="width: 100%; height: fit-content"></div>
        	</div>

        </div>
        

    </main>
</div>
<script src="/static/index.js"></script>


<!-- 결과 모달 -->
<div class="w3-container">

	<div id="modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			<div id="modal_title" class="card-content text-center" style="place-content: center;"></div>
      
			<div class="card-content text-center" style="place-content: center;">
            	<div id="details" align="center">
					<table id="result" class="fixed_headers" style="width: fit-content;"></table>
				</div>
            </div>
    	</div>
  	</div>
</div>

<script>
resetProgress();
</script>

</body>
</html>