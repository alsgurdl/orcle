--insert
--���̺� ���� Ȯ��
desc DEPARTMENTS;

--insert ù��° ���(��� �÷� �����͸� �� ���� �����ؼ� ����)
insert into DEPARTMENTS
values(300, '���ߺ�',100, 1500);

insert into DEPARTMENTS
values(300, '���ߺ�'); --> ���� �÷��� �������� �ʰ� ���� �ִ� ��쿡�� ��� ���� ����� �Ѵ�(null ��� ���� �������)

select * from DEPARTMENTS;
rollback; --���� ������ �ٽ� �ڷ� �ǵ����� Ű����
--insert �ι�° (���� �÷��� �����ϰ� ����not null �÷��� Ȯ��)
insert into DEPARTMENTS
(DEPARTMENT_id,DEPARTMENT_name) --���� -> DEPARTMENT_name�� not null
VALUES(300,'���ߺ�');

--�纻 ���̺� ���� 
--�纻 ���̺��� ������ �� �׳� �����ϸ� > ��ȸ�� �����ͱ��� ��� ����
--where���� false��(1=2)���� �ϸ� > ���̺��� ������ ����ǰ� �����ʹ� ����
--ctas���� �÷��� ������ �����͸� ������ �� ���� ����(pk,kf...)�� �������� �ʽ��ϴ�
create table emps as
(select employee_id , first_name,job_id,hire_date
from employees where 1 = 2);
select *from emps;
drop table emps;


--insert (��������)
insert into emps
(select employee_id , first_name,job_id,hire_date 
from employees where department_id = 50);

select * from emps
where department_id = 120;


--upadte
--update ���̺��̸� set �÷�=�� where ������ ��������(����)
create table emps as
(select *from employees);
select * from emps;

--update�� ������ ���� ������ ������ �� �������� �� �����ؾ� �մϴ�
--�׷��� ������ ���� ����� ��ü ���̺�� ����
update emps set salary = 30000;
rollback;
update emps set salary = 30000
where employee_id = 100;

update emps set salary = salary +salary*0.1
where employee_id = 100;

update emps
set PHONE_NUMBER = '010-1234-5678',MANAGER_ID = 102
where EMPLOYEE_ID = 100;
select *from emps;

--update (��������)
update emps
set (job_id,salary,MANAGER_ID)=(
select job_id,salary,MANAGER_ID
from emps
where EMPLOYEE_ID = 100
)
where EMPLOYEE_ID = 101;

select *from emps;
-----------
--delete
--delete where �� �������� ������ ���̺� ��ü ���� ����� �ȴ�
delete from emps
where EMPLOYEE_ID = 103;
--delete(��������)
delete from emps
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENTS
 where DEPARTMENT_NAME = 'IT');



