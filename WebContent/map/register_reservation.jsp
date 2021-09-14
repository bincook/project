<%@page import="map.dto.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="map.dao.ReservationDao"%>
<%

String id_str = (String)request.getParameter("clinic_time_id");
String member_id_str = (String)request.getParameter("member_id");
String phone_area_code = (String)request.getParameter("phone_area_code");
String phone_number = (String)request.getParameter("phone_number");
String phone_dialing_code = (String)request.getParameter("phone_dialing_code");

Integer clinic_time_id = Integer.parseInt(id_str);
Integer member_id = Integer.parseInt(member_id_str);
	
ReservationDto dto = new ReservationDto();
dto.setMember_id(member_id);
dto.setClinic_time_id(clinic_time_id);
dto.setPhone_area_code(phone_area_code);
dto.setPhone_number(phone_number);
dto.setPhone_dialing_code(phone_dialing_code);

ReservationDao repository = new ReservationDao();
repository.save(dto);
%>


<script>
	alert('예약이 완료 되었습니다.');
	location.href = '/clinic/clinic.jsp';
</script>


