CREATE TABLE MEMBER_TBL(
    MEMBER_NO   NUMBER          PRIMARY KEY,
    MEMBER_ID   VARCHAR2(20)    UNIQUE NOT NULL,
    MEMBER_PW   VARCHAR2(20)    NOT NULL,
    MEMBER_NAME VARCHAR2(20)    NOT NULL,
    PHONE       CHAR(13),
    EMAIL       VARCHAR2(50)
);
CREATE SEQUENCE MEMBER_SEQ;
INSERT INTO MEMBER_TBL VALUES(MEMBER_SEQ.NEXTVAL,'user01','1234','����1','010-1111-1111','user01@gmail.com');
SELECT * FROM MEMBER_TBL;
COMMIT;