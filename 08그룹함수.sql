--�׷��Լ� AVG MAX MIN SUM COUNT
-- �׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �ȴ�
select
avg(salary),
max(salary),
min(salary),
sum(salary),
count(salary)
from employees;
select count(*)from employees; --�� �� �������� ��
select count(first_name) from employees;
select count(commission_pct) from employees;--null�� �ƴ� ���� ��
select count(manager_id) from employees;--null�� �ƴ� ���� ��

--�μ����� �׷�ȭ �׷��Լ��� ���
select
department_id,
avg(salary)
from employees
group by department_id;


--�������� 
-- �׷��Լ��� �ܵ������� ����� ���� ��ü ���̺��� �׷��� ����� ������
--�ϸ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ� �׷��� �ʿ�
select
department_id,
avg(salary)
from employees; --����

-- group by�� ����Ҷ� group���� ������ ���� �÷��� ��ȸ�� �� ����
select
job_id,
avg(salary)
from employees
group by department_id;--����

-- group by�� 2�� �̻� ���
select
job_id,
avg(salary)
from employees
group by department_id,job_id;--����

--group by�� ���� �׷�ȭ �� �� ������ �� ��� having�� ���
--where�� �Ϲ� ������ group by ���� ���� ����
select
department_id,
avg(salary)
from employees
group by department_id
having sum(salary)> 100000;

select
job_id,
count(*)
from employees
group by job_id
having count(*) >= 5;

--�μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿� ����� 500 �̻� ��ȸ
select
department_id,
avg(salary) as ���
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000
order by ��� desc;

/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
select
job_id,
count(*),
avg(salary) as ����
from employees
group by job_id
order by ���� DESC;

select
*
from employees;


/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
select
to_char(HIRE_DATE, 'YY'),
count(*) as �����
from employees
group by to_char(HIRE_DATE, 'YY');



/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/
select
DEPARTMENT_ID,
avg(salary)
from employees
where salary >= 5000
group by DEPARTMENT_ID
having avg(salary) >= 7000;

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/
   select
   department_id,
trunc(avg(salary + salary*commission_pct),1) as avg,
sum(salary + salary*commission_pct) as ��,
count(*) as count 
from employees
where commission_pct is not null
group by department_id;


