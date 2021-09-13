<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Covid 19 분석 및 게시판</title>
</head>
<body>

<div id="modal-section"></div>
<div id="root">
    <main class="covid-main py-5">

        <jsp:include page="header.jsp"/>

        <div class="card py-2 mb-4-2">
            <div class="card-title py-1 text-right">
                <div class="text--11px">
                    <span class="update-date">로딩중</span>
                </div>
            </div>
            <div class="card-content text-center">
                <div class="flex flex-direction gap-y-2">
                    <h5>
                        확진자
                    </h5>
                    <span class="infected-count text-weight-bold error--text">로딩중</span>
                    <span class="infected-count-cha text-weight-bold radius text--11px">로딩중↓</span>
                </div>
                <div class="flex flex-direction gap-y-2">
                    <h5>
                        사망자
                    </h5>
                    <span class="deaths-count text-weight-bold">로딩중</span>
                    <span class="deaths-count-cha text-weight-bold radius text--11px">로딩중↓</span>
                </div>
                <div class="flex flex-direction gap-y-2">
                    <h5>
                        완치자
                    </h5>
                    <span class="healing-count text-weight-bold success--text">로딩중</span>
                    <span class="release-from-quarantine-count-cha text-weight-bold radius  text--11px">로딩중↓</span>
                </div>
                <div class="flex flex-direction gap-y-2">
                    <h5>
                        검사자
                    </h5>
                    <span class="examine-count text-weight-bold primary--text">로딩중</span>
                    <span class="examine-count-cha text-weight-bold radius text--11px">로딩중↑</span>
                </div>
            </div>
        </div>


        <div class="card py-2 mb-4-2">
            <div class="card-content align-items-center text-center">
                <div>
                    <h6 class="mb-3 tex">오늘 확진자 수</h6>
                    <h1 class="text--32px">
                        <span class="now-infect-count dark--text text-weight-bold"></span> 명
                    </h1>
                </div>
                <div class="flex flex-direction text--11px">
                    <div class="my-2 flex justify-content-space-between gap-x-1">
                        <span>vs 어제</span>
                        <span class="day-before-status text-weight-bold radius">로딩중</span>
                    </div>
                    <div class="my-2 flex justify-content-space-between gap-x-1">
                        <span>vs 1주전 </span>
                        <span class="week-ago-status text-weight-bold radius">로딩중</span>
                    </div>
                </div>
                <div class="flex flex-direction text--11px">
                    <div class="my-2 flex justify-content-space-between gap-x-1">
                        <span>vs 2주전</span>
                        <span class="two-week-ago-status text-weight-bold radius">로딩중</span>
                    </div>
                    <div class="my-2 flex justify-content-space-between gap-x-1">
                        <span>vs 1달전 </span>
                        <span class="month-ago-status text-weight-bold radius">로딩중</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="card py-2 mb-4-2">
            <select id="period" class="ml-3 mt-3 mb-5" onchange="changeChartData(this.value)" disabled="disabled">
                <option value="day">
                    일별
                </option>
                <option value="week">
                    주별
                </option>
                <option value="month">
                    월별
                </option>
                <option value="acc">
                    누적
                </option>
            </select>

            <div id="chart"></div>
        </div>

    </main>
</div>

<script src="/utils/lodash.min.js"></script>
<script src="/utils/moment.min.js"></script>
<script src="/utils/moment-with-locales.js"></script>
<script> moment.locale('ko');</script>

<script>
    getCovidStatus();
    getCovidStatusAll();
</script>

</body>
</html>

