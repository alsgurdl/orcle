--gerge: ���̺� ����
/*
update�� insert�� �� �濡 ó��

�� ���̺� �ش��ϴ� �����Ͱ� �����Ѵٸ� update�� 
������ insert�� ó��
*/
create table emps_it as (select * from EMPLOYEES where 1 = 2);

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (106, '���', '��', 'CHOONSIK', sysdate, 'IT_PROG');
    select * from emps_it;
    
     select * from EMPLOYEES
     where job_id = 'IT_PROG';
     
     MERGE INTO emps_it a -- ������ �� Ÿ�� ���̺�
     using -- ���ս�ų ������(���̺� �̸�, �������� ��...)
     (select * from EMPLOYEES
     where job_id = 'IT_PROG') b --�����ϰ� �ϴ� �����͸� ���������� ǥ��
     on --���ս�ų �������� ���� ����
     (a.employee_id = b.employee_id) -- employee_id������ ���� ���� ���̺��� ������ ���� ���� Ȯ��
     when MATCHED THEN -- �ٷ� ���� �ۼ��� ������ ��ġ�ϴ� ���(�����Ͱ� ���� �ִ� ���)
     update set
     a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
        /*
        DELETE�� �ܵ����� �� ���� �����ϴ�.
        UPDATE ���Ŀ� DELETE �ۼ��� �����մϴ�.
        UPDATE �� ����� DELETE �ϵ��� ����Ǿ� �ֱ� ������
        ������ ��� �÷����� ������ ������ �ϴ� UPDATE�� �����ϰ�
        DELETE�� WHERE���� �Ʊ� ������ ������ ���� �����ؼ� �����մϴ�.
        */
        delete
        where a.employee_id = b.employee_id
        
        
        when not MATCHED THEN --������ ��ġ���� �ʴ� ���
        insert VALUES
            (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
    
    select * from emps_it;
    
------------------------------------------------------------------------------------

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '����', '��', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '�ϳ�', '��', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '���', '��', 'HMSON', '20/04/06', 'AD_VP');
/*
employees ���̺��� �Ź� ����ϰ� �����Ǵ� ���̺��̶�� ��������.
������ �����ʹ� email, phone, salary, comm_pct, man_id, dept_id��
������Ʈ �ϵ��� ó��
���� ���Ե� �����ʹ� �״�� �߰�.
*/
merge into emps_it a
using 
employees b
on (a.employee_id = b.employee_id)
when MATCHED THEN
UPDATE set
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        when not MATCHED then
        insert VALUES
        (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
    
    select * from emps_it
    order by employee_id asc;
    
    rollback;

-------------------------
DELETE from depts; 
drop table depts;
create table depts as
(select *from DEPARTMENTS );
select * from depts;
insert into depts
values(320,'����' ,303 , 1700 )
;
insert into depts
values(310,'�λ�' ,302 , 1800 )
;
insert into depts
values(300,'����' ,301 , 1800 )
;
insert into depts (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID)
values(290,'ȸ���' , 1800 )
;
insert into depts (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID)
values(280,'����' , 1800 )
;
update depts set DEPARTMENT_ID = 301
where DEPARTMENT_ID = 290;













    
    