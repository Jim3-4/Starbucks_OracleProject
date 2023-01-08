# 오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹



# 📖 Introduction

### 1.프로젝트 개요 

<img src="./images/main.png">

- 대기업의 정형화된 시스템에 주목하여 요구분석을 먼저 진행하였습니다. 
- 그 후에 개념적 , 논리적, 물리적 모델링을 진행하였습니다. 
- 업무를 분담하여 요구분석에 알맞는 쿼리를 작성하였습니다. 



### 2. 개발 환경

[![img](https://camo.githubusercontent.com/72a16edaf98ba33d67a3f49173e94e84ef711b5de4dfe629a4b613919987d712/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6f7261636c652d4638303030303f7374796c653d666f722d7468652d6261646765266c6f676f3d6f7261636c65266c6f676f436f6c6f723d7768697465)](https://camo.githubusercontent.com/72a16edaf98ba33d67a3f49173e94e84ef711b5de4dfe629a4b613919987d712/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6f7261636c652d4638303030303f7374796c653d666f722d7468652d6261646765266c6f676f3d6f7261636c65266c6f676f436f6c6f723d7768697465)



- 본프로젝트는 주로 PL/SQL을 사용하여 진행하였습니다. 

- ER-다이어그램은 draw.io를, ERD는 exERD를, 쿼리작성은 SQL Developer를 사용하였습니다.

  

## 🙋‍♂️함께한 팀원

- 김지민
- 김서영
- 박재영
- 안시은
- 이채영



## 📃개념적 모델링 

<img src="./images/r1.png">





## 🌞논리적 모델링
<a href="https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/2%EC%A1%B0_%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4_exerd.exerd">
 논리적 모델링 파일로 자세하게 보기 
</a>

<img src="./images/exerd.png">

 다음과 같이 설계하였습니다. 테이블은  총33개로 구성되어 있습니다.



## 🙋 My Role



**회원관련**

- 인증코드발행+일치하는지
- 회원가입
- 로그인
- 회원프로필
- 레벨출력
- 회원탈퇴
- 회원정보수정 패키지
- 영수증출력



**관리자관련**

- 매니저정보출력
- 게시글쓰기
- 게시글출력
- 메뉴등록
- 메뉴삭제
- 메뉴수정



**결제**

- 분할결제 



# 🔎 Detail

**주요코드 살펴보기**
😊코드링크를 클릭하시면 해당 코드의 깃허브 링크가 연결됩니다 😊

### 회원

 <br> <br>

✔️**개인정보수집에 대한 동의여부, 신상정보를** **입력받고** **랜덤한** **인증번호 발행** <br>
 [코드 링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1회원관련/1인증코드발행_일치하는지sql.sql) 

개인정보 수집에 대한 동의 여부를 텍스트로 입력하고, 신상정보를 입력받으면 바인드변수에 인증번호가 발생되고,
 dbms_output.put_line로 인증번호를 출력합니다.
 사용자는 대체변수를 입력하는 입력창에 인증번호를 입력하면 다음과 같이 일치하는지 확인합니다.



 바인드변수를 사용한 이유: 프로시저의 결과값을 다른 프로시저에도 사용하기 위해서 사용하였습니다.

authen_check 변수가 있는 이유: 다른 프로시저에서 로그인이 된 상태인지 알 수 있기 위해서 사용하였습니다. 

 <br> <br>

✔️**회원가입**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/2%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85_%EC%96%91%EC%8B%9D%EC%B6%94%EA%B0%80.sql)

회원가입에서는  select문으로 아이디가 존재하는지, 아이디 중복여부를 확인하고, if문으로 양식에 맞게 입력하였는지 확인합니다. 양식에 맞지 않으면 다음과 같이 회원가입을 할 수 없습니다.

 <br> <br>

**✔️로그인**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/3%EB%A1%9C%EA%B7%B8%EC%9D%B8.sql)

지역변수 plogonCheck를 선언하여 이용합니다. 

if문을 통해  아이디가 존재 하는지 먼저 체크하고

존재한다면 db에 저장된 비밀번호와 파라미터로 받은 비밀번호를 비교합니다.

 <br> <br>

**✔️레벨출력**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/5%EB%A0%88%EB%B2%A8%EC%B6%9C%EB%A0%A5.sql)

아이디를 입력받으면 ,

주민번호는  7자리만 출력되기때문에  select문을 따로 실행시켜 지역변수 ssn에 넣어줍니다.

나머지는 그대로 출력되기떄문에 select문으로 한번에  받습니다.

 <br> <br>

**✔️회원프로필출력**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/4%ED%9A%8C%EC%9B%90%ED%94%84%EB%A1%9C%ED%95%84.sql)

아이디를 입력받으면 ,

주민번호는  7자리만 출력되기때문에  select문을 따로 실행시켜 지역변수 ssn에 넣어줍니다.

나머지는 그대로 출력되기떄문에 select문으로 한번에  받습니다.

 <br> <br>

**✔️회원탈퇴**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/6%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4.sql)

파라미터로 아이디와 비밀번호를 받습니다.

아이디가 존재한다면, 파라미터로 받은 비밀번호가  db에  저장된 비밀번호와 같은 지 확인합니다.

 <br> <br>

**✔️회원정보수정**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/7%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%EC%88%98%EC%A0%95%20%ED%8C%A8%ED%82%A4%EC%A7%80.sql)

회원정보 수정하는 기능입니다.어플에서는 생년월일,  이메일 , 현금영수증 번호만 변경이 가능합니다.

update_info는 고객정보를 갱신하는 프로시저이고 (null값이라면 기존값으로 대체)

update_info2는  고객정보를 *로 치환하여  출력하는 프로시저 입니다.

 <br> <br>

✔️**영수증출력** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/1%ED%9A%8C%EC%9B%90%EA%B4%80%EB%A0%A8/8%EC%98%81%EC%88%98%EC%A6%9D%EC%B6%9C%EB%A0%A5.sql)

출력에 필요한 칼럼들을 가지고 있는 테이블 8개를 전부 조인해서 필요한 칼럼들을 다 가져왔고 그것들을 동적쿼리랑 커서 사용해서 구현했습니다.

 <br> <br>
### 분할결제

 <br> <br>

✔️**카드 분할 결제 시 차감 (스타벅스 카드 잔액에서 차감, 잔액이 부족할 경우 결제 불가)**

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/6%EA%B2%B0%EC%A0%9C%EA%B4%80%EB%A0%A8/%EC%B9%B4%EB%93%9C%EB%B6%84%ED%95%A0%EA%B2%B0%EC%A0%9C%EC%8B%9C%EC%B0%A8%EA%B0%90) <br>
주문번호를 입력하면 해당 결제수단과 해당금액이 출력되고, 포인트와 유사한 스타벅스카드를 사용했을 시에는 사용한 금액만큼 스타벅스카드잔액에서 차감됩니다.

분할 결제가 아닐시에도 가능합니다(일반카드로만 결제시).

패키지로 프로시저 2개를 묶어놨는데  하나는 스타벅스카드결제 프로시저고, 다른 하나는  스타벅스카드가 아닌 , 다른 결제수단 프로시저로 이루어져있습니다. 그래서 분할 결제가 아닐시에는 카드 종류에 해당하는 프로시저를 실행하면 됩니다.

패키지를 사용한 이유는 유사한 업무에 사용되는 여러 개의 프로시저나 함수를 하나의 패키지로 묶어서  관리해야 자신이 필요한 항목을 찾는게 더 수월해지기 때문입니다. 패키지를 사용하면 자유 사용되는 프로그램과 로직을 모듈화 할 수  있기 때문에 유지보수 작업이 편해지고 프로그램의 처리흐름을 노출되지 않기에 보안기능이 향상될 수 있습니다.
 <br> <br>

### 관리자 

 <br> <br>

✔️**매니저정보출력** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/5%EA%B4%80%EB%A6%AC%EC%9E%90%EA%B4%80%EB%A0%A8/1%EB%A7%A4%EB%8B%88%EC%A0%80%EC%A0%95%EB%B3%B4%EC%B6%9C%EB%A0%A5.sql#L8)

반환되는 결과도 행이 여러개이고 커서를 선언할 필요없는 명시적 커서 for loop를 사용하였다.

 <br> <br>

✔️**게시글쓰기** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/5%EA%B4%80%EB%A6%AC%EC%9E%90%EA%B4%80%EB%A0%A8/2%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%93%B0%EA%B8%B0-%EA%B3%B5%EC%A7%80.sql)

시퀀스를 생성하였고 insert문으로 게시글을 삽입하였습니다.

 <br> <br>

✔️**게시글출력** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/5%EA%B4%80%EB%A6%AC%EC%9E%90%EA%B4%80%EB%A0%A8/3%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%B6%9C%EB%A0%A5.sql)

ROWTYPE에 해당하는 변수를 따로 DECLARE할 필요가 없기 때문에 명시적 커서 for loop를 선언하였고,

파라미터를 통해 입력 받은 코드에 맞는 게시글 정보를 불러옵니다.

 <br> <br>

✔️**메뉴등록** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/5%EA%B4%80%EB%A6%AC%EC%9E%90%EA%B4%80%EB%A0%A8/4%EB%A9%94%EB%89%B4%EB%93%B1%EB%A1%9D.sql)

insert문을 이용하여 데이터를 삽입하였습니다.

 <br> <br>

✔️**메뉴삭제** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/5%EA%B4%80%EB%A6%AC%EC%9E%90%EA%B4%80%EB%A0%A8/5%EB%A9%94%EB%89%B4%EC%82%AD%EC%A0%9C.sql)

delete문을 이용하여 데이터를 삭제하였습니다.

 <br> <br>

✔️**메뉴수정** 

[코드링크](https://github.com/Jim3-4/Starbucks_OracleProject/blob/main/5%EA%B4%80%EB%A6%AC%EC%9E%90%EA%B4%80%EB%A0%A8/6%EB%A9%94%EB%89%B4%EC%88%98%EC%A0%95.sql)

pk인 menu_code는  꼭 파라미터 값을 받아야 하고 , 

나머지 파라미터값은 null값도 허용합니다. 


 <br> <br>
## 💡 느낀점



- DB 작업시 기초 ERD 설계가 정말 중요하고 , 조금이라도 잘못 설계되었을시 그 후에 파장이 정말 크다는것 느꼈습니다.
- 쿼리를 진행해보니, 필요했던 칼럼들을 빠트린 것도 있었고, 테이블에 cascade와 같이, 부모 데이터를 삭제하면 자식도 자동으로 삭제되는 제약조건을 설정하지 않아서 프로시저들을 실행시키고 데이터를 원상복구하는데에 어려움이 있었습니다. 또한 부모테이블을 삭제, 변경시에 자식테이블은 아무 반응을 하지 않았습니다. 이로 인해 제약조건 설정의 중요함을 알게 되었습니다. 
- 팀원분들도 열정적이고 자신이 임무맡은 바를 열심히 해내려고 해서 촉박한 시간안에서도 세부적인 일정계획으로 구현하기로 목표기능들을 모두 구현할 수 있었습니다. 위 두 과정에서 팀플의 중요성을 다시 한번 깨달았습니다. 예를 들어 오늘 계획한 할당량을 다 못끝내면 쉬는시간을 줄였습니다.
- 좋은 팀원분들을 만나서 서로 조언도 많이 해주고, 에러도 서로 같이 잡아주고 했습니다. 이 과정에서 같이 고민을 하다보니 제가 몰랐던 것을 다른 팀원이 채워주고 다른 팀원이 몰랐던 것을 내가 채워주는 상호작용 효과가 일어난 부분이 좋았습니다.
