CREATE TABLE MEMBER_TBL(
    MEMBER_ID VARCHAR2(30) PRIMARY KEY,
    MEMBER_PW VARCHAR2(30) NOT NULL,
    MEMBER_NAME VARCHAR2(20) NOT NULL
);

select * from member_tbl;

insert into member_tbl values('dd','hh','ff');