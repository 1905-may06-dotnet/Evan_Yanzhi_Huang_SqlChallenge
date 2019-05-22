CREATE table Department
(
 ID int IDENTITY,
 Name VARCHAR(30), 
 Location VARCHAR(30),
 CONSTRAINT PK_Dept_ID PRIMARY Key(ID)
)
go

CREATE table Employee
(
 ID int IDENTITY,
 FirstName VARCHAR(30), 
 LastName VARCHAR(30),
 SSN int, 
 DepartmentID int,
 CONSTRAINT PK_Emp_Id PRIMARY Key(ID),
 CONSTRAINT FK_Dept_Emp FOREIGN Key(DepartmentID) REFERENCES dbo.Department(ID)
)
go

CREATE table EmpDetails
(
 ID int IDENTITY,
 EmployeeID int Not null unique,
 Salary decimal,
 Address1 VARCHAR(30), 
 Address2 VARCHAR(30),
 City VARCHAR(10), 
 State VARCHAR(10),
 Country VARCHAR(20),
 CONSTRAINT PK_EmpDe_ID PRIMARY Key(ID),
 CONSTRAINT FK_Emp_EmpDe FOREIGN Key(EmployeeID) REFERENCES dbo.Employee(ID),
 
)
go

insert into [Department] VALUES('Production','New City, NY 10956');
insert into [Department] VALUES('Development','Allen Park, MI 48101');
insert into [Department] VALUES('HR','Washington, MD 20744');

insert into [Employee] VALUES('Carlos','Zurita','12341515','1');
insert into [Employee] VALUES('Daniel','Coombs','23124858','2');
insert into [Employee] VALUES('Patrick','Tate','27587778','2');

insert into [EmpDetails] VALUES('1',88888,'645 Valley View','','Houston','TX', 'US');
insert into [EmpDetails] VALUES('2',77777,'502 S. Pulaski St','apt 12','Houston','TX', 'US');
insert into [EmpDetails] VALUES('3',66666,'7936 Walnut Dr','unit A','Houston','TX', 'US');

insert into [Department] VALUES('Marketing','Arlington, TX 10956');
insert into [EmpDetails] VALUES('4',55555,'666 Fountain View','','Houston','TX', 'US');

insert into [Employee] VALUES('Tina','Smith','89485948','4');

SELECT * FROM Employee e, Department d
where e.DepartmentID=d.ID AND d.Name='Marketing';  /*listing all employee in Marketing*/

SELECT SUM(ed.Salary) FROM EmpDetails ed, Employee e, Department d
where d.Name='Marketing' AND e.DepartmentID=d.ID AND ed.EmployeeID=e.ID;

SELECT Employee.*, Department.Name
FROM Employee 
LEFT JOIN Department ON Employee.DepartmentID=Department.ID;


UPDATE EmpDetails 
SET Salary = 90000
WHERE EmployeeID= (SELECT e.ID From Employee e where e.FirstName='Tina'AND e.LastName='Smith');

select Salary from EmpDetails where EmpDetails.EmployeeID=4;