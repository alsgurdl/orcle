-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

-- �÷� ���� ���� ���� (�÷� ���𸶴� �������� ����)
CREATE TABLE dept2 (
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY, -- �������� �ĺ��ڴ� ������ �����մϴ�. (����Ŭ�� �˾Ƽ� �̸� ����)
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);
select *from dept2;
DROP TABLE dept2;

-- ���̺� ���� ���� ���� (��� �� ���� �� ���� ������ ���ϴ� ���)
CREATE TABLE dept2 (
    dept_no NUMBER(2), 
    dept_name VARCHAR2(14) CONSTRAINT dept_name_notnull NOT NULL,
    loca NUMBER(4), 
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1), 
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

-- �ܷ� Ű(foreign key)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT �Ұ���.
INSERT INTO dept2
VALUES(10, 'gg', 6542, 90000, 'M'); -- ���� -> 6542�� ������ ����!

INSERT INTO dept2
VALUES(20, 'hh', 1900, 90000, 'M'); 

update dept2
set loca = 4000
where dept_no = 10; --����(�ܷ�Ű �������� ����)

update dept2
set dept_no = 20
where dept_no = 10; --����(�ֿ�Ű �������� ����)

update dept2
set dept_bonus = 900
where dept_no = 10;--����(check �������� ����)

--���̺� ���� ���� �������� �߰� �� ����, ����
--���� ������ �߰�, ������ ���� ������ �ȵ�
--�����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ� �մϴ�
CREATE TABLE dept2 (
    dept_no NUMBER(2), 
    dept_name VARCHAR2(14) CONSTRAINT dept_name_notnull NOT NULL,
    loca NUMBER(4), 
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1)
    );
    
--pk �߰�
alter TABLE dept2 add constraint dept2_deptno_pk PRIMARY key(dept_no);
-- fk �߰�
alter TABLE dept2 add constraint dept2_loca_locid_fk
foreign KEY(loca) REFERENCES locations(location_id);
--check �߰�
alter TABLE dept2 add CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000);
--unique
alter TABLE dept2 add CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

alter TABLE dept2 modify dept_bonus NUMBER(10) not null;
--�������� Ȯ��
select * from user_constraints
where table_name = 'DEPT2';
--���� ���� ���� (���� ������ �̸����� > �̸��� ���� ���� �ʾҴٸ� ����Ŭ�� �ο��� �̸��� ����)
alter TABLE dept2 drop CONSTRAINT dept2_deptno_pk;


CREATE TABLE members (
     
    M_name VARCHAR2(20)NOT NULL,
    M_NUM NUMBER(3) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    REG_DATE date not null CONSTRAINT mem_regdate_uk unique, 
    gender VARCHAR2(1),
    loca NUMBER(4) CONSTRAINT mem_loc_locid_fk REFERENCES locations(location_id)
    
);
select *from user_constraints
where table_name = 'MEMBERS';

INSERT into members
VALUES('AAA',1,'18-07-01','M',1800);
INSERT into members
VALUES('BBB',2,'18-07-02','M',1900);
INSERT into members
VALUES('CCC',3,'18-07-03','M',2000);
INSERT into members
VALUES('DDD',4,'18-07-04','M',2100);

--����2
select 
m.m_name,
m.m_num,
loc.street_address,
loc.location_id
from members m join locations loc
on m.loca = loc.location_id
order by m_num;





