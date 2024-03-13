
/*
���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
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
���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� 
ROWNUM�� �ٿ� 1-10 ������ ������ ����ϼ���.
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

