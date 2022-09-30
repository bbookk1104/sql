/*
PL/SQL : Procedural Language extention to SQL
    -- ����Ŭ ��ü�� ����Ǿ��ִ� ������ ���
    -- SQL������ �����Ͽ� ���� �� ��������, ����ó��, �ݺ�ó�� ���� ����
PL/SQL ����
1. �͸���
    -- �̸��� ���� ���, ������ ���(SQL���� ���� ��)���� �� ���
2. ���ν���(������ ���� �޼ҵ�~VOID)
    -- ������ Ư�� ó���� �����ϴ� ���� ���α׷�
3. �Լ�(������ �ִ� �޼ҵ�)
    -- ���ν����� ���� ����
    
PL/SQL ��������

DECLARE(�����)
    - ���� �Ǵ� ����� �����ϴ� �κ�
    - ������ ��������ʴ� ��� ��������
BEGIN
    - ���, �ݺ���, �Լ����� �� ������ ���
    - �ݵ�� �ۼ�!
EXCEPTION(����ó����)
    - ���ܻ�Ȳ �߻��� �ذ��ϱ����� ���� �ۼ�
    - ��������
END;(�������)
/(PL/SQL ���� �� ����)

*/
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
END;
/

DECLARE
    ID      NUMBER;
    NAME    VARCHAR2(20);
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO ID, NAME
    FROM EMPLOYEE
    WHERE EMP_NAME = '������';
    DBMS_OUTPUT.PUT_LINE('��� : '||ID);
    DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
END;
/

DECLARE
    NAME    VARCHAR2(20);
    D_CODE  VARCHAR2(20);
    J_CODE  VARCHAR2(20);
BEGIN
    SELECT EMP_NAME, DEPT_CODE, JOB_CODE
    INTO NAME, D_CODE, J_CODE
    FROM EMPLOYEE
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : '||D_CODE);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : '||J_CODE);
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�.');
END;
/

-- �����ȣ �Է½� �̸�,�μ���,���޸��� ��µǵ��� �͸��� �ۼ�
DECLARE
    NAME VARCHAR2(20);
    D_TITLE VARCHAR2(20);
    J_NAME VARCHAR2(20);
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO NAME, D_TITLE, J_NAME
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN JOB USING (JOB_CODE)
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '||D_TITLE);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||J_NAME);
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�.');
END;
/

/*
PL/SQL�� ���� ���� �� ����
�����̸� [CONSTANT] �ڷ��� [:=�ʱⰪ];    -- CONSTANT : ����� ���� ���� / := ���Կ�����
DECLARE
    NO CONSTANT NUM := 10;  -- ����� ��� ��������� �ݵ�� �ʱ�ȭ�ؾ���!
    NAME VARCHAR2(20);
    TEST VARCHAR2(30) := 'TEST����';
*/
DECLARE
    NAME    VARCHAR2(20) := '�ΰ���';
    NUM     NUMBER;
    NUM1    CONSTANT NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(NAME);
    NAME := '�����̸�';
    DBMS_OUTPUT.PUT_LINE(NAME);
END;
/

-- VARCHAR2(20) ��� �������� %TYPE ���
DECLARE
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    D_NAME  DEPARTMENT.DEPT_TITLE%TYPE;
    J_NAME  JOB.JOB_NAME%TYPE;
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO NAME, D_NAME, J_NAME
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN JOB USING (JOB_CODE)
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '||D_NAME);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||J_NAME);
END;
/

-- ����� �Է��ϸ� �ش����� �̸�,�ֹε�Ϲ�ȣ,�̸���,�μ��ڵ�,�޿� ���(%ROWTYRE)
DECLARE
    MYROW   EMPLOYEE%ROWTYPE;
BEGIN
    SELECT  EMP_NAME,EMP_NO,EMAIL,DEPT_CODE,SALARY
    INTO    MYROW.EMP_NAME, MYROW.EMP_NO, MYROW.EMAIL, MYROW.DEPT_CODE, MYROW.SALARY
    FROM    EMPLOYEE
    WHERE   EMP_ID='&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||MYROW.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�ֹε�Ϲ�ȣ : '||MYROW.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('�̸��� : '||MYROW.EMAIL);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : '||MYROW.DEPT_CODE);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||MYROW.SALARY);
END;
/

-- ����Է½� �̸�,�μ���,���޸�,�޿�,�̸��� ���(RECORD)
DECLARE
    TYPE MY_RECORD IS RECORD(
        NAME    EMPLOYEE.EMP_NAME%TYPE,
        D_NAME  DEPARTMENT.DEPT_TITLE%TYPE,
        J_NAME  JOB.JOB_NAME%TYPE,
        SAL     EMPLOYEE.SALARY%TYPE,
        EMAIL   EMPLOYEE.EMAIL%TYPE
    );
    MYRECORD MY_RECORD;
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY, EMAIL
    INTO MYRECORD
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN JOB USING (JOB_CODE)
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||MYRECORD.NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '||MYRECORD.D_NAME);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||MYRECORD.J_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||MYRECORD.SAL);
    DBMS_OUTPUT.PUT_LINE('�̸��� : '||MYRECORD.EMAIL);
END;
/

-- �ǽ�����1
-- ���,�����,�����ڵ�,�޿��� �������ִ� ���������� ����(%TYPE)
-- ������ ����� ���,�����,�����ڵ�,�޿��� �͸���� ���� ��ũ��Ʈ ���
DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    J_CODE     EMPLOYEE.JOB_CODE%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT  EMP_ID,EMP_NAME,JOB_CODE,SALARY
    INTO    ID, NAME, J_CODE, SAL
    FROM    EMPLOYEE
    WHERE   EMP_NAME = '������';
    DBMS_OUTPUT.PUT_LINE('��� : '||ID);
    DBMS_OUTPUT.PUT_LINE('����� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : '||J_CODE);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
END;
/

-- �ǽ�����2
-- ���,�����,�μ���,���޸��� �������ִ� ���������� ����(RECORD)
-- ������� �˻��Ͽ� �ش����� ���,�����,�μ���,���޸��� �͸���� ���� ��ũ��Ʈ ���
DECLARE
    TYPE EMP_RECORD IS RECORD(
        ID      EMPLOYEE.EMP_ID%TYPE,
        NAME    EMPLOYEE.EMP_NAME%TYPE,
        D_NAME  DEPARTMENT.DEPT_TITLE%TYPE,
        J_NAME  JOB.JOB_NAME%TYPE
    );
    DATA EMP_RECORD;
BEGIN
    SELECT  EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO    DATA
    FROM    EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN JOB USING (JOB_CODE)
    WHERE   EMP_NAME = '&�����';
    DBMS_OUTPUT.PUT_LINE('��� : '||DATA.ID);
    DBMS_OUTPUT.PUT_LINE('�̸� : '||DATA.NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '||DATA.D_NAME);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||DATA.J_NAME);
END;
/

-- �ǽ�����3
-- ����� �Է��Ͽ� �ش� ����� ã��(%ROWTYPE���)
-- �����,�ֹι�ȣ,�Ի���,�μ����� �͸���� ���� ��ũ��Ʈ ���
DECLARE
    EMP   EMPLOYEE%ROWTYPE;
    DEP  DEPARTMENT%ROWTYPE;
BEGIN
    SELECT EMP_NAME, EMP_NO, HIRE_DATE, DEPT_TITLE
    INTO EMP.EMP_NAME, EMP.EMP_NO, EMP.HIRE_DATE, DEP.DEPT_TITLE
    FROM  EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||EMP.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�ֹι�ȣ : '||EMP.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('�Ի��� : '||EMP.HIRE_DATE);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '||DEP.DEPT_TITLE);
END;
/
--------------------------------------------------------------------------------
/*
PL/SQL ���ù�
*/
-- �����ȣ�� ���� �̸�,�޿�,���ʽ��� ���
-- ���ʽ��� ���������� '���ʽ��� �����ϴ�.'�� ���
DECLARE
    E_NAME  EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    BO      EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT  EMP_NAME, SALARY, NVL(BONUS,0)
    INTO    E_NAME, SAL, BO
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
    IF(BO = 0)
    THEN DBMS_OUTPUT.PUT_LINE('���ʽ��� �����ϴ�.');
    ELSE DBMS_OUTPUT.PUT_LINE('���ʽ� : '||(bo*100)||'%');
    END IF;
END;
/
-- IF(����) / THEN [TRUE�϶� ���๮] / ELSE [FALSE�϶� ���๮] / END IF;

-- ����� �Է¹��� �� �޿��� ���� ����� ����
-- �̸�,�޿�,�޿����
-- 0 ~ 99 ����: F
-- 100 ~ 199 : E
-- 200 ~ 299 : D
-- 300 ~ 399 : C
-- 400 ~ 499 : B
-- 500�̻�    : A
DECLARE
    E_NAME  EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT  EMP_NAME, SALARY
    INTO    E_NAME, SAL
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
    IF(0<=SAL AND SAL<1000000)
    THEN DBMS_OUTPUT.PUT_LINE('��� : F');
    ELSIF(1000000<=SAL AND SAL<2000000)
    THEN DBMS_OUTPUT.PUT_LINE('��� : E');
    ELSIF(2000000<=SAL AND SAL<3000000)
    THEN DBMS_OUTPUT.PUT_LINE('��� : D');
    ELSIF(3000000<=SAL AND SAL<4000000)
    THEN DBMS_OUTPUT.PUT_LINE('��� : C');
    ELSIF(4000000<=SAL AND SAL<5000000)
    THEN DBMS_OUTPUT.PUT_LINE('��� : B');
    ELSE DBMS_OUTPUT.PUT_LINE('��� : A');
    END IF;
END;
/
-- ���� 3�� ����ϴ� ���
DECLARE
    E_NAME  EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    SAL_GRADE   CHAR(1);
BEGIN
    SELECT  EMP_NAME, SALARY
    INTO    E_NAME, SAL
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
    SAL := SAL/10000;
    IF(0<=SAL AND SAL<100) THEN SAL_GRADE := 'F';
    ELSIF(100<=SAL AND SAL<200) THEN SAL_GRADE := 'E';
    ELSIF(200<=SAL AND SAL<300) THEN SAL_GRADE := 'D';
    ELSIF(300<=SAL AND SAL<400) THEN SAL_GRADE := 'C';
    ELSIF(400<=SAL AND SAL<500) THEN SAL_GRADE := 'B';
    ELSE SAL_GRADE := 'A';
    END IF;
    DBMS_OUTPUT.PUT_LINE('��� : '||SAL_GRADE);
END;
/
--------------------------------------------------------------------------------
/*
�ǽ����� 1
�����ȣ�� �Է¹޾Ƽ� ����� ���,�̸�,�޿�,���ʽ����� ���.
������ ��ǥ�� ���, '����ȸ�� ��ǥ���̽ʴϴ�.'�� ���.
*/
DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    BO      EMPLOYEE.BONUS%TYPE;
    J_NAME  JOB.JOB_NAME%TYPE;
BEGIN
    SELECT  EMP_ID, EMP_NAME, SALARY, NVL(BONUS,0)*100, JOB_NAME
    INTO    ID, NAME, SAL, BO, J_NAME
    FROM    EMPLOYEE
    LEFT JOIN    JOB USING(JOB_CODE)
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : '||ID);
        DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
        DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
        DBMS_OUTPUT.PUT_LINE('���ʽ��� : '||BO||'%');
    IF(J_NAME = '��ǥ')
    THEN DBMS_OUTPUT.PUT_LINE('����ȸ�� ��ǥ���̽ʴϴ�.');
    END IF;
END;
/

/*
�ǽ����� 2
�ش� ��� ��ȣ�� �Է¹޾� �ش� ����� �Ҽӵ� �μ����� ���� ���� �޿��� �ް� �ִ� ����� ���
��°��� [�˻��� �����,����μ�],[�ش�μ����� ���� ���� �޿��� ���� ����� �� �޿�,�μ���]
*/
DECLARE
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    D_NAME  DEPARTMENT.DEPT_TITLE%TYPE;
    MAX_SAL EMPLOYEE.SALARY%TYPE;
    MAX_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT  EMP_NAME, DEPT_TITLE
    INTO    NAME, D_NAME
    FROM    EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID)
    WHERE   EMP_ID = '&���';
    IF(D_NAME IS NOT NULL)
    THEN
        SELECT  MAX(SALARY)
        INTO    MAX_SAL
        FROM    EMPLOYEE
        LEFT JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID)
        WHERE   DEPT_TITLE = D_NAME;
    ELSE
        SELECT  MAX(SALARY)
        INTO    MAX_SAL
        FROM    EMPLOYEE
        WHERE   DEPT_CODE IS NULL;
        D_NAME := '�μ�����';
    END IF;
    SELECT  EMP_NAME
    INTO    MAX_NAME
    FROM    EMPLOYEE
    WHERE   SALARY = MAX_SAL;
    DBMS_OUTPUT.PUT_LINE('### �˻��� ��� ���� ###');
    DBMS_OUTPUT.PUT_LINE('�˻��� ����� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�Ҽӵ� �μ��� : '||D_NAME);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
    DBMS_OUTPUT.PUT_LINE('### '||D_NAME||'���� �޿��� ���� ���� ��� ���� ###');
    DBMS_OUTPUT.PUT_LINE('����� : '||MAX_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||MAX_SAL||'��');
    DBMS_OUTPUT.PUT_LINE('�Ҽӵ� �μ��� : '||D_NAME);
END;
/
--------------------------------------------------------------------------------
-- �ݺ���
-- BASIC LOOP : ���Ǿ��� ���ѹݺ�
DECLARE
    NUM     NUMBER := 1;
BEGIN
    LOOP        -- �ݺ�����
        DBMS_OUTPUT.PUT_LINE(NUM);
        NUM := NUM + 1;
        IF (NUM > 5)
        THEN EXIT;
        END IF;
    END LOOP;   -- �ݺ� ��
END;
/

-- FOR LOOP : �ݺ�Ƚ���� �����ؼ� �ݺ�, �ݺ�Ƚ���� ������ �ڵ����� ����
DECLARE
    
BEGIN
    FOR NUM IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(NUM);
    END LOOP;
END;
/

-- WHILE LOOP : ���ǽ��� TRUE�� ���� �ݺ��ϴ� �ݺ���
-- ��, ó���� ���ǽ��� FALSE�� ��� �ѹ��� �������� ���� �� ����
DECLARE
    NUM     NUMBER := 1;
BEGIN
    WHILE (NUM<=5) LOOP
        DBMS_OUTPUT.PUT_LINE(NUM);
        NUM := NUM + 1;
    END LOOP;
END;
/

SET SERVEROUTPUT ON;
--
DECLARE
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
BEGIN
    FOR NUM IN 0..22 LOOP
        SELECT EMP_NAME, SALARY
        INTO NAME, SAL
        FROM EMPLOYEE
        WHERE EMP_ID = 200+NUM;
        DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
        DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
/
--
CREATE TABLE LOOP_TEST(
    EMP_NAME    VARCHAR2(20),
    DEPT_TITLE  VARCHAR2(30),
    JOB_NAME    VARCHAR2(30),
    SALARY      NUMBER
);
-- PL/SQL �ݺ����� Ȱ���Ͽ� ������ �Է�
-- JOIN�̳� SUBQUERY����� �Ұ�
-- �μ��ڵ� ���� ������ '�μ�����'���� �μ��� �Է�
-- 1. ����� �̿��ؼ� EMPLOYEE���̺��� �ʿ��� ���� ��ȸ
-- 2. 1�� ��ȸ����� �̿��ؼ� DEPARTMENT, JOB���� �߰����� ��ȸ
-- 3. 1,2�� ��ȸ����� �̿��Ͽ� INSERT�ۼ�
-- 4. ��� INSERT�� ����Ǹ� COMMIT;
DECLARE
    EMP     EMPLOYEE%ROWTYPE;
    D_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
    J_NAME  JOB.JOB_NAME%TYPE;
BEGIN
    FOR NUM IN 0..22 LOOP
        SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
        INTO EMP.EMP_NAME, EMP.DEPT_CODE, EMP.JOB_CODE, EMP.SALARY
        FROM EMPLOYEE
        WHERE EMP_ID = 200+NUM;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('�̸� : '||EMP.EMP_NAME);
        DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : '||EMP.DEPT_CODE);
        DBMS_OUTPUT.PUT_LINE('�����ڵ� : '||EMP.JOB_CODE);
        DBMS_OUTPUT.PUT_LINE('�޿� : '||EMP.SALARY);    
        IF (EMP.DEPT_CODE IS NULL)
        THEN 
            D_TITLE := '�μ�����';
        ELSE
            SELECT  DEPT_TITLE
            INTO D_TITLE
            FROM DEPARTMENT
            WHERE DEPT_ID = EMP.DEPT_CODE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('�μ��� : '||D_TITLE);
        SELECT JOB_NAME
        INTO J_NAME
        FROM JOB
        WHERE JOB_CODE = EMP.JOB_CODE;
        DBMS_OUTPUT.PUT_LINE('���޸� : '||J_NAME);
        INSERT INTO LOOP_TEST VALUES (EMP.EMP_NAME, D_TITLE, J_NAME, EMP.SALARY);
    END LOOP;
    COMMIT;
END;
/
SELECT * FROM LOOP_TEST;
--------------------------------------------------------------------------------
-- EXCEPTION : BEGIN���� ��ü�� TRY�μ�
DECLARE
    E_NAME  EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    BO      EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT  EMP_NAME, SALARY, 100*NVL(BONUS,0)
    INTO    E_NAME, SAL, BO
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
    DBMS_OUTPUT.PUT_LINE('���ʽ� : '||BO||'%');
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN DBMS_OUTPUT.PUT_LINE('���� ������ ��ȸ�� �� �����ϴ�.');
END;
/
--------------------------------------------------------------------------------
/*
PROCEDURE(���ν���)
 -> �Ϸ��� �۾������� �����ؼ� �����ص� ��
 -> ���� SQL���� ��� �̸� �����ϰ� �ϳ��� ��û���� ����
 -> ���� ���Ǵ� ������ �۾����� �����ΰ� �����ϰ� ��밡��
 -> return void�� �ڹ� �޼ҵ� ����(���� Ÿ���� ���ٰ� �����ϱ�)
 
���ν��� ����� ���
CREATE [OR REPLACE] PROCEDURE ���ν����̸�(�Ű�����1 [����Ÿ��] �ڷ���, �Ű�����2 [����Ÿ��] �ڷ���...)
IS
    �������� ���� ����
BEGIN
    ���๮
END;
/
-- ���ν��� �Ű�����
1. ���࿡ �Ű������� ������ ���ν��� �̸������� �ۼ��ϰ� IS
    CREATE PROCEDURE ���ν����̸�
    IS
2. �Ű������� �ڷ��� �Է� �� ���̴� �ۼ����� ����(���� �ۼ� �� �����߻�)
    CREATE PROCEDURE ���ν����̸�(STR VARCHAR2)
    IS
3. ����Ÿ�� Ű���� [IN|OUT|INOUT]
    -> IN : �����͸� ���޹��� �� ���
    -> OUT : ����� �޾ư� �� ���
    -> INOUT : IN,OUT �ΰ��� �������� ��� ��밡��(������ ���� �� ��)
*/
-- �Ű������� ���� ���ν���
CREATE OR REPLACE PROCEDURE TEST_PRO_1
IS
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT  EMP_NAME, SALARY
    INTO    NAME, SAL
    FROM    EMPLOYEE
    WHERE   EMP_ID = 200;
    DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
END;
/
EXECUTE TEST_PRO_1;
EXEC TEST_PRO_1;

-- �Ű������� �ִ� ���ν���
-- �Ű����� ���� �� �������� ���̴� �Է�X
CREATE OR REPLACE PROCEDURE TEST_PRO_2(E_NAME IN VARCHAR2)
IS
    D_CODE  EMPLOYEE.DEPT_CODE%TYPE;
    J_CODE  EMPLOYEE.JOB_CODE%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT  DEPT_CODE, JOB_CODE, SALARY
    INTO    D_CODE, J_CODE, SAL
    FROM    EMPLOYEE
    WHERE   EMP_NAME = E_NAME;
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : '||D_CODE);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : '||J_CODE);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL);
END;
/
EXEC TEST_PRO_2('������');

CREATE OR REPLACE PROCEDURE TEST_PRO_3(E_NAME1 IN VARCHAR2, E_NAME2 IN EMPLOYEE.EMP_NAME%TYPE)
IS
    SAL1    EMPLOYEE.SALARY%TYPE;
    SAL2    EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT  SALARY
    INTO    SAL1
    FROM    EMPLOYEE    WHERE   EMP_NAME=E_NAME1;
    SELECT  SALARY
    INTO    SAL2
    FROM    EMPLOYEE    WHERE   EMP_NAME=E_NAME2;
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME1);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL1);
    DBMS_OUTPUT.PUT_LINE('�̸� : '||E_NAME2);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SAL2);
END;
/
EXEC TEST_PRO_3('������','������');

-- OUT ����
CREATE OR REPLACE PROCEDURE TEST_PRO_4(
    E_NAME  IN  VARCHAR2,
    D_NAME  OUT VARCHAR2
)
IS
    D_CODE  EMPLOYEE.DEPT_CODE%TYPE;
BEGIN
    SELECT DEPT_CODE
    INTO D_CODE
    FROM EMPLOYEE WHERE EMP_NAME = E_NAME;
    
    SELECT DEPT_TITLE
    INTO D_NAME
    FROM DEPARTMENT WHERE DEPT_ID = D_CODE;
END;
/
DECLARE
    D_TITLE     DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    -- PL/SQL ���ο��� ���ν��� ���� EXECŰ���带 ������� ����
    TEST_PRO_4('������',D_TITLE);
    DBMS_OUTPUT.PUT_LINE(D_TITLE);
END;
/

CREATE TABLE EMP_PRO_TEST
AS
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN JOB USING (JOB_CODE)
ORDER BY 1;
SELECT * FROM EMP_PRO_TEST;
-- 1. ���ν��� ����
--> �Ű������� ����� �޾Ƽ� �ش� ������ EMP_PRO_TEST���̺��� ����
--> COMMIT;
CREATE OR REPLACE PROCEDURE DEL_EMP_PRO1(E_ID NUMBER)
IS
BEGIN
    DELETE FROM EMP_PRO_TEST WHERE EMP_ID = E_ID;
    COMMIT;
END;
/
EXEC DEL_EMP_PRO1(205);
SELECT * FROM EMP_PRO_TEST;

/*
1. �ű����̺� ����
    -> ���̺��̸� DEL_EMP
    -> ���, �̸�, �μ���, ���޸�, ����� ������ �÷� ����
2. DEL_EMP_PRO2 ���ν��� ����
    -> �Ű������� ����� ����
    -> �Ű������� ���� ��������� EMP_PRO_TEST���̺��� ����
    -> EMP_PRO_TEST���̺� ���� ���� �ʿ��� ������ ��ȸ�ؼ� DEL_EMP�� INSERT�� �� ����
        (������� SYSDATE�� �Է�)
    -> COMMIT;
*/
CREATE TABLE DEL_EMP(
    EMP_ID      NUMBER,
    EMP_NAME    VARCHAR2(20),
    DEPT_TITLE  VARCHAR2(50),
    JOB_NAME    VARCHAR2(30),
    ENT_DATE    DATE
);
CREATE OR REPLACE PROCEDURE DEL_EMP_PRO2(E_ID NUMBER)
IS
    E_NAME  EMP_PRO_TEST.EMP_NAME%TYPE;
    D_TITLE EMP_PRO_TEST.DEPT_TITLE%TYPE;
    J_NAME  EMP_PRO_TEST.JOB_NAME%TYPE;
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO E_NAME, D_TITLE, J_NAME
    FROM EMP_PRO_TEST WHERE EMP_ID = E_ID;

    INSERT INTO DEL_EMP
    VALUES(E_ID, E_NAME, D_TITLE, J_NAME, SYSDATE);

    DELETE FROM EMP_PRO_TEST WHERE EMP_ID = E_ID;
    
    COMMIT;
END;
/
EXEC DEL_EMP_PRO2(202);
SELECT * FROM EMP_PRO_TEST;
SELECT * FROM DEL_EMP;

/*
FUNCTION : ���ν����� ���� ����
 -> ������ �ݵ�� ����
 -> IN|OUT Ÿ�Ժ��� ���X
 �Լ� �ۼ����
 CREATE [OR REPLACE] FUCTION �Լ��̸�(�Ű�����1 �ڷ���, �Ű�����2 �ڷ���..)
 RETURN �����ڷ���
 IS
 BEGIN
 END;
 /
*/
-- �μ��ڵ带 �޾Ƽ� �ش��ϴ� �μ����� ��ȸ�ϴ� �Լ� ����
CREATE OR REPLACE FUNCTION GET_DEPT(D_CODE VARCHAR2)
RETURN DEPARTMENT.DEPT_TITLE%TYPE
IS
    D_NAME DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT DEPT_TITLE
    INTO D_NAME
    FROM DEPARTMENT
    WHERE DEPT_ID = D_CODE;
    RETURN D_NAME;
END;
/
SELECT GET_DEPT('D7') FROM DUAL;
SELECT EMP_NAME, DEPT_CODE, GET_DEPT(DEPT_CODE) FROM EMPLOYEE;

-- �޿��� ���ʽ��� �Ű������� �޾Ƽ� ������ ����ؼ� ����
CREATE OR REPLACE FUNCTION GET_YEAR_SAL(
    SAL NUMBER,
    BO  NUMBER
)
RETURN NUMBER
IS
    YEAR_SAL    NUMBER;
BEGIN
    YEAR_SAL := (SAL+SAL*BO)*12;
    RETURN YEAR_SAL;
END;
/
SELECT GET_YEAR_SAL(5000000,0.1) FROM DUAL;
SELECT EMP_NAME, SALARY, GET_YEAR_SAL(SALARY,NVL(BONUS,0)) FROM EMPLOYEE;

-- �Ű������� ����� �޾Ƽ� �ش����� ������ �����ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_YEAR_SAL2(E_ID NUMBER)
RETURN NUMBER
IS
    SAL EMPLOYEE.SALARY%TYPE;
    BO  EMPLOYEE.BONUS%TYPE;
    YEAR_SAL NUMBER;
BEGIN
    SELECT SALARY, NVL(BONUS,0)
    INTO SAL, BO
    FROM EMPLOYEE WHERE EMP_ID = E_ID;
    YEAR_SAL := (SAL+SAL*BO)*12;
    RETURN YEAR_SAL;
END;
/
SELECT EMP_NAME, GET_YEAR_SAL2(EMP_ID) FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
TRIGGER : �̸� ���س��� ������ �����ϰų� ����Ǹ� �ڵ������� ����Ǵ� �ൿ
    -> Ư�����̺��̳� �信 INSERT, UPDATE, DELETE�� DML�� ����
    -> �Է�,����,������ �Ǵ� ��� �ڵ����� ����
*/
-- ȸ�������� �����ϴ� ���̺�
CREATE TABLE M_TBL(
    MEMBER_ID   VARCHAR2(20) PRIMARY KEY,   -- ���̵�
    MEMBER_PW   VARCHAR2(30) NOT NULL,      -- ��й�ȣ
    MEMBER_NAME VARCHAR2(20) NOT NULL,      -- �̸�
    ENROLL_DATE DATE                        -- ������
);
-- M_TBL ������ ����Ǹ� �����̷��� �����ϴ� ���̺�(��й�ȣ ����)
CREATE TABLE M_LOG(
    MEMBER_ID   VARCHAR2(20) REFERENCES M_TBL ON DELETE CASCADE,
    CHANGE_CONTENT VARCHAR2(100),   -- ��й�ȣ ���泻��
    CHANGE_DATE DATE                -- ���泯¥
);
-- M_TBL���� ȸ���� Ż������ �� Ż���̷��� �����ϴ� ���̺�
CREATE TABLE DEL_M_TBL(
    MEMBER_ID   VARCHAR2(20) PRIMARY KEY,   -- Ż��ȸ�� ���̵�
    MEMBER_NAME VARCHAR2(20),               -- Ż��ȸ�� �̸�
    ENROLL_DATE DATE,                       -- Ż��ȸ�� ������
    OUT_DATE    DATE                        -- Ż�� ��¥
);
/*
FOR EACH ROW�� �ִ� ���
������Ʈ�� ���� -> 5�� ���� ���� -> TRIGGER 5ȸ ����
FOR EACH ROW�� ���� ���
������Ʈ�� ���� -> 5�� ���� ���� -> TRIGGER 1ȸ ����

CREATE [OR REPLACE] TRIGGER Ʈ�����̸�
���۽���    ����DML   (EX. AFTER INSERT)
ON ������̺�
[FOR EACH ROW] -- Ʈ���� ����(����� ���� ����ŭ Ʈ���� ����)
BEGIN
    -- �����ڵ� ����
END;
/
���ε庯��(FOR EACH ROW�� ����� ���� ��밡���� ����)
:NEW - SQL������ ���� �Էµ� ������
:OLD - SQL������ ����Ǳ� �� ������
:NEW.�÷���
:OLD.�÷���
*/
-- M_TBL�� ȸ���� INSERT�Ǹ� 'ȸ���� �߰��Ǿ����ϴ�.'�޼��� ����ϴ� TRIGGER
CREATE OR REPLACE TRIGGER M_TBL_INSERT_TRG
AFTER INSERT
ON M_TBL
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.MEMBER_NAME||' ȸ���� �߰��Ǿ����ϴ�.');
END;
/
INSERT INTO M_TBL
VALUES('user01','1111','����1',SYSDATE-1);
INSERT INTO M_TBL
VALUES('user02','2222','����2',SYSDATE-1);
INSERT INTO M_TBL
VALUES('user03','3333','����3',SYSDATE-1);
COMMIT;
SELECT * FROM M_TBL;

-- M_TBL���� ��й�ȣ�� �����ϸ� �����̷��� M_LOG TBL�� INSERT�ϴ� TRIGGER
CREATE OR REPLACE TRIGGER M_TBL_PW_TRG
AFTER UPDATE
ON M_TBL
FOR EACH ROW
BEGIN
    INSERT INTO M_LOG
    VALUES (:OLD.MEMBER_ID, :OLD.MEMBER_PW||' -> '||:NEW.MEMBER_PW, SYSDATE);
END;
/
SELECT * FROM M_TBL;
UPDATE M_TBL SET MEMBER_PW = '1234' WHERE MEMBER_ID = 'user01';
SELECT * FROM M_LOG;

-- M_TBL���� ������ ���� �� DEL_M_TBL�� �����͸� INSERT�ϴ� TRIGGER
CREATE OR REPLACE TRIGGER M_TBL_DEL_TRG
AFTER DELETE
ON M_TBL
FOR EACH ROW
BEGIN
    INSERT INTO DEL_M_TBL
    VALUES(:OLD.MEMBER_ID, :OLD.MEMBER_NAME, :OLD.ENROLL_DATE, SYSDATE);
END;
/
DESC DEL_M_TBL;
SELECT * FROM M_TBL;
SELECT * FROM DEL_M_TBL;
DELETE FROM M_TBL WHERE MEMBER_ID = 'user03';

CREATE TABLE PRODUCT(
    PCODE   NUMBER PRIMARY KEY,     -- ��ǰ�ڵ�
    PNAME   VARCHAR2(50) NOT NULL,  -- ��ǰ�̸�
    PRICE   NUMBER,                 -- ����
    STOCK   NUMBER                  -- ���
);
CREATE TABLE PRO_DETAIL(
    DCODE   NUMBER PRIMARY KEY,     -- ��/��� ��ȣ
    PCODE   NUMBER REFERENCES PRODUCT, -- ��ǰ�ڵ�
    D_DATE  DATE,                   -- ��/��� ��¥
    AMOUNT  NUMBER,                 -- ��/��� ����
    STATUS  CHAR(6) CHECK(STATUS IN('�԰�','���')) -- ����
);
INSERT INTO PRODUCT
VALUES(PCODE_SEQ.NEXTVAL,'��������','10000',20);
INSERT INTO PRODUCT
VALUES(PCODE_SEQ.NEXTVAL,'�ڵ�ũ��',9000,10);
CREATE SEQUENCE PCODE_SEQ;
CREATE SEQUENCE DCODE_SEQ;
SELECT * FROM PRODUCT;
SELECT * FROM PRO_DETAIL;
COMMIT;

INSERT INTO PRO_DETAIL
VALUES(DCODE_SEQ.NEXTVAL,2,SYSDATE,10,'�԰�');
UPDATE PRODUCT SET STOCK = 20 WHERE PCODE = 2;
INSERT INTO PRO_DETAIL
VALUES(DCODE_SEQ.NEXTVAL,1,SYSDATE,5,'���');
UPDATE PRODUCT SET STOCK = 15 WHERE PCODE = 1;

CREATE OR REPLACE TRIGGER PRO_TRG
AFTER INSERT
ON PRO_DETAIL
FOR EACH ROW
BEGIN
    IF(:NEW.STATUS = '�԰�')
    THEN
        UPDATE PRODUCT SET STOCK = STOCK + :NEW.AMOUNT WHERE PCODE = :NEW.PCODE;
    ELSE
        UPDATE PRODUCT SET STOCK = STOCK - :NEW.AMOUNT WHERE PCODE = :NEW.PCODE;
    END IF;
END;
/