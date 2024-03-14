--gerge: 테이블 병합
/*
update와 insert를 한 방에 처리

한 테이블에 해당하는 데이터가 존재한다면 update를 
없으면 insert로 처리
*/
create table emps_it as (select * from EMPLOYEES where 1 = 2);

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (106, '춘식', '김', 'CHOONSIK', sysdate, 'IT_PROG');
    select * from emps_it;
    
     select * from EMPLOYEES
     where job_id = 'IT_PROG';
     
     MERGE INTO emps_it a -- 머지를 할 타겟 테이블
     using -- 병합시킬 데이터(테이블 이름, 서브쿼리 등...)
     (select * from EMPLOYEES
     where job_id = 'IT_PROG') b --병합하고 하는 데이터를 서브쿼리로 표현
     on --병합시킬 데이터의 연결 조건
     (a.employee_id = b.employee_id) -- employee_id결합을 통해 양쪽 테이블의 데이터 존재 유무 확인
     when MATCHED THEN -- 바로 위에 작성하 조건이 일치하는 경우(데이터가 서로 있는 경우)
     update set
     a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
        /*
        DELETE만 단독으로 쓸 수는 없습니다.
        UPDATE 이후에 DELETE 작성이 가능합니다.
        UPDATE 된 대상을 DELETE 하도록 설계되어 있기 때문에
        삭제할 대상 컬럼들을 동일한 값으로 일단 UPDATE를 진행하고
        DELETE의 WHERE절에 아까 지정한 동일한 값을 지정해서 삭제합니다.
        */
        delete
        where a.employee_id = b.employee_id
        
        
        when not MATCHED THEN --조건이 일치하지 않는 경우
        insert VALUES
            (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
    
    select * from emps_it;
    
------------------------------------------------------------------------------------

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '렉스', '박', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '니나', '최', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '흥민', '손', 'HMSON', '20/04/06', 'AD_VP');
/*
employees 테이블을 매번 빈번하게 수정되는 테이블이라고 가정하자.
기존의 데이터는 email, phone, salary, comm_pct, man_id, dept_id을
업데이트 하도록 처리
새로 유입된 데이터는 그대로 추가.
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
values(320,'영업' ,303 , 1700 )
;
insert into depts
values(310,'인사' ,302 , 1800 )
;
insert into depts
values(300,'재정' ,301 , 1800 )
;
insert into depts (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID)
values(290,'회계부' , 1800 )
;
insert into depts (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID)
values(280,'개발' , 1800 )
;
update depts set DEPARTMENT_ID = 301
where DEPARTMENT_ID = 290;













    
    