<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="map.dao.ReservationDao"%>
<%@page import="map.dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="map.dao.TempSession"%> 




<%
	
	
	boolean isAdmin = false;
	boolean isLogin = (session != null && session.getAttribute("email") != null);
	int memberId = 0;
	
	if (isLogin) {
		memberId = (int)session.getAttribute("member_id");
		isAdmin = (boolean) session.getAttribute("isAdmin");
	}
	
	ReservationDao repository = new ReservationDao();
	List<ReservationDto> dtos = repository.findAllReservation();
	
	
	
%>
<html>
<head>
    <title>Covid 19 분석 및 게시판</title>
    <link rel="stylesheet" href="/static/index.css">

</head>
<body>

<div id="modal-section"></div>
<div id="root">
    <main class="covid-main pt-5">

        <jsp:include page="../header.jsp" />

        <div class="card mb-4-2">
            <div class="card-content text-center">
            <jsp:include page="/clinic/info.jsp"/>
            </div>
        </div>
        
        <div class="card mb-4-2">
            <div class="card-content text-center">
                <h1>카드</h1>
            </div>
        </div>

		<div class="card py-2 mb-4-2 py-4">
        	<jsp:include page="/map/index.jsp"/>
        </div>
        
        
        <% 
        	if (isLogin && isAdmin) {
     	%>
     			<div class="card mb-4-2">
     	<%
        		for (ReservationDto dto : dtos) {
        %>
        
	        <!-- 관리자 예약 현황 확인 -->
            <div class="card-content text-center" style="border-bottom: 1px solid rgba(193, 193, 193, 0.314);">
            	<span class="clinic_name" style="color: #070707;"><%=dto.getClinic_name() %></span> : 
            	<span class="clinic_date" style="color: #178a17;"><%=dto.getStart_date() %></span> ~ 
            	<span class="clinic_date" style="color: #178a17;"><%=dto.getEnd_date() %></span>
                <span class="clinic_name"><%=dto.getFullnumber() %></span>
            </div>
	        
        <%
        		}
     	%>
     		</div>
     	<%
       		}
        %>
        

    </main>
</div>
<script src="/static/index.js"></script>
</body>
</html>


