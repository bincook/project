import requests
import xmltodict as xml
import pymysql

"""
    코로나19 시·도발생 현황 API 를 이용하여 DB `korea city` 테이블에 데이터를 저장하는 코드입니다
    
    공공데이터활용지원센터_보건복지부 코로나19 시·도발생 현황
    API 사이트 :https://www.data.go.kr/data/15043378/openapi.do
"""

url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?'
serviceKey = 'serviceKey=E2AIG73d7Y%2FKsCqGf%2B42o2jh%2BD1uLdYlwQWZL1f%2F7etZLLHFcuzZgbpXK7F7wQeq4tJqVMRLF4YQi%2Fdbu6st9g%3D%3D'
pageNo = '&pageNo=1'
numOfRows = '&numOfRows=10'
startCreateDt = '&startCreateDt=20200401'
endCreateDt = '&endCreateDt=20200401'

res = requests.get(url + serviceKey + pageNo + numOfRows + startCreateDt + endCreateDt)
dictRes = xml.parse(res.text)

h = '26.168.126.112'; u = 'ysj'; p = '1234'; d = 'test'; c = 'utf8'
conn = pymysql.connect(host=h, user=u, password=p, db=d, charset=c)

curs = conn.cursor()
sql = "insert into `korea city` (name_ko, name_en) values (%s, %s)"

for item in dictRes['response']['body']['items']['item']:
    if (item['gubun'] == '합계'):
        continue
    else:
        gubun = item['gubun']
        gubun_en = item['gubunEn']
        print(gubun, gubun_en)
        curs.execute(sql, (gubun, gubun_en))

conn.commit()
conn.close()


