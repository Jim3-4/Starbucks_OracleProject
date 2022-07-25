## 오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹



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

<img src="./images/exerd.png">





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

 

✔️**개인정보수집에 대한 동의여부, 신상정보를** **입력받고** **랜덤한** **인증번호 발행** 

<img src="./images/c1.png">

**결과**

<img src="./images/c2.png">



✔️**회원가입**

<img src="./images/.png">

**결과**

<img src="./images/.png">





**✔️로그인**



<img src="./images/.png">

**결과**

<img src="./images/.png">





**✔️회원정보수정**

![image-20220725201726731](C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725201726731.png)

![image-20220725201841044](C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725201841044.png)



✔️**카드 분할 결제 시 차감****(****스타벅스 카드 잔액에서 차감****,** **잔액이 부족할 경우 결제 불가****)**

![image-20220725202027027](C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725202027027.png)

![image-20220725202031047](C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725202031047.png)

![image-20220725202040973](C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725202040973.png)



<img src="C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725202056175.png" alt="image-20220725202056175" style="zoom: 50%;" />



**결과**
![image-20220725202203978](C:\Users\kimjm\OneDrive\바탕화~1-DESKTOP-FGTFS58-1187675\지민\images\오라클 데이터베이스 프로젝트 - 스타벅스 벤치마킹\image-20220725202203978.png)





## 💡 느낀점



- DB 작업시 기초 ERD 설계가 정말 중요하고 , 조금이라도 잘못 짜여졌을시 그 후에 파장이 정말 크다는것 느꼈습니다.
- 쿼리를 진행해보니, 필요했던 칼럼들을 빠트린 것도 있었고, 테이블에 cascade와 같이, 부모 데이터를 삭제하면 자식도 자동으로 삭제되는 제약조건을 설정하지 않아서 프로시저들을 실행시키고 데이터를 원상복구하는데에 어려움이 있었습니다.
-  팀원분들도 열정적이고 자신이 임무맡은 바를 열심히 해내려고 해서 촉박한 시간안에서도 구현하기로 목표한 기능들을 모두 구현할 수 있었습니다. 위 두 과정에서 팀플의 중요성을 다시 한번 깨달았습니다. 예를 들어 오늘 할당량을 다 못끝내면 쉬는시간을 줄였습니다.
-  좋은 팀원분들을 만나서 서로 조언도 많이 해주고, 에러도 서로 같이 잡아주고 했습니다. 이 과정에서 같이 고민을 하다보니 제가 몰랐던 것을 다른 팀원이 채워주고 다른 팀원이 몰랐던 것을 내가 채워주는 상호작용 효과가 일어난 부분이 좋았습니다.
