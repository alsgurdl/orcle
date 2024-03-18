
/*
trigger는 테이블에 부착된 형태로써, INSERT, UPDATE, DELETE 작업이 수행될 때
특정 코드가 작동되도록 하는 구문입니다.
VIEW에는 부착이 불가능합니다.

트리거를 만들 때 범위 지정하고 F5버튼으로 부분 실행해야 합니다.
그렇지 않으면 하나의 구문으로 인식되어 정상 동작하지 않습니다.
*/

create table tbl_test(
id number(10),
text varchar2(20)
);
create or REPLACE TRIGGER trg_test
after delete or UPDATE -- 트리거의 동작 시점(삭제 혹은 수정 이후에 동작)
on tbl_test -- 트리거를 부착할 테이블
for each ROW -- 각 행에 모두 적용(생략이 가능 생략시 한 번만 실행)
--DECLARE는 생략가능
begin
dbms_output.put_line('트리거가 동작함');--실행 하고자 하는 코드를 begin ~둥 사이에 넣음
end;

insert into tbl_test VALUES(1,'춘식');
UPDATE tbl_test set text = '김께통' where id =1;
DELETE from tbl_test where id =2;




















