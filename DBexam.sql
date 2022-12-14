-- BRANDS 테이블 생성
CREATE TABLE BRANDS(
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(30) NOT NULL
);

-- PRODUCTS 테이블 생성 - SERIAL_NO unique 추가, 
CREATE TABLE PRODUCTS(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30) NOT NULL,
    PRODUCT_PRICE NUMBER NOT NULL,
    BRAND_CODE NUMBER REFERENCES BRANDS(BRAND_ID),
    SERIAL_NO VARCHAR2(50) UNIQUE,
    SOLD_OUT CHAR(1) CHECK(SOLD_OUT IN ('Y','N'))
);

-- SEQ_BRAND_ID 시퀀스 생성 - 최대값 수정
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 1000
NOCYCLE;

-- SEQ_PRODUCT_NO 시퀀스 생성
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE;

-- BRANDS 테이블 데이터 삽입
INSERT INTO BRANDS VALUES(SEQ_BRAND_ID.NEXTVAL, 'Samsung');
INSERT INTO BRANDS VALUES(SEQ_BRAND_ID.NEXTVAL, 'Apple');

-- PRODUCTS 테이블 데이터 삽입
INSERT INTO PRODUCTS VALUES(SEQ_PRODUCT_NO.NEXTVAL, '삼성노트북', 1800000, 100, 's-001','N');
INSERT INTO PRODUCTS VALUES(SEQ_PRODUCT_NO.NEXTVAL, '갤럭시스마트폰', 1500000, 100, 's-002','N');
INSERT INTO PRODUCTS VALUES(SEQ_PRODUCT_NO.NEXTVAL, '맥북', 2500000, 200, 'a-001','N');
INSERT INTO PRODUCTS VALUES(SEQ_PRODUCT_NO.NEXTVAL, '아이폰', 1500000, 200, 'a-002','N');
INSERT INTO PRODUCTS VALUES(SEQ_PRODUCT_NO.NEXTVAL, '아이패드', 1000000, 200, 'a-003','N');

-- 결과 조회
SELECT PRODUCT_NO, PRODUCT_NAME, BRAND_NAME, PRODUCT_PRICE, SERIAL_NO
FROM PRODUCTS
JOIN BRANDS ON (BRAND_CODE = BRAND_ID);