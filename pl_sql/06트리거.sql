
/*
trigger�� ���̺� ������ ���·ν�, INSERT, UPDATE, DELETE �۾��� ����� ��
Ư�� �ڵ尡 �۵��ǵ��� �ϴ� �����Դϴ�.
VIEW���� ������ �Ұ����մϴ�.

Ʈ���Ÿ� ���� �� ���� �����ϰ� F5��ư���� �κ� �����ؾ� �մϴ�.
�׷��� ������ �ϳ��� �������� �νĵǾ� ���� �������� �ʽ��ϴ�.
*/

create table tbl_test(
id number(10),
text varchar2(20)
);
create or REPLACE TRIGGER trg_test
after delete or UPDATE -- Ʈ������ ���� ����(���� Ȥ�� ���� ���Ŀ� ����)
on tbl_test -- Ʈ���Ÿ� ������ ���̺�
for each ROW -- �� �࿡ ��� ����(������ ���� ������ �� ���� ����)
--DECLARE�� ��������
begin
dbms_output.put_line('Ʈ���Ű� ������');--���� �ϰ��� �ϴ� �ڵ带 begin ~�� ���̿� ����
end;

insert into tbl_test VALUES(1,'���');
UPDATE tbl_test set text = '�貲��' where id =1;
DELETE from tbl_test where id =2;




















