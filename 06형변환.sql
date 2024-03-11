--형변환 함수 to_CHAR, TO_NUMBER, TO_DATE

--날짜를 문자로 TO_CHAR(값,형식)
--날짜를 문자로 형 변환할 때 형식으로 날짜를 표현할 수 있습니다
SELECT TO_CHAR(sysdate) From dual;
SELECT TO_CHAR(sysdate, 'YYY-MM-DD DY PM:MI:SS') From dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD DY HH24:MI:SS') From dual;
--서식문자와 함께 사용하고 싶은 문자를 ""로 감싸서 표현
SELECT 
TO_CHAR(sysdate, 'YYYY"년"MM"월"DD"일"') 
From dual;

--숫자를 문자로 TO_CHAR(값, 형식)
--형식에서 사용하는 '9'는 실제 숫자 9가 아니라 자리수를 표현하기 위한 기호
select to_char(20000, '99,999') from dual;
select to_char(20000, 'L99,999') from dual;
select to_char(20000.29, 'L99,999.9') from dual; --반올림을 지원


select 
first_name,
to_char(salary, '$99,999') as salary 
from employees;

--문자를 숫자로 TO_NUMBER(값, 형식)
SELECT '2000' + 2000 FROM dual; -- 자동으로 형 변환(문자 > 숫자)
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- 자동으로 형 변환(문자 > 숫자)

select 
'$3,300'+ 2000
from dual;

select 
TO_NUMBER('$3,300', '$9,999')+2000
from dual;

--문자를 날짜로 변환하는 함수 TO_DATE(값,형식)
SELECT TO_DATE('2023-04-13') FROM dual;
--주어진 문자열 모두 변환해야 한다 일부만 변환할수 없다
SELECT TO_DATE('201-03-13 12:23:50', 'YY-MM-DD HH:MI:SS') FROM dual;

SELECT TO_DATE('2024년 02월 12일','YYYY"년" MM"월" DD"일"') FROM dual;
--xxxx년 xx월 xx일 > 문자열 형식으로 변환
--조회 컬럼명은 dateinfo라고 하겠다 dual레서 조회

SELECT 
to_char(
TO_DATE('20050102', 'YYYYMMDD'),
'YYYY"년" MM"월" DD"일"') as dateinfo
FROM dual;

---------------------------------------------
--null 형태를 변환하는 함수 NVL(컬럼,변환할 타겟값)
SELECT
first_name,
nvl(commission_pct,0) AS comm_pct
FROM EMPLOYEES;



--NULL 형태를 변환하는 함수 NVL2(컬럼, null이 아닐 경우의 값 ,null일 경우의 값)
SELECT 
first_name,
salary,
nvl2(
commission_pct,
salary+(salary * commission_pct),
salary

)as real_salary
FROM EMPLOYEES;

--null은 연산이 되지 않습니다
SELECT 
first_name,
salary,
salary+(salary * commission_pct)
FROM EMPLOYEES;

--DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2---------- default)
--오라클 전용 함수 동등 비교만 가능
SELECT
first_name,
job_id,
salary,
decode(
job_id,
'IT_FROG', salary*1.1,
'FI_MGR', salary*1.2,
'AD_VP',salary*1.1,
salary
)as result
FROM EMPLOYEES;

--CASE WHEN THEN END
--ANSI표준 구문
SELECT
first_name,
job_id,
salary,
(CASE job_id
WHEN 'IT_FROG' THEN salary*1.1
WHEN 'FI_MGR' THEN salary*1.2
WHEN 'AD_VP' THEN salary*1.3
WHEN 'FI_ACCOUNT' THEN salary*1.4
ELSE salary
END) as salary

FROM EMPLOYEES;
/*
문제 1.
현재일자를 기준으로 employees테이블의 입사일자(hire_date)를 참조해서 근속년수가 17년 이상인
사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다
*/
SELECT
hire_date as 입사일자,
TRUNC((sysdate - hire_date)/365) as year
FROM employees
where ((sysdate - hire_date)/365) >= 17
order by year DESC;
/*
문제 2.
EMPLOYEES 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
100이라면 ‘사원’, 
120이라면 ‘주임’
121이라면 ‘대리’
122라면 ‘과장’
나머지는 ‘임원’ 으로 출력합니다.
조건 1) department_id가 50인 사람들을 대상으로만 조회합니다
*/
SELECT
manager_id,
first_name,
manager_id,
(CASE manager_id
WHEN 100 THEN'사원'
WHEN 120 THEN '주임'
WHEN 121 THEN '대리'
WHEN 122 THEN '과장'
ELSE '임원'
END) as salary

FROM employees
where department_id = 50;

