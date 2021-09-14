<%@ page import="map.dto.Category" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String servletPath = request.getServletPath();
    int sliceIndex = servletPath.lastIndexOf("/");
    String fileName = servletPath.substring(sliceIndex);

    List<Category> categories = Arrays.asList(
            Category.of("/index.jsp", "국내"),
            Category.of("/clinic/clinic.jsp", "진료소"),
            Category.of("/vaccination_status/vaccination_status.jsp", "백신"),
            Category.of("/covid_status/index.jsp", "거리두기")
    );
%>

<!-- w3 css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- custom css -->
<link rel="stylesheet" href="/static/index.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="/static/index.js"></script>
<script>
	function loginModal() {
		modalClose();
		document.getElementById('login-modal').style.display='block';
	}
	
	function signModal() {
		document.getElementById('login-modal').style.display='none';
		document.getElementById('sign-modal').style.display='block';
	}
</script>

<%
	boolean isLogin = (session != null && session.getAttribute("email") != null);
%>

<!-- 로그인 모달 -->
<div class="w3-container">

	<div id="login-modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:300px">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('login-modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			<div class="card-content text-center mt-3" style="place-content: center;">
            	<jsp:include page="/sign/sign-in.jsp"/>
            </div>
    	</div>
  	</div>
</div>

<!-- 회원가입 모달 -->
<div class="w3-container">

	<div id="sign-modal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:400px">

			<div class="w3-center"><br>
				<span onclick="document.getElementById('sign-modal').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
			</div>
			
			<div class="card-content text-center mt-3" style="place-content: center;">
            	<jsp:include page="/sign/sign-up.jsp"/>
            </div>
    	</div>
  	</div>
</div>

<div class="korea_covid_container">
	<div class="korea_covid_status" onclick="window.open('/covid_status_city/city_status.jsp', '_blank', 'width=1600, height=1000')">
		
	</div>
</div>

<header class="card mb-4-2">
    <div class="menu-title">
        <h2 class="visible-hidden w24">
        </h2>
        <h2 class="dark--text text-weight-bold">
            Covid <span class="error--text">19</span>
        </h2>
        <h2>
        	<%
        		if (isLogin) {
        	%>
        			<button class="icon" type="button" onclick="modalOpen(true)">
		                <%@ include file="icon/mdi-menu.jsp" %>
		            </button>
        	<%
        		} else {
        	%>
        			<button class="icon" type="button" onclick="modalOpen(false)">
		                <%@ include file="icon/mdi-menu.jsp" %>
		            </button>
        	<%
        		}
        	%>
            
        </h2>
    </div>
    <div class="card-content pt-2 pb-1 text-weight-bold text-center">
        <%
            for (Category category : categories) {
                boolean isActivate = category.isActivate(fileName);
        %>
        <a class="text-decoration-none flex-1" href="<%= category.getServletPath()%>">
            <h4 class="card-content-item py-1 <%= isActivate ? "active" : "" %>">
                <span class="inline-block">
                    <%= category.getName() %>
                </span>
            </h4>
        </a>
        <%
            }
        %>
    </div>
</header>