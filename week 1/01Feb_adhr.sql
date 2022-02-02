SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
ORDER BY
deptno;
-- ################################################################
-- 12. WHERE CLAUSE
-- Where caluse with in,not in, is null, is not null, between, not between
-- Where caluse with Comparison Operator (<,>,<=,>=,=,<>,!=)
-- Where caluse with Logical Operator (AND,OR,NOT)
-- ################################################################
-- ################################################################
-- 12.1 Display all emp working in deptno 10
-- ################################################################
SELECT
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE 
    deptno=10;
-- ################################################################
-- 12.2 Display employee no,name working department no 10
-- ################################################################
SELECT 
    empno,ename,deptno
FROM 
    emp
WHERE 
    deptno=10;
-- ################################################################
-- 12.3 Display all employees working in department no 10 or 20
-- using OR
-- using IN
-- ################################################################
SELECT
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE 
    deptno=10 or deptno=20;
--    using IN
SELECT
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE 
    deptno IN (10,20);
    
-- ################################################################
-- 12.3 Display all employees not working in department no 10 or 20
-- using OR
-- using IN
-- ################################################################
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno!=10 AND deptno!=20;
    
--    using IN
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno NOT in (10,20)
    
-- ################################################################
-- 12.3 Display all employees working in department no 10 or 20 or 30
-- ################################################################
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IN (10,20,30)
ORDER BY
    deptno;
 -- ################################################################
-- 12.4 Display all employees not working in any department 
-- ################################################################
-- ################################################################
-- 12.5 Display all employees who's department no is null
-- ################################################################

-- Below query will not give any records as we are comparing values from list 10,20,30
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno NOT IN (10,20,30)
ORDER BY
    deptno;
   
-- NO DEPTNO INDICATES NULL VALUE HENCE WE USE IS NULL
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IS NULL
ORDER BY
    deptno;
-- ################################################################
-- 12.6 Display all employees who's department no is not null
-- ################################################################
SELECT
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IS NOT NULL
ORDER BY
    deptno;
-- ################################################################
-- 12.7 Display employee no,name,comm working department no 30 and earning some commission
-- ################################################################
SELECT
    empno,ename,comm,deptno
FROM 
    emp
WHERE
    deptno=30 AND comm IS NOT NULL AND comm>0
ORDER BY 
    comm;

-- ################################################################
-- 12.8 Display all employees not earning any commission
-- ################################################################
SELECT
    empno,ename,comm,deptno
FROM 
    emp
WHERE
    comm IS NULL OR comm=0
ORDER BY 
    comm;
-- ################################################################
-- 12.9 Display all employees earning salary in range 1000 to 3000 including boundry values
-- ################################################################
SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal>=1000 and sal<=3000
ORDER BY 
    sal ;
-- using BETWEEN
SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal BETWEEN 1000 AND 3000
ORDER BY 
    sal ;
    
-- ################################################################
-- 12.10 Display all employees earning salary in range 1000 to 3000 excluding boundry values
-- ################################################################

SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal>1000 and sal<3000
ORDER BY 
    sal ;
-- ################################################################
-- 12.11 Display all employees earning salary not in range 1000 to 3000
-- ################################################################
    
SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal NOT BETWEEN 1000 AND 3000
ORDER BY 
    sal ;
    
-- USING > AND <
SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal<1000 OR sal>3000
ORDER BY 
    sal ;

-- ################################################################
-- 12.12 Display all employees earning 5000salary 
-- ################################################################
SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal=5000
ORDER BY 
    sal ;

-- ################################################################
-- 12.13 Display all employees not earning 5000 salary 
-- ################################################################
SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal!=5000
ORDER BY 
    sal ;
    
 -- USING <>
 SELECT
    empno,ename,sal
FROM 
    emp
WHERE
    sal<>5000
ORDER BY 
    sal ;

-- ################################################################
-- 13. Where caluse with like
--     WHERE WITH ESCAPE Clause
-- ################################################################
-- ################################################################
-- 13.1 Display all details of SMITH
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename='SMITH'; 
-- in oracle data is case sensitive
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename='Smith'; 

-- ################################################################
-- 13.2 Display all details of EMPLOYEE who's name starts with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE 'S%'; 

SELECT
    empno,ename
FROM
    emp
WHERE 
    ename NOT LIKE 'S%'; 

-- ################################################################
-- 13.3 Display all details of EMPLOYEE who's name ends with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '%S'; 
-- ################################################################
-- 13.4 Display all details of EMPLOYEE who's name contains LL
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '%LL%'; 
    
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '_LL__'; 
        
-- ################################################################
-- 13.5 Display all details of EMPLOYEE who's name contains _
-- ################################################################
--    BELOW QUERY IS TO MUCH EXCITED TO GIVE ALL EMPLOYE AS IT % _ %
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '%_%'; 
--    BELOW QUERY IS AFRAID TO FIND ANY RECORD
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '%\_%'; 
--    USING ESCAPE : rEALIZATION WE NEED ENAME WITH "_"
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '%\_%' ESCAPE '\';
    
SELECT
    empno,ename
FROM
    emp
WHERE 
    ename LIKE '%@_%' ESCAPE '@';
    

-- ################################################################
-- 14. Aggregate Function max,min,sum,avg,count 
--     SUM
--     AVG
--     COUNT
--     MAX
--     MIN
-- ################################################################
-- ################################################################
-- 14.1 Display count of employees
-- count(*) including null values 
-- ################################################################
SELECT
    COUNT(*), COUNT(empno),count(deptno)
FROM 
    emp;
-- ################################################################
-- 14.2 Display count of employees WORKING IN SOME DEPT
-- count(deptno) excludes the null vlaue 
-- ################################################################
SELECT 
    COUNT(deptno)
FROM 
    emp;

-- ################################################################
-- 14.3 Display max,min,sum,avg salary of employees
-- ################################################################
SELECT
    MIN(sal), MAX(sal),COUNT(sal),SUM(sal),AVG(sal)
FROM
    emp;
-- ################################################################
-- 15. Aggregate Function max,min,sum,avg,count  and grouping
-- ################################################################
    
-- ################################################################
-- 15.1 Display department wise count of employees
-- ################################################################
SELECT
    deptno,count(empno)
FROM 
    emp
GROUP BY
    deptno
ORDER BY 
    deptno;
-- ################################################################
-- 15.1 Display job wise count of employees and order by job
-- ################################################################
    
SELECT
    job,COUNT(empno)
FROM 
    emp
GROUP BY
    job
ORDER BY 
    job;
    
SELECT
    job,COUNT(empno)
FROM 
    emp
GROUP BY
    job
ORDER BY 
    count(empno);
 
-- ################################################################
-- 15.2 Display department wise max,min,avg salary
-- ################################################################
SELECT 
       deptno,MAX(sal),MIN(sal),AVG(sal)
FROM 
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
    
SELECT 
       deptno,MAX(sal),MIN(sal),round(AVG(sal),2)
FROM 
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
        
-- ################################################################
-- 15.3 Display department wise max,min,avg salary where avg(sal)<2500
-- ################################################################
SELECT 
       deptno,MAX(sal),MIN(sal),round(AVG(sal),2)
FROM 
    emp
GROUP BY
    deptno
Having 
    avg(sal)<2500
ORDER BY
    deptno;
    
    
-- ################################################################
-- 16. Special functions nvl() 
-- If comm is null display 0
-- Display empno,ename,sal,comm and total sal=sal+comm for all employees 
-- 0+1=1
-- null+1=null
-- for calculation purpose we can give some default value for null values in a column
-- nvl=>nullvalue replacement 
-- ################################################################
SELECT
    empno,ename,sal,comm,sal+comm,sal+nvl(comm,0)
FROM
    emp
ORDER BY comm;
-- if comm 0 or comm is null -> 100 -> case when expression then action end 
-- if com >0   comm
SELECT
    empno,ename,sal,comm,
    case
        when comm is null or comm=0
                then 100
        when comm >0
                then comm
    end as UPDATED_COMMISSION ,
    SAL+case
        when comm is null or comm=0
                then 100
        when comm >0
                then comm
    end as Total_salary
    
FROM 
    emp
ORDER BY
    comm;

-- ################################################################
-- 17. Distinct values
-- ################################################################
SELECT
   distinct deptno
FROM 
    emp;
-- ################################################################
-- 18. SUB QUERY
-- Query within query
-- Inner Query
-- outer Query depends on result of INNER query
-- ################################################################
-- ################################################################
-- 18.1. display the employees details such as empno,ename and sal, who are earning more than avg salary
-- ################################################################
-- 1. display empno,ename,sal
SELECT 
    empno,ename,sal
FROM 
    emp;
-- 2. avg(sal)
SELECT 
    AVG(sal)
FROM 
    emp;

-- 3. sal>avg(sal) final solution

SELECT 
    empno,ename,sal
FROM 
    emp
WHERE
    sal>(
    SELECT 
        AVG(sal)
    FROM 
    emp
    );

-- ################################################################
-- 18.2. Display empno,ename,deptno for all employees working in 'ACCOUNTING'
-- ################################################################
-- 1.
    SELECT 
        empno,ename,deptno
    from 
        emp;
-- 2. 
    SELECT 
        deptno
    FROM
        dept
    WHERE
        dname='ACCOUNTING';

-- 3. Final Query
    SELECT 
        empno,ename,deptno
    FROM
        emp
    WHERE
        deptno=(
        SELECT 
        deptno
    FROM
        dept
    WHERE
        dname='ACCOUNTING'
        );

-- ################################################################
-- 18.3. Display empno,ename,deptno for all employees from department having employee earning max salary
-- ################################################################
-- 1. department having employee earning max salary
    SELECT 
        deptno
    FROM 
        emp
    WHERE
        sal=(SELECT max(sal) FROM emp);
        
    
-- 2. Display empno,ename,deptno for all employees
    SELECT 
        empno,ename,deptno
    FROM
        emp;
    
-- 3. Final












SELECT 
        empno,ename,deptno
    FROM
        emp
    WHERE
        sal=(SELECT max(sal) FROM emp)


SELECT
    deptno
FROM
    emp
WHERE
    sal IN (
    SELECT
        MAX(sal)
    FROM
        emp
    GROUP BY
        deptno
        );        
-- ################################################################
-- 18.3. Display empno,ename,deptno for all employees from department having employee earning salary > avg(salary)
-- ################################################################
-- 1. department having employee earning max salary
    SELECT 
        deptno
    FROM 
        emp
    WHERE
        sal>(SELECT avg(sal) FROM emp)
    ORDER BY
    deptno;
        
    
-- 2. Display empno,ename,deptno for all employees
    SELECT 
        empno,ename,deptno
    FROM
        emp;
    
-- 3. Final
SELECT 
        empno,ename,deptno
    FROM
        emp
    WHERE
    deptno IN (SELECT       deptno     FROM         emp
            WHERE         sal>(SELECT avg(sal) FROM emp))
    and
    sal>(SELECT avg(sal) FROM emp)
    ORDER BY
    deptno;
-- ################################################################
-- 18.4. Display empno,ename,deptno for employee earning greater than any from employees of dept 30
-- ################################################################
SELECT sal FROM emp WHERE deptno=30 order by sal;
SELECT      empno,ename,deptno,sal FROM         emp where deptno!=30



SELECT 
        empno,ename,deptno,sal
FROM
        emp
WHERE
        sal > ANY(SELECT sal FROM emp WHERE deptno=30)
        and
        deptno!=30 
order by sal;


SELECT 
        empno,ename,deptno,sal
FROM
        emp
WHERE
        sal > All(SELECT sal FROM emp WHERE deptno=30)
        
order by sal;
                