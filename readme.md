# 모두의 SQL 실습 클론코딩

## [프로젝트 개요]

1. 실습에서 제공하는 예약 데이터와 매출 데이터를 토대로 데이터 분석
2. oracle 문법을 mariadb 문법으로 바꾸기
3. 기본 SQL문을 학습하고, 데이터 분석 실습을 통해 실무에서 SQL 활용을 학습.

## [배운점]

### 1. 테이블 생성

- CONSTRAINT PK*이름 PRIMARY KEY (적용 컬럼): PK*이름으로 PK를 생성합니다.
- ALTER TABLE customer ADD CONSTRAINT fk_customer_zip_code FOREIGN KEY (zip_code) REFERENCES address (zip_code); : customer 테이블의 zip_code를 customer_zip_code이름으로 FOREIGN KEY로 지정하고, 이는 address 테이블의 (zip_code)를 참조한다.

### 2. INSERT

- to_date('17/11/07','RR/MM/DD'): to_date(str, 형식)

- str_to_date('17/11/08','%y/%m/%d'): date 값의 형식을 바꿈

## [궁금증]

### 1. 테이블 생성

- CONSTRAINT nn_reservation_customer_id NOT NULL enable -> NOT NULL
