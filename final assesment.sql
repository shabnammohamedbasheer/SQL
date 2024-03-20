-- 1 Select all employees from the HR department:
select * from employee
where department  = 'HR'
--2 Count the number of employees in each department:
select count (*),department from employee
group by department
--3 Find employees with a salary greater than the average salary:
select * from employee
where salary > (select avg(salary) from employee)
--4 Find departments with more than 2 employees:
select count (*),department from employee
group by department having count(*) >2
--5 List employees along with their department information:
select * from department
select * from employee e
inner join department d 
on e.department=d.department_name

-- 6. List all departments and their employees, even if there are no employees
assigned:
select * from department
select * from employee e
full join department d 
on e.department=d.department_name
--7. Find the highest salary among all employees:
select max(salary),department from employee
group by department
--8. Find the average salary for each department:
SELECT avg(salary),department from employee
GROUP by department
-- 9. Calculate the total salary for each department:
select sum(salary),department from employee
GROUP by department
-- 10. Rank employees by salary within each department:
select *,rank () over (order by salary desc) as rank_
from employee
GROUP by department
--11 Find the employee with the highest salary in each department:
select department,max(salary) from employee
GROUP by department 

--12 List employees whose names start with 'A':
SELECT * FROM employee
WHERE name LIKE 'A%'
--13 Find employees with salaries between 60000 and 80000
SELECT * FROM employee
WHERE SALARY BETWEEN 60000 AND 80000
-- 14 List departments located in 'Headquarters' or 'Tech Park':
SELECT * FROM department
WHERE location = 'Headquarters' or location = 'Tech Park'
--15 Count the number of employees per character length of their name:
SELECT LENGTH(name), COUNT(*) 
FROM employee
GROUP BY LENGTH(name)
ORDER BY LENGTH(name)
--16 Find employees whose name contains 'son':
select * from employee
where name like '%son'
--17 Find the employee with the lowest salary:
select * , min(salary) from employee
--18 Find employees whose department is not 'HR':
select * from employee
where department <> 'HR'


--19 List employees with a salary greater than 60000 and sorted by salary in DECSENDING ORDER
select * from employee
where salary > 60000
order by salary desc
--20  List all employees along with their department and location, but only fordepartments with more than 1 employee:
select e.*,e.department,d.location from employee e
inner join department d
on e.department=d.department_name
where d.department_name in(select department
               from employee
               group by department
               having count(*) >1)
--21 Find the department with the highest average salary among employees:
select avg(salary) ,department from employee
group by department
order by AVG(salary) desc LIMIT 1
--22  List all employees who have the same salary as at least one other employee:
SELECT e1.*
FROM employee e1
JOIN employee e2 ON e1.salary = e2.salary AND e1.empid <> e2.empid
ORDER BY e1.salary;
--23 Find the employee(s) with the highest salary in each location:
select * from employee e 
full join department d
on e.department=d.department_name
where salary in (select d.location
                 from department
                 GROUP by d.location
                 having max(salary))



--24 List all departments and the average salary of employees within eachdepartment, sorted by average salary in descending order:
select avg(salary) ,department from employee
group by department 
order by avg(Salary) desc

--25 Find the employee(s) with the highest salary who are not in the 'Admin'department:
select * from employee
where department <> 'Admin'
order by salary desc


--26 Find the employee(s) with the second-highest salary:
select * from employee
order by salary desc limit 1 OFFSET 1
