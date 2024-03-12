--숫자함수
--POUND(반올림)
--원하는 반올림 위치를 매개값으로 지정 음수를 주는 것도 가능
SELECT
 round(3.1415,3),round(45.63,0),round(45.923,-1)
FROM dual;

--TRUNC(절사)
--정해진 소수점 자리수까지 잘라냅니다
SELECT
 TRUNC(3.1415,3),TRUNC(45.63,0),TRUNC(45.923,-1)
FROM dual;

--ABS (절대값)
SELECT
abs(-34)
FROM dual;
--CEIL(올림), FLOOR(내림)
SELECT
ceil(3.14),floor(3.14)
FROM dual;

--MOD(나머지 연산)
SELECT
10/4, mod(10,4)
FROM dual;

-------------------------------------------

--날짜함수
--sysdate: 컴퓨터의 현재 날짜 시간 정보를 가져와서 제공하는 함수 >시간 정보도 포함
SELECT
sysdate
FROM dual; 

SELECT
systimestamp -->밀리초 표준시까지 제공
FROM dual;
--날짜도 연산이 가능
SELECT
sysdate +1 --일자 덧셈 연산이 가능
FROM dual; 

--날짜 타입과 날짜 타입은 뺄셈 연산을 지원
--덧셈은 허용하지 않습니다
SELECT
first_name, sysdate - HIRE_DATE
FROM employees; -- 일자

SELECT
first_name,
(sysdate - HIRE_DATE) /7 as week
FROM employees; --주수

SELECT
first_name,
(sysdate - HIRE_DATE) /365 as year
FROM employees; --년수

-- 날짜 반올림, 절사
SELECT
round(sysdate) 
FROM dual; 

SELECT
round(sysdate, 'year') --월기준
FROM dual; 

SELECT
round(sysdate, 'month') --주(일) 기준으로 반올림
FROM dual; 

SELECT
round(sysdate, 'day')
FROM dual; 
SELECT
first_name,
(sysdate - HIRE_DATE) /365 as year
FROM employees; --년수

-- 날짜 반올림, 절사
SELECT trunc(sysdate) --년 기준) 
FROM dual; 
SELECT trunc(sysdate, 'year') --월기준 
FROM dual; 

SELECT trunc(sysdate, 'month') --주(일) 기준으로 반올림
FROM dual; 
SELECT trunc(sysdate, 'day') FROM dual;







