-- ���̺� ��ü ��ȸ
select *
from DEPARTMENTS;

-- Ư�� �÷��� ��ȸ(select �� �̸�)
select department_id, department_name
from DEPARTMENTS; 

-- ��Ī ����ϱ� (select �� �̸� as ��Ī)
select department_id as �μ�ID, department_name as �μ��̸�
from DEPARTMENTS;

select department_id as "�μ� ID", department_name as �μ��̸�
from DEPARTMENTS;

select department_id �μ�ID, department_name �μ��̸�
from DEPARTMENTS;

-- �ߺ� ����(select distinct)
select distinct location_id
from DEPARTMENTS;

-- ���� ������(||)
select department_id || department_name
from DEPARTMENTS; 

select 'Department of' || department_name
from DEPARTMENTS;

select 'Department of' || department_name as �μ��̸�
from DEPARTMENTS;

-- ��� ������
select first_name, last_name, salary + 1000
from EMPLOYEES;

select first_name, last_name, salary - 1000
from EMPLOYEES;

select first_name, last_name, salary * 1.1
from EMPLOYEES;