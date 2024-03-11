--����ȯ �Լ� to_CHAR, TO_NUMBER, TO_DATE

--��¥�� ���ڷ� TO_CHAR(��,����)
--��¥�� ���ڷ� �� ��ȯ�� �� �������� ��¥�� ǥ���� �� �ֽ��ϴ�
SELECT TO_CHAR(sysdate) From dual;
SELECT TO_CHAR(sysdate, 'YYY-MM-DD DY PM:MI:SS') From dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD DY HH24:MI:SS') From dual;
--���Ĺ��ڿ� �Բ� ����ϰ� ���� ���ڸ� ""�� ���μ� ǥ��
SELECT 
TO_CHAR(sysdate, 'YYYY"��"MM"��"DD"��"') 
From dual;

--���ڸ� ���ڷ� TO_CHAR(��, ����)
--���Ŀ��� ����ϴ� '9'�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ
select to_char(20000, '99,999') from dual;
select to_char(20000, 'L99,999') from dual;
select to_char(20000.29, 'L99,999.9') from dual; --�ݿø��� ����


select 
first_name,
to_char(salary, '$99,999') as salary 
from employees;

--���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ����� �� ��ȯ(���� > ����)
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- �ڵ����� �� ��ȯ(���� > ����)

select 
'$3,300'+ 2000
from dual;

select 
TO_NUMBER('$3,300', '$9,999')+2000
from dual;

--���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��,����)
SELECT TO_DATE('2023-04-13') FROM dual;
--�־��� ���ڿ� ��� ��ȯ�ؾ� �Ѵ� �Ϻθ� ��ȯ�Ҽ� ����
SELECT TO_DATE('201-03-13 12:23:50', 'YY-MM-DD HH:MI:SS') FROM dual;

SELECT TO_DATE('2024�� 02�� 12��','YYYY"��" MM"��" DD"��"') FROM dual;
--xxxx�� xx�� xx�� > ���ڿ� �������� ��ȯ
--��ȸ �÷����� dateinfo��� �ϰڴ� dual���� ��ȸ

SELECT 
to_char(
TO_DATE('20050102', 'YYYYMMDD'),
'YYYY"��" MM"��" DD"��"') as dateinfo
FROM dual;

---------------------------------------------
--null ���¸� ��ȯ�ϴ� �Լ� NVL(�÷�,��ȯ�� Ÿ�ٰ�)
SELECT
first_name,
nvl(commission_pct,0) AS comm_pct
FROM EMPLOYEES;



--NULL ���¸� ��ȯ�ϴ� �Լ� NVL2(�÷�, null�� �ƴ� ����� �� ,null�� ����� ��)
SELECT 
first_name,
salary,
nvl2(
commission_pct,
salary+(salary * commission_pct),
salary

)as real_salary
FROM EMPLOYEES;

--null�� ������ ���� �ʽ��ϴ�
SELECT 
first_name,
salary,
salary+(salary * commission_pct)
FROM EMPLOYEES;

--DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2---------- default)
--����Ŭ ���� �Լ� ���� �񱳸� ����
SELECT
first_name,
job_id,
salary,
decode(
job_id,
'IT_FROG', salary*1.1,
'FI_MGR', salary*1.2,
'AD_VP',salary*1.1,
salary
)as result
FROM EMPLOYEES;

--CASE WHEN THEN END
--ANSIǥ�� ����
SELECT
first_name,
job_id,
salary,
(CASE job_id
WHEN 'IT_FROG' THEN salary*1.1
WHEN 'FI_MGR' THEN salary*1.2
WHEN 'AD_VP' THEN salary*1.3
WHEN 'FI_ACCOUNT' THEN salary*1.4
ELSE salary
END) as salary

FROM EMPLOYEES;
/*
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/
SELECT
hire_date as �Ի�����,
TRUNC(sysdate - hire_date)/365 as year
FROM employees
where (sysdate - hire_date)/365 >= 17
order by year DESC;
/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/
SELECT
manager_id,
first_name,
manager_id,
(CASE manager_id
WHEN 100 THEN'���'
WHEN 120 THEN '����'
WHEN 121 THEN '�븮'
WHEN 122 THEN '����'
ELSE '�ӿ�'
END) as salary

FROM employees
where department_id = 50;

