<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
                <h1>카드</h1>
            </div>
        </div>

        <div class="card py-5">
            <div class="card-content text-center">
                <h1>카드</h1>
            </div>
        </div>

    </main>
</div>
<script src="/static/index.js"></script>
</body>
</html>


