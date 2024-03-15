/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/
CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

DESC dept2;
SELECT * FROM dept2;

-- NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��
INSERT INTO dept2
VALUES(30, '�濵����', '���', sysdate, 20000);

--�÷� �߰�
alter table dept2
add dept_count number(3);

alter TABLE dept2
rename COLUMN dept_count to emp_count;

--�÷� �Ӽ� ����
--���� ��������� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ� ���� �ܴ� Ÿ�п��

alter TABLE dept2
MODIFY dept_name VARCHAR2(50);

--ddl(create, alter, truncate, drop)�� Ʈ������� ����� �ƴ�
ROLLBACK;
-- �÷� ����
alter TABLE dept2
DROP column dept_bonus;

select * from dept2;

--���̺� �̸� ����
alter TABLE dept2
rename to dept3;

--���̺� ����(������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE table dept3;

drop TABLE dept3;
