-- 2025.04.10
select *
from EMPLOYEES;

select *
from EMPLOYEES
where employee_id = 100;

select *
from EMPLOYEES
where first_name = 'John';

select *
from EMPLOYEES
where employee_id <> 110;

select *
from EMPLOYEES
where employee_id > 110;

select *
from EMPLOYEES
where employee_id < 110;

select *
from EMPLOYEES
where employee_id >= 120 and employee_id < 130;

select *
from EMPLOYEES
where employee_id >= 120 or employee_id < 110;

-- �������� ���� : asc (�⺻���̱⿡ ����X)
select first_name, last_name
from EMPLOYEES
order by first_name; 

-- �������� ���� : desc
select first_name, last_name
from EMPLOYEES
order by first_name desc;

-- �������� ���� + �ߺ��� �� �������� ����
select first_name, last_name
from EMPLOYEES
order by first_name asc, last_name desc;

select *
from EMPLOYEES
where employee_id >= 110 and employee_id < 120;

select *
from EMPLOYEES
where employee_id BETWEEN 110 and 120-1;

select *
from EMPLOYEES
where first_name = 'John' or first_name = 'Luis' or first_name = 'Den';

select *
from EMPLOYEES
where first_name in ('John', 'Luis', 'Den');

select *
from EMPLOYEES
where first_name not in ('John', 'Luis', 'Den');

select *
from locations
where state_province is null;

select *
from locations
where state_province is not null;

-- '198'�� �����ϴ� ���ڿ� ��ȸ
select *
from locations
where street_address like '198%';

-- 'RIE'�� ������ ���ڿ� ��ȸ
select *
from locations
where street_address like '%Rie';

-- 'Cola' �����ϴ� ���ڿ� ��ȸ
select *
from locations
where street_address like '%Cola%';

select *
from COUNTRIES;

insert into COUNTRIES
values('KR', 'South Korea', 3);

-- ��� �� ���� ���� ���� ����
insert into COUNTRIES(country_id, country_name, region_id)
values('KP', 'South Korea2', 3); 

-- ��� ���� ���� ���� �ݵ�� ����
insert into COUNTRIES(country_id, region_id)
values('KO', 3); 

commit;

delete from  COUNTRIES
where COUNTRY_ID = 'KO';

select *
from EMPLOYEES;

-- salary ���� 20% ���
update EMPLOYEES
set salary = salary * 1.2;

-- table ����
create table customers(
    customer_id number not null primary key,
    first_name VARCHAR2(20) not null,
    last_name VARCHAR2(20) not null,
    email VARCHAR2(30),
    phone_number VARCHAR2(20),
    regist_date date
);

select *
from customers;