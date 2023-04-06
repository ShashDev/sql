
create table Employe(


EMPLOYEE_ID int,
FIRST_NAME varchar (50),
LAST_NAME varchar(50),
SALARY int,
JOINING_DATE datetime,
DEPARTMENT varchar(50),
MANAGER_ID int


);
insert into Employe values(1,'John','Abraham',1000000,'2013-1-13 12.00.00','Banking',null);
insert into Employe values(2,'Michael','Clarke',800000,'2013-1-13 12.00.00','Insurance',1);
insert into Employe values(3,'Roy','Thomas',700000,'2013-2-01 12.00.00','Banking',1);
insert into Employe values(4,'Tom','Jose',600000,'2013-2-01 12.00.00','Insurance',2);
insert into Employe values(5,'Jerry','Pinto',650000,'2013-2-01 12.00.00','Insurance',3);
insert into Employe values(6,'Philip','Mathew',750000,'2013-1-13 12.00.00','Services',3);
insert into Employe values(7,'TestName1','123',650000,'2013-1-13 12.00.00','Services',2);
insert into Employe values(8,'TestName2','Lname%',600000,'2013-2-01 12.00.00','Insurance',2);

create table incentives(
EMPLOYEE_REF_ID int,
INCENTIVE_DATE date,
INCENTIVE_AMOUNT int	


);
insert into incentives values(1,'2013-2-01' ,'5000');
insert into incentives values(2,'2013-2-01' ,'3000');
insert into incentives values(3,'2013-2-01' ,'4000');
insert into incentives values(4,'2013-2-01' ,'0');
insert into incentives values(5,'2013-2-01' ,'3500');

select FIRST_NAME, INCENTIVE_DATE-JOINING_DATE from Employe  inner join incentives  on Employe.EMPLOYEE_ID=incentives.EMPLOYEE_REF_ID;
select FIRST_NAME,INCENTIVE_AMOUNT  from Employe  left join incentives on incentives.INCENTIVE_AMOUNT>3000; 
select FIRST_NAME, INCENTIVE_DATE-JOINING_DATE from Employe  inner join incentives  on Employe.EMPLOYEE_ID=incentives.EMPLOYEE_REF_ID;
select FIRST_NAME ,INCENTIVE_AMOUNT from Employe left join incentives on incentives.INCENTIVE_AMOUNT=0 ;
select DEPARTMENT, INCENTIVE_AMOUNT + SALARY as total_Salary from Employe left join incentives on incentives.INCENTIVE_AMOUNT ;
select DEPARTMENT, INCENTIVE_AMOUNT + SALARY as total_Salary from Employe left join incentives on incentives.INCENTIVE_AMOUNT order by total_Salary desc ;
select  DEPARTMENT, INCENTIVE_AMOUNT + SALARY as total_Salary from Employe left join incentives on incentives.INCENTIVE_AMOUNT order by total_Salary desc ;
select DEPARTMENT , SUM(SALARY) as Total from Employe group by DEPARTMENT;
select DEPARTMENT, MIN(SALARY) as minsalary from Employe group by DEPARTMENT order by minsalary;
select DEPARTMENT,SUM(SALARY) as total_Salary from Employe group by DEPARTMENT having sum(SALARY)>800000 ;
select FIRST_NAME,'_',LAST_NAME as fullname from Employe;

create view bankDept as select * from  Employe where DEPARTMENT="Banking" ;
create view InsuranceDept as select * from  Employe where DEPARTMENT="Insurance" ;
create view ServicesDept as select * from  Employe where DEPARTMENT="Services" ;
select FIRST_NAME ,SALARY from Employe where SALARY> (select SALARY from Employe where FIRST_NAME="ROY") ;
alter view EmpDetails as Select FIRST_NAME ,LAST_NAME,	JOINING_DATE,INCENTIVE_DATE,INCENTIVE_AMOUNT from Employe left join incentives on Employe.EMPLOYEE_ID=incentives.EMPLOYEE_REF_ID;
create view EmpDetails1 as Select FIRST_NAME ,INCENTIVE_AMOUNT from Employe left join incentives on incentives.INCENTIVE_AMOUNT>3000;
create view EmpDetails3 as select FIRST_NAME,LAST_NAME from Employe where Location ="London";
alter view EmpDetails4 as select DEPARTMENT,count(DEPARTMENT) as COUNT from Employe group by  DEPARTMENT;
select DEPARTMENT,MANAGER_Name,City from Employe ;

create view EmpDetails5 as select DEPARTMENT,FIRST_NAME,LAST_NAME,Hire_date,SALARY from Managers where experience>5;