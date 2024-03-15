-- 오토 커밋 활성화 여부
show autocommit;
-- 모토 커밋 온
set autocommit on;
--오토 커밋 오프
set autocommit off;

select * from emps;
DELETE from emps where EMPLOYEE_ID = 100;
insert into emps
(EMPLOYEE_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
VALUES(304,'lee','fdasjf@gmail',sysdate,'test');

-- 보류중 모든 데이터 변경사항을 취소(폐기)
--직전 커밋 단계로 회귀(돌아가기) 및 트랜잭션 종료
ROLLBACK;

--세이브 포인트 생성
--롤백할 포인트를 직접 이름을 붙여서 지정
--anst 표준 문법은 아니기 때문에 그렇게 권장하지 않음
savepoint insert_park;
insert into emps
(EMPLOYEE_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
VALUES(305,'park','park0000@gmail',sysdate,'test');

ROLLBACK to SAVEPOINT insert_park;
--보류중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 종료
--커밋 후에는 어떠한 방법을 사용하더라도 되돌릴 수 없다
commit;