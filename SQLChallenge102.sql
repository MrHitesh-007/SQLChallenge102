use sqlpractice

create table ManagerDetails (
								EmpId int not null,
								FullName Varchar(200) not null,
								ManagerId int not null,
								DateOfJoining Date,
								City Varchar(200));
insert into ManagerDetails values
(123,'Mohan Pandey',986,'2020/02/21','Toronto'),
(321,'Walter White',986,'2020/01/30','California'),
(986,'Hitesh Stark',223,'2017/02/18','Spain')

--Fetch all the empids which are present in either of the tables - 'EmployeeDetails' and 'EmployeeSalary'

select * from EmployeeDetails
UNION
select * from Managerdetails

--Fetch common records between two table
select * from EmployeeDetails
intersect
select * from ManagerDetails

--Fetch records that are present in one table but not in another table
select *
from EmployeeDetails ed
left join ManagerDetails md
on ed.EmpId = md.EmpId

--Fetch the empIds that are present in both the tables employeedetails and employeesalary
select EmpId
from EmployeeDetails
where EmpId in (select EmpId from EmployeeSalary);

--Fetch the empIds that are present in employeedetails but not in employeesalary
select EmpId
from EmployeeDetails
where EmpId not in (select EmpId from EmployeeSalary);

--Fetch the employees full name and replace the space with '-';
select REPLACE(fullname,' ','-')
from EmployeeDetails

--Fetch the position of a given characters in a field
select CHARINDEX('Snow',fullname)
from EmployeeDetails

--fetch EmpId and ManagerId together
select concat (EmpId,ManagerId) as newid
from employeedetails;

--Fetch only the first name (string before space) from fullname column of the employeedetails table
select SUBSTRING(FullName,1,CHARINDEX(' ',FullName))
from EmployeeDetails;

--Query to uppercase the name of the employee and lowercase the city values
select UPPER(FullName),LOWER(City) from EmployeeDetails