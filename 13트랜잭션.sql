-- ���� Ŀ�� Ȱ��ȭ ����
show autocommit;
-- ���� Ŀ�� ��
set autocommit on;
--���� Ŀ�� ����
set autocommit off;

select * from emps;
DELETE from emps where EMPLOYEE_ID = 100;
insert into emps
(EMPLOYEE_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
VALUES(304,'lee','fdasjf@gmail',sysdate,'test');

-- ������ ��� ������ ��������� ���(���)
--���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����
ROLLBACK;

--���̺� ����Ʈ ����
--�ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����
--anst ǥ�� ������ �ƴϱ� ������ �׷��� �������� ����
savepoint insert_park;
insert into emps
(EMPLOYEE_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
VALUES(305,'park','park0000@gmail',sysdate,'test');

ROLLBACK to SAVEPOINT insert_park;
--�������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ����
--Ŀ�� �Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� ����
commit;