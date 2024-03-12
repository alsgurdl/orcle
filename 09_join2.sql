
SELECT * from info;
SELECT * from auth;

--이너(soqn) 조인
select *
from info i
inner join auth a
on i.auth_id = a.auth_id;

--오라클 문법(오라클 전용문법이라 앞으로는 작성하지 않겠습니다)
select *
from info i, auth a
where i.auth_id = a.auth_id;

--auth_id 컬럼을 그냥 쓰면 모호하다 라고 뜬다
-- 그 아유는 양쪽에 아름을 붙이던지 별칭을쓰던지
--확실하게 지목해 주세요
select 
a.auth_id, title,content, name
from info i
join auth a -- join이라고만 쓰면 inner join
on i.auth_id = a.auth_id;

--필요한 데이터만 조회하겠다 (일반조건) 라고 한다면
--where 구문을 통해 조건을 걸어주면 된다
select 
a.auth_id, title,content, name
from info i
join auth a 
on i.auth_id = a.auth_id
where a.name = '이순신';
--아우터(외부) 조인
select*
from info i left outer join auth a--outer 생략가능
on i.auth_id = a.auth_id;

select * 
from info i,auth a
where i.auth_id = a.auth_id(+);
--좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현하는 외부 조인
select*
from info i full outer join auth a
on i.auth_id = a.auth_id;

--cross join은 join저건을 설정하지 않기 때문에
--단순히 모든 컬럼에 대한 join을 지행합니다
--실젤는 거의 사용하지 않습니다
select*from info 
cross join auth ;

select*
from info , auth ;

--여러개 테이블 조인 > 키 값을 찾아 구문을 연결해서 쓰면 된다
SELECT *
from employees e
left join departments d on e.department_id = d.department_id
left join locations loc on d.location_id = loc.location_id;

/*
- 테이블 별칭 a, i를 이용하여 LEFT OUTER JOIN 사용.
- info, auth 테이블 사용
- job 컬럼이 scientist인 사람의 id, title, content, job을 출력.
*/
select 
i.id,
i.title,
i.content,
a.job
from info i
right outer join auth a
on i.auth_id = a.auth_id
where a.job = 'scientist';

select * from info;
--셀프 조인이란 동일 테이블 사이의 조인을 말한다
--동일 테이블 컬럼을 통해 기존의 존재하는 값을 매칭시켜 가져올 때 사용
select  
e1.employee_id,e1.first_name,e1.manager_id,
e2.first_name, e2.employee_id
from employees e1
join employees e2
on e1.manager_id = e1.manager_id
order by e1.employee_id;












