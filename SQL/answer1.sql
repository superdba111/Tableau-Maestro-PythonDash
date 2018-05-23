-- Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
Select FIRST_NAME AS WORKER_NAME from Worker;

-- Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
Select upper(FIRST_NAME) from Worker;

-- Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
Select distinct DEPARTMENT from Worker;

-- Q-4. Write An SQL Query To Print First Three Characters Of  FIRST_NAME From Worker Table.
Select substring(FIRST_NAME,1,3) from Worker;

-- Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';


##The INSTR method is in case-sensitive by default.
##Using Binary operator will make INSTR work as the case-sensitive function.
 

-- Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
Select RTRIM(FIRST_NAME) from Worker;
 

-- Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
Select LTRIM(DEPARTMENT) from Worker;
 
-- Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
Select distinct length(DEPARTMENT) from Worker;

-- Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘A’ With ‘A’.
Select REPLACE(FIRST_NAME,'a','A') from Worker;

-- Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;

-- Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
Select * from Worker order by FIRST_NAME asc;
 
-- Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;
 

-- Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
Select * from Worker where FIRST_NAME in ('Vipul','Satish');
 
-- Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
Select * from Worker where FIRST_NAME not in ('Vipul','Satish');
 
-- Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
Select * from Worker where DEPARTMENT like 'Admin%';
 

-- Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
Select * from Worker where FIRST_NAME like '%a%';
 
-- Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
Select * from Worker where FIRST_NAME like '%a';

-- Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
Select * from Worker where FIRST_NAME like '_____h';
 
-- Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
Select * from Worker where SALARY between 100000 and 500000;
 

-- Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
 
-- Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';
 
-- Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);
 
-- Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;
 
-- Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

-- Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;
 
-- Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;
 
-- Q-27. Write An SQL Query To Show Only Even Rows From A Table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;
 
-- Q-28. Write An SQL Query To Clone A New Table From Another Table.
SELECT * INTO WorkerClone FROM Worker;

-- The general way to clone a table without information is:
SELECT * INTO WorkerClone FROM Worker WHERE 1 = 0;

-- An alternate way to clone a table (for MySQL) without is:
CREATE TABLE WorkerClone LIKE Worker;
 

-- Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);
 
-- Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
SELECT * FROM Worker
MINUS
SELECT * FROM Title;
 
-- Q-31. Write An SQL Query To Show The Current Date And Time.
SELECT CURDATE();
Following MySQL query returns the current date and time:

SELECT NOW();
Following SQL Server query returns the current date and time:

SELECT getdate();
Following Oracle query returns the current date and time:

SELECT SYSDATE FROM DUAL;
 
-- Q-32. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10;
Following SQL Server query will return the top n records using the TOP command:

SELECT TOP 10 * FROM Worker ORDER BY Salary DESC;
Following Oracle query will return the top n records with the help of ROWNUM:

SELECT * FROM (SELECT * FROM Worker ORDER BY Salary DESC)
WHERE ROWNUM <= 10;
 
-- Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT n-1,1;

-- The following SQL Server query returns the nth highest salary:

SELECT TOP 1 Salary
FROM (
 SELECT DISTINCT TOP n Salary
 FROM Worker 
 ORDER BY Salary DESC
 )
ORDER BY Salary ASC;
 

-- Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
-- The following query is using the correlated subquery to return the 5th highest salary:

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );

-- Use the following generic method to find nth highest salary without using TOP or limit.

SELECT Salary
FROM Worker W1
WHERE n-1 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
 

-- Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

-- Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

-- Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';
 
-- Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);
 
-- Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

-- Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;
 
-- Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;

-- Q-42. Write An SQL Query To Show The Last Record From A Table.
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);
 
-- Q-43. Write An SQL Query To Fetch The First Row Of A Table.
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);
 
-- Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;

-- Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;
 
-- Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 
-- Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;
 
-- Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.
SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 
-- Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
 
-- Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);
