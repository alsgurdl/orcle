/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
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
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;--122��

select
*
from EMPLOYEES e
FULL join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID; --123��

/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_name�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
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
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
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
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/
select 
* from jobs j
LEFT JOIN JOB_HISTORY h
on j.job_id = h.job_id;

/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
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
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/
select * from EMPLOYEES 
cross join DEPARTMENTS;

select * from EMPLOYEES 
cross join DEPARTMENTS;

select * from EMPLOYEES ,
DEPARTMENTS;

/*
���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. as(Alias�� ���)
*/
select 
e.EMPLOYEE_ID as �����ȣ,
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
���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� 
���� ������ ����ϼ���.
*/
select
*
from employees e
 join jobs j
on e.JOB_ID = j.JOB_ID
where job_title in ('Stock Manager','Stock Clerk');

/*
���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
*/
select
d.department_name
from departments d
LEFT OUTER JOIN employees e
on d.department_id = e.department_id
where e.employee_id is not NULL
;

/*
���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
*/
select 
e1.FIRST_NAME,
e2.FIRST_NAME
from EMPLOYEES e1
join EMPLOYEES e2
on e1.manager_id = e2.manager_id;


/*
���� 11. 
-- EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)id��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���.
-- �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� �����ϼ���.
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


