/*
depts 테이블은 CTAS 문법으로 만들어 주세요.
데이터도 복제해서 만드세요.
2-4.  290, 300, 310, 320번 부서의 매니저 아이디를 변경합니다.

*/
create table depts as(
select * from DEPARTMENTS
);
select *from depts;

