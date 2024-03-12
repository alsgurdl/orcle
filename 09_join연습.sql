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