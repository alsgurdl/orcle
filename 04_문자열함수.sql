--lower(소문자 )initcap(앞글자만 대문자),uppe(대문자)
SELECT * FROM dual;
/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/
SELECT 
'abcDEF', lower('abcDEF'), initcap('abcDEF'),upper('abcDEF')
FROM dual;
SELECT
last_name,
lower(last_name),
initcap(last_name),
upper(last_name)
FROM employees;

SELECT
salary
FROM employees
where lower(last_name) = 'austin';

--length(길이) inste(문자 찾기, 없으면 0을 반환 있으면 인덱스 값)
SELECT 
'abcdef', length('abcdef'),instr('abcdef', 'b')
FROM dual;

SELECT
first_name,
length(first_name),
instr(first_name, 'a')
FROM employees;

--sunstr(자를 문자열, 시작인덱스, 길이)
--sunstr(자를 문자열, 시작인덱스, 길이)>문자열 끝까지
--인덱스 1부터 시작
--conncat(문자연결)
SELECT 
'abcde' as ex,
substr('abcdef',2,5),
concat('abc','123')
FROM dual;
SELECT 
first_name,
substr(first_name,1,3),
concat(first_name, last_name)
FROM employees;

--LPAD,RPAD(좌,우측을 지정한 문자열로 채우기)
SELECT
lpad('abc',10,'*'),
rpad('abc',10,'*')
FROM employees;





