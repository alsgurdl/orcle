SELECT * FROM employees;
--WHERE절 비교 데이터 값은 대소문자를 비교 구분한다
SELECT first_name, last_name, job_id 
FROM employees
WHERE job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE last_name = 'King';
