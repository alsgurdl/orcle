SELECT * FROM employees;
--WHERE절 비교 데이터 값은 대소문자를 비교 구분한다
SELECT first_name, last_name, job_id 
FROM employees
WHERE job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE last_name = 'King';

--IN 연산자의 사용 특정 값들과 비교할 때 사용

SELECT * FROM employees
WHERE manager_id IN (100,101,102);

SELECT * FROM employees
WHERE job_id IN('IT_PROG', 'AD_VP');

--LIKE 연산자(지정 문자열 포함 여부)
--%는 어떠한 문자든,_는 데이터의 자리(위치)를 표현할 때

SELECT 
first_name,
last_name,
hire_date
 FROM employees
WHERE hire_date LIKE '03%';

SELECT 
first_name,
last_name,
hire_date
 FROM employees
WHERE hire_date LIKE '%15';

SELECT *
FROM employees
WHERE hire_date LIKE '%05%';

SELECT 
first_name,
last_name,
hire_date
 FROM employees
WHERE hire_date LIKE '___05%';

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;
--AND, OR
--and가  or보다 연산 순서 빠르다
SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

--데이터의 정렬 (select 구문의 가장 마지막에 배치됩니다)
--ASC: ascending 오름차순 > 생략이 가능
--DESC: descending 내림차순
SELECT * FROM employees
order by hire_date;

SELECT * FROM employees
order by hire_date DESC;

SELECT * FROM employees
where job_id = 'IT_PROG'
order by first_name desc;

SELECT * FROM employees
where salary >= 5000
order by employee_id desc;

SELECT 
first_name,
salary*12 AS pay
FROM employees
order by pay asc;