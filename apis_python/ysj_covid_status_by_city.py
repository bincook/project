import requests
import xmltodict as a
import pymysql
import json

url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey='
serviceKey = 'E2AIG73d7Y%2FKsCqGf%2B42o2jh%2BD1uLdYlwQWZL1f%2F7etZLLHFcuzZgbpXK7F7wQeq4tJqVMRLF4YQi%2Fdbu6st9g%3D%3D'
pageNo = '&pageNo=1'
numOfRows = '&numOfRows=10'
for rate in range(9,10):
    startCreateDt = '&startCreateDt=2021090{}'.format(rate)
    endCreateDt = '&endCreateDt=2021090{}'.format(rate)

    res = requests.get(url + serviceKey + pageNo + numOfRows + startCreateDt + endCreateDt)
    # print(res)
    dictRes = a.parse(res.text)
    jsonRes = json.dumps(dictRes, ensure_ascii=False)
    # print(jsonRes)

    h = '26.168.126.112';u = 'ysj';p = '1234';d = 'guro_project_1';c = 'utf8'
    conn = pymysql.connect(host=h, user=u, password=p, db=d, charset=c)
    curs = conn.cursor()

    # 도시 아이디 | 감염자 수 | 격리해제 수 | 사망자수 | 감염률 | 기간 | 국내감염자 수 | 해외감염자 수
    sql = """
        INSERT INTO `covid status by city` (
            city_id,
            infected_count,
            healing_count,
            deaths_count,
            infected_rate,
            date,
            domestic_count,
            abroad_count
        )
        VALUES (%s, %s, %s, %s, %s, %s, 0, 0)
        """
    itemsOrigin = dictRes['response']['body']['items']['item']
    items = itemsOrigin[1:18]

    def city_id(x):
        if(x == '제주'):
            return int(2)
        elif(x == '경남'):
            return 3
        elif(x == '경북'):
            return 4
        elif(x == '전남'):
            return 5
        elif(x == '전북'):
            return 6
        elif(x == '충남'):
            return 7
        elif(x == '충북'):
            return 8
        elif(x == '강원'):
            return 9
        elif(x == '경기'):
            return 10
        elif(x == '세종'):
            return 11
        elif(x == '울산'):
            return 12
        elif(x == '대전'):
            return 13
        elif(x == '광주'):
            return 14
        elif(x == '인천'):
            return 15
        elif(x == '대구'):
            return 16
        elif(x == '부산'):
            return 17
        elif(x == '서울'):
            return 18

    for i in items:
        sum = 0
        for j in items:
            total = j['defCnt']
            sum = sum + int(total)
        gubun = i['gubun']
        cityid = city_id(gubun)
        infectedCnt = i['defCnt']
        isolClearCnt = i['isolClearCnt']
        deathCnt = i['deathCnt']
        infected_rate = int(infectedCnt) / sum
        date = i['createDt'][:10]
        curs.execute(sql, (cityid, infectedCnt, isolClearCnt, deathCnt, infected_rate * 100, date))
        # print("{} / {} / {} / {} / {} / {:.2f}% / {} / {}".format(cityid, gubun, infectedCnt, isolClearCnt, deathCnt, infected_rate*100, date, sum))
    conn.commit()
    conn.close()