
SELECT * from info;
SELECT * from auth;

--�̳�(soqn) ����
select *
from info i
inner join auth a
on i.auth_id = a.auth_id;

--����Ŭ ����(����Ŭ ���빮���̶� �����δ� �ۼ����� �ʰڽ��ϴ�)
select *
from info i, auth a
where i.auth_id = a.auth_id;

--auth_id �÷��� �׳� ���� ��ȣ�ϴ� ��� ���
-- �� ������ ���ʿ� �Ƹ��� ���̴��� ��Ī��������
--Ȯ���ϰ� ������ �ּ���
select 
a.auth_id, title,content, name
from info i
join auth a -- join�̶�� ���� inner join
on i.auth_id = a.auth_id;

--�ʿ��� �����͸� ��ȸ�ϰڴ� (�Ϲ�����) ��� �Ѵٸ�
--where ������ ���� ������ �ɾ��ָ� �ȴ�
select 
a.auth_id, title,content, name
from info i
join auth a 
on i.auth_id = a.auth_id
where a.name = '�̼���';
--�ƿ���(�ܺ�) ����
select*
from info i left outer join auth a--outer ��������
on i.auth_id = a.auth_id;

select * 
from info i,auth a
where i.auth_id = a.auth_id(+);
--���� ���̺�� ���� ���̺� �����͸� ��� �о� ǥ���ϴ� �ܺ� ����
select*
from info i full outer join auth a
on i.auth_id = a.auth_id;

--cross join�� join������ �������� �ʱ� ������
--�ܼ��� ��� �÷��� ���� join�� �����մϴ�
--������ ���� ������� �ʽ��ϴ�
select*from info 
cross join auth ;

select*
from info , auth ;

--������ ���̺� ���� > Ű ���� ã�� ������ �����ؼ� ���� �ȴ�
SELECT *
from employees e
left join departments d on e.department_id = d.department_id
left join locations loc on d.location_id = loc.location_id;

/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���.
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���.
*/
select 
i.id,
i.title,
i.content,
a.job
from info i
right outer join auth a
on i.auth_id = a.auth_id
where a.job = 'scientist';

select * from info;
--���� �����̶� ���� ���̺� ������ ������ ���Ѵ�
--���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ���
select  
e1.employee_id,e1.first_name,e1.manager_id,
e2.first_name, e2.employee_id
from employees e1
join employees e2
on e1.manager_id = e1.manager_id
order by e1.employee_id;












