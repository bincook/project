import pymysql

h = '26.168.126.112';u = 'ysj';p = '1234';d = 'guro_project_1';c = 'utf8'
conn = pymysql.connect(host=h, user=u, password=p, db=d, charset=c)
curs = conn.cursor()

# 도시 아이디 | 발생시기 | 제목 | 설명 | 링크
sql = """
INSERT INTO `issue` (
    city_id,
    occurrence_date,
    title,
    description,
    link
)
VALUES (%s, %s, %s, %s, %s)
"""

curs.execute(sql, (2, '2021-05-23', '한미 글로벌 백신 파트너십 구축합의', '한미 양국 정부 및 기업간 백신생산, 원부자재 공급, 과학기술 등 포괄적 협력 합의, 한미 배신 파트너십, 행사 개최(5.22), 백신 협력 위한 총 4건 계약 및 양해각서 체결', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-21', '수도권 2단계, 비수도권 1.5단계 거리두기 3주간 유지(5.24~6.13)', '05.22부터 75세 이상 어르신 화이자 백신 1차 접종, 화이자 29.7만 회분 추가 도입', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-19', '요양병원 집단감염 사례에서 접종자는 감염되지 않는 등 백신 접종 효과 증명', '건설현장 코로나 19 확산방지를 위한 방역 관리 실태 점검 등 실시', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-16', '2분기 계약 AZ백신 106.8만회분 안동공장서 순차적 출고(05.17)', '모임과 음주가 많은 음식점, 춤추기 등 방역 수칙 위반 우려가 잇는 유흥시설 집중점검', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-14', '전남, 동부권 특별방역대책 수립 및 거리 두기 2단계 격상을 통한 유행확산 억제', '실내 체육시설 및 방문판매 분야 방역 점검 등 감염 취약시설 방역관리', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-12', '5월 13일 부터 60~64세 어르신 예방접종 예약 시작', '코로나19 대응 원소속 의료인력 지원을 위한 감염관리 지원금 추진, 2분기 83.5만회분 AZ백신 도입', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-09', '5월 10일 부터 65~69세 어르신 예방접종 예약 시작', '부처님 오신날 연등행사 비대면 전환 등 종교계 자발적 방역 강화 노력, 코로나19 사망자의 95%는 60세 이상 어르신, 예방접종 86.6%로 높은 예방효과', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-07', '경북 거리두기 개편안 시범적용 지역 인구 100만 명당 하루 평균 2명 발생', '어린이집 감염 확산방지를 위해 장관책임제, 민관협업 등 방역 관리 강화', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-05', '5월 5일 부터 70~74세 어르신 예방접종 예약 시작', '만성 중증 호흡기 질환자는 5월 6일, 유치원, 초교 저학년 교사는 5월 13일 부터 예약시작', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-05-02', '전남 사회적 거리 두기 개편(안) 시범 실시, 1단계 적용(5.3~5.9)', '시설별 장관책임제(9,714개소), 정부합동점검단(8,586개소) 점검 완료, 계획대로 차질없이 점검 추진예정', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-04-30', '수도권 2단계, 비수도권 1.5단계 거리두기 3주간 유지(5.3~5.23)', '유행이 적정 관리되는 경우 7월부터 거리 두기 개편 진행, 75%이상 접종한 요양벙원, 시설 종사자 검사주기 완화, 특별 방역관리주간(5.3~5.9) 1주일 연장', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-04-25', '특별 방역관리주간 운영(4.26~5.2)', '집단 감염의 약 50%가 다중이용시설 감염, 22시 운영제한 업종 비중 증가, 공공부문 재택근무, 시차출퇴근 제도 확대 적용, 불필용한 회식, 모임금지', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-04-23', '시설별 장관책임제 운영(4.15~), 체육 종교 유흥시설 등 9대 취약', '확진자 일 1명 이하 경북 12개 군 사회적거리 두기 개편안 1단계 시점적용(4.26~5.2)', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-04-21', '코로나19 한시 생계 지원비 지급(온라인접수 5.10~5.28)', '지원대상 코로나19로 인해 소득이 감소, 생계에 지장, 타 복지제도 및 코로나19 지원프로그램을 받지 못하는 저소득 가구 대상, 저소득층 가구당 50만원 지원', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-04-18', '음식점, 주점, 실내체육시설 등 다중이용시설 감염 증가', '고령층 예방접종 진행될수록 중증환자 감소, 의료체게 여력 안정적 확보, 목욕장업, 어린이집 등 감염 위험시설 방역 관리 강화', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
curs.execute(sql, (2, '2021-04-16', '수도권, 부산지역 유증상자에 대한 의사, 약사 권고 시 진단검사 의무 행정명령 시행', '택배, 유동시설, 관계부처, 지자체 합동점검 주 2회 확대 및 자체점검 강화, 9대 취약시설 위반사항에 대해 집합금지, 과태료 부과 등 무관용 원칙 적용', 'http://ncov.mohw.go.kr/lastBannerList.do?brdId=3&brdGubun=39&dataGubun=4&ncvContSeq=&contSeq=&board_id=&gubun='))
conn.commit()
conn.close()