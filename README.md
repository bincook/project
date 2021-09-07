<h1 align="center"> Covid-19 데이터 분석 및 게시판 </h1>
-
---

![img](./covid.jpg)

<br>

### 📌 팀원소개
|🤴 김동현|🧔 김영빈|👨 윤성재|👩 송주은|👩‍🦰 홍은주|🧑🏻 황병화|
|---|---|---|---|---|---|

<br>

### 📌 기술스택
`JAVA 8` | `JSP` | `MariaDB` | `Python 3.6 ↑` | `JavaScript ECM5`

<br>

### 📌 사용한 API
[공공데이터활용지원센터_보건복지부 코로나19 감염 현황](https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15043376)

[공공데이터활용지원센터_코로나19 예방접종 통계 데이터 조회 서비스](https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15077756)

[공공데이터활용지원센터_코로나19 예방접종센터 조회서비스](https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15077586)

[공공데이터활용지원센터_보건복지부 코로나19 시·도발생 현황](https://www.data.go.kr/data/15043378/openapi.do)

[Corona-19-API](https://github.com/dhlife09/Corona-19-API)

[Kakao-Map-API](https://apis.map.kakao.com/web/documentation)

<br>

### 📌 요구사항 분석
[보러 가기](https://www.notion.so/8670b450cec54c76ba12792f36cf459d?v=72048d1f23ef41e099192a485a4bd586)

<br>

### 📌 폴더구조

<details>
<summary>Project Folder</summary>

```markdown
📦covide
┣ 📂src
┃ ┗ 📂corona
┃ ┃ ┣ 📜CoronaDao.java
┃ ┃ ┗ 📜CoronaDto.java
┣ 📂WebContent
┃ ┣ 📂clinic
┃ ┃ ┗ 📜clinic.jsp
┃ ┣ 📂covid_status
┃ ┃ ┣ 📜distance.jsp
┃ ┃ ┣ 📜domestic_status.jsp
┃ ┃ ┣ 📜gayo.jsp
┃ ┃ ┗ 📜world_status.jsp
┃ ┣ 📂covid_status_city
┃ ┃ ┗ 📜city_status.jsp
┃ ┣ 📂META-INF
┃ ┃ ┗ 📜MANIFEST.MF
┃ ┣ 📂sign
┃ ┃ ┣ 📜sign-in.jsp
┃ ┃ ┗ 📜sign-up.jsp
┃ ┣ 📂utils
┃ ┃ ┗ 📜util.js
┃ ┣ 📂vaccination_status
┃ ┃ ┗ 📜vaccination_status.jsp
┃ ┣ 📂WEB-INF
┃ ┃ ┗ 📂lib
┃ ┃ ┃ ┗ 📜mysql-connector-java-5.1.40-bin.jar
┃ ┣ 📜index.jsp
┃ ┗ 📜top.jsp
┣ 📜.classpath
┣ 📜.gitignore
┣ 📜.project
┣ 📜corona.iml
┗ 📜README.md
```
`ㄴ2021.09.08 update`
</details> 





