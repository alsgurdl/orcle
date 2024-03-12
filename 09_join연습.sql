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