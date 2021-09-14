var obj;

function modalOpen(isLogin) {

    var loginText = isLogin ? '로그아웃' : '로그인';
    var html = '';


    html += '   <div class="modal-blur"></div>'
    html += '    <div class="modal">'
    html += '        <div class="modal-title flex justify-content-space-between align-items-center mb-3">'
    html += '            <h2>'
    html += '                <button class="icon" type="button" onclick="modalClose()">'
    html += '                   <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                       <path fill="currentColor" d="M15.41,16.58L10.83,12L15.41,7.41L14,6L8,12L14,18L15.41,16.58Z" />'
    html += '                   </svg>'
    html += '                </button>'
    html += '            </h2>'
    html += '            <h5 class="text-weight-bold dark--text">메뉴</h5>'
    html += '            <h5 class="visible-hidden w40"></h5>'
    html += '        </div>'
    html += '        <div class="modal-content flex flex-direction">'
    html += '            <div class="list">'
    html += '                <a class="list-item text-decoration-none" href="javascript:loginModal()">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>' + loginText + '</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="/index.jsp">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>국내</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="/clinic/clinic.jsp">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>진료소</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="/vaccination_status/vaccination_status.jsp">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>백신</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="/covid_status/status_main.jsp">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>거리두기</div>'
    html += '                </a>'
    html += '            </div>'
    html += '        </div>'
    html += '    </div>'

    document.getElementById('modal-section').innerHTML = html
}

function modalClose() {
    document.getElementById('modal-section').innerText = ''
}


function getCovidStatus() {

    // var xhttp = new XMLHttpRequest()
    // xhttp.onreadystatechange = function () {
    //     if (xhttp.readyState === 4 && xhttp.status === 200) {
    //         var covidStatus = JSON.parse(xhttp.responseText)
    //
    //         updateCovidStatus(covidStatus)
    //     }
    // };
    // xhttp.open('GET', 'http://localhost:8080/api/covid_status.jsp')
    // xhttp.send()
}

function updateCovidStatus(obj) {
    var updateDate = document.querySelector('.update-date');
    var infectedCount = document.querySelector('.infected-count');
    var deathsCount = document.querySelector('.deaths-count');
    var healingCount = document.querySelector('.healing-count');
    var examineCount = document.querySelector('.examine-count');

    var infectedCountCha = document.querySelector('.infected-count-cha')
    var deathsCountCha = document.querySelector('.deaths-count-cha')
    var releaseFromQuarantineCountCha = document.querySelector('.release-from-quarantine-count-cha')
    var examineCountCha = document.querySelector('.examine-count-cha')

    updateDate.innerText = obj['date'] + ' 업데이트';
    infectedCount.innerText = obj['infected_count'].toLocaleString();
    deathsCount.innerText = obj['deaths_count'].toLocaleString();
    healingCount.innerText = obj['healing_count'].toLocaleString();
    examineCount.innerText = obj['examine_count'].toLocaleString();

    var inf = obj['infected_count_cha']
    var death = obj['deaths_count_cha']
    var release = obj['release_from_quarantine_count_cha']
    var exam = obj['examine_count_cha']

    var infStatus = countStatus(inf)
    var deathStatus = countStatus(death)
    var releaseStatus = countStatus(release)
    var examStatus = countStatus(exam)

    infectedCountCha.innerText = infStatus.content;
    infectedCountCha.classList.add(...infStatus.style)

    deathsCountCha.innerText = deathStatus.content;
    deathsCountCha.classList.add(...deathStatus.style)

    releaseFromQuarantineCountCha.innerText = releaseStatus.content;
    releaseFromQuarantineCountCha.classList.add(...releaseStatus.style)

    examineCountCha.innerText = examStatus.content;
    examineCountCha.classList.add(...examStatus.style)

}

function changeCount(count) {
    return Math.abs(count).toLocaleString()
}

function countStatus(count) {
    switch (true) {
        case (count < 0):
            return {
                style: ['primary--light-1', 'primary--text'],
                count: changeCount(count),
                content: changeCount(count) + '↓'
            }
        case (count > 0):
            return {
                style: ['error--light-1', 'error--text'],
                count: changeCount(count),
                content: changeCount(count) + '↑'
            }
        default:
            return {
                style: ['secondary--light-1', 'secondary--text'],
                count: changeCount(count),
                content: changeCount(count) + '-'
            }
    }
}

function getCovidStatusAll() {
    var xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var covidStatus = JSON.parse(xhttp.responseText)
            obj = covidStatus

            document.getElementById('period').disabled = ''

            drawMap(covidStatus)
        }
    };
    xhttp.open('GET', 'http://localhost:8080/api/covid_status_month.jsp')
    xhttp.send()
}


function drawMap(obj) {

    // 일일 확진자 구하기
    for (let i = 1; i < obj.length; i++) {
        obj[i]['infected_count_cha'] = obj[i]['infected_count'] - obj[i - 1]['infected_count']
        obj[i]['examine_count_cha'] = obj[i]['examine_count'] - obj[i - 1]['examine_count']
        obj[i]['deaths_count_cha'] = obj[i]['deaths_count'] - obj[i - 1]['deaths_count']
        obj[i]['release_from_quarantine_count_cha'] = obj[i]['release_from_quarantine_count'] - obj[i - 1]['release_from_quarantine_count']
    }

    var now = moment() // 현재
    var monthAgo = moment().subtract(1, 'month').add(1, 'days') // 한달 전
    var objMap = obj.slice(1).map(covid => ({
        infected_count_cha: covid['infected_count_cha'],
        date: covid['date']
    }))
    var filteredArr = objMap.filter(covid => moment(covid['date']).isBetween(monthAgo, now, undefined, '[]'))

    var nowInfectCountObj = filteredArr[filteredArr.length - 1]
    var nowInfectCountElem = document.querySelector('.now-infect-count')
    nowInfectCountElem.innerText = nowInfectCountObj.infected_count_cha.toLocaleString()

    var dayBeforeStatus = countStatus(nowInfectCountObj.infected_count_cha - filteredArr[filteredArr.length - 1 - 1].infected_count_cha)
    var dayBeforeElem = document.querySelector('.day-before-status')
    dayBeforeElem.classList.add(...dayBeforeStatus.style)
    dayBeforeElem.innerText = dayBeforeStatus.content

    var weekAgoStatus = countStatus(nowInfectCountObj.infected_count_cha - filteredArr[filteredArr.length - 1 - 7].infected_count_cha)
    var weekAgoElem = document.querySelector('.week-ago-status')
    weekAgoElem.classList.add(...weekAgoStatus.style)
    weekAgoElem.innerText = weekAgoStatus.content

    var twoWeekAgoStatus = countStatus(nowInfectCountObj.infected_count_cha - filteredArr[filteredArr.length - 1 - 7 * 2].infected_count_cha)
    var twoWeekAgoElem = document.querySelector('.two-week-ago-status')
    twoWeekAgoElem.classList.add(...twoWeekAgoStatus.style)
    twoWeekAgoElem.innerText = twoWeekAgoStatus.content

    var monthAgoStatus = countStatus(nowInfectCountObj.infected_count_cha - filteredArr[0].infected_count_cha)
    var monthAgoElem = document.querySelector('.month-ago-status')
    monthAgoElem.classList.add(...monthAgoStatus.style)
    monthAgoElem.innerText = monthAgoStatus.content


    updateCovidStatus(obj[obj.length - 1])

    var options = {
        series: [
            {
                name: '일별 확진자',
                data: filteredArr.map(covid => covid['infected_count_cha'])
            }
        ],
        chart: {
            height: 350,
            type: 'area',
            locales: [{
                "name": "ko",
                "options": {
                    "months": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    "shortMonths": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
                    "days": ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                    "shortDays": ["일", "월", "화", "수", "목", "금", "토"],
                    "toolbar": {
                        "exportToSVG": "다운로드 SVG",
                        "exportToPNG": "다운로드 PNG",
                        "exportToCSV": "다운로드 CSV",
                        "menu": "메뉴",
                        "selection": "Selection",
                        "selectionZoom": "선택 영역 확대",
                        "zoomIn": "확대",
                        "zoomOut": "축소",
                        "pan": "Panning",
                        "reset": "초기화"
                    }
                }
            }],
            defaultLocale: "ko"
        },
        title: {
            text: '일별 확진자',
            align: 'left'
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth'
        },
        xaxis: {
            type: 'datetime',
            categories: filteredArr.map(covid => new Date(covid.date).getTime()),
            labels: {
                datetimeFormatter: {
                    year: 'yyyy',
                    month: 'yyyy.MMM',
                    day: 'MMM.dd',
                    hour: 'HH:mm'
                }
            },
        },
        yaxis: {
            labels: {
                formatter: function (value) {
                    return value.toLocaleString();
                }
            },
        },
        tooltip: {
            x: {
                format: 'yy/MM/dd'
            },
        },
    };

    chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();
}

function changeChartData(value) {

    var now = moment() // 현재
    var monthAgo = moment().subtract(1, 'month').add(1, 'days') // 한달 전
    var yearAgo = moment().subtract(1, 'year').add(1, 'days')

    switch (value) {

        case 'day':
            var objMap = obj.slice(1).map(covid => ({
                infected_count_cha: covid['infected_count_cha'],
                date: covid['date']
            })) // return [일일감염자수, 날짜]

            // [ 이상 | ( 초과 | ] 이하 | ) 미만
            var filteredArr = objMap.filter(covid => moment(covid['date']).isBetween(monthAgo, now, undefined, '[)'))
            var c = filteredArr.map(covid => new Date(covid.date).getTime())
            var d = filteredArr.map(covid => covid['infected_count_cha'])

            // 차트 값 변경하기
            chart.updateOptions({
                xaxis: {
                    type: 'datetime',
                    categories: c,
                },
                series: [
                    {
                        name: '일별 확진자',
                        data: d
                    }
                ],
                title: {
                    text: '일별 확진자',
                },
            })

            chart.zoomX(c[0], c[c.length - 1])

            break;


        case 'week':
            var objMap = obj.slice(1).map(covid => ({
                infected_count_cha: covid['infected_count_cha'],
                date: covid['date']
            })) // return [일일감염자수, 날짜]
            var filteredArr = objMap.filter(covid => moment(covid.date).isBetween(monthAgo, now, undefined, '[]'))
            var groupByWeek = _.groupBy(filteredArr, (covid) => moment(covid.date).week());

            c = Object.values(groupByWeek).map(covid => new Date(covid[0].date).getTime())
            d = Object.values(groupByWeek).map(covid => covid[0].infected_count_cha)

            chart.updateOptions({
                xaxis: {
                    type: 'datetime',
                    categories: c,
                },
                series: [
                    {
                        name: '주별 확진자',
                        data: d
                    }
                ],
                title: {
                    text: '주별 확진자',
                },
            })
            chart.zoomX(c[0], c[c.length - 1])

            break;


        case 'month':
            var objMap = obj.slice(1).map(covid => ({
                infected_count_cha: covid['infected_count_cha'],
                date: covid['date']
            })) // return [일일감염자수, 날짜]
            var filteredArr = objMap.filter(covid => moment(covid.date).isBetween(yearAgo, now, undefined, '[]'))
            var groupByMonth = _.groupBy(filteredArr, (covid) => moment(covid.date).month());
            var sortedDataArr = Object.values(groupByMonth)
                .sort((a, b) => new Date(a[0].date).getTime() - new Date(b[0].date).getTime())


            c = sortedDataArr.map(covid => new Date(covid[0].date).getTime())
            d = sortedDataArr.map(covid => covid[0].infected_count_cha)

            chart.updateOptions({
                xaxis: {
                    type: 'datetime',
                    categories: c
                },
                series: [
                    {
                        name: '월별 확진자',
                        data: d
                    }
                ],
                title: {
                    text: '월별 확진자',
                },
            })

            chart.zoomX(c[0], c[c.length - 1])

            break;


        case 'acc':
            var objArr = obj.map(covid => ({
                infected_count: covid['infected_count'],
                date: covid['date']
            })) // return [일일감염자수, 날짜]
            chart.updateOptions({
                xaxis: {
                    type: 'datetime',
                    categories: objArr.map(covid => new Date(covid['date']).getTime())
                },
                series: [
                    {
                        name: '누적 확진자',
                        data: objArr.map(covid => covid['infected_count'])
                    }
                ],
                title: {
                    text: '누적 확진자',
                },
            })

            break;


        default:
            console.error('선택을 잘못하셨거나 없는 항목을 선택하셨습니다')
    }
}





