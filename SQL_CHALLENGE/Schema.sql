create table titles(
title_id varchar not null, 
	title varchar not null, 
	primary key (title_id)
);
select * from titles;

create table employees (
emp_no int not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
    hire_date date not null,
	primary key (emp_no)
);
select * from employees;

create table departments (
dept_no varchar not null,
	dept_name varchar not null,
	primary key (dept_no)
);
select * from departments;

create table dept_manager(
dept_no varchar not null,
	emp_no int not null,
	primary key (dept_no, emp_no)
);
select * from dept_manager;

create table dept_emp(
emp_no int not null,
	dept_no varchar not null,
	primary key (emp_no, dept_no)
);
select * from dept_emp;

create table salaries (
emp_no int not null,
	salary int not null,
	primary key (emp_no)
);
select * from salaries;


select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s 
on (e.emp_no = s.emp_no);

select first_name, last_name, hire_date 
from employees 
where hire_date between '1986-01-01' and '1986-12-31';

select dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
from dept_manager dm
inner join departments d
on (dm.dept_no = d.dept_no)
inner join employees e
on (dm.emp_no = e.emp_no);

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de 
on (e.emp_no = de.emp_no)
inner join departments d 
on (de.dept_no=d.dept_no)
where d.dept_name = 'Sales';

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de 
on (e.emp_no = de.emp_no)
inner join departments d 
on (de.dept_no=d.dept_no)
where d.dept_name in ('Sales','Development');

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;
