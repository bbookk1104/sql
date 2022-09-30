SELECT * FROM employee; -- *:모든것
SELECT emp_name, email, phone FROM employee;
SELECT * FROM employee WHERE emp_name='선동일'; -- 문자,문자열 상관없이 작은 따옴표 사용

-- EMPLOYEE테이블에서 JOB_CODE가 J5인 직원의 이름,전화번호 출력
SELECT emp_name, phone FROM employee WHERE job_code='J5';

-- JOB테이블에서 JOB_NAME의 정보만 출력
SELECT job_name FROM JOB;

-- DEPARTMENT테이블의 모든 정보 출력
SELECT * FROM department;

-- EMPLOYEE테이블에서 이름(EMP_NAME), 이메일(EMAIL), 전화번호(PHONE), 월급(SALARY)출력
SELECT emp_name, email, phone, salary FROM employee;

-- EMPLOYEE테이블에서 이름(EMP_NAME), 이메일(EMAIL), 전화번호(PHONE), 월급(SALARY)출력
-- 월급이 250만원 이상인 사람만
SELECT emp_name, email, phone, salary
FROM employee
WHERE salary>=2500000; -- 세미콜론(;~;)기준으로 출력

-- EMPLOYEE테이블에서 이름(EMP_NAME), 이메일(EMAIL), 전화번호(PHONE), 월급(SALARY)출력
-- 월급이 250만원 이상이면서 직급코드(JOB_CODE)가 J3인 사람
SELECT emp_name, email, phone, salary
FROM employee
WHERE salary>=2500000 AND job_code='J3';

SELECT emp_name, salary, salary*12 FROM employee; -- 연봉: 월급*12

-- 컬럼 별칭 붙이기: 정석은 [AS "별칭"]인 형태지만 특수문자가 없다면 별칭만 써도 무방
-- 특수기호 사용 시에는 반드시 쌍따옴표 입력 EX)"이름(개명 전)"
SELECT
    emp_name AS "이름", salary "월급", salary*12 연봉,
    (salary+(salary*bonus))*12 "연봉(보너스포함)"
FROM employee;

-- 데이터 붙이기
SELECT emp_name, salary, '원' 단위
FROM employee;


SELECT * FROM employee WHERE salary>=2500000 AND job_code='J3';


-- 연결 연산자: || 연결할 컬럼 사이에 입력, +는 산술 연산자
SELECT emp_name, salary||'원' FROM employee;

-- 비교 연산자는 =, !=, >, <, >=, =< 등

-- 급여가 350만원 이상 600만원 이하인 직원의 이름, 급여 출력
SELECT emp_name, salary
FROM employee
WHERE salary>=3500000 AND salary<=6000000;

-- 비교 연산자 BETWEEN 사용
SELECT emp_name, salary
FROM employee
WHERE salary BETWEEN 3500000 AND 6000000;


-- LIKE, NOT LIKE
-- 와일드카드 %,_
-- _ : 한 글자를 대체
SELECT emp_name, salary
FROM employee
WHERE emp_name LIKE '전__';
-- % : 글자수 제한없이 대체
SELECT emp_name, salary
FROM employee
WHERE emp_name LIKE '전%';


-- 이메일에서 _앞이 3글자인 직원 조회
SELECT emp_name, email
FROM employee
WHERE email LIKE '___#_%'ESCAPE'#';
-- ESCAPE'#': #뒤 글자는 와일드카드가 아님을 명시, 자바의'\'같은 역할(ESCAPE문자)
-- 이메일에서 _앞이 3글자가 아닌 직원 조회
SELECT emp_name, email
FROM employee
WHERE email NOT LIKE '___#_%'ESCAPE'#';


-- 1. EMPLOYEE테이블에서 이름 끝이 연으로 끝나는 사원의 이름,급여 출력
SELECT emp_name, salary
FROM employee
WHERE emp_name LIKE '%연';

-- 2. EMPLOYEE테이블에서 전화번호 첫 3자리가 010이 아닌 직원의 이름,전화번호 출력
SELECT emp_name, phone
FROM employee
WHERE phone NOT LIKE '010%';

-- 3. EMPLOYEE테이블에서 이메일 주소에 s가 들어가면서,
--    DEPT_CODE가 D9 또는 D6인 직원의 이름, 이메일, 부서코드(DEPT_CODE)출력
SELECT emp_name, email, dept_code
FROM employee
WHERE --EMAIL LIKE '%s%' AND DEPT_CODE='D9' OR
      --EMAIL LIKE '%s%'AND DEPT_CODE='D6';
      email LIKE '%s%' AND (dept_code = 'D9' OR dept_code = 'D6');
      -- 연산할 때 AND가 OR보다 빠름
      

SELECT emp_name, salary, bonus
FROM employee
WHERE bonus IS NOT NULL; -- NULL검사하려면 연산자IS입력


-- EMPLOYEE테이블에서 이름, 부서코드 조회
-- 부서코드(DEPT_CODE)가 D9 또는 D6 또는 D8인 직원 제외
SELECT emp_name, dept_code
FROM employee
WHERE dept_code NOT IN ('D9','D6','D8'); -- OR조건 여러 개일때 IN()

-- 함수 파트 --------------------------------------------------------------------
-- LENGTH : 문자열의 길이반환
SELECT
    emp_name, LENGTH(emp_name),
    email, LENGTH(email)
FROM employee;

-- LENGTHB : 문자열의 BYTE반환
SELECT
    emp_name, lengthb(emp_name),
    email, lengthb(email)
FROM employee;

-- INSTR : 찾는 문자열이 지정한 위치부터 지정한 횟수에 나타난 위치 반환
SELECT 'Hello World Hi High' FROM dual; --DUAL은 가상의 테이블
SELECT instr('Hello World Hi High','H',1,1) FROM dual; --1번째 H의 위치 반환
SELECT instr('Hello World Hi High','H',1,2) FROM dual; --2번째 H의 위치 반환
SELECT instr('Hello World Hi High','H',1,3) FROM dual; --3번째 H의 위치 반환
SELECT instr('Hello World Hi High','H',2,1) FROM dual; --앞에서 두번째 위치(e)부터 오른쪽으로 찾기
SELECT instr('Hello World Hi High','H',-1,1) FROM dual; --뒤에서 첫번째 위치(h)부터 오른쪽으로 찾기

SELECT emp_name, email, instr(email,'@',1,1) "@위치"
FROM employee;


-- LPAD/RPAD : 주어진 컬럼 문자열에 임의의 문자열을 왼쪽/오른쪽에 덧붙임
SELECT
    email, LENGTH(email),
    lpad(email,20,'#'),-- 문자열 남는 공간만큼 왼쪽에 #채우기
    rpad(email,20,'#') -- 문자열 남는 공간만큼 오른쪽에 #채우기
                       -- 문자열 공간이 더 많으면 그만큼 데이터 잘림
FROM employee;


-- LTRIM/RTRIM : 주어진 컬럼이나 문자열의 왼쪽 또는 오른쪽에서
-- 지정된 문자열에 포함된 모든 문자를 제거한 나머지 반환
SELECT '000KH000' FROM dual;
SELECT LTRIM('000KH000','0') FROM dual; --'0'에 포함되는 문자 모두 제거
-- '1,2,3'에 포함되는 문자 모두 제거
SELECT LTRIM('12312312123123KH12312312123123','123') FROM dual; --왼쪽부터 뒤로
SELECT RTRIM('12312312123123KH12312312123123','123') FROM dual; --오른쪽부터 앞으로

-- TRIM : 주어진 컬럼이나 문자열의 앞/뒤/양쪽에 있는
-- 지정한 문자를 제거한 나머지 반환
SELECT '000KH000' FROM dual;
SELECT TRIM('0' FROM '000KH000') FROM dual; --생략하면 BOTH
SELECT TRIM(BOTH '0' FROM '000KH000') FROM dual; --양쪽 제거'KH'
SELECT TRIM(LEADING '0' FROM '000KH000') FROM dual; --앞 제거'KH000'
SELECT TRIM(TRAILING '0' FROM '000KH000') FROM dual; --뒤 제거'000KH'

-- SUBSTR : 컬럼이나 문자열에서 지정한 위치부터
-- 지정한 개수의 문자열을 잘라내어 반환
SELECT 'SHOW ME THE MONEY' FROM dual;
SELECT substr('SHOW ME THE MONEY',6,2) FROM dual;
-- 6번째 위치부터 2개 글자 반환'ME'
SELECT substr('SHOW ME THE MONEY',9,3) FROM dual;
-- 9번째 위치부터 3개 글자 반환'THE'
SELECT substr('SHOW ME THE MONEY',9) FROM dual;
-- 9번째 위치부터 모두 반환'THE MONEY'
SELECT substr('SHOW ME THE MONEY',-9,3) FROM dual;
-- 뒤에서 9번째 위치부터 오른쪽 3개 글자 반환'THE'


-- 1. EMPLOYEE테이블에서 사원이름 중 성만 출력
SELECT lpad(emp_name,2,' ')성 FROM employee;
SELECT rpad(emp_name,2,' ')성 FROM employee;
SELECT substr(enp_name,1,1) FROM employee;

-- 2. EMPLOYEE테이블에서 남자사원만 사원번호,이름,주민번호,월급
-- 단, 주민번호 출력 시 뒤 6자리는 *로 출력
SELECT
    emp_id 사원번호, emp_name 이름,
    rpad(substr(emp_no, 1,8),14,'*') 주민번호, salary 월급, '원' 단위
    -- 주민번호 길이: 14 / SUBSTR로 주민번호 1~8번째 잘라서 반환 / RPAD로 공백(9~14)에 *추가
    -- RPAD(RPAD(EMP_NO,8,'*'),14,'*') 주민번호, SALARY 월급, '원' 단위
    -- SUBSTR(EMP_NO, 1,8)||'******' 주민번호, SALARY 월급, '원' 단위
FROM employee
WHERE emp_no LIKE '%-1%';
-- WHERE SUBSTR(EMP_NO,8,1) = '1';


-- LOWER / UPPER / INITCAP
SELECT LOWER('Welcome To Oracle') FROM dual;
SELECT UPPER('Welcome To Oracle') FROM dual;
SELECT initcap('wElcome to oRacle') FROM dual;

-- CONCAT : 문자열 두개를 받아 하나로 합쳐서 리턴
SELECT CONCAT(CONCAT('가나다라','ABCD'),'1111') FROM DUAL;
SELECT '가나다라'||'ABCD'||'1111' FROM DUAL; -- 근데 연결연산자가 더 편함...

-- REPLACE(STR1,STR2,STR3) : 문자열 3개를 매개변수로 받아서
-- STR1문자열 중 STR2의 내용을 STR3으로 수정
SELECT REPLACE(EMAIL,'kh','iei') FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- ABS : 절대값
SELECT ABS(10),ABS(-10) FROM DUAL;
-- MOD : 나머지 연산
SELECT MOD(10,3) FROM DUAL;
-- ROUND : 반올림
SELECT ROUND(123.456) FROM DUAL;
SELECT ROUND(123.456,1) FROM DUAL; -- 소수 첫째자리까지 반올림(123.5)
SELECT ROUND(123.456,2) FROM DUAL;
SELECT ROUND(123.456,-1) FROM DUAL; -- 120
SELECT ROUND(123.456,-2) FROM DUAL; -- 100
-- FLOOR : 버림
SELECT FLOOR(123.567) FROM DUAL; -- 자릿수 지정 불가
-- TRUNC : 소수점 자리수 버림
SELECT TRUNC(123.567,1) FROM DUAL; -- 자릿수 지정 가능, 첫째자리까지 버림
SELECT TRUNC(123.567,-1) FROM DUAL;
-- CEIL : 올림
SELECT CEIL(123.456) FROM DUAL; -- 자릿수 지정 불가
--------------------------------------------------------------------------------
-- 현재시간을 다루는 함수 ... SYSDATE사용!
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP, CURRENT_TIMESTAMP FROM DUAL;

-- MONTHS_BETWEEN(DATE1,DATE2) : 두 날짜의 개월수 차이를 반환
SELECT EMP_NAME,HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) FROM EMPLOYEE;

-- ADD_MONTHS(DATE,NUMBER) : 매개변수로 받은 날짜에, 매개변수로 받은 숫자만큼 개월수를 더해서 리턴
SELECT SYSDATE,ADD_MONTHS(SYSDATE,1) FROM DUAL; -- 쿠폰 만료일로 활용가능
SELECT SYSDATE, SYSDATE+3 FROM DUAL; -- 일수 더할 때에는 함수 필요없삼

-- NEXT_DAY(DATE,STRING[NUMBER]) : 매개변수로 받은 날짜기준으로
-- 입력한 요일에 속하는 가장 가까운 날짜 리턴
SELECT SYSDATE, NEXT_DAY(SYSDATE,'목요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'수') FROM DUAL;
-- 1=일요일 ~ 7=토요일
SELECT SYSDATE, NEXT_DAY(SYSDATE,2) FROM DUAL;
-- LAST_DAY(DATE) : 매개변수로 받은 날짜가 속한 달의 마지막 날짜를 구해서 리턴
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,2), LAST_DAY(ADD_MONTHS(SYSDATE,2)) FROM DUAL;
-- EXTRACT : 원하는 연도/월/일 추출
SELECT SYSDATE FROM DUAL;
SELECT
    SYSDATE,
    EXTRACT(YEAR FROM SYSDATE),
    EXTRACT(MONTH FROM SYSDATE),
    EXTRACT(DAY FROM SYSDATE)
FROM DUAL;
SELECT
    EMP_NAME,
    EXTRACT(YEAR FROM HIRE_DATE)||'년 '||
    EXTRACT(MONTH FROM HIRE_DATE)||'월 '||
    EXTRACT(DAY FROM HIRE_DATE)||'일 ' 입사일
FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- TO_CHAR 문자타입으로 변환
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD/DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MONTH/DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY"년"MM"월"DD"일" HH24"시"MI"분"SS"초"') FROM DUAL;
-- FM입력하면 0지움(07월->7월)
SELECT TO_CHAR(SYSDATE,'FMYYYY"년"MM"월"DD"일" HH24"시"MI"분"SS"초"') FROM DUAL;

SELECT
    EMP_NAME,
    HIRE_DATE,
    TO_CHAR(HIRE_DATE,'YYYY-MM-DD(DY)') 입사일 -- DY:월/화/수/목/금/토/일
    -- 날짜HIRE_DATE를 문자타입'YYYY-MM-DD'으로 바꿈
FROM EMPLOYEE;

-- 숫자에서 문자로 변환
-- 0 OR 9 를 통해서 숫자의 최대 갯수를 표현
-- 100 -> 000,999
-- 변환될 숫자길이보다 포맷길이가 길어야함
SELECT 10000, TO_CHAR(10000,'000,000,000') FROM DUAL; -- 남는 공간 0채움
SELECT 10000, TO_CHAR(10000,'999,999,999') FROM DUAL; -- 남는 공간 표시X
SELECT 10000, TO_CHAR(10000,'999,999,999.999') FROM DUAL; -- 소숫점 표시
SELECT 10000, TO_CHAR(10000,'L999,999,999') FROM DUAL; -- 시스템 지역의 화폐 표시(원)
SELECT EMP_NAME, TO_CHAR(SALARY,'L999,999,999') 월급 FROM EMPLOYEE;

-- TO_DATE 날짜타입으로 변환
SELECT TO_DATE(20220715,'YYYYMMDD') FROM DUAL; -- 'YYYYMMDD'는 양식
SELECT TO_CHAR(TO_DATE(20220718,'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- EMPLOYEE 테이블에서 2000년도 이후(2000년도 포함)에 입사한 사원의 이름,입사일
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE)>= 2000;
--
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE(20000101,'YYYYMMDD');

-- TO_NUMBER 숫자타입으로 변환
SELECT TO_NUMBER('10,000' , '99,999') FROM DUAL;
--------------------------------------------------------------------------------
-- NVL : NULL처리함수
SELECT
    EMP_NAME,
    SALARY,
    NVL(BONUS,0), -- BONUS와 BONUS에 넣을 값의 자료형이 일치해야함
    SALARY*12 연봉,
    (SALARY+(SALARY*NVL(BONUS,0)))*12 "연봉(보너스포함)"
FROM EMPLOYEE;

-- DECODE 선택함수1 : 여러가지 경우에 선택할 수 있는 기능 제공
SELECT
    EMP_NAME, EMP_NO,
    DECODE(SUBSTR(EMP_NO,8,1),
    '1','남','2','여','3','남','4','여','?') 성별 -- ?는 default역할
FROM EMPLOYEE;
/*
switch(변수){ --
    case "1": "남" break;
    case "2": "여" break;
    case "3": "남" break;
    case "4": "여" break;
    default : break;
*/

-- CASE : 여러가지 경우 선택할 수 있는 기능제공(범위값도 가능)
SELECT
    EMP_NAME, EMP_NO,
    CASE
        WHEN SUBSTR(EMP_NO,8,1)=1 OR SUBSTR(EMP_NO,8,1)=3 -- WHEN조건식
        THEN '남' -- THEN실행할 것
        WHEN SUBSTR(EMP_NO,8,1) IN (2,4)
        THEN '여'
        ELSE '?'
    END 성별
FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- 그룹 함수를 쓸 때에는 일반 함수를 함께 사용할 수 없음
-- SUM : 해당 컬럼 값들의 총 합을 구하는 함수
SELECT SUM(SALARY*12) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- AVG : 해당 컬럼 값들의 평균을 구하는 함수
SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT AVG(NVL(BONUS,0)) FROM EMPLOYEE; -- NULL값 처리는 NVL
SELECT BONUS FROM EMPLOYEE;

-- COUNT : 조회한 ROW수를 반환
SELECT COUNT(BONUS) FROM EMPLOYEE;
SELECT SALARY FROM EMPLOYEE;

-- MAX 최대값, MIN 최소값
SELECT MAX(SALARY),MIN(SALARY) FROM EMPLOYEE;
SELECT MAX(HIRE_DATE), MIN(HIRE_DATE) FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- 실습
SELECT * FROM EMPLOYEE;
-- 1. 직원명과 이메일, 이메일길이 출력
SELECT EMP_NAME 직원명, EMAIL 이메일, LENGTH(EMAIL) 이메일길이
FROM EMPLOYEE;

-- 2. [직원명], [이메일주소 중 아이디 부분]만 출력
--SELECT EMP_NAME 직원명, SUBSTR(EMAIL,1,INSTR(EMAIL,'@',1,1)-1) 이메일아이디
SELECT EMP_NAME 직원명, RTRIM(RTRIM(EMAIL,'kh.or.kr'),'@') 이메일아이디
FROM EMPLOYEE;

-- 3. 60년생의 직원명과 년생, 보너스 값 출력
-- 보너스 값이 null인 경우 0으로 출력
SELECT EMP_NAME 직원명, SUBSTR((EMP_NO),1,2) 출생연도, NVL(BONUS,0) 보너스
FROM EMPLOYEE
WHERE
    TO_NUMBER(SUBSTR((EMP_NO),1,2)) >= 60
    AND TO_NUMBER(SUBSTR((EMP_NO),1,2)) < 70;

-- 4. '010'핸드폰 번호를 쓰지않는 사람의 수를 출력(인원 단위: 명)
SELECT COUNT(PHONE)||'명' AS 인원
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

-- 5. 직원명과 입사년월 출력(날짜 출력은 0을 빼고)
SELECT EMP_NAME 직원명, TO_CHAR(HIRE_DATE,'FMYYYY"년"MM"월"') 입사년월
FROM EMPLOYEE;

-- 6. 직원명과 주민번호 조회(9번째 자리부터 끝까지는 *문자로 채워서 출력)
-- SELECT EMP_NAME 직원명, RPAD(SUBSTR(EMP_NO,1,8),14,'*') 주민등록번호
SELECT EMP_NAME 직원명, SUBSTR(EMP_NO,1,8)||'******' 주민등록번호
FROM EMPLOYEE;

-- 7. 직원명,직급코드,연봉(원) 조회
-- 연봉(보너스가 적용된 1년치 급여)은 세 자리마다 쉼표','를 넣어서 표시
SELECT
    EMP_NAME 직원명, JOB_CODE 직급코드,
    TO_CHAR((SALARY+(SALARY*NVL(BONUS,0)))*12,'L999,999,999') 연봉
FROM EMPLOYEE;

-- 8. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원 조회
SELECT EMP_ID 사번, EMP_NAME 직원명, DEPT_CODE 부서코드, HIRE_DATE 입사일
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D9') AND SUBSTR(HIRE_DATE,1,2) = '04';

-- 9. 직원명, 입사일, 오늘까지의 근무일수 조회(주말도 포함, 소수점 아래는 버림)
SELECT EMP_NAME 직원명, HIRE_DATE 입사일, FLOOR(SYSDATE-HIRE_DATE) 근무일수
FROM EMPLOYEE;

-- 10. 모든 직원의 나이 중 가장 많은 나이와 가장 적은 나이 출력
-- 나이계산방법 현재년도 - 태어난년도 +1
--SELECT MAX(123-SUBSTR(EMP_NO,1,2)) "최대 나이", MIN(123-SUBSTR(EMP_NO,1,2)) "최소 나이"
SELECT
    MAX(
    EXTRACT(YEAR FROM SYSDATE)
    - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))
    +1
    ) 최대나이,
    MIN(
    EXTRACT(YEAR FROM SYSDATE)
    - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))
    +1
    ) 최소나이
   
FROM EMPLOYEE;

-- 11. 회사에서 야근을 해야되는 부서 발표, 부서코드 D5,D6,D9인 경우 '야근', 이외 부서는 '야근없음'
-- 출력값은 이름, 부서코드, 야근유무(부서코드 기준 오름차순 정렬)
SELECT
    EMP_NAME 직원명, DEPT_CODE 부서코드,
    CASE
        WHEN DEPT_CODE IN ('D5','D6','D9')
        THEN '야근'
        ELSE '야근없음'
    END 야근유무
FROM EMPLOYEE ORDER BY DEPT_CODE ASC;

-- 정렬
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE ORDER BY 2;
-- 기본은 오름차순ASC, 내림차순은 DESC / 현재 출력되는 컬럼의 순서로도 정렬 가능(2=DEPT_CODE)
-- 현재 출력이 되지않는 커럼으로도 정렬 가능(SALARY)

-- 12. 부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리
-- 단, 부서코드가 D5, D6, D9인 직원의 정보만 조회, 부서코드 기준 오름차순 정렬
SELECT
    EMP_NAME 직원명 , DEPT_CODE 부서코드,
    CASE
        WHEN DEPT_CODE = 'D5'
        THEN '총무부'
        WHEN DEPT_CODE = 'D6'
        THEN '기획부'
        WHEN DEPT_CODE = 'D9'
        THEN '영업부'
    END 부서명
    -- DECODE(DEPT_CODE,'D5','총무부','D6','기획부','D9','영업부')
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9') ORDER BY DEPT_CODE;

-- 13. 직원명, 부서코드, 생년월일, 나이 조회
-- 생년월일은 주민번호에서 추출해서 00년00월00일로 출력
-- 나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음 계산
-- 주민번호 이상한 사람 제외(200,201,214번 - 힌트: NOT IN 사용)
SELECT
    EMP_NAME 직원명, DEPT_CODE 부서코드,
    TO_CHAR(TO_DATE(SUBSTR(EMP_NO,1,6)),'YY"년 "MM"월 "DD"일"') 생년월일,
    EXTRACT(YEAR FROM SYSDATE)-
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6),'RRMMDD'))+1 나이
    --CEIL(MONTHS_BETWEEN(SYSDATE,(TO_DATE(SUBSTR(EMP_NO,1,6))))/12)
FROM EMPLOYEE
WHERE EMP_ID NOT IN(200,201,214);

-- 14. 직원들의 입사일로부터 연도만 가지고 각 연도별 입사인원수 출력, 전체직원수 출력
SELECT
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE),1998,1)) AS "1998년",
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE),1999,1)) AS "1999년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2000,1,0)) AS "2000년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2001,1,0)) AS "2001년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2002,1,0)) AS "2002년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2003,1,0)) AS "2003년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE),2004,1,0)) AS "2004년",
    COUNT(HIRE_DATE) 전체직원수
FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- GROUP BY [기준] : 기준 별로 그룹함수 적용
SELECT DEPT_CODE, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
SELECT --4
    DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') 성별,
    SUM(SALARY), FLOOR(AVG(SALARY)),
    COUNT(*)
FROM EMPLOYEE --1
WHERE DEPT_CODE IN('D1','D2','D3') --2
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') --3
ORDER BY 3 DESC; --5

-- HAVING
SELECT --4
    DEPT_CODE, FLOOR(AVG(SALARY))
FROM EMPLOYEE --1
-- WHERE SALARY > 3000000 쓰면 순서때문에 전혀 다른 결과발생
GROUP BY DEPT_CODE --2
HAVING FLOOR(AVG(SALARY))>3000000; --3

-- 1. EMPLOYEE테이블에서 J1직급 제외(JOB_CODE)
-- 직급, 직급별 사원수, 직급별 평균급여 출력
SELECT JOB_CODE 직급, COUNT(*) "사원 수", FLOOR(AVG(SALARY)) 평균급여
FROM EMPLOYEE
WHERE JOB_CODE != 'J1'
GROUP BY JOB_CODE;

-- 2. EMPLOYEE테이블에서 J1직급 제외
-- 입사년도별 인원수를 조회해서 입사년기준으로 오름차순 정렬
SELECT EXTRACT(YEAR FROM HIRE_DATE) 입사연도, COUNT(*) "사원 수"
FROM EMPLOYEE
WHERE JOB_CODE != 'J1'
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
ORDER BY 1;

-- 부서별 성별 인원수
-- D1 남 2
-- D1 여 1
SELECT
    DEPT_CODE 부서, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') AS 성별,
    COUNT(*) 인원수
FROM EMPLOYEE
GROUP BY DEPT_CODE, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여')
ORDER BY 1;
--------------------------------------------------------------------------------
-- JOIN
-- 1. ORACLE전용구문
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

-- 2. ANSI 표준구문
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- INNER JOIN: NULL인 사람들은 조건에 맞지않아 제외됨

SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE IS NULL;
SELECT * FROM JOB;

-- 1. ORACLE(비교하려는 컬럼 이름이 같은 경우 테이블 구분 필요)
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- 2. ANSI표준
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE); --컬럼명이 같은 경우 USING사용->하나로 인식

-- INNER JOIN (비교구문과 일치하는 데이터가 없으면 JOIN결과에서 제외)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- OUTER JOIN
-- LEFT JOIN (왼쪽 전부 포함)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- RIGHT JOIN (오른쪽 전부 포함)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- FULL JOIN (LEFT RIGHT 전부 포함)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- CROSS JOIN
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT;

SELECT EMP_ID, EMP_NAME, MANEGER_ID FROM EMPLOYEE;

-- EMPLOYEE E1(직원정보용), EMPLOYEE E2(관리자정보용)
SELECT E1.EMP_ID, E1.EMP_NAME, E1.MANAGER_ID, E2.EMP_NAME AS MANAGER_NAME
FROM EMPLOYEE E1
LEFT JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID)
ORDER BY 1;

-- EMPLOYEE, DEPARTMENT
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;
-- 다중 조인
SELECT EMP_NAME, DEPT_TITLE, NATIONAL_CODE -- 4
FROM EMPLOYEE -- 1
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) -- 2(그룹핑)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE) -- 2(그룹핑)
WHERE DEPT_CODE IN ('D9','D6'); -- 3 WHERE는 조인 이후
-- JOIN순서 중요(EMPLOYEE와 직접 연관된 컬럼이 없어서)

SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE);
-- 컬럼이 서로 직접 연관된 경우에는 순서섞어도 무방
--------------------------------------------------------------------------------
-- JOIN 실습
-- 1. 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의
-- 사원명, 주민번호, 부서명, 직급명 조회
SELECT EMP_NAME 사원명, EMP_NO 주민번호, DEPT_TITLE 부서명, JOB_NAME 직급명
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
WHERE
    EMP_NO LIKE '7%-2%' AND EMP_NAME LIKE '전%';
    -- SUBSTR(EMP_NO,1,1) = 7 AND SUBSTR(EMP_NO,8,1)=2 AND_NAME LIKE '전%'
    -- SUBSTR(EMP_NO,1,2)>=70 AND SUBSTR(EMP_NO,1,2)<80 AND SUBSTR(EMP_NO,8,1)=2 AND SUBSTR(EMP_NAME,1,1)= '전';

-- 2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, DEPT_TITLE 부서명
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_NAME LIKE '%형%';

-- 3. 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명 조회
SELECT EMP_NAME 사원명, JOB_NAME 직급명, DEPT_CODE 부서코드, DEPT_TITLE 부서명
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
WHERE DEPT_TITLE LIKE '해외영업%';

-- 4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명 조회
SELECT EMP_NAME 사원명, BONUS 보너스, DEPT_TITLE 부서명, LOCAL_NAME 근무지역명
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE BONUS IS NOT NULL;

-- 5. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명 조회
SELECT EMP_NAME 사원명, JOB_NAME 직급명, DEPT_TITLE 부서명, LOCAL_NAME 근무지역명
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE DEPT_CODE = 'D2';

-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명 조회
SELECT EMP_NAME 사원명, DEPT_TITLE 부서명, LOCAL_NAME 지역명, NATIONAL_NAME 국가명
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME IN('한국','일본');

-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서명, 동료이름 조회(SELF JOIN사용)
SELECT E1.EMP_NAME 사원명, DEPT_TITLE 부서명,E2.EMP_NAME 동료이름
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON (E1.DEPT_CODE = E2.DEPT_CODE)
JOIN DEPARTMENT ON (E1.DEPT_CODE = DEPT_ID)
WHERE E1.EMP_NAME != E2.EMP_NAME
ORDER BY 1;

-- 8. 보너스포인트가 없는 직원들 중에서
-- 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회(JOIN과 IN사용)
SELECT EMP_NAME 사원명, JOB_NAME 직급명, SALARY 급여
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE BONUS IS NULL AND JOB_NAME IN('차장','사원');
--------------------------------------------------------------------------------
-- 집합연산자(SET OPERATOR) : 컬럼의 수와 자료형이 일치해야 함
-- UNION : 두 조회결과(SELECT)를 중복영역을 제외하고 하나로 합침(합집합),
-- 첫번째 컬럼으로 오름차순 정렬까지 해줌
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- UNION ALL : 두 조회결과를 하나로 합치면서 중복값 제거하지않음, 정렬하지 않음
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- INTERSECT : 두 SELECT문에서 공통된 부분만 추출(교집합)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- MINUS : 첫번째 조회문에서 두번째 조회문과 겹치는 부분을 제거(차집합)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
--------------------------------------------------------------------------------
-- SUBQUERY : SELECT안에 포함된 또 하나의 SELECT문, 메인쿼리 실행 전 한번만 실행
-- 조건 : 서브쿼리를 소괄호로 묶어야하고,
-- 비교할 항목은 서브쿼리의 SELECT한 항목의 개수와 자료형이 일치해야 함

-- 전직원의 평균급여보다 많은 급여를 받는 직원의 사번,이름,급여 조회
-- 1. 전직원의 평균급여 조회
SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE; -- 컬럼1 ROW1
-- 2. 1에서 조회된 결과를 이용하여 쿼리문 작성
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE);

-- 전지연 직원의 관리자 이름을 출력
-- 1. 전지연 직원의 관리자 사번(MANAGER_ID)조회
SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME = '전지연';
-- 2. 1의 조회결과로 관리자 이름 출력
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = (SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME = '전지연');
-- JOIN 사용 시
SELECT E2.EMP_NAME
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID)
WHERE E1.EMP_NAME = '전지연';

-- 1. 윤은해와 급여가 같은 사원들의 사원번호,이름,급여를 출력(단, 윤은해는 출력X)
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 급여
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '윤은해')
      AND EMP_NAME != '윤은해';
      
-- 2. EMPLOYEE 테이블에서 급여가 가장 많은 사람과 가장 적은 사람의 사번,이름,급여 출력
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 급여
FROM EMPLOYEE
WHERE SALARY IN((SELECT MAX(SALARY) FROM EMPLOYEE),(SELECT MIN(SALARY) FROM EMPLOYEE));
      
-- 3. D1, D2부서에서 근무하는 사원들 중 [D5부서 직원들의 평균급여]보다
-- 급여가 많은 사람들의 이름, 부서코드, 급여 출력
SELECT EMP_NAME 이름, DEPT_CODE 부서코드, SALARY 급여
FROM EMPLOYEE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D5')
      AND DEPT_CODE IN('D1','D2') ;
--------------------------------------------------------------------------------//07.20시험범위
-- 다중행 서브쿼리(컬럼 하나, ROW 여러 개...벽돌)
-- 각 부서별 최고급여를 받는 직원의 이름,부서코드,급여 출력
SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
-- 여러 값과 비교할 수 있는 IN 사용
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);

-- ANY는 각각 OR로 연결
-- 비교값 > ANY() : 서브쿼리 조회결과 중 [최소값보다 크면] = 249만원보다 크면
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > ANY(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
-- 비교값 < ANY() : 서브쿼리 조회결과 중 [최대값보다 작으면] = 800만원보다 작으면
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < ANY(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
-- 비교값 = ANY() : IN과 같은 효과!
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = ANY(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);

-- ALL은 각각 AND로 연결
-- 비교값 > ALL() : 최대값보다 크면 = 800만원보다 크면(출력결과 없음)
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > ALL(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
-- 비교값 < ALL() : 최소값보다 작으면 = 249만원보다 작으면
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < ALL(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE);
--------------------------------------------------------------------------------
-- 다중열 SUBQUERY(ROW하나, 컬럼 여러 개...김밥)
-- 퇴사한 직원의 부서,직급을 조회(ENT_YN = 'Y')
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN = 'Y';

SELECT EMP_NAME, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE
(DEPT_CODE, JOB_CODE) IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN = 'Y');
-- DEPT_CODE = 'D8' AND JOB_CODE = 'J6';
--------------------------------------------------------------------------------
-- 상관쿼리(상호연관 서브쿼리)
-- 메인쿼리값을 서브쿼리에 주고 서브쿼리를 수행한 후, 다시 메인쿼리를 수행
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID
FROM EMPLOYEE E1
WHERE EXISTS(SELECT EMP_ID FROM EMPLOYEE E2 WHERE E1.MANAGER_ID = E2.EMP_ID);
-- EXIST : 조회결과가 있으면 TRUE, 없으면 FALSE
SELECT EMP_ID, MANAGER_ID FROM EMPLOYEE;
--------------------------------------------------------------------------------
-- 스칼라 서브쿼리 : 상호연관 서브쿼리이면서 결과값이 1개인 서브쿼리
-- 스칼라 서브쿼리 (SELECT절 사용)

-- 모든 사원의 사번,이름,관리자번호,관리자이름 조회
SELECT
    EMP_ID 사번, EMP_NAME 이름, MANAGER_ID 관리자번호,
    (SELECT E2.EMP_NAME FROM EMPLOYEE E2 WHERE E2.EMP_ID = E1.MANAGER_ID) AS 관리자명
FROM EMPLOYEE E1;

-- 사원명,부서코드,소속부서의 평균임금을 스칼라 서브쿼리로 출력
SELECT EMP_NAME, DEPT_CODE,
       FLOOR((SELECT AVG(SALARY) FROM EMPLOYEE E2 WHERE E2.DEPT_CODE = E1.DEPT_CODE)) 평균임금
FROM EMPLOYEE E1;
--------------------------------------------------------------------------------
-- 인라인 뷰
-- 뷰 : 가상의 테이블
-- 인라인 뷰 : FROM에서 사용하는 서브쿼리
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;
SELECT * FROM (SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE);

-- TOP-N 분석
-- 회사에서 급여가 가장 높은 직원 5명의 이름, 부서코드, 급여 출력
SELECT ROWNUM, EMP_NAME, DEPT_CODE, SALARY
FROM (SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM < 6; -- 사용 예시 : 게시판에서 최근 글 20개 출력

SELECT SALARY FROM EMPLOYEE ORDER BY 1 DESC;

SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) FROM EMPLOYEE; -- 19,19,21
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) FROM EMPLOYEE; -- 19,19,20
SELECT EMP_NAME, SALARY, ROW_NUMBER() OVER(ORDER BY SALARY DESC) FROM EMPLOYEE; -- 19,20,21
--------------------------------------------------------------------------------

-- 2022.07.20
-- 1. BONUS가 없으면서 매니저가 존재하는 사원의 모든정보를 조회하기위한 SQL문
SELECT * FROM EMPLOYEE WHERE BONUS IS NULL AND MANAGER_ID IS NOT NULL;


-- 2. DEPT_CODE가 D9이거나 D6이고, SALARY이 300만원 이상이고, BONUS가 있는 사원의
-- EMP_NAME, EMP_NO, DEPT_CODE, SALARY를 조회
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='D9' OR DEPT_CODE='D6') AND SALARY >=3000000
AND BONUS IS NOT NULL;


-- 3. SALARY가 3000000원 이상인 직원의 EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME을 조회
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE=J.JOB_CODE)
WHERE SALARY>=3000000;?

SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY>=3000000;?