-- 계정생성
-- CREATE USER 계정이름 IDENTIFIED BY 비밀번호;
CREATE USER test01 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test01;
REVOKE CONNECT FROM test01;

CREATE USER ddlexam IDENTIFIED BY 1111;
GRANT CONNECT, RESOURCE TO ddlexam;

DROP USER DDLEXAM; -- 접속중이거나 외래키 있는건 바로 삭제 불가
DROP USER TEST01 CASCADE; -- CASCADE 강제 삭제

GRANT CONNECT, RESOURCE TO kh;
REVOKE CONNECT FROM kh;
GRANT CREATE VIEW TO kh;
GRANT CREATE SYNONYM TO KH;

CREATE USER test00 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test00;

-- 공개동의어 생성
CREATE PUBLIC SYNONYM DEPT FOR KH.DEPARTMENT;
--TEST00계정에 KH의 DEPARTMENT테이블 조회권한 부여
GRANT SELECT ON KH.DEPARTMENT TO TEST00;
GRANT SELECT ON KH.EMPLOYEE TO TEST00;
DROP PUBLIC SYNONYM DEPT;

CREATE USER khtest IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO KHTEST;
GRANT CREATE VIEW TO KHTEST;
GRANT CREATE SYNONYM TO KHTEST;

CREATE USER DBTEST IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO DBTEST;
GRANT CREATE SYNONYM TO DBTEST;

CREATE USER DBEXAM IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO DBEXAM;

CREATE USER jdbc IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO jdbc;

CREATE USER JDBCEX IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO JDBCEX;

create user oracleuser identified by pwd1234;
grant connect, resource to oracleuser;

CREATE USER webserver IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO webserver;

CREATE USER spring IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO spring;

CREATE USER uzzultv IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO uzzultv;