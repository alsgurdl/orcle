--�����Լ�
--POUND(�ݿø�)
--���ϴ� �ݿø� ��ġ�� �Ű������� ���� ������ �ִ� �͵� ����
SELECT
 round(3.1415,3),round(45.63,0),round(45.923,-1)
FROM dual;

--TRUNC(����)
--������ �Ҽ��� �ڸ������� �߶���ϴ�
SELECT
 TRUNC(3.1415,3),TRUNC(45.63,0),TRUNC(45.923,-1)
FROM dual;

--ABS (���밪)
SELECT
abs(-34)
FROM dual;
--CEIL(�ø�), FLOOR(����)
SELECT
ceil(3.14),floor(3.14)
FROM dual;

--MOD(������ ����)
SELECT
10/4, mod(10,4)
FROM dual;

-------------------------------------------

--��¥�Լ�
--sysdate: ��ǻ���� ���� ��¥ �ð� ������ �����ͼ� �����ϴ� �Լ� >�ð� ������ ����
SELECT
sysdate
FROM dual; 

SELECT
systimestamp -->�и��� ǥ�ؽñ��� ����
FROM dual;
--��¥�� ������ ����
SELECT
sysdate +1 --���� ���� ������ ����
FROM dual; 

--��¥ Ÿ�԰� ��¥ Ÿ���� ���� ������ ����
--������ ������� �ʽ��ϴ�
SELECT
first_name, sysdate - HIRE_DATE
FROM employees; -- ����

SELECT
first_name,
(sysdate - HIRE_DATE) /7 as week
FROM employees; --�ּ�

SELECT
first_name,
(sysdate - HIRE_DATE) /365 as year
FROM employees; --���

-- ��¥ �ݿø�, ����
SELECT
round(sysdate) 
FROM dual; 

SELECT
round(sysdate, 'year') --������
FROM dual; 

SELECT
round(sysdate, 'month') --��(��) �������� �ݿø�
FROM dual; 

SELECT
round(sysdate, 'day')
FROM dual; 
SELECT
first_name,
(sysdate - HIRE_DATE) /365 as year
FROM employees; --���

-- ��¥ �ݿø�, ����
SELECT trunc(sysdate) --�� ����) 
FROM dual; 
SELECT trunc(sysdate, 'year') --������ 
FROM dual; 

SELECT trunc(sysdate, 'month') --��(��) �������� �ݿø�
FROM dual; 
SELECT trunc(sysdate, 'day') FROM dual;







