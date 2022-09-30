CREATE TABLE MEMBER_TBL(
    MEMBER_ID   VARCHAR2(20)    PRIMARY KEY,
    MEMBER_PW   VARCHAR2(20)    NOT NULL,
    MEMBER_NAME VARCHAR2(20)    NOT NULL,
    MEMBER_ADDR VARCHAR2(100)   NOT NULL,
    MEMBER_PHONE    CHAR(13)    NOT NULL,
    MEMBER_AGE  NUMBER          NOT NULL,
    MEMBER_GENDER   CHAR(3) CHECK(MEMBER_GENDER IN('남','여')),
    ENROLL_DATE DATE
);
INSERT INTO MEMBER_TBL
VALUES('user01','1111','유저1','서울시 영등포구','010-1111-1111',20,'여',sysdate);
INSERT INTO MEMBER_TBL
VALUES('user02','2222','유저2','서울시 마포구','010-2222-2222',25,'여',sysdate);
INSERT INTO MEMBER_TBL
VALUES('user03','3333','유저3','부산시 강서구','010-3333-3333',22,'여',sysdate);
INSERT INTO MEMBER_TBL
VALUES('test01','4444','테스터1','인천시 계양구','010-4444-4444',28,'여',sysdate);
INSERT INTO MEMBER_TBL
VALUES('test02','5555','테스터2','경기도 군포시','010-5555-5555',23,'남',sysdate);
INSERT INTO MEMBER_TBL
VALUES('test03','3333','테스터3','경기도 안양시','010-6666-6666',27,'남',sysdate);
COMMIT;
SELECT * FROM MEMBER_TBL;

select * from member_tbl where member_id='' or '1' = '1';

CREATE TABLE DEL_MEMBER(
    MEMBER_ID   VARCHAR2(20)    PRIMARY KEY,
    MEMBER_NAME VARCHAR2(20)    NOT NULL,
    MEMBER_PHONE    CHAR(13)    NOT NULL,
    MEMBER_AGE  NUMBER          NOT NULL,
    MEMBER_GENDER   CHAR(3)     NOT NULL,
    DEL_DATE    DATE
);

SELECT * FROM DEL_MEMBER;

select member_id from member_tbl where member_id = 'user01'
union
select member_id from del_member where member_id = 'user01';

select count from member_tbl where member_id = 'user01'
union
select member_id from del_member where member_id = 'user01';
