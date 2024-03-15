/*
view�� �������� �ڷḸ ���� ���� ����ϴ� ���� ���̺��� �����Դϴ�.
��� �⺻ ���̺�� ������ ���� ���̺��̱� ������
�ʿ��� �÷��� ������ �θ� ������ ������ ���ϴ�.
��� �������̺�� ���� �����Ͱ� ���������� ����� ���´� �ƴմϴ�.
�並 ���ؼ� �����Ϳ� �����ϸ� ���� �����ʹ� �����ϰ� ��ȣ�� �� �ֽ��ϴ�.
*/
select * from user_sys_privs; -- ���� Ȯ��

--�ܼ� �� �ϳ��� ���̺��� �̿��Ͽ� ������ ��
--���� �÷����� �Լ� ȣ�⹮ ����� �� ���� ���� ǥ�����̸� �ȵ�
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

--���� ��
--���� ���̺��� �����Ͽ� �ʿ��� �����͸� �����ϰ� ���� Ȯ���� ���� ���
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

-- ���� ����(create or replace view ����)
--���� �̸����� �ش� ������ ����ϸ� �����Ͱ� ����Ǹ鼭 ���Ӱ� ����

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
order by avg desc; -- sql������ ��������.

-- �� ����
drop view view_emp;

/*
VIEW�� INSERT�� �Ͼ�� ��� ���� ���̺��� �ݿ��� �˴ϴ�.
�׷��� VIEW�� INSERT, UPDATE, DELETE�� ���� ���� ������ �����ϴ�.
���� ���̺��� NOT NULL�� ��� VIEW�� INSERT�� �Ұ����մϴ�.
VIEW���� ����ϴ� �÷��� ������ ��쿡�� �ȵ˴ϴ�.
*/

--�ι�° �÷��� full name�� ���� �̱� ������ insert �ȵ�
insert into view_emp_dept_job
VALUES(300,'test','test','test',10000);--�ȵ�

--join�� ���� ��쿡�� �� ���� ������ �� �����ϴ�
insert into view_emp_dept_job
( EMPLOYEE_ID,DEPARTMENT_ID,JOB_TITLE,salary)
VALUES(300,'test','test','test',10000);

--���� ���̺� �÷� �� not null �÷��� �����ϰ� �ش� �÷��� view�� ������ �� ���ٸ� insert�� �Ұ�
insert into view__emp
( EMPLOYEE_ID,JOB_id,salary)
VALUES(300,'test',10000);

DELETE from view_emp
where employee_id = 107;

select * from view_emp;
select * from employees;
rollback;

--with check option > ���� ���� ����
--�並 ������ �� ����� ���� �÷��� �並 ���ؼ� ������ �� ���� ���ִ� Ű����
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

--�б� ���� �� > with read only (dml ������ ����) > dekect�� ���
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



