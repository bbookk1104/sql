SELECT * FROM employee; -- *:����
SELECT emp_name, email, phone FROM employee;
SELECT * FROM employee WHERE emp_name='������'; -- ����,���ڿ� ������� ���� ����ǥ ���

-- EMPLOYEE���̺��� JOB_CODE�� J5�� ������ �̸�,��ȭ��ȣ ���
SELECT emp_name, phone FROM employee WHERE job_code='J5';

-- JOB���̺��� JOB_NAME�� ������ ���
SELECT job_name FROM JOB;

-- DEPARTMENT���̺��� ��� ���� ���
SELECT * FROM department;

-- EMPLOYEE���̺��� �̸�(EMP_NAME), �̸���(EMAIL), ��ȭ��ȣ(PHONE), ����(SALARY)���
SELECT emp_name, email, phone, salary FROM employee;

-- EMPLOYEE���̺��� �̸�(EMP_NAME), �̸���(EMAIL), ��ȭ��ȣ(PHONE), ����(SALARY)���
-- ������ 250���� �̻��� �����
SELECT emp_name, email, phone, salary
FROM employee
WHERE salary>=2500000; -- �����ݷ�(;~;)�������� ���

-- EMPLOYEE���̺��� �̸�(EMP_NAME), �̸���(EMAIL), ��ȭ��ȣ(PHONE), ����(SALARY)���
-- ������ 250���� �̻��̸鼭 �����ڵ�(JOB_CODE)�� J3�� ���
SELECT emp_name, email, phone, salary
FROM employee
WHERE salary>=2500000 AND job_code='J3';

SELECT emp_name, salary, salary*12 FROM employee; -- ����: ����*12

-- �÷� ��Ī ���̱�: ������ [AS "��Ī"]�� �������� Ư�����ڰ� ���ٸ� ��Ī�� �ᵵ ����
-- Ư����ȣ ��� �ÿ��� �ݵ�� �ֵ���ǥ �Է� EX)"�̸�(���� ��)"
SELECT
    emp_name AS "�̸�", salary "����", salary*12 ����,
    (salary+(salary*bonus))*12 "����(���ʽ�����)"
FROM employee;

-- ������ ���̱�
SELECT emp_name, salary, '��' ����
FROM employee;


SELECT * FROM employee WHERE salary>=2500000 AND job_code='J3';


-- ���� ������: || ������ �÷� ���̿� �Է�, +�� ��� ������
SELECT emp_name, salary||'��' FROM employee;

-- �� �����ڴ� =, !=, >, <, >=, =< ��

-- �޿��� 350���� �̻� 600���� ������ ������ �̸�, �޿� ���
SELECT emp_name, salary
FROM employee
WHERE salary>=3500000 AND salary<=6000000;

-- �� ������ BETWEEN ���
SELECT emp_name, salary
FROM employee
WHERE salary BETWEEN 3500000 AND 6000000;


-- LIKE, NOT LIKE
-- ���ϵ�ī�� %,_
-- _ : �� ���ڸ� ��ü
SELECT emp_name, salary
FROM employee
WHERE emp_name LIKE '��__';
-- % : ���ڼ� ���Ѿ��� ��ü
SELECT emp_name, salary
FROM employee
WHERE emp_name LIKE '��%';


-- �̸��Ͽ��� _���� 3������ ���� ��ȸ
SELECT emp_name, email
FROM employee
WHERE email LIKE '___#_%'ESCAPE'#';
-- ESCAPE'#': #�� ���ڴ� ���ϵ�ī�尡 �ƴ��� ���, �ڹ���'\'���� ����(ESCAPE����)
-- �̸��Ͽ��� _���� 3���ڰ� �ƴ� ���� ��ȸ
SELECT emp_name, email
FROM employee
WHERE email NOT LIKE '___#_%'ESCAPE'#';


-- 1. EMPLOYEE���̺��� �̸� ���� ������ ������ ����� �̸�,�޿� ���
SELECT emp_name, salary
FROM employee
WHERE emp_name LIKE '%��';

-- 2. EMPLOYEE���̺��� ��ȭ��ȣ ù 3�ڸ��� 010�� �ƴ� ������ �̸�,��ȭ��ȣ ���
SELECT emp_name, phone
FROM employee
WHERE phone NOT LIKE '010%';

-- 3. EMPLOYEE���̺��� �̸��� �ּҿ� s�� ���鼭,
--    DEPT_CODE�� D9 �Ǵ� D6�� ������ �̸�, �̸���, �μ��ڵ�(DEPT_CODE)���
SELECT emp_name, email, dept_code
FROM employee
WHERE --EMAIL LIKE '%s%' AND DEPT_CODE='D9' OR
      --EMAIL LIKE '%s%'AND DEPT_CODE='D6';
      email LIKE '%s%' AND (dept_code = 'D9' OR dept_code = 'D6');
      -- ������ �� AND�� OR���� ����
      

SELECT emp_name, salary, bonus
FROM employee
WHERE bonus IS NOT NULL; -- NULL�˻��Ϸ��� ������IS�Է�


-- EMPLOYEE���̺��� �̸�, �μ��ڵ� ��ȸ
-- �μ��ڵ�(DEPT_CODE)�� D9 �Ǵ� D6 �Ǵ� D8�� ���� ����
SELECT emp_name, dept_code
FROM employee
WHERE dept_code NOT IN ('D9','D6','D8'); -- OR���� ���� ���϶� IN()

-- �Լ� ��Ʈ --------------------------------------------------------------------
-- LENGTH : ���ڿ��� ���̹�ȯ
SELECT
    emp_name, LENGTH(emp_name),
    email, LENGTH(email)
FROM employee;

-- LENGTHB : ���ڿ��� BYTE��ȯ
SELECT
    emp_name, lengthb(emp_name),
    email, lengthb(email)
FROM employee;

-- INSTR : ã�� ���ڿ��� ������ ��ġ���� ������ Ƚ���� ��Ÿ�� ��ġ ��ȯ
SELECT 'Hello World Hi High' FROM dual; --DUAL�� ������ ���̺�
SELECT instr('Hello World Hi High','H',1,1) FROM dual; --1��° H�� ��ġ ��ȯ
SELECT instr('Hello World Hi High','H',1,2) FROM dual; --2��° H�� ��ġ ��ȯ
SELECT instr('Hello World Hi High','H',1,3) FROM dual; --3��° H�� ��ġ ��ȯ
SELECT instr('Hello World Hi High','H',2,1) FROM dual; --�տ��� �ι�° ��ġ(e)���� ���������� ã��
SELECT instr('Hello World Hi High','H',-1,1) FROM dual; --�ڿ��� ù��° ��ġ(h)���� ���������� ã��

SELECT emp_name, email, instr(email,'@',1,1) "@��ġ"
FROM employee;


-- LPAD/RPAD : �־��� �÷� ���ڿ��� ������ ���ڿ��� ����/�����ʿ� ������
SELECT
    email, LENGTH(email),
    lpad(email,20,'#'),-- ���ڿ� ���� ������ŭ ���ʿ� #ä���
    rpad(email,20,'#') -- ���ڿ� ���� ������ŭ �����ʿ� #ä���
                       -- ���ڿ� ������ �� ������ �׸�ŭ ������ �߸�
FROM employee;


-- LTRIM/RTRIM : �־��� �÷��̳� ���ڿ��� ���� �Ǵ� �����ʿ���
-- ������ ���ڿ��� ���Ե� ��� ���ڸ� ������ ������ ��ȯ
SELECT '000KH000' FROM dual;
SELECT LTRIM('000KH000','0') FROM dual; --'0'�� ���ԵǴ� ���� ��� ����
-- '1,2,3'�� ���ԵǴ� ���� ��� ����
SELECT LTRIM('12312312123123KH12312312123123','123') FROM dual; --���ʺ��� �ڷ�
SELECT RTRIM('12312312123123KH12312312123123','123') FROM dual; --�����ʺ��� ������

-- TRIM : �־��� �÷��̳� ���ڿ��� ��/��/���ʿ� �ִ�
-- ������ ���ڸ� ������ ������ ��ȯ
SELECT '000KH000' FROM dual;
SELECT TRIM('0' FROM '000KH000') FROM dual; --�����ϸ� BOTH
SELECT TRIM(BOTH '0' FROM '000KH000') FROM dual; --���� ����'KH'
SELECT TRIM(LEADING '0' FROM '000KH000') FROM dual; --�� ����'KH000'
SELECT TRIM(TRAILING '0' FROM '000KH000') FROM dual; --�� ����'000KH'

-- SUBSTR : �÷��̳� ���ڿ����� ������ ��ġ����
-- ������ ������ ���ڿ��� �߶󳻾� ��ȯ
SELECT 'SHOW ME THE MONEY' FROM dual;
SELECT substr('SHOW ME THE MONEY',6,2) FROM dual;
-- 6��° ��ġ���� 2�� ���� ��ȯ'ME'
SELECT substr('SHOW ME THE MONEY',9,3) FROM dual;
-- 9��° ��ġ���� 3�� ���� ��ȯ'THE'
SELECT substr('SHOW ME THE MONEY',9) FROM dual;
-- 9��° ��ġ���� ��� ��ȯ'THE MONEY'
SELECT substr('SHOW ME THE MONEY',-9,3) FROM dual;
-- �ڿ��� 9��° ��ġ���� ������ 3�� ���� ��ȯ'THE'


-- 1. EMPLOYEE���̺��� ����̸� �� ���� ���
SELECT lpad(emp_name,2,' ')�� FROM employee;
SELECT rpad(emp_name,2,' ')�� FROM employee;
SELECT substr(enp_name,1,1) FROM employee;

-- 2. EMPLOYEE���̺��� ���ڻ���� �����ȣ,�̸�,�ֹι�ȣ,����
-- ��, �ֹι�ȣ ��� �� �� 6�ڸ��� *�� ���
SELECT
    emp_id �����ȣ, emp_name �̸�,
    rpad(substr(emp_no, 1,8),14,'*') �ֹι�ȣ, salary ����, '��' ����
    -- �ֹι�ȣ ����: 14 / SUBSTR�� �ֹι�ȣ 1~8��° �߶� ��ȯ / RPAD�� ����(9~14)�� *�߰�
    -- RPAD(RPAD(EMP_NO,8,'*'),14,'*') �ֹι�ȣ, SALARY ����, '��' ����
    -- SUBSTR(EMP_NO, 1,8)||'******' �ֹι�ȣ, SALARY ����, '��' ����
FROM employee
WHERE emp_no LIKE '%-1%';
-- WHERE SUBSTR(EMP_NO,8,1) = '1';


-- LOWER / UPPER / INITCAP
SELECT LOWER('Welcome To Oracle') FROM dual;
SELECT UPPER('Welcome To Oracle') FROM dual;
SELECT initcap('wElcome to oRacle') FROM dual;

-- CONCAT : ���ڿ� �ΰ��� �޾� �ϳ��� ���ļ� ����
SELECT CONCAT(CONCAT('�����ٶ�','ABCD'),'1111') FROM DUAL;
SELECT '�����ٶ�'||'ABCD'||'1111' FROM DUAL; -- �ٵ� ���Ῥ���ڰ� �� ����...

-- REPLACE(STR1,STR2,STR3) : ���ڿ� 3���� �Ű������� �޾Ƽ�
-- STR1���ڿ� �� STR2�� ������ STR3���� ����
SELECT REPLACE(EMAIL,'kh','iei') FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- ABS : ���밪
SELECT ABS(10),ABS(-10) FROM DUAL;
-- MOD : ������ ����
SELECT MOD(10,3) FROM DUAL;
-- ROUND : �ݿø�
SELECT ROUND(123.456) FROM DUAL;
SELECT ROUND(123.456,1) FROM DUAL; -- �Ҽ� ù°�ڸ����� �ݿø�(123.5)
SELECT ROUND(123.456,2) FROM DUAL;
SELECT ROUND(123.456,-1) FROM DUAL; -- 120
SELECT ROUND(123.456,-2) FROM DUAL; -- 100
-- FLOOR : ����
SELECT FLOOR(123.567) FROM DUAL; -- �ڸ��� ���� �Ұ�
-- TRUNC : �Ҽ��� �ڸ��� ����
SELECT TRUNC(123.567,1) FROM DUAL; -- �ڸ��� ���� ����, ù°�ڸ����� ����
SELECT TRUNC(123.567,-1) FROM DUAL;
-- CEIL : �ø�
SELECT CEIL(123.456) FROM DUAL; -- �ڸ��� ���� �Ұ�
--------------------------------------------------------------------------------
-- ����ð��� �ٷ�� �Լ� ... SYSDATE���!
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP, CURRENT_TIMESTAMP FROM DUAL;

-- MONTHS_BETWEEN(DATE1,DATE2) : �� ��¥�� ������ ���̸� ��ȯ
SELECT EMP_NAME,HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) FROM EMPLOYEE;

-- ADD_MONTHS(DATE,NUMBER) : �Ű������� ���� ��¥��, �Ű������� ���� ���ڸ�ŭ �������� ���ؼ� ����
SELECT SYSDATE,ADD_MONTHS(SYSDATE,1) FROM DUAL; -- ���� �����Ϸ� Ȱ�밡��
SELECT SYSDATE, SYSDATE+3 FROM DUAL; -- �ϼ� ���� ������ �Լ� �ʿ����

-- NEXT_DAY(DATE,STRING[NUMBER]) : �Ű������� ���� ��¥��������
-- �Է��� ���Ͽ� ���ϴ� ���� ����� ��¥ ����
SELECT SYSDATE, NEXT_DAY(SYSDATE,'�����') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��') FROM DUAL;
-- 1=�Ͽ��� ~ 7=�����
SELECT SYSDATE, NEXT_DAY(SYSDATE,2) FROM DUAL;
-- LAST_DAY(DATE) : �Ű������� ���� ��¥�� ���� ���� ������ ��¥�� ���ؼ� ����
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,2), LAST_DAY(ADD_MONTHS(SYSDATE,2)) FROM DUAL;
-- EXTRACT : ���ϴ� ����/��/�� ����
SELECT SYSDATE FROM DUAL;
SELECT
    SYSDATE,
    EXTRACT(YEAR FROM SYSDATE),
    EXTRACT(MONTH FROM SYSDATE),
    EXTRACT(DAY FROM SYSDATE)
FROM DUAL;
SELECT
    EMP_NAME,
    EXTRACT(YEAR FROM HIRE_DATE)||'�� '||
    EXTRACT(MONTH FROM HIRE_DATE)||'�� '||
    EXTRACT(DAY FROM HIRE_DATE)||'�� ' �Ի���
FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- TO_CHAR ����Ÿ������ ��ȯ
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD/DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MONTH/DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY"��"MM"��"DD"��" HH24"��"MI"��"SS"��"') FROM DUAL;
-- FM�Է��ϸ� 0����(07��->7��)
SELECT TO_CHAR(SYSDATE,'FMYYYY"��"MM"��"DD"��" HH24"��"MI"��"SS"��"') FROM DUAL;

SELECT
    EMP_NAME,
    HIRE_DATE,
    TO_CHAR(HIRE_DATE,'YYYY-MM-DD(DY)') �Ի��� -- DY:��/ȭ/��/��/��/��/��
    -- ��¥HIRE_DATE�� ����Ÿ��'YYYY-MM-DD'���� �ٲ�
FROM EMPLOYEE;

-- ���ڿ��� ���ڷ� ��ȯ
-- 0 OR 9 �� ���ؼ� ������ �ִ� ������ ǥ��
-- 100 -> 000,999
-- ��ȯ�� ���ڱ��̺��� ���˱��̰� ������
SELECT 10000, TO_CHAR(10000,'000,000,000') FROM DUAL; -- ���� ���� 0ä��
SELECT 10000, TO_CHAR(10000,'999,999,999') FROM DUAL; -- ���� ���� ǥ��X
SELECT 10000, TO_CHAR(10000,'999,999,999.999') FROM DUAL; -- �Ҽ��� ǥ��
SELECT 10000, TO_CHAR(10000,'L999,999,999') FROM DUAL; -- �ý��� ������ ȭ�� ǥ��(��)
SELECT EMP_NAME, TO_CHAR(SALARY,'L999,999,999') ���� FROM EMPLOYEE;

-- TO_DATE ��¥Ÿ������ ��ȯ
SELECT TO_DATE(20220715,'YYYYMMDD') FROM DUAL; -- 'YYYYMMDD'�� ���
SELECT TO_CHAR(TO_DATE(20220718,'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- EMPLOYEE ���̺��� 2000�⵵ ����(2000�⵵ ����)�� �Ի��� ����� �̸�,�Ի���
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE)>= 2000;
--
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE(20000101,'YYYYMMDD');

-- TO_NUMBER ����Ÿ������ ��ȯ
SELECT TO_NUMBER('10,000' , '99,999') FROM DUAL;
--------------------------------------------------------------------------------
-- NVL : NULLó���Լ�
SELECT
    EMP_NAME,
    SALARY,
    NVL(BONUS,0), -- BONUS�� BONUS�� ���� ���� �ڷ����� ��ġ�ؾ���
    SALARY*12 ����,
    (SALARY+(SALARY*NVL(BONUS,0)))*12 "����(���ʽ�����)"
FROM EMPLOYEE;

-- DECODE �����Լ�1 : �������� ��쿡 ������ �� �ִ� ��� ����
SELECT
    EMP_NAME, EMP_NO,
    DECODE(SUBSTR(EMP_NO,8,1),
    '1','��','2','��','3','��','4','��','?') ���� -- ?�� default����
FROM EMPLOYEE;
/*
switch(����){ --
    case "1": "��" break;
    case "2": "��" break;
    case "3": "��" break;
    case "4": "��" break;
    default : break;
*/

-- CASE : �������� ��� ������ �� �ִ� �������(�������� ����)
SELECT
    EMP_NAME, EMP_NO,
    CASE
        WHEN SUBSTR(EMP_NO,8,1)=1 OR SUBSTR(EMP_NO,8,1)=3 -- WHEN���ǽ�
        THEN '��' -- THEN������ ��
        WHEN SUBSTR(EMP_NO,8,1) IN (2,4)
        THEN '��'
        ELSE '?'
    END ����
FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- �׷� �Լ��� �� ������ �Ϲ� �Լ��� �Բ� ����� �� ����
-- SUM : �ش� �÷� ������ �� ���� ���ϴ� �Լ�
SELECT SUM(SALARY*12) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- AVG : �ش� �÷� ������ ����� ���ϴ� �Լ�
SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT AVG(NVL(BONUS,0)) FROM EMPLOYEE; -- NULL�� ó���� NVL
SELECT BONUS FROM EMPLOYEE;

-- COUNT : ��ȸ�� ROW���� ��ȯ
SELECT COUNT(BONUS) FROM EMPLOYEE;
SELECT SALARY FROM EMPLOYEE;

-- MAX �ִ밪, MIN �ּҰ�
SELECT MAX(SALARY),MIN(SALARY) FROM EMPLOYEE;
SELECT MAX(HIRE_DATE), MIN(HIRE_DATE) FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- �ǽ�
SELECT * FROM EMPLOYEE;
-- 1. ������� �̸���, �̸��ϱ��� ���
SELECT EMP_NAME ������, EMAIL �̸���, LENGTH(EMAIL) �̸��ϱ���
FROM EMPLOYEE;

-- 2. [������], [�̸����ּ� �� ���̵� �κ�]�� ���
--SELECT EMP_NAME ������, SUBSTR(EMAIL,1,INSTR(EMAIL,'@',1,1)-1) �̸��Ͼ��̵�
SELECT EMP_NAME ������, RTRIM(RTRIM(EMAIL,'kh.or.kr'),'@') �̸��Ͼ��̵�
FROM EMPLOYEE;

-- 3. 60����� ������� ���, ���ʽ� �� ���
-- ���ʽ� ���� null�� ��� 0���� ���
SELECT EMP_NAME ������, SUBSTR((EMP_NO),1,2) �������, NVL(BONUS,0) ���ʽ�
FROM EMPLOYEE
WHERE
    TO_NUMBER(SUBSTR((EMP_NO),1,2)) >= 60
    AND TO_NUMBER(SUBSTR((EMP_NO),1,2)) < 70;

-- 4. '010'�ڵ��� ��ȣ�� �����ʴ� ����� ���� ���(�ο� ����: ��)
SELECT COUNT(PHONE)||'��' AS �ο�
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

-- 5. ������� �Ի��� ���(��¥ ����� 0�� ����)
SELECT EMP_NAME ������, TO_CHAR(HIRE_DATE,'FMYYYY"��"MM"��"') �Ի���
FROM EMPLOYEE;

-- 6. ������� �ֹι�ȣ ��ȸ(9��° �ڸ����� �������� *���ڷ� ä���� ���)
-- SELECT EMP_NAME ������, RPAD(SUBSTR(EMP_NO,1,8),14,'*') �ֹε�Ϲ�ȣ
SELECT EMP_NAME ������, SUBSTR(EMP_NO,1,8)||'******' �ֹε�Ϲ�ȣ
FROM EMPLOYEE;

-- 7. ������,�����ڵ�,����(��) ��ȸ
-- ����(���ʽ��� ����� 1��ġ �޿�)�� �� �ڸ����� ��ǥ','�� �־ ǥ��
SELECT
    EMP_NAME ������, JOB_CODE �����ڵ�,
    TO_CHAR((SALARY+(SALARY*NVL(BONUS,0)))*12,'L999,999,999') ����
FROM EMPLOYEE;

-- 8. �μ��ڵ尡 D5, D9�� ������ �߿��� 2004�⵵�� �Ի��� ���� ��ȸ
SELECT EMP_ID ���, EMP_NAME ������, DEPT_CODE �μ��ڵ�, HIRE_DATE �Ի���
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D9') AND SUBSTR(HIRE_DATE,1,2) = '04';

-- 9. ������, �Ի���, ���ñ����� �ٹ��ϼ� ��ȸ(�ָ��� ����, �Ҽ��� �Ʒ��� ����)
SELECT EMP_NAME ������, HIRE_DATE �Ի���, FLOOR(SYSDATE-HIRE_DATE) �ٹ��ϼ�
FROM EMPLOYEE;

-- 10. ��� ������ ���� �� ���� ���� ���̿� ���� ���� ���� ���
-- ���̰���� ����⵵ - �¾�⵵ +1
--SELECT MAX(123-SUBSTR(EMP_NO,1,2)) "�ִ� ����", MIN(123-SUBSTR(EMP_NO,1,2)) "�ּ� ����"
SELECT
    MAX(
    EXTRACT(YEAR FROM SYSDATE)
    - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))
    +1
    ) �ִ볪��,
    MIN(
    EXTRACT(YEAR FROM SYSDATE)
    - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))
    +1
    ) �ּҳ���
   
FROM EMPLOYEE;

-- 11. ȸ�翡�� �߱��� �ؾߵǴ� �μ� ��ǥ, �μ��ڵ� D5,D6,D9�� ��� '�߱�', �̿� �μ��� '�߱پ���'
-- ��°��� �̸�, �μ��ڵ�, �߱�����(�μ��ڵ� ���� �������� ����)
SELECT
    EMP_NAME ������, DEPT_CODE �μ��ڵ�,
    CASE
        WHEN DEPT_CODE IN ('D5','D6','D9')
        THEN '�߱�'
        ELSE '�߱پ���'
    END �߱�����
FROM EMPLOYEE ORDER BY DEPT_CODE ASC;

-- ����
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE ORDER BY 2;
-- �⺻�� ��������ASC, ���������� DESC / ���� ��µǴ� �÷��� �����ε� ���� ����(2=DEPT_CODE)
-- ���� ����� �����ʴ� Ŀ�����ε� ���� ����(SALARY)

-- 12. �μ��ڵ尡 D5�̸� �ѹ���, D6�̸� ��ȹ��, D9�̸� �����η� ó��
-- ��, �μ��ڵ尡 D5, D6, D9�� ������ ������ ��ȸ, �μ��ڵ� ���� �������� ����
SELECT
    EMP_NAME ������ , DEPT_CODE �μ��ڵ�,
    CASE
        WHEN DEPT_CODE = 'D5'
        THEN '�ѹ���'
        WHEN DEPT_CODE = 'D6'
        THEN '��ȹ��'
        WHEN DEPT_CODE = 'D9'
        THEN '������'
    END �μ���
    -- DECODE(DEPT_CODE,'D5','�ѹ���','D6','��ȹ��','D9','������')
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9') ORDER BY DEPT_CODE;

-- 13. ������, �μ��ڵ�, �������, ���� ��ȸ
-- ��������� �ֹι�ȣ���� �����ؼ� 00��00��00�Ϸ� ���
-- ���̴� �ֹι�ȣ���� �����ؼ� ��¥�����ͷ� ��ȯ�� ���� ���
-- �ֹι�ȣ �̻��� ��� ����(200,201,214�� - ��Ʈ: NOT IN ���)
SELECT
    EMP_NAME ������, DEPT_CODE �μ��ڵ�,
    TO_CHAR(TO_DATE(SUBSTR(EMP_NO,1,6)),'YY"�� "MM"�� "DD"��"') �������,
    EXTRACT(YEAR FROM SYSDATE)-
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6),'RRMMDD'))+1 ����
    --CEIL(MONTHS_BETWEEN(SYSDATE,(TO_DATE(SUBSTR(EMP_NO,1,6))))/12)
FROM EMPLOYEE
WHERE EMP_ID NOT IN(200,201,214);

-- 14. �������� �Ի��Ϸκ��� ������ ������ �� ������ �Ի��ο��� ���, ��ü������ ���
SELECT
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE),1998,1)) AS "1998��",
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE),1999,1)) AS "1999��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2000,1,0)) AS "2000��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2001,1,0)) AS "2001��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2002,1,0)) AS "2002��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2003,1,0)) AS "2003��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2004,1,0)) AS "2004��",
    COUNT(HIRE_DATE) ��ü������
FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- GROUP BY [����] : ���� ���� �׷��Լ� ����
SELECT DEPT_CODE, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
SELECT --4
    DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') ����,
    SUM(SALARY), FLOOR(AVG(SALARY)),
    COUNT(*)
FROM EMPLOYEE --1
WHERE DEPT_CODE IN('D1','D2','D3') --2
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') --3
ORDER BY 3 DESC; --5

-- HAVING
SELECT --4
    DEPT_CODE, FLOOR(AVG(SALARY))
FROM EMPLOYEE --1
-- WHERE SALARY > 3000000 ���� ���������� ���� �ٸ� ����߻�
GROUP BY DEPT_CODE --2
HAVING FLOOR(AVG(SALARY))>3000000; --3

-- 1. EMPLOYEE���̺��� J1���� ����(JOB_CODE)
-- ����, ���޺� �����, ���޺� ��ձ޿� ���
SELECT JOB_CODE ����, COUNT(*) "��� ��", FLOOR(AVG(SALARY)) ��ձ޿�
FROM EMPLOYEE
WHERE JOB_CODE != 'J1'
GROUP BY JOB_CODE;

-- 2. EMPLOYEE���̺��� J1���� ����
-- �Ի�⵵�� �ο����� ��ȸ�ؼ� �Ի��������� �������� ����
SELECT EXTRACT(YEAR FROM HIRE_DATE) �Ի翬��, COUNT(*) "��� ��"
FROM EMPLOYEE
WHERE JOB_CODE != 'J1'
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
ORDER BY 1;

-- �μ��� ���� �ο���
-- D1 �� 2
-- D1 �� 1
SELECT
    DEPT_CODE �μ�, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') AS ����,
    COUNT(*) �ο���
FROM EMPLOYEE
GROUP BY DEPT_CODE, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��')
ORDER BY 1;
--------------------------------------------------------------------------------
-- JOIN
-- 1. ORACLE���뱸��
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

-- 2. ANSI ǥ�ر���
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- INNER JOIN: NULL�� ������� ���ǿ� �����ʾ� ���ܵ�

SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE IS NULL;
SELECT * FROM JOB;

-- 1. ORACLE(���Ϸ��� �÷� �̸��� ���� ��� ���̺� ���� �ʿ�)
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- 2. ANSIǥ��
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE); --�÷����� ���� ��� USING���->�ϳ��� �ν�

-- INNER JOIN (�񱳱����� ��ġ�ϴ� �����Ͱ� ������ JOIN������� ����)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- OUTER JOIN
-- LEFT JOIN (���� ���� ����)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- RIGHT JOIN (������ ���� ����)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- FULL JOIN (LEFT RIGHT ���� ����)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- CROSS JOIN
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT;

SELECT EMP_ID, EMP_NAME, MANEGER_ID FROM EMPLOYEE;

-- EMPLOYEE E1(����������), EMPLOYEE E2(������������)
SELECT E1.EMP_ID, E1.EMP_NAME, E1.MANAGER_ID, E2.EMP_NAME AS MANAGER_NAME
FROM EMPLOYEE E1
LEFT JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID)
ORDER BY 1;

-- EMPLOYEE, DEPARTMENT
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;
-- ���� ����
SELECT EMP_NAME, DEPT_TITLE, NATIONAL_CODE -- 4
FROM EMPLOYEE -- 1
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) -- 2(�׷���)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE) -- 2(�׷���)
WHERE DEPT_CODE IN ('D9','D6'); -- 3 WHERE�� ���� ����
-- JOIN���� �߿�(EMPLOYEE�� ���� ������ �÷��� ���)

SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE);
-- �÷��� ���� ���� ������ ��쿡�� ������� ����
--------------------------------------------------------------------------------
-- JOIN �ǽ�
-- 1. �ֹι�ȣ�� 1970��� ���̸鼭 ������ �����̰�, ���� ������ ��������
-- �����, �ֹι�ȣ, �μ���, ���޸� ��ȸ
SELECT EMP_NAME �����, EMP_NO �ֹι�ȣ, DEPT_TITLE �μ���, JOB_NAME ���޸�
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
WHERE
    EMP_NO LIKE '7%-2%' AND EMP_NAME LIKE '��%';
    -- SUBSTR(EMP_NO,1,1) = 7 AND SUBSTR(EMP_NO,8,1)=2 AND_NAME LIKE '��%'
    -- SUBSTR(EMP_NO,1,2)>=70 AND SUBSTR(EMP_NO,1,2)<80 AND SUBSTR(EMP_NO,8,1)=2 AND SUBSTR(EMP_NAME,1,1)= '��';

-- 2. �̸��� '��'�ڰ� ���� �������� ���, �����, �μ��� ��ȸ
SELECT EMP_ID ���, EMP_NAME �����, DEPT_TITLE �μ���
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_NAME LIKE '%��%';

-- 3. �ؿܿ����ο� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ��� ��ȸ
SELECT EMP_NAME �����, JOB_NAME ���޸�, DEPT_CODE �μ��ڵ�, DEPT_TITLE �μ���
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
WHERE DEPT_TITLE LIKE '�ؿܿ���%';

-- 4. ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ������� ��ȸ
SELECT EMP_NAME �����, BONUS ���ʽ�, DEPT_TITLE �μ���, LOCAL_NAME �ٹ�������
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE BONUS IS NOT NULL;

-- 5. �μ��ڵ尡 D2�� �������� �����, ���޸�, �μ���, �ٹ������� ��ȸ
SELECT EMP_NAME �����, JOB_NAME ���޸�, DEPT_TITLE �μ���, LOCAL_NAME �ٹ�������
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE DEPT_CODE = 'D2';

-- 6. �ѱ�(KO)�� �Ϻ�(JP)�� �ٹ��ϴ� �������� �����, �μ���, ������, ������ ��ȸ
SELECT EMP_NAME �����, DEPT_TITLE �μ���, LOCAL_NAME ������, NATIONAL_NAME ������
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME IN('�ѱ�','�Ϻ�');

-- 7. ���� �μ��� �ٹ��ϴ� �������� �����, �μ���, �����̸� ��ȸ(SELF JOIN���)
SELECT E1.EMP_NAME �����, DEPT_TITLE �μ���,E2.EMP_NAME �����̸�
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON (E1.DEPT_CODE = E2.DEPT_CODE)
JOIN DEPARTMENT ON (E1.DEPT_CODE = DEPT_ID)
WHERE E1.EMP_NAME != E2.EMP_NAME
ORDER BY 1;

-- 8. ���ʽ�����Ʈ�� ���� ������ �߿���
-- ������ ����� ����� �������� �����, ���޸�, �޿��� ��ȸ(JOIN�� IN���)
SELECT EMP_NAME �����, JOB_NAME ���޸�, SALARY �޿�
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE BONUS IS NULL AND JOB_NAME IN('����','���');
--------------------------------------------------------------------------------
-- ���տ�����(SET OPERATOR) : �÷��� ���� �ڷ����� ��ġ�ؾ� ��
-- UNION : �� ��ȸ���(SELECT)�� �ߺ������� �����ϰ� �ϳ��� ��ħ(������),
-- ù��° �÷����� �������� ���ı��� ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- UNION ALL : �� ��ȸ����� �ϳ��� ��ġ�鼭 �ߺ��� ������������, �������� ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- INTERSECT : �� SELECT������ ����� �κи� ����(������)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- MINUS : ù��° ��ȸ������ �ι�° ��ȸ���� ��ġ�� �κ��� ����(������)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
--------------------------------------------------------------------------------
-- SUBQUERY : SELECT�ȿ� ���Ե� �� �ϳ��� SELECT��, �������� ���� �� �ѹ��� ����
-- ���� : ���������� �Ұ�ȣ�� ������ϰ�,
-- ���� �׸��� ���������� SELECT�� �׸��� ������ �ڷ����� ��ġ�ؾ� ��

-- �������� ��ձ޿����� ���� �޿��� �޴� ������ ���,�̸�,�޿� ��ȸ
-- 1. �������� ��ձ޿� ��ȸ
SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE; -- �÷�1 ROW1
-- 2. 1���� ��ȸ�� ����� �̿��Ͽ� ������ �ۼ�
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE);

-- ������ ������ ������ �̸��� ���
-- 1. ������ ������ ������ ���(MANAGER_ID)��ȸ
SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME = '������';
-- 2. 1�� ��ȸ����� ������ �̸� ���
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = (SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME = '������');
-- JOIN ��� ��
SELECT E2.EMP_NAME
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID)
WHERE E1.EMP_NAME = '������';

-- 1. �����ؿ� �޿��� ���� ������� �����ȣ,�̸�,�޿��� ���(��, �����ش� ���X)
SELECT EMP_ID ���, EMP_NAME �̸�, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '������')
      AND EMP_NAME != '������';
      
-- 2. EMPLOYEE ���̺��� �޿��� ���� ���� ����� ���� ���� ����� ���,�̸�,�޿� ���
SELECT EMP_ID ���, EMP_NAME �̸�, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY IN((SELECT MAX(SALARY) FROM EMPLOYEE),(SELECT MIN(SALARY) FROM EMPLOYEE));
      
-- 3. D1, D2�μ����� �ٹ��ϴ� ����� �� [D5�μ� �������� ��ձ޿�]����
-- �޿��� ���� ������� �̸�, �μ��ڵ�, �޿� ���
SELECT EMP_NAME �̸�, DEPT_CODE �μ��ڵ�, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D5')
      AND DEPT_CODE IN('D1','D2') ;
--------------------------------------------------------------------------------//07.20�������
-- ������ ��������(�÷� �ϳ�, ROW ���� ��...����)
-- �� �μ��� �ְ�޿��� �޴� ������ �̸�,�μ��ڵ�,�޿� ���
SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
-- ���� ���� ���� �� �ִ� IN ���
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);

-- ANY�� ���� OR�� ����
-- �񱳰� > ANY() : �������� ��ȸ��� �� [�ּҰ����� ũ��] = 249�������� ũ��
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > ANY(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
-- �񱳰� < ANY() : �������� ��ȸ��� �� [�ִ밪���� ������] = 800�������� ������
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < ANY(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
-- �񱳰� = ANY() : IN�� ���� ȿ��!
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = ANY(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);

-- ALL�� ���� AND�� ����
-- �񱳰� > ALL() : �ִ밪���� ũ�� = 800�������� ũ��(��°�� ����)
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > ALL(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
-- �񱳰� < ALL() : �ּҰ����� ������ = 249�������� ������
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < ALL(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
--------------------------------------------------------------------------------
-- ���߿� SUBQUERY(ROW�ϳ�, �÷� ���� ��...���)
-- ����� ������ �μ�,������ ��ȸ(ENT_YN = 'Y')
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN = 'Y';

SELECT EMP_NAME, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE
(DEPT_CODE, JOB_CODE) IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN = 'Y');
-- DEPT_CODE = 'D8' AND JOB_CODE = 'J6';
--------------------------------------------------------------------------------
-- �������(��ȣ���� ��������)
-- ������������ ���������� �ְ� ���������� ������ ��, �ٽ� ���������� ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID
FROM EMPLOYEE E1
WHERE EXISTS(SELECT EMP_ID FROM EMPLOYEE E2 WHERE E1.MANAGER_ID = E2.EMP_ID);
-- EXIST : ��ȸ����� ������ TRUE, ������ FALSE
SELECT EMP_ID, MANAGER_ID FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- ��Į�� �������� : ��ȣ���� ���������̸鼭 ������� 1���� ��������
-- ��Į�� �������� (SELECT�� ���)

-- ��� ����� ���,�̸�,�����ڹ�ȣ,�������̸� ��ȸ
SELECT
    EMP_ID ���, EMP_NAME �̸�, MANAGER_ID �����ڹ�ȣ,
    (SELECT E2.EMP_NAME FROM EMPLOYEE E2 WHERE E2.EMP_ID = E1.MANAGER_ID) AS �����ڸ�
FROM EMPLOYEE E1;

-- �����,�μ��ڵ�,�ҼӺμ��� ����ӱ��� ��Į�� ���������� ���
SELECT EMP_NAME, DEPT_CODE,
       FLOOR((SELECT AVG(SALARY) FROM EMPLOYEE E2 WHERE E2.DEPT_CODE = E1.DEPT_CODE)) ����ӱ�
FROM EMPLOYEE E1;
--------------------------------------------------------------------------------
-- �ζ��� ��
-- �� : ������ ���̺�
-- �ζ��� �� : FROM���� ����ϴ� ��������
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;
SELECT * FROM (SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE);

-- TOP-N �м�
-- ȸ�翡�� �޿��� ���� ���� ���� 5���� �̸�, �μ��ڵ�, �޿� ���
SELECT ROWNUM, EMP_NAME, DEPT_CODE, SALARY
FROM (SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM < 6; -- ��� ���� : �Խ��ǿ��� �ֱ� �� 20�� ���

SELECT SALARY FROM EMPLOYEE ORDER BY 1 DESC;

SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) FROM EMPLOYEE; -- 19,19,21
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) FROM EMPLOYEE; -- 19,19,20
SELECT EMP_NAME, SALARY, ROW_NUMBER() OVER(ORDER BY SALARY DESC) FROM EMPLOYEE; -- 19,20,21
--------------------------------------------------------------------------------

-- 2022.07.20
-- 1. BONUS�� �����鼭 �Ŵ����� �����ϴ� ����� ��������� ��ȸ�ϱ����� SQL��
SELECT * FROM EMPLOYEE WHERE BONUS IS NULL AND MANAGER_ID IS NOT NULL;


-- 2. DEPT_CODE�� D9�̰ų� D6�̰�, SALARY�� 300���� �̻��̰�, BONUS�� �ִ� �����
-- EMP_NAME, EMP_NO, DEPT_CODE, SALARY�� ��ȸ
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='D9' OR DEPT_CODE='D6') AND SALARY >=3000000
AND BONUS IS NOT NULL;


-- 3. SALARY�� 3000000�� �̻��� ������ EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME�� ��ȸ
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE=J.JOB_CODE)
WHERE SALARY>=3000000;?

SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY>=3000000;?