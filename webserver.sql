--회원테이블
CREATE TABLE MEMBER_TBL(
    MEMBER_NO       NUMBER            PRIMARY KEY,  --회원 고유번호
    MEMBER_ID       VARCHAR2(20)      UNIQUE NOT NULL,
    MEMBER_PW       VARCHAR2(20)      NOT NULL,
    MEMBER_NAME     VARCHAR2(21)      NOT NULL,
    MEMBER_PHONE    CHAR(13),
    MEMBER_ADDR     VARCHAR2(100),
    MEMBER_LEVEL    NUMBER, --회원등급(1:관리자,2:정회원,3:준회원)
    ENROLL_DATE     CHAR(10)--YYYY-MM-DD
);
CREATE SEQUENCE MEMBER_SEQ; --회원 고유번호 발급을 위한 시퀀스
select * from member_tbl;
update member_tbl set member_level = 1 where member_no = 1;
update member_tbl set member_level = 2 where member_no = 7;
update member_tbl set member_no = 7 where member_no = 8;
commit;

alter sequence member_seq increment by -2;
select member_seq.nextval from dual;
alter sequence member_seq increment by 1;
delete from member_tbl where member_no = 10;

alter TABLE NOTICE RENAME COLUMN NOTIVE_NO TO NOTICE_NO;
CREATE TABLE NOTICE(
    NOTICE_NO       NUMBER  PRIMARY KEY,
    NOTICE_TITLE    VARCHAR2(300)   NOT NULL,
    NOTICE_WRITER   VARCHAR2(20)    REFERENCES MEMBER_TBL(MEMBER_ID) ON DELETE CASCADE,
    NOTICE_CONTENT  VARCHAR2(4000)  NOT NULL,
    READ_COUNT      NUMBER,
    REG_DATE        CHAR(10),
    FILENAME        VARCHAR2(100),  --원본 파일이름
    FILEPATH        VARCHAR2(100)   --실제 서버에 업로드되는 파일이름
);
CREATE SEQUENCE NOTICE_SEQ;

INSERT INTO NOTICE VALUES(
    NOTICE_SEQ.NEXTVAL,
    '공지사항'||NOTICE_SEQ.CURRVAL,
    'user01',
    '공지사항내용'||NOTICE_SEQ.CURRVAL,
    0,
    TO_CHAR(SYSDATE,'YYYY-MM-DD'),
    NULL,
    NULL
);
COMMIT;
-- 최신순 정렬
SELECT * FROM NOTICE ORDER BY NOTICE_NO DESC;
-- 최신순 정렬(우선순위 때문에 가상테이블 만들고 ROWNUM 넣기)
SELECT ROWNUM AS RNUM, N.* FROM(SELECT * FROM NOTICE ORDER BY NOTICE_NO DESC)N;
-- 최신순 정렬(우선순위 때문에 괄호로 묶고 WHERE조건 넣기)
SELECT * FROM
    (SELECT ROWNUM AS RNUM, N.* FROM
        (SELECT * FROM NOTICE ORDER BY NOTICE_NO DESC)N
    )
WHERE RNUM BETWEEN 1 AND 10;
select * from(select rownum as rnum, n.* from(select * from notice order by notice_no desc)n)where rnum between 1 and 10;
select count(*)as cnt from notice;

select * from notice_comment;
select * from photo;

alter sequence nc_seq increment by -21;
select nc_seq.nextval from dual;
alter sequence nc_seq increment by 1;