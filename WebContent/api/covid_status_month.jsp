
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="corona.CoronaDao" %>
<%@ page import="corona.CoronaDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    try {
        CoronaDao dao = new CoronaDao();
        List<CoronaDto> coronaDtoList = dao.findAll();
        ObjectMapper mapper = new ObjectMapper();

        String jsonString = mapper.writeValueAsString(coronaDtoList);
        System.out.println(jsonString);

        out.print(jsonString);

    } catch (Exception e) {
        e.printStackTrace();
    }
%>


