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
create table emps as
(select employee_id , first_name,job_id,hire_date
from employees where 1 = 2);
select *from emps;
drop table emps;

--insert (��������)
insert into emps
(select employee_id , first_name,job_id,hire_date 
from employees where department_id = 50);










