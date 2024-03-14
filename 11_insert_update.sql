--insert
--테이브 구조 확인
desc DEPARTMENTS;

--insert 첫번째 방법(모든 컬럼 데이터를 한 번에 지정해서 삽입)
insert into DEPARTMENTS
values(300, '개발부',100, 1500);

insert into DEPARTMENTS
values(300, '개발부'); --> 에러 컬럼을 지정하지 않고 값만 주는 경우에는 모든 값을 다줘야 한다(null 허용 여부 상관없이)

select * from DEPARTMENTS;
rollback; --실행 시점을 다시 뒤로 되돌리는 키워드
--insert 두번째 (직접 컬럼을 지정하고 저장not null 컬럼을 확인)
insert into DEPARTMENTS
(DEPARTMENT_id,DEPARTMENT_name) --에러 -> DEPARTMENT_name이 not null
VALUES(300,'개발부');

--사본 테이블 생성 
--사본 테이블을 생성할 때 그냥 생성하면 > 조회된 데이터까지 모두 복사
--where절에 false값(1=2)지정 하면 > 테이블의 구조만 복사되고 데이터는 복사
create table emps as
(select employee_id , first_name,job_id,hire_date
from employees where 1 = 2);
select *from emps;
drop table emps;

--insert (서브쿼리)
insert into emps
(select employee_id , first_name,job_id,hire_date 
from employees where department_id = 50);










