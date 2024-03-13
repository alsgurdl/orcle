/*
# 서브쿼리 
: SQL 문장 안에 또다른 SQL을 포함하는 방식.
 여러 개의 질의를 동시에 처리할 수 있습니다.
 WHERE, SELECT, FROM 절에 작성이 가능합니다.

- 서브쿼리의 사용방법은 () 안에 명시함.
 서브쿼리절의 리턴행이 1줄 이하여야 합니다.
- 서브쿼리 절에는 비교할 대상이 하나 반드시 들어가야 합니다.
- 해석할 때는 서브쿼리절 부터 먼저 해석하면 됩니다.
*/
--이름이 'nancy' 인 사워보다 급여가 높은 사람 구하기
select salary from employees
where first_name = 'Nancy';

select first_name from employees
where salary > 12008;
--서브쿼리를 활용한 문장
select first_name from employees
where salary > (select salary from employees
                where first_name = 'Nancy');

--employee_id가 103번인 사람의 job_id와 동일한 job_id가진 사람을 조회
SELECT * from employees
where job_id = (SELECT job_id from employees
where employee_id = 103);

--다음 문자은 서브쿼리가 리넡한느 행이 여러 개라서 단일행 연산자를 사용할 수 없다
--단일행 연사자: 주로 비교 연산자(=,>,<,<=,>=,<>)를 주로 사용하는 경우 하나의 행만 반환해야한다
SELECT * from employees
where job_id = (SELECT job_id from employees
where last_name = 'King');--에러

--다중행 연산자(in,any,all,exists)

--in:조회된 목록의 어떤 값과 같은지를 비교
SELECT * from employees
where job_id in (SELECT job_id from employees
where last_name = 'King');

--first_name이 david인 사람들의 급여와 같은 급요를 받는 사람들을 조화
select * from employees
where salary in (select salary from employees
where first_name = 'David');

--any,aome 값을 서브쿼리에 의해 리턴된 각각의 값과 비교해서
-- 하나라도 만족하면 조회 대상에 포함
--david라는 사람이 여러 명인데 그중 가장 적은 급여를 받는 david버다 높은 사람을 조회
select * from employees
where salary > any (select salary from employees
where first_name = 'David');
--all:값은 서브쿼리에 의해 리턴된 각각의 값과 모두 비교해서
--전부 다 일치해야 조회대상에 포함
--david라는 사람이 여러 명인데 그중 가장 많은 급여를 받는 david버다 높은 사람을 조회

select * from employees
where salary > all (select salary from employees
where first_name = 'David');

--exists: 서브쿼라가 하나 이상의 행을 반환하면 참으로 간주
-- jon_history에 존재하는 직원이 employees에도 존재한다번 조회대상에 포함
--서브쿼리 대해서 jh에 있는 id와 e에 일치할 때마다 1이라는 값을 조회
--exitsts 얀산자가 1이 조회가 될 때 데이터가 존재한다는 것을 판단하여 empolyee에 해당 사원으ㅏ 모즌 정보조회
select * from employees e
where exists (select 1 from job_history jh
where e.employee_id = jh.employee_id);

select * from employees e
where exists (select 1 from departments d
where department_id = 10);
-----------------------------------------
--SELECT 절에 서브쿼리를 붙이기
--스칼라 서브쿼리 라고도 칭함
--스칼라 서브쿼리 실행 결과가 단일 값을 반환하는 서브쿼리 주로 slect절이나 where 절에서 사용

select
e.first_name,
d.department_name
from employees e
left join DEPARTMENTS d
on e.department_id = d.department_id
order by e.first_name;

select
e.first_name,
(
select 
 department_name
from departments d
where d.department_id = e.department_id
)

from employees e
order by e.first_name;

-- 각 부서의 매니저 이름 조회
select
d.*,
e.first_name as manager_name
 from departments d
 left join employees e
 on d.manager_id = e.employee_id
 order by d.manager_id; -- left join
 
 select
 d.*,
 (
 select
 first_name
 from employees e
 where e.employee_id = d.manager_id
 )as manager_name
 from departments d
 order by d.manager_id;
 
 /*
- 스칼라 서브쿼리가 조인보다 좋은 경우
: 함수처럼 한 레코드당 정확히 하나의 값만을 리턴할 때.

- 조인이 스칼라 서브쿼리보다 좋은 경우
: 조회할 컬럼이나 데이터가 대용량인 경우, 해당 데이터가
수정, 삭제 등이 빈번한 경우 (sql 가독성이 조인이 좀 더 뛰어납니다.)
*/
--각 부서별 사원 수 뽑기 (스칼라)
select
d.department_name as 부서명,
(
select
count(*)
from employees e
where e.department_id = d.department_id
group by DEPARTMENT_ID
)as 사원수
from departments d;


 








