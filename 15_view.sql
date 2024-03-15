/*
view는 제한적인 자료만 보기 위해 사용하는 가상 테이블의 개념입니다.
뷰는 기본 테이블로 유도된 가상 테이블이기 때문에
필요한 컬럼만 저장해 두면 관리가 용이해 집니다.
뷰는 가상테이블로 실제 데이터가 물리적으로 저장된 형태는 아닙니다.
뷰를 통해서 데이터에 접근하면 원본 데이터는 안전하게 보호될 수 있습니다.
*/
select * from user_sys_privs; -- 권한 확인

--단순 뷰 하나의 테이블을 이용하여 생성한 뷰
--뷰의 컬럼명은 함수 호출문 연산식 등 같은 가상 표현식이면 안됨
select 
EMPLOYEE_ID,
first_name || ' ' || last_name,
job_id,
salary
from employees
where DEPARTMENT_ID = 60;

CREATE view view_emp as(
select 
EMPLOYEE_ID,
first_name || ' ' || last_name as full_name,
job_id,
salary
from employees
where DEPARTMENT_ID = 60
);
select * from view_emp
where salary >= 6000;

--복합 뷰
--여러 테이블을 조인하여 필요한 데이터만 저장하고 빠른 확인을 위해 사용
CREATE view view_emp_dept_job as(
select 
e.EMPLOYEE_ID,
e.first_name || ' ' || e.last_name as full_name,
j.job_title
from EMPLOYEES e
left join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
left join jobs j
on e.job_id = j.job_id
)
order by EMPLOYEE_ID;

select * from view_emp_dept_job;

-- 뷰의 수정(create or replace view 구문)
--동일 이름으로 해당 구문을 사용하면 데이터가 변경되면서 새롭게 생성

CREATE or REPLACE VIEW view_emp_dept_job as(
select 
e.EMPLOYEE_ID,
e.first_name || ' ' || e.last_name as full_name,
j.job_title,
e.salary
from EMPLOYEES e
left join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
left join jobs j
on e.job_id = j.job_id
)
order by EMPLOYEE_ID;

select
job_title,
avg(salary) as avg
from view_emp_dept_job
group by job_title
order by avg desc; -- sql구문이 간결해짐.

-- 뷰 삭제
drop view view_emp;

/*
VIEW에 INSERT가 일어나는 경우 실제 테이블에도 반영이 됩니다.
그래서 VIEW의 INSERT, UPDATE, DELETE는 많은 제약 사항이 따릅니다.
원본 테이블이 NOT NULL인 경우 VIEW에 INSERT가 불가능합니다.
VIEW에서 사용하는 컬럼이 가상열인 경우에도 안됩니다.
*/

--두번째 컬럼인 full name은 가상열 이기 때문에 insert 안됨
insert into view_emp_dept_job
VALUES(300,'test','test','test',10000);--안됨

--join된 뷰의 경우에는 한 번에 삽입할 수 없습니다
insert into view_emp_dept_job
( EMPLOYEE_ID,DEPARTMENT_ID,JOB_TITLE,salary)
VALUES(300,'test','test','test',10000);

--원본 테이블 컬럼 중 not null 컬럼이 존재하고 해당 컬럼을 view로 지목할 수 없다면 insert가 불가
insert into view__emp
( EMPLOYEE_ID,JOB_id,salary)
VALUES(300,'test',10000);

DELETE from view_emp
where employee_id = 107;

select * from view_emp;
select * from employees;
rollback;

--with check option > 조건 제약 결정
--뷰를 생성할 때 사용한 조건 컬럼은 뷰를 통해서 변경할 수 없게 해주는 키워드
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    department_id
    FROM employees
    WHERE department_id = 60
)
with check OPTION CONSTRAINT view_emp_test_ck;
select * from view_emp_test;
UPDATE view_emp_test
set DEPARTMENT_ID = 100
where EMPLOYEE_ID = 107;

--읽기 전용 뷰 > with read only (dml 연산을 막음) > dekect만 허용
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    department_id
    FROM employees
    WHERE department_id = 60
)
with read only;



