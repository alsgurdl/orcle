
declare
v_salary number :=0;
v_department_id number :=0;

begin
v_department_id := round(dbms_random.value(10,110), -1);
dbms_output.put_line('�޿��� �� ����');
select 
salary
into
v_salary
from EMPLOYEES
where department_id = v_department_id
and rownum = 1; -- ù° ���� ���ؼ� ������ ����
if
v_salary <= 5000
then
dbms_output.put_line('�޿��� �� ����');
elsif
v_salary <= 9000
then
dbms_output.put_line('�޿��� �߰�');

else
dbms_output.put_line('�޿��� ����');
end if;
end;

--case��

declare
v_salary number :=0;
v_department_id number :=0;

begin
v_department_id := round(dbms_random.value(10,110), -1);
dbms_output.put_line('�޿��� �� ����');
select 
salary
into
v_salary
from EMPLOYEES
where department_id = v_department_id
and rownum = 1; -- ù° ���� ���ؼ� ������ ����
case
when v_salary <= 5000 then
dbms_output.put_line('�޿��� �� ����');
when v_salary <= 9000 then
dbms_output.put_line('�޿��� �߰�');
else
dbms_output.put_line('�޿��� ����');
end case;

end;

-- ��ø if��

declare
v_salary number :=0;
v_department_id number :=0;
v_commussion number := 0;
begin
v_department_id := round(dbms_random.value(10,110), -1);
dbms_output.put_line('����');
select 
salary,COMMISSION_PCT
into
v_salary,v_commussion
from EMPLOYEES
where department_id = v_department_id
and rownum = 1; -- ù° ���� ���ؼ� ������ ����
if v_commussion > 0 then
    if v_commussion > 0.15 then
        dbms_output.put_line('Ŀ�̼��� 15% �̻�');
            dbms_output.put_line(v_salary*v_commussion );

end if;
else
    dbms_output.put_line('����');
end if;

end;











