# project
첫 프로젝트

학원에서 배운것을 바탕으로 대학어디가,대학알리미 같은 입시 관련 사이트를 목표로 프로젝트를 진행했습니다.
초기에는 학원과정에 spring이 없어서 JDBC로 진행하다가 팀원들과 같이 공부해 기술들을 습득해 다시 적용하였고 
이 프로젝트에서 저는 전반적인 기획과 소프트웨어 아키텍처 설계, DB설계, 주요한 back-end를 구현했습니다.

요구사항 분석 회의를 진행하고 고객의 요구사항을 기능별로 나누고 분석하여 유스케이스, 시퀀스 다이어그램 등을 통해
모델링 하였고 최종적으로 요구사항 명세서를 산출하였으며, 변경사항을 빠짐없이 기록하고, 각 팀원들이 고객의 입장에서
고객의 요구사항에 대해 피드백하며 진행하였습니다.

데이터베이스 설계는 요구사항 명세서를 가지고 E-R 다이어그램으로 표현하였고 데이터 모델은 보다 효율적으로 개선해 나기기 위해 
1~3차 정규화를 통해 최대한 이상현상이 생기지 않도록 했고 이를 토대로 테이블 명세서를 작성하였습니다.
이전 설계 단계의 결과물들을 기반으로 DBMS에서 SQL로 작성한 명령문을 실행하여 데이터베이스를 생성했습니다.

프로젝트는 Spring의 mvc2패턴을 사용해 유지 보수 및 확장에 용이하도록 하였고 개발자와 웹 퍼블리셔의 영역을 분리하였습니다.
실제로 개발자 영역은 Back-End를 맡은 저와 팀원 1명, view에서는 Front-End를 맡은 팀원이 각각 작업을 진행했습니다.
DBMS는 Oracle를 사용하였고 SQL 실행 결과를 Java Bean에 Mapping 해주는 솔루션인 MyBatis를 사용하여 SQL을 소스코드가 아닌
XML로 따로 분리하였습니다.
보안성이 부실하다 생각해 회원관리 부분에서 비밀번호를 실제 사이트와 비슷하게 구현하기 위해 spring-security를 이용해 암호화를 진행하였고 
실제 DB에서 암호화되어 저장됩니다.

2021/12/01 톰캣을 사용해 배포했고 DB계정삭제 문제로 배포한 사이트의 db관련된 기능들이 작동하질 않아서 해결중에 있습니다.

2021/12/02 DB초기화하고 다시 생성해서 커밋 완료 / 쿼리파일 인코딩 문제가 생겨서 수정중입니다.

## http://182.216.170.220:8080/pj2/


![메인](https://user-images.githubusercontent.com/94891286/144356456-a13f5d2b-6832-4ca5-a9f7-21202af0cc2d.png)
