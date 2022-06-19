# 20221-WebProgramming

# 14주차
![image](https://user-images.githubusercontent.com/95271528/174494330-bf10e21a-098a-4571-9928-bbeef68b21f5.png)
+ 메인 화면에서 자신이 저장한 일정 목록 열람, 수정, 

# 13주차
![image](https://user-images.githubusercontent.com/95271528/174494294-8ba6605e-09bf-4523-879b-9e2c405de746.png)
+ 관리자 메뉴 수정
  + 회원 목록 5명씩 표시하도록 페이징
  + ID, 닉네임, 전화번호로 회원 목록 검색 가능

# 12주차
![image](https://user-images.githubusercontent.com/95271528/172201130-005a40a2-3800-4cca-bcd0-627ac53e9dbc.png)
+ 데이터베이스 schedule 테이블 설계 수정
  + 일정을 등록한 유저의 ID와 일정의 scheduleID을 primary key로 등록, scheduleID는 일정 등록 시 계산
+ 일정 내용을 입력하고 추가 버튼을 누르면 데이터베이스에 등록

# 11주차
![image](https://user-images.githubusercontent.com/95271528/171370850-0dd2156a-2cda-4682-a1c9-8f395dc584d9.png)
![image](https://user-images.githubusercontent.com/95271528/171370872-f0362353-a042-499d-aa9b-6655fe091817.png)
+ 유저 ID로 검색 가능

# 10주차
![image](https://user-images.githubusercontent.com/95271528/171370779-fb53c271-0148-4be5-ac79-2c2f65dd4544.png)
+ 회원가입 시 데이터베이스에 회원 정보 등록
+ 관리자 화면에서 회원 목록 열람, 회원 삭제 기능

# 9주차
![image](https://user-images.githubusercontent.com/95271528/174494237-e112542e-5c47-4b85-a50f-80a4bf373c75.png)
![image](https://user-images.githubusercontent.com/95271528/174494247-a3b07180-255c-44ec-9d3c-fb61d507067d.png)
+ DB 테이블 설계
+ DAO, DTO 클래스 구현 중

# 8주차
![image](https://user-images.githubusercontent.com/95271528/167437723-99413cda-f5dd-4193-87b2-ad65972c73ca.png)
+ 메인 화면에서 일정 추가화면으로 이동

# 7주차
+ 중간고사

# 6주차
![image](https://user-images.githubusercontent.com/95271528/164986358-cb4722c8-6361-4107-8f13-0ce50d5f3a8e.png)
+ `java.time.LocalDate` 클래스를 이용하여 현재 날짜를 구하고, 메인 화면에 달력 출력하는 코드 작성

# 5주차
![image](https://user-images.githubusercontent.com/95271528/163716410-c0f1f770-7516-4562-96a8-7c4420cf8441.png)
+ 로그인 화면에서 입력한 id가 "imsiid" pw가 "qwer1234!" 인 경우에만 세션 생성
  + 추후 DB 연동 후 수정 예정
+ 메인 페이지에서 `session.getAttribute("memberId");`를 이용해 사용자의 id 정보 가져오기
+ 세션 유지 시간은 15분으로 설정
+ 로그아웃 버튼을 누르면 세션의 정보 파기, 로그인 화면으로 되돌아간다.
  + 로그아웃을 하고 메인 페이지를 들어가면 id 정보가 null로 나온다.

# 4주차
+ 회원가입 페이지 UI 수정

![image](https://user-images.githubusercontent.com/95271528/161426639-32361b03-739f-464a-a024-452ee26a7e5c.png)
+ 회원가입 데이터 유효성 검사 추가
  + ID: 정규식 이용, 영문 대/소문자와 숫자만 가능, 4~20자리
  + PW: 정규식 이용, 영문 대/소문자와 숫자, 특수기호 1개 이상, 8~16자리
  + 등 모든 입력란에 유효성 검사, 공백 검사 추가

![image](https://user-images.githubusercontent.com/95271528/161426825-f18c3a42-8621-445f-92da-62a0eb6d8345.png)![image](https://user-images.githubusercontent.com/95271528/161426877-326e3eb9-0526-4a9e-8d0d-450213a121bb.png)

# 3주차
![image](https://user-images.githubusercontent.com/95271528/160287984-b686eaeb-43e6-455e-8517-c302d3a8aa55.png)
+ 로그인 페이지에서 회원가입 페이지로 넘어가는 기능 구현
  + 회원가입 페이지에서 정보 입력 후 "가입" 버튼을 통해 파라미터를 받음.

# 2주차
## 웹 캘린더 프로젝트
+ 웹에서 일정 관리 등의 기능을 수행하는 캘린더 페이지

## 선정 동기
+ 동아리 프로젝트나 조별과제등을 하면서 팀 프로젝트에선 일정 관리가 정말 중요하다는 것을 느꼈고, <br>
일정 관리를 할 수 있는 프로그램이나 사이트를 직접 만들어보고 싶다는 생각이 들어 선정.

## 주요 기능
| 기능 | 설명 | 비고 |
| :--: | :-- | :--: |
| 일정 추가 | 날짜를 선택하고 일정 추가 | C |
| 일정 보기 | 추가해놓은 일정 조회 | R |
| 일정 수정 | 일정이 있는 날을 선택하고, 일정 내용 수정 | U |
| 일정 삭제 | 일정이 있는 날을 선택하고, 일정 삭제 | D |
| 회원 가입 | 회원별로 일정을 저장 | DB 사용 |

## 개발 환경
+ 운영체제: Windows 10
+ 개발 언어: Java 17
+ 서버: Tomcat 9
+ 개발 환경: Eclipse
