function modalOpen() {
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
    html += '                <a class="list-item text-decoration-none" href="#">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>목록</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="#">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>목록</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="#">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>목록</div>'
    html += '                </a>'
    html += '                <a class="list-item text-decoration-none" href="#">'
    html += '                       <svg style="width:24px;height:24px" viewBox="0 0 24 24">'
    html += '                             <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />'
    html += '                       </svg>'
    html += '                       <div>목록</div>'
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

    var xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var covidStatus = JSON.parse(xhttp.responseText)
            console.log(covidStatus)

            updateCovidStatus(covidStatus)
        }
    };
    xhttp.open('GET', 'http://localhost:8080/api/covid_status.jsp')
    xhttp.send()
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


    // 증가인지 감소인지 판단여부가 필요해보입니다
    infectedCountCha.innerText = obj['infected_count_cha'].toLocaleString() + ' ?';
    deathsCountCha.innerText = obj['deaths_count_cha'].toLocaleString() + ' ?';
    releaseFromQuarantineCountCha.innerText = obj['release_from_quarantine_count_cha'].toLocaleString() + ' ?';
    examineCountCha.innerText = obj['examine_count_cha'].toLocaleString() + ' ?';
}

function getCovidStatusMonth() {
    var xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var covidStatus = JSON.parse(xhttp.responseText)
            console.log(covidStatus)

            drawMap(covidStatus)
        }
    };
    xhttp.open('GET', 'http://localhost:8080/api/covid_status_month.jsp')
    xhttp.send()
}


function drawMap(obj) {

    var options = {
        series: [
            {
                name: '누적 확진자',
                data: obj.map(covid => covid['infected_count'])
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
            text: '누적 감염수',
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
            categories: obj.map(covid => new Date(covid['date']).getTime()),
            labels: {
                format: 'MM.dd'
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

    var chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();
}

window.onload = function () {
    getCovidStatus()
    getCovidStatusMonth()
}



