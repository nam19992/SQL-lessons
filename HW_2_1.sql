-- SQL_DDL

-- Первая часть.

-- Таблица employees

-- 1.	Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
-- 2.	Наполнить таблицу employee 70 строками.
create table employees (
id serial primary key,
employee_name varchar(50) not null);
insert into employees(employee_name) values ('Andrey_1'), ('Sergey_1'), ('Ilya_1'), ('Max_1'), ('Anna_1'), ('Misha_1'), ('Alex_1'), 
('Andrey_2'), ('Sergey_2'), ('Ilya_2'), ('Max_2'), ('Anna_2'), ('Misha_2'), ('Alex_2'),
('Andrey_3'), ('Sergey_3'), ('Ilya_3'), ('Max_3'), ('Anna_3'), ('Misha_3'), ('Alex_3'),
('Andrey_4'), ('Sergey_4'), ('Ilya_4'), ('Max_4'), ('Anna_4'), ('Misha_4'), ('Alex_4'),
('Andrey_5'), ('Sergey_5'), ('Ilya_5'), ('Max_5'), ('Anna_5'), ('Misha_5'), ('Alex_5'),
('Andrey_6'), ('Sergey_6'), ('Ilya_6'), ('Max_6'), ('Anna_6'), ('Misha_6'), ('Alex_6'),
('Andrey_7'), ('Sergey_7'), ('Ilya_7'), ('Max_7'), ('Anna_7'), ('Misha_7'), ('Alex_7'),
('Andrey_8'), ('Sergey_8'), ('Ilya_8'), ('Max_8'), ('Anna_8'), ('Misha_8'), ('Alex_8'),
('Andrey_9'), ('Sergey_9'), ('Ilya_9'), ('Max_9'), ('Anna_9'), ('Misha_9'), ('Alex_9'),
('Andrey_10'), ('Sergey_10'), ('Ilya_10'), ('Max_10'), ('Anna_10'), ('Misha_10'), ('Alex_10');
select count(employee_name) from employees;
--
-- Таблица salary

-- 3.	Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
-- 4.	Наполнить таблицу salary 16 строками:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500
create table salary (
id serial primary key,
monthly_salary int not null);
insert into salary(monthly_salary) values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800),
(1900), (2000), (2100), (2200), (2300), (2400), (2500);
select count(monthly_salary) from salary;
--
-- Таблица employee_salary
--
-- 5.	Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
-- 6.	Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null);
insert into employee_salary(employee_id, salary_id) values (5,1), (10,2), (15,3), (20,4),
(25,5), (30,6), (35,2), (40,8),
(45,7), (50,15), (55,9), (60,8),
(65,10), (70,15), (22,9), (23,8),
(27,1), (26,15), (31,2), (24,13),
(29,12), (32,14), (33,16), (34,16),
(36,10), (37,15), (38,2), (39,5),
(41,11), (42,15), (73,5), (77,8),
(78,7), (79,11), (81,11), (84,8),
(89,10), (99,12), (101,9), (103,3);
select count(id) from employee_salary; -- проверка на кол-во строк в таблице employee_salary
select count(employee_salary.employee_id) as count_employee_id_equals_count_id from employee_salary join employees on employee_salary.employee_id = employees.id; -- проверка на кол-во повторяющихся строк
--
-- Таблица roles
--
-- 7.	Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
-- 8.	Поменять тип столба role_name с int на varchar(30)
-- 9.	Наполнить таблицу roles 20 строками:
create table roles ( 
id serial primary key,
role_name int not null unique);
alter table roles alter column role_name type varchar(30);
insert into roles(role_name) values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');
select * from roles;
--
-- Таблица roles_employee
--
-- 10.	Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- 11.	Наполнить таблицу roles_employee 40 строками:
create table roles_employee (
id serial primary key,
employee_id int not null,
role_id int not null,
foreign key (role_id)
references roles(id),
foreign key (employee_id)
references employees(id)
);
insert into roles_employee (employee_id, role_id) values (7,2),
(20,4),
(3,9),
(5,13),
(23,4),
(11,2),
(10,9),
(22,12),
(21,3),
(34,4),
(6,7),
(24,13),
(25,14),
(26,11),
(27,10),
(28,9),
(29,8),
(30,7),
(31,6),
(32,4),
(33,5),
(36,3),
(69,2),
(63,1),
(54,19),
(37,19),
(38,18),
(39,20),
(1,10),
(2,9),
(9,4),
(55,5),
(45,6),
(44,7),
(49,5),
(67,4),
(19,3),
(17,2),
(13,11),
(68,2);
select count(id) from roles_employee ;-- проверка на кол-во строк в таблице roles_employee