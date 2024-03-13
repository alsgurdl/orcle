
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

