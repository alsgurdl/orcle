/*
# �����̶�?
- ���� �ٸ� ���̺� ���� ������ ���谡 �����Ͽ�
 1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ����մϴ�.
- SELECT �÷�����Ʈ FROM ���δ���� �Ǵ� ���̺� (1�� �̻�)
  WHERE ���� ���� (����Ŭ ���� ����)
*/
--employees ���̺��� �μ� id �� ��ġ�ϴ� department ���̺��� �μ� id �� ã�Ƽ�
--setlect ���Ͽ� �ִ� �÷����� ����ϴ� ������
select
e.first_name,
d.department_name
from employees e, departments d
where e.department_id = d.department_id; --����Ŭ ���� ����

SELECT
e.first_name,
d.department_name,
e.department_id
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; -- ANSI ǥ�� ���� ����

/*
������ ���̺� ���������� �����ϴ� �÷��� ��쿡��
���̺� �̸��� �����ص� �����մϴ�. �׷���, �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ϼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��Ͽ� Ī�մϴ�.
�� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.
*/

--3���� ���̺��� �̿��� ���� ����(inner join)
--�������� : ���� ���ǿ� ��ġ�ϴ� �ุ ��ȯ�ϴ� ����
--���� ���ǿ� ��ġ���� �ʴ� �����ʹ� ��ȸ ��󿡼� ����
select 
e.first_name , e.last_name, e.job_id,
d.department_name,
j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;

select
e.first_name , e.last_name,e.department_id,
d.department_name,
j.job_title,
loc.city
from 
employees e,
departments d, 
jobs j,
locations loc
where e.department_id = d.department_id
and e.job_id = j.job_id
and d.location_id = loc.location_id
and loc.state_province = 'California'; -- �Ϲ� ������ ���� ���� ���Ŀ� �ۼ�

--�ܺ� ����
/*
��ȣ ���̺��� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
��� �� ���̺� ���� ���� �������� �ش� row���� ��ȸ �����
��� ���ԵǴ� ������ ����
*/
select
e.first_name,
d.department_name,
loc.city

from employees e,departments d ,locations loc 
where e.department_id = d.department_id(+)
and d.location_id = loc.location_id(+)
;
/*
employees ���̺��� �����ϰ�, departments ���̺��� �������� �ʾƵ�
(+)�� ���� ���� ���̺��� �������� �Ͽ� departments ���̺��� ���ο�
�����϶�� �ǹ̸� �ο��ϱ� ���� ��ȣ�� ���Դϴ�.
�ܺ������� ����ߴ���, ���Ŀ� ���� ������ ���ȭ��
���������� �켱������ �ν��մϴ�.
*/
--�ܺ� ���� ���� �� ��� ���ǿ� +�� �ٿ��� �ϸ�
--�Ϲ� ���ǿ��� + ������ ������ �����䰡 �����Ǵ� ������ �߻� 
SELECT
e.employee_id,e.first_name,
jh.start_date,jh.end_date,jh.job_id
from employees e, job_history jh
where e.employee_id = jh.employee_id(+)
and jh.department_id(+) = 80;












