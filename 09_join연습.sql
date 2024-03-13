/*
문제 1.
-EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
-EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서
각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 주석으로 작성)
*/
select*from EMPLOYEES;
select*from DEPARTMENTS;
select*from jobs;
select*from JOB_HISTORY;
select*from LOCATIONS;
select
*
from EMPLOYEES e
INNER join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select
*
from EMPLOYEES e
LEFT join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select
*
from EMPLOYEES e
right join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;--122개

select
*
from EMPLOYEES e
FULL join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID; --123개

/*
문제 2.
-EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
조건)employee_id가 200인 사람의 이름, department_name를 출력하세요
조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다
*/
select
d.department_name,
 e.first_name || e.last_name
from EMPLOYEES e
INNER JOIN DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.employee_id = 200
;

/*
문제 3.
-EMPLOYEES, JOBS테이블을 INNER JOIN하세요
조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
HINT) 어떤 컬럼으로 서로 연결되어 있는지 확인
*/
select
e.first_name,
j.job_id,
j.job_title
from EMPLOYEES e
join JOBS j
on e.job_id = j.job_id
order by e.first_name;
/*
문제 4.
--JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.
*/
select 
* from jobs j
LEFT JOIN JOB_HISTORY h
on j.job_id = h.job_id;

/*
문제 5.
--Steven King의 부서명을 출력하세요.
*/
select
e.first_name || ' '||e.last_name,
j.job_title
from EMPLOYEES e
left join jobs j
on e.job_id = j.job_id
where e.first_name ='Steven'
and e.last_name = 'King' 
;

/*
문제 6.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요
*/
select * from EMPLOYEES 
cross join DEPARTMENTS;

select * from EMPLOYEES 
cross join DEPARTMENTS;

select * from EMPLOYEES ,
DEPARTMENTS;

/*
문제 7.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름, 
급여, 부서명, 근무지를 출력하세요. as(Alias를 사용)
*/
select 
e.EMPLOYEE_ID as 사원번호,
e.first_name,
e.SALARY,
d.DEPARTMENT_NAME,
loc.city
from EMPLOYEES e
join DEPARTMENTS d
on e.department_id = d.department_id
join locations loc
on d.location_id = loc.location_id
where e.job_id = 'SA_MAN';



/*
문제 8.
-- employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 
직원 정보만 출력하세요.
*/
select
*
from employees e
 join jobs j
on e.JOB_ID = j.JOB_ID
where job_title in ('Stock Manager','Stock Clerk');

/*
문제 9.
-- departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용
*/
select
d.department_name
from departments d
LEFT OUTER JOIN employees e
on d.department_id = e.department_id
where e.employee_id is not NULL
;

/*
문제 10. 
-join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요
힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.
*/
select 
e1.FIRST_NAME,
e2.FIRST_NAME
from EMPLOYEES e1
join EMPLOYEES e2
on e1.manager_id = e2.manager_id;


/*
문제 11. 
-- EMPLOYEES 테이블에서 left join하여 관리자(매니저)id와, 매니저의 이름, 매니저의 급여 까지 출력하세요.
-- 매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 정렬하세요.
*/
select 
e1.EMPLOYEE_id,
e1.FIRST_NAME,
e1.manager_id,
e2.FIRST_NAME,
e2.salary
from EMPLOYEES e1
left join EMPLOYEES e2
on e1.manager_id = e2.EMPLOYEE_id
where e1.manager_id is not null
order by e2.salary desc;


