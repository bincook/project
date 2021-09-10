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

    updateDate.innerText = obj['date'] + ' 업데이트';
    infectedCount.innerText = obj['infected_count'];
    deathsCount.innerText = obj['deaths_count'];
    healingCount.innerText = obj['healing_count'];
    examineCount.innerText = obj['examine_count'];
}

window.onload = function () {
    getCovidStatus()
};

