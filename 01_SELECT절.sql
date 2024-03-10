SELECT * FROM employees;

SELECT employee_id,
first_name,
last_name 
FROM employees;
SELECT email, phone_number, hire_date
FROM employees;
--컬럼을 조회할때 위치에서 */+-연산이 가능
SELECT 
employee_id,
first_name,
last_name,
salary,
salary + salary*0.1 AS 성과금
FROM employees;

--null 값의 확인 숫자 0이나 공백과는 다른 존재
SELECT department_id, commission_pct
FROM employees;
-- alias 컬럼명 테이블명의 이름을 변경해서 조회()
SELECT 
first_name AS 이름,
last_name AS 성,
salary AS 급여
FROM employees;
/*
dhfkzmfdmf ''문자 표현하는 문자열 안에 '' 특수기호를
표현하고 싶다면 ''를 두번 연속으로 
문자열 연결기호는 || 입니다 문자열의 덧셈 연산을 허용하지 않습니다
*/
SELECT 
first_name || ' ' ||  last_name  || '''s salary is $' || salary AS 급여
FROM employees;
--DISTINCT (중복 행의 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;
--  ROWNUM,ROWID 
--ROWNUM: 쿼리에의해 반환듸는 행 번호를 출력
--ROWID: 데이버베이스 내역 행의 주소를 반환
SELECT ROWNUM, ROWID ,employee_id
FROM employees;

