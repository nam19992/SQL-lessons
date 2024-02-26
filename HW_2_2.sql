-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select salary.monthly_salary as Зарплаты, employees.employee_name as Работники from employee_salary 
join salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select salary.monthly_salary as Зарплата, employees.employee_name as Работники_чья_зп_больше_2000 from employee_salary 
join salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id where salary.monthly_salary > 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary as Зарплата, employees.employee_name as Неназначенный_работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
left join employees on employees.id = employee_salary.employee_id where employee_salary.employee_id not in (select id from  employees);
-- *3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary as Зарплата, employees.employee_name as Неназначенный_работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
left join employees on employees.id = employee_salary.employee_id where employees.employee_name is null;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary as Зарплата, employees.employee_name as Неназначенный_работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
left join employees on employees.id = employee_salary.employee_id where employee_salary.employee_id not in (select id from  employees) and salary.monthly_salary < 2000;
-- 5. Найти всех работников кому не начислена ЗП.
select salary.monthly_salary as Неназначенная_ЗП, employees.employee_name as Работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
right join employees on employees.id = employee_salary.employee_id where employees.id not in (select employee_id from employee_salary) ;
-- *5. Найти всех работников кому не начислена ЗП.
select salary.monthly_salary as NA_ЗП, employees.employee_name as Работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
right join employees on employee_salary.employee_id = employees.id where salary.monthly_salary is null;
-- 6. Вывести всех работников с названиями их должности.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id;
-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Java_d%';
-- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Python%';
-- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Manual_QA%';
-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Automation_QA%';
-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id  where roles.role_name like '%Junior%' ;
-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id  where roles.role_name like '%Middle%' ;
-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id 
left join employee_salary on employee_salary.employee_id  = roles_employee.employee_id  
left join salary on salary.id = employee_salary.salary_id where roles.role_name  like '%Senior%';
-- 15. Вывести зарплаты Java разработчиков
select roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id where roles.role_name like '%Java_d%';
-- 16. Вывести зарплаты Python разработчиков
select roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id where roles.role_name like '%Python%';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Junior_Python%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Middle_JavaScript%';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Senior_Java_d%';
-- 20. Вывести зарплаты Junior QA инженеров
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Junior%QA%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select round(avg(salary.monthly_salary), 1) as Средняя_Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as Сумма_Зарплат from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select min(salary.monthly_salary) as Сумма_Зарплат from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) as Сумма_Зарплат from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 25. Вывести количество QA инженеров
select count(roles.id) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 26. Вывести количество Middle специалистов.
select count(roles.id) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Middle%';
-- 27. Вывести количество разработчиков
select count(roles.id) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%developer';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%developer';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id order by Зарплата ;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where salary.monthly_salary between 1700 and 2300 order by Зарплата ;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where salary.monthly_salary < 2300 order by Зарплата ;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where salary.monthly_salary in (1100, 1500, 2000) order by Зарплата ;
