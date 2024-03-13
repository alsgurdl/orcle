/*
# �������� 
: SQL ���� �ȿ� �Ǵٸ� SQL�� �����ϴ� ���.
 ���� ���� ���Ǹ� ���ÿ� ó���� �� �ֽ��ϴ�.
 WHERE, SELECT, FROM ���� �ۼ��� �����մϴ�.

- ���������� ������� () �ȿ� �����.
 ������������ �������� 1�� ���Ͽ��� �մϴ�.
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �˴ϴ�.
*/
--�̸��� 'nancy' �� ������� �޿��� ���� ��� ���ϱ�
select salary from employees
where first_name = 'Nancy';

select first_name from employees
where salary > 12008;
--���������� Ȱ���� ����
select first_name from employees
where salary > (select salary from employees
                where first_name = 'Nancy');

--employee_id�� 103���� ����� job_id�� ������ job_id���� ����� ��ȸ
SELECT * from employees
where job_id = (SELECT job_id from employees
where employee_id = 103);

--���� ������ ���������� �����Ѵ� ���� ���� ���� ������ �����ڸ� ����� �� ����
--������ ������: �ַ� �� ������(=,>,<,<=,>=,<>)�� �ַ� ����ϴ� ��� �ϳ��� �ุ ��ȯ�ؾ��Ѵ�
SELECT * from employees
where job_id = (SELECT job_id from employees
where last_name = 'King');--����

--������ ������(in,any,all,exists)

--in:��ȸ�� ����� � ���� �������� ��
SELECT * from employees
where job_id in (SELECT job_id from employees
where last_name = 'King');

--first_name�� david�� ������� �޿��� ���� �޿並 �޴� ������� ��ȭ
select * from employees
where salary in (select salary from employees
where first_name = 'David');

--any,aome ���� ���������� ���� ���ϵ� ������ ���� ���ؼ�
-- �ϳ��� �����ϸ� ��ȸ ��� ����
--david��� ����� ���� ���ε� ���� ���� ���� �޿��� �޴� david���� ���� ����� ��ȸ
select * from employees
where salary > any (select salary from employees
where first_name = 'David');
--all:���� ���������� ���� ���ϵ� ������ ���� ��� ���ؼ�
--���� �� ��ġ�ؾ� ��ȸ��� ����
--david��� ����� ���� ���ε� ���� ���� ���� �޿��� �޴� david���� ���� ����� ��ȸ

select * from employees
where salary > all (select salary from employees
where first_name = 'David');

--exists: �������� �ϳ� �̻��� ���� ��ȯ�ϸ� ������ ����
-- jon_history�� �����ϴ� ������ employees���� �����Ѵٹ� ��ȸ��� ����
--�������� ���ؼ� jh�� �ִ� id�� e�� ��ġ�� ������ 1�̶�� ���� ��ȸ
--exitsts ����ڰ� 1�� ��ȸ�� �� �� �����Ͱ� �����Ѵٴ� ���� �Ǵ��Ͽ� empolyee�� �ش� ������� ���� ������ȸ
select * from employees e
where exists (select 1 from job_history jh
where e.employee_id = jh.employee_id);

select * from employees e
where exists (select 1 from departments d
where department_id = 10);
-----------------------------------------
--SELECT ���� ���������� ���̱�
--��Į�� �������� ��� Ī��
--��Į�� �������� ���� ����� ���� ���� ��ȯ�ϴ� �������� �ַ� slect���̳� where ������ ���

select
e.first_name,
d.department_name
from employees e
left join DEPARTMENTS d
on e.department_id = d.department_id
order by e.first_name;

select
e.first_name,
(
select 
 department_name
from departments d
where d.department_id = e.department_id
)

from employees e
order by e.first_name;

-- �� �μ��� �Ŵ��� �̸� ��ȸ
select
d.*,
e.first_name as manager_name
 from departments d
 left join employees e
 on d.manager_id = e.employee_id
 order by d.manager_id; -- left join
 
 select
 d.*,
 (
 select
 first_name
 from employees e
 where e.employee_id = d.manager_id
 )as manager_name
 from departments d
 order by d.manager_id;
 
 /*
- ��Į�� ���������� ���κ��� ���� ���
: �Լ�ó�� �� ���ڵ�� ��Ȯ�� �ϳ��� ������ ������ ��.

- ������ ��Į�� ������������ ���� ���
: ��ȸ�� �÷��̳� �����Ͱ� ��뷮�� ���, �ش� �����Ͱ�
����, ���� ���� ����� ��� (sql �������� ������ �� �� �پ�ϴ�.)
*/
--�� �μ��� ��� �� �̱� (��Į��)
select
d.department_name as �μ���,
(
select
count(*)
from employees e
where e.department_id = d.department_id
group by DEPARTMENT_ID
)as �����
from departments d;


 








