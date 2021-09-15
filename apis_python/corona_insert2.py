import requests
import xmltodict
import json
import pymysql as my

# 공공데이터활용지원센터_보건복지부 코로나19 감염 현황
# API 사이트 : https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15043376

# DB 연결
conn = my.connect(host="26.168.126.112",
           user ="kyb",
           password="1234",
           db="guro_project_1",
           charset="utf8")
# 2 cursor 생성
cur = conn.cursor(my.cursors.DictCursor)

# 3 insert Query
sql = """ insert into `covid status` (infected_count,
                                deaths_count,    							
                                examine_count,								
                                negative_count,						 				
                                healing_count,							
                                release_from_quarantine_count,					
                                accumulated_inspection_count,				 
                                accumulated_inspection_comp_count,            
                                accumulated_infected_rate,					 
                                date) 
values ({}, {}, {}, {}, {}, {}, {}, {}, {},{} )"""

url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?'
serviceKey = 'serviceKey=Z9bsijxgPdovM7xlVFn4UQuqlttpM361%2Bt9lxtVewfXvIWHKOlTLbXQC%2BC6mFgWE%2FR7dkFJgsVmxsoZZxFy9FA%3D%3D'

pageNo = '&pageNo=1'
numOfRows = '&numOfRows=10'
startCreateDt = '&startCreateDt=20210912'
endCreateDt = '&endCreateDt=20210912'

res = requests.get(url + serviceKey + pageNo + numOfRows + startCreateDt + endCreateDt)

dictRes = xmltodict.parse(res.text)


jsonRes = json.dumps(dictRes)


items = dictRes['response']['body']['items']['item']


for item in items:

    infected_count = item.get('decideCnt')
    deaths_count = item.get('deathCnt')
    examine_count = item.get('examCnt')
    negative_count = item.get('resutlNegCnt')
    healing_count = item.get('careCnt')
    release_from_quarantine_count = item.get('clearCnt')
    accumulated_inspection_count = item.get('accExamCnt')
    accumulated_inspection_comp_count = item.get('accExamCompCnt')
    accumulated_infected_rate = item.get('accDefRate')
    date = item.get('stateDt')

    cur.execute(sql.format(infected_count,
                            deaths_count,
                            examine_count,
                            negative_count,
                            healing_count,
                            release_from_quarantine_count,
                            accumulated_inspection_count,
                            accumulated_inspection_comp_count,
                            accumulated_infected_rate,
                            date
                            ))

conn.commit()
conn.close()
