/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� 
(AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� 
�����͸� ����ϼ���
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
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� �μ��� �����ִ� �������
��� ������ ����ϼ���.
*/
SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments
                        WHERE manager_id = 100);

/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� 
����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
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
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� 
�� ��ȣ, �̸��� ����ϼ���
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
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� 
�� ��ȣ, ���id, �̸�, ��ȭ��ȣ, �Ի����� ����ϼ���.
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
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
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
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
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
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/
select
d.DEPARTMENT_ID,d.DEPARTMENT_NAME,d.MANAGER_ID,d.LOCATION_ID,
loc.STREET_ADDRESS,loc.POSTAL_CODE,loc.CITY
from departments d
left join locations loc
on d.LOCATION_ID = loc.LOCATION_ID
order by DEPARTMENT_ID;


/*
���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
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
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����
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
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT
    loc.location_id, loc.street_address, loc.city, loc.country_id,
    (SELECT country_name
    FROM countries c
    WHERE loc.country_id = c.country_id) AS country_name
FROM locations loc
ORDER BY loc.country_id;


/*
���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 
11-0��° �����͸� ����մϴ�.
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, 
�μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
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
���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
*/
select
e.LAST_NAME, e.JOB_ID, 
d.DEPARTMENT_ID,d.DEPARTMENT_NAME
from EMPLOYEES e
join DEPARTMENTS d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.JOB_ID = 'SA_MAN';


/*
���� 14
-- DEPARTMENTS ���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
-- �ο��� ���� �������� �����ϼ���.
-- ����� ���� �μ��� ������� �ʽ��ϴ�.
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

