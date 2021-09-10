<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="map.dao.ReservationDao"%>
<%@page import="map.dto.ClinicTimeDto"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.sql.Timestamp"%>
<%

String id_str = (String)request.getParameter("clinic_id");
String capacity_str = (String)request.getParameter("capacity");
String start_date = (String)request.getParameter("start_date");
String start_time = (String)request.getParameter("start_time") + ":00";
String end_date = (String)request.getParameter("end_date");
String end_time = (String)request.getParameter("end_time") + ":00";


Integer clinic_id = Integer.parseInt(id_str);
Integer capacity = Integer.parseInt(capacity_str);
Timestamp start = Timestamp.valueOf(start_date + " " + start_time);
Timestamp end = Timestamp.valueOf(end_date + " " + end_time);
	
ClinicTimeDto dto = new ClinicTimeDto();
dto.setCapacity(capacity);
dto.setClinic_id(clinic_id);
dto.setStart_date(start);
dto.setEnd_date(end);

ReservationDao repository = new ReservationDao();
repository.save(dto);
%>


<script>
	alert('등록이 완료 되었습니다.');
	location.href = 'index.jsp';
</script>


