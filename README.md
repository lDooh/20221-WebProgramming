# 20221-WebProgramming

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
| 친구 추가 | 친구로 등록된 사용자끼리 일정 공유 | |

## 개발 환경
+ 운영체제: Windows 10
+ 개발 언어: Java 17
+ 서버: Tomcat 9
+ 개발 환경: Eclipse
