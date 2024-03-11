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

SELECT
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




