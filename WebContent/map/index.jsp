<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="map.dao.ReservationDao"%>
<%@page import="map.dto.ClinicDto"%>
<%@page import="map.dto.ClinicTimeDto"%>
<%@page import="java.util.List"%>
<%@page import="map.dao.TempSession"%>

<%
	HttpSession tempSession = TempSession.getMemberSession(request);
	boolean isAdmin = (boolean) tempSession.getAttribute("isAdmin");
	boolean isLogin = true;
	int memberId = 2;
	
	ReservationDao repository = new ReservationDao();
	List<ClinicDto> list = repository.findAllClinic();
	repository.settingTodayTimeTable(list);
%>
<html>
<head>
    <title>Index Page</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<style>
		.time {
			padding: 8px;
    		border: 1px solid gray;
		}
		.time:hover {
			background-color: #f1f1f1;
			cursor: pointer;
		}
	</style>
</head>
<body>


<div class="w3-container">

  <div id="modal" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">


      <div class="w3-center"><br>
        <span onclick="document.getElementById('modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
      </div>

<%
	if (isAdmin) {
%>
		<!-- 시간 등록 폼 -->
      <form class="w3-container" action="./register_clinic_time.jsp">
        <div class="w3-section">

      		<input class="w3-input w3-border w3-margin-bottom" type="hidden" name="clinic_id" id="clinic_id">
        
        
          <label><b>start date</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="date" name="start_date" required>
          <input class="w3-input w3-border w3-margin-bottom" type="time" name="start_time" required>
          
          <label><b>end date</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="date" name="end_date" required>
          <input class="w3-input w3-border w3-margin-bottom" type="time" name="end_time" required>
          
          <label><b>capacity</b></label>
          <input class="w3-input w3-border" name="capacity" type="number" placeholder="Enter capacity" required>
          
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">등록</button>

        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('modal').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>

      </div>
<%
	} else {
%>
		<!-- 시간 예약 폼 -->
      <form class="w3-container" action="./register_reservation.jsp">
        <div class="w3-section">

      		<input class="w3-input w3-border w3-margin-bottom" type="hidden" name="clinic_time_id" id="clinic_time_id">
      		<input class="w3-input w3-border w3-margin-bottom" type="hidden" name="member_id" id="member_id" value="<%=memberId%>">
        
        	<label><b>area code</b></label>
        	<br />
          	<input class="w3-input w3-border w3-margin-bottom" type="number" name="phone_area_code" required>
          	<label><b>number</b></label>
        	<br />
          	<input class="w3-input w3-border w3-margin-bottom" type="number" name="phone_number" required>
          	<label><b>dialing code</b></label>
        	<br />
          	<input class="w3-input w3-border w3-margin-bottom" type="number" name="phone_dialing_code" required>
        	<!-- 정말 이 시간으로 예약 하실래요? -->
			
			
			<button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">예약</button>
        </div>
      </form>

<%
	}
%>


    </div>
  </div>
</div>


<!-- timeList 확인 모달 -->
<div class="w3-container">

  <div id="timeList" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
    
      <div class="w3-center" style="min-height:52px"><br>
        <span onclick="document.getElementById('timeList').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
      </div>
		
		
		<div class="w3-section" id="timetable"></div>
		
    </div>
  </div>
</div>

<div id="map" style="width:100%;height:80vh;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8865b0b62328d18ad61dcbd299d470b0"></script>
<script>



<%
	if (list.size() > 0) {
%>
		var longitude = <%=list.get(0).getLongitude() %>;
		var latitude = <%=list.get(0).getLatitude() %>;
<%
	} else {
%>
		var longitude = 33.450701;
		var latitude = 126.570667;
<%
	}
%>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(longitude, latitude), // 지도의 중심좌표
    level: 9 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
<%
	for (ClinicDto dto : list) {
%>
		{
		    title: '<%=dto.getName()%>', 
		    latlng: new kakao.maps.LatLng(<%=dto.getLongitude()%>, <%=dto.getLatitude()%>),
		    info: {
		    	id: '<%=dto.getClinic_id()%>',
		    	name: '<%=dto.getName()%>',
		    	address: '<%=dto.getAddress()%>',
		    	time: [
		    		<%
		    			for (ClinicTimeDto time : dto.getTodayTimeList()) {
			    	%>
				    		{
				    			clinic_time_id: '<%=time.getClinic_time_id()%>',
				    			start_date: '<%=time.getStart_date()%>',
				    			end_date: '<%=time.getEnd_date()%>',
				    			capacity: '<%=time.getCapacity()%>'
				    		}
			    	<%
		    			}
			    	%>
		    	]
		    },
		},
<%
	}
%>
];

var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {

	var imageSize = new kakao.maps.Size(24, 35); 
	 
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
	var marker = new kakao.maps.Marker({
	    map: map,
	    position: positions[i].latlng,
	    title : positions[i].title,
	});
	
	// 어쩔 수 없다.. 데이터 강제로 넣어줌
	var info = {
		info: positions[i].info
	};
	Object.assign(marker, info);
	
	<%
		if (isAdmin && isLogin) {
	%>
		kakao.maps.event.addListener(marker, 'click', function() {
			document.getElementById('modal').style.display='block';
			document.getElementById('clinic_id').value=this.info.id;
	  	});
	<%
		} else if (!isAdmin && isLogin) {
	%>
		kakao.maps.event.addListener(marker, 'click', function() {
			document.getElementById('timeList').style.display='block';
			
			
			// 타임 테이블 만큼 예약표 그려주기 => timetable
			var timeList = this.info.time;
			
			var html = '';
			for (i=0; i<timeList.length; i++) {
				html += '<div class="time" onclick="check_register(' + timeList[i]['clinic_time_id'] + ')">';
				html += '<span class="order">' + (i+1) + '. </span>';
				html += '<span class="description">' + timeList[i]['start_date'] + ' ~ ' + timeList[i]['end_date'] + '</span>';
				html += '</div>';
			}
			
			document.getElementById('timetable').innerHTML = html;
	  	});
	<%
		}
	%>
}


function check_register(time_id) {
	document.getElementById('clinic_time_id').value = time_id;
	document.getElementById('timeList').style.display = 'none';
	document.getElementById('modal').style.display = 'block';
}
</script>

</body>
</html>

