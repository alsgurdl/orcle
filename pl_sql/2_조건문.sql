
declare
v_salary number :=0;
v_department_id number :=0;

begin
v_department_id := round(dbms_random.value(10,110), -1);
dbms_output.put_line('급여가 좀 넞음');
select 
salary
into
v_salary
from EMPLOYEES
where department_id = v_department_id
and rownum = 1; -- 첫째 값만 구해서 변수에 저장
if
v_salary <= 5000
then
dbms_output.put_line('급여가 좀 낮음');
elsif
v_salary <= 9000
then
dbms_output.put_line('급여가 중간');

else
dbms_output.put_line('급여가 높음');
end if;
end;

--case문

declare
v_salary number :=0;
v_department_id number :=0;

begin
v_department_id := round(dbms_random.value(10,110), -1);
dbms_output.put_line('급여가 좀 넞음');
select 
salary
into
v_salary
from EMPLOYEES
where department_id = v_department_id
and rownum = 1; -- 첫째 값만 구해서 변수에 저장
case
when v_salary <= 5000 then
dbms_output.put_line('급여가 좀 낮음');
when v_salary <= 9000 then
dbms_output.put_line('급여가 중간');
else
dbms_output.put_line('급여가 높음');
end case;

end;

-- 중첩 if문

declare
v_salary number :=0;
v_department_id number :=0;
v_commussion number := 0;
begin
v_department_id := round(dbms_random.value(10,110), -1);
dbms_output.put_line('난수');
select 
salary,COMMISSION_PCT
into
v_salary,v_commussion
from EMPLOYEES
where department_id = v_department_id
and rownum = 1; -- 첫째 값만 구해서 변수에 저장
if v_commussion > 0 then
    if v_commussion > 0.15 then
        dbms_output.put_line('커미션이 15% 이상');
            dbms_output.put_line(v_salary*v_commussion );

end if;
else
    dbms_output.put_line('없음');
end if;

end;











