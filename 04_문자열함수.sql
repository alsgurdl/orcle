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
salary,
last_name
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

--substr(자를 문자열, 시작인덱스, 길이)
--substr(자를 문자열, 시작인덱스, 길이)>문자열 끝까지
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
FROM dual;
--LTRIM(), RTRIM, TRIM()
--TRIM() > 공백제거
--LTRIM(paraml, param2) > param2의 값을 param1에서 찾아서 제거 (왼쪽부터)
--RTRIM(paraml, param2) > param2의 값을 param1에서 찾아서 제거 (오른쪽부터)
SELECT
ltrim('javascript_java','java')
FROM dual;
SELECT
rtrim('javascript_java','java')
FROM dual;
SELECT trim('    java     ')
FROM dual;

--REPLACE(str, old, new)
SELECT
REPLACE('my dream is a presidnt', 'presidnt' ,'prma')
FROM dual;
SELECT
REPLACE(REPLACE('my dream is a presidnt', 'presidnt' ,'prma'), ' ','')
FROM dual;

SELECT
REPLACE(concat('hello','world0!'), '!' ,'?')
FROM dual;

/*
문제 1.
EMPLOYEES 테이블에서 이름, 입사일자 컬럼으로 변경(별칭)해서 이름순으로 오름차순 출력 합니다.
조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다. (CONCAT)
조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다. (REPLACE)
*/
SELECT*FROM employees;

SELECT
concat( first_name,last_name) AS 이름,
REPLACE(HIRE_DATE, '/', '')
FROM employees
order by 이름;

/*
문제 2.
EMPLOYEES 테이블에서 phone_number컬럼은 ###.###.####형태로 저장되어 있다
여기서 처음 세 자리 숫자 대신 서울 지역변호 (02)를 붙여 
전화 번호를 출력하도록 쿼리를 작성하세요. (CONCAT, SUBSTR 사용)
*/
SELECT
CONCAT('02',substr(PHONE_NUMBER, '5'))
FROM employees;


/*
문제 3. 
EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
조건 1) 비교하기 위한 값은 소문자로 비교해야 합니다.(힌트 : lower 이용)
조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다. 
이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다. 
이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)
*/
SELECT

rpad(substr(first_name, 1,3),length(first_name),'*') AS name,
lpad(salary, 10, '*') AS salary

FROM employees
where lower(job_id) = 'it_prog';



