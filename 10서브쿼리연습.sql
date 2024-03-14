/*
문제 1.
-EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들의 데이터를 출력 하세요 
(AVG(컬럼) 사용)
-EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들의 수를 출력하세요
-EMPLOYEES 테이블에서 job_id가 IT_PROG인 사원들의 평균급여보다 높은 사원들의 
데이터를 출력하세요
*/
select
*
from EMPLOYEES
where salary > (select avg(salary) from EMPLOYEES);  
select
count(*)
from EMPLOYEES
where salary > (select avg(salary) from EMPLOYEES);  
select
*
from EMPLOYEES
where salary > (select avg(salary) from EMPLOYEES where job_id = 'IT_PROG');  

/*
문제 2.
-DEPARTMENTS테이블에서 manager_id가 100인 부서에 속해있는 사람들의
모든 정보를 출력하세요.
*/
SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments
                        WHERE manager_id = 100);

/*
문제 3.
-EMPLOYEES테이블에서 “Pat”의 manager_id보다 높은 manager_id를 갖는 모든 사원의 데이터를 
출력하세요
-EMPLOYEES테이블에서 “James”(2명)들의 manager_id를 갖는 모든 사원의 데이터를 출력하세요.
*/
select * from EMPLOYEES;
select 
*
from EMPLOYEES
where manager_id > (select manager_id from EMPLOYEES where first_name = 'Pat')
;
select 
*
from EMPLOYEES
where manager_id in (select manager_id from EMPLOYEES where first_name = 'James')
;


/*
문제 4.
-EMPLOYEES테이블 에서 first_name기준으로 내림차순 정렬하고, 41~50번째 데이터의 
행 번호, 이름을 출력하세요
*/
select * from
(
SELECT rownum as rn,tbl.first_name

from 
(
select*
from EMPLOYEES
order by first_name desc
)tbl
)
where rn BETWEEN 41 and 50;

/*
문제 5.
-EMPLOYEES테이블에서 hire_date기준으로 오름차순 정렬하고, 31~40번째 데이터의 
행 번호, 사원id, 이름, 전화번호, 입사일을 출력하세요.
*/
select * from
(
SELECT rownum as rn,tbl.first_name,tbl.EMPLOYEE_ID

from 
(
select*
from EMPLOYEES
order by hire_date
)tbl
)
where rn BETWEEN 31 and 40;

/*
문제 6.
employees테이블 departments테이블을 left 조인하세요
조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명 만 출력합니다.
조건) 직원아이디 기준 오름차순 정렬
*/
select 
e.DEPARTMENT_ID,
e.first_name || ' '|| e.last_name as name,
e.department_id,
d.department_name
from employees e
left join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
order by e.DEPARTMENT_ID;

/*
문제 7.
문제 6의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
*/
select
e.DEPARTMENT_ID,
e.first_name || ' '|| e.last_name as name,
e.department_id,
(select department_name
from departments d
where d.department_id = e.department_id
)as deot
from employees e
order by e.DEPARTMENT_ID ;
/*
문제 8.
departments테이블 locations테이블을 left 조인하세요
조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스트 코드, 시티 만 출력합니다
조건) 부서아이디 기준 오름차순 정렬
*/
select
d.DEPARTMENT_ID,d.DEPARTMENT_NAME,d.MANAGER_ID,d.LOCATION_ID,
loc.STREET_ADDRESS,loc.POSTAL_CODE,loc.CITY
from departments d
left join locations loc
on d.LOCATION_ID = loc.LOCATION_ID
order by DEPARTMENT_ID;


/*
문제 9.
문제 8의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
*/
SELECT
d.DEPARTMENT_ID,
d.DEPARTMENT_NAME,
d.MANAGER_ID,
d.LOCATION_ID,
(select
loc.STREET_ADDRESS 
from locations loc
where d.LOCATION_ID = loc.LOCATION_ID
) as stre,
(select
loc.POSTAL_CODE
from locations loc
where d.LOCATION_ID = loc.LOCATION_ID
)as code,
(select
loc.CITY 
from locations loc
where d.LOCATION_ID = loc.LOCATION_ID
) as city
from departments d
order by DEPARTMENT_ID;


/*
문제 10.
locations테이블 countries 테이블을 left 조인하세요
조건) 로케이션아이디, 주소, 시티, country_id, country_name 만 출력합니다
조건) country_name기준 오름차순 정렬
*/
select
loc.location_id,
loc.street_address,
loc.city,
c.country_id,
c.country_name
from locations loc
left join countries c
on loc.COUNTRY_ID = c.COUNTRY_ID
order by c.country_name desc;

/*
문제 11.
문제 10의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
*/
SELECT
    loc.location_id, loc.street_address, loc.city, loc.country_id,
    (SELECT country_name
    FROM countries c
    WHERE loc.country_id = c.country_id) AS country_name
FROM locations loc
ORDER BY loc.country_id;


/*
문제 12. 
employees테이블, departments테이블을 left조인 hire_date를 오름차순 기준으로 
11-0번째 데이터만 출력합니다.
조건) rownum을 적용하여 번호, 직원아이디, 이름, 전화번호, 입사일, 
부서아이디, 부서이름 을 출력합니다.
조건) hire_date를 기준으로 오름차순 정렬 되어야 합니다. rownum이 틀어지면 안됩니다.
*/
select * from
(
SELECT rownum as rn, tbl.*
from 
(
select 
e.EMPLOYEE_ID,
e.first_name,e.PHONE_NUMBER,e.HIRE_DATE,
d.DEPARTMENT_ID,d.DEPARTMENT_NAME
from employees e
left join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
order by e.hire_date
)tbl
)
where rn > 10 and rn <= 20;

/*
문제 13. 
--EMPLOYEES 와 DEPARTMENTS 테이블에서 JOB_ID가 SA_MAN 사원의 정보의 LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME을 출력하세요.
*/
select
e.LAST_NAME, e.JOB_ID, 
d.DEPARTMENT_ID,d.DEPARTMENT_NAME
from EMPLOYEES e
join DEPARTMENTS d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.JOB_ID = 'SA_MAN';


/*
문제 14
-- DEPARTMENTS 테이블에서 각 부서의 ID, NAME, MANAGER_ID와 부서에 속한 인원수를 출력하세요.
-- 인원수 기준 내림차순 정렬하세요.
-- 사람이 없는 부서는 출력하지 않습니다.
*/
select 
d.department_id,
d.department_name,
d.manager_id,
count(*)
from DEPARTMENTS d
left join EMPLOYEES e
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by e.DEPARTMENT_ID;


/*
문제 15
--부서에 대한 정보 전부와, 주소, 우편번호, 부서별 평균 연봉을 구해서 출력하세요.
--부서별 평균이 없으면 0으로 출력하세요.
*/
select 
d.*,
e.avg(salary),
loc.STREET_ADDRESS,
loc.POSTAL_CODE
from EMPLOYEES e
join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS loc
on d.LOCATION_ID = loc.LOCATION_ID
group by d.DEPARTMENT_NAME;



/*
문제 16
-문제 15 결과에 대해 DEPARTMENT_ID기준으로 내림차순 정렬해서 
ROWNUM을 붙여 1-10 데이터 까지만 출력하세요.
*/
select * from ROWNUM, rn
(
select
d.*,
e.avg(salary),
loc.STREET_ADDRESS,
loc.POSTAL_CODE
from EMPLOYEES e
join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS loc
on d.LOCATION_ID = loc.LOCATION_ID
group by d.DEPARTMENT_NAME
order by DEPARTMENT_ID desc
)rn
where rownum >= 1 and rownum <11;

