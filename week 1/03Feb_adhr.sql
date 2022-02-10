CREATE TABLE COLOR(
    ID INT, COLORCODE VARCHAR2(7)
);

INSERT INTO COLOR VALUES(1,'#FF0000');
INSERT INTO COLOR VALUES(2,'#00FF00');
INSERT INTO COLOR VALUES(3,'#0000FF');
INSERT INTO COLOR VALUES(4,NULL);

SELECT ID,COLORCODE FROM COLOR;

SELECT
    ID,COLORCODE,
    DECODE(COLORCODE,
    '#FF0000','RED',
    '#00FF00','GREEN',
    '#0000FF','BLUE',
    'COLOR CODE NOT LABELRD') AS COLOR_NAME
FROM
    COLOR;
    
INSERT INTO COLOR VALUES(5,'#0000FF');
INSERT INTO COLOR VALUES(6,'#00FFFF');

-- USING ROW_NUMBER OVER()
SELECT
    empno,ename,deptno,sal,ROW_NUMBER() OVER (ORDER BY sal) as row_number
FROM
    emp
ORDER BY
    sal;
    
-- ################################################################
-- USING ROW_NUMBER OVER( ORDER BY SAL) - FOR EVER DEPT
-- ################################################################
SELECT
    EMPNO,ENAME,DEPTNO,SAL, 
    ROW_NUMBER() OVER (PARTITION BY DEPTNO ORDER BY SAL) AS ROW_NUM
FROM EMP ORDER BY DEPTNO,SAL;

-- ################################################################
-- USING RANK ()
--A. RANK(CONSTANT_VALUES,CONSTANT_VALUES,....) WITHIN GROUP (ORDER BY COL1, COL2)
--B. RANK() OVER (PARTITION BY department_id
-- ################################################################
--A. RANK(3000) WITHIN GROUP (ORDER BY sal)
-- WE GET SINGLE RECORD 
-- IN EMP.SAL THE FIRST 3000 RANK IS RETURN BY THE RANK(3000) WITHIN GROUP(ORDER BY SAL)
--RANK(3000) WITHIN GROUP (ORDER BY sal) WITH THIS WE CAN'T PRESENT OTHER COLUMNS
--RANK(3000) WITHIN GROUP (ORDER BY sal) WE CAN PASS COLUMN VALUES AS IT EXPECT ONLY CONSTANT VALUES
-- ################################################################
SELECT    
    RANK(3000) WITHIN GROUP(ORDER BY SAL)
FROM EMP ORDER BY SAL;

-- #########################
SELECT
    empno,ename,deptno,sal,RANK() OVER(ORDER BY SAL)
FROM
    emp
ORDER BY
    sal;
    
SELECT
    empno,ename,deptno,sal,RANK() OVER(PARTITION BY deptno ORDER BY SAL)
FROM
    emp
ORDER BY
    deptno;
    
-- ########################################
-- Using DENSE_RANK()
-- ########################################
SELECT    
    DENSE_RANK(3000) WITHIN GROUP(ORDER BY SAL)
FROM EMP ORDER BY SAL;

SELECT
    empno,ename,deptno,sal,DENSE_RANK() OVER(ORDER BY SAL)
FROM
    emp
ORDER BY
    SAL;

SELECT
    empno,ename,deptno,sal,
    ROW_NUMBER() OVER(ORDER BY SAL) as row_num,
    RANK() OVER(ORDER BY SAL) as rank,
    DENSE_RANK() OVER(ORDER BY SAL) as dense_rank
FROM
    emp
ORDER BY
    sal;
    

-- ################################################################	 	
-- The following example returns, within each department of the sample table hr.employees, 
-- the minimum salary among the employees who make the lowest commission and the maximum 
-- salary among the employees who make the highest commission:
-- ################################################################	 
--SELECT department_id,
--MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct) "LOW",
--MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct) "MAX"
--   FROM employees
--   GROUP BY department_id;
SELECT
    deptno, 
    MIN(sal) KEEP (DENSE_RANK FIRST ORDER BY comm) "low",
    MAX(sal) KEEP (DENSE_RANK LAST ORDER BY comm) "high"
FROM
    emp
GROUP BY
    deptno;
    
-- ################################################################	  
-- TO_CHAR() : 'MM' OR 'MM:YY'
--List all employees join in dec 81 and working for dept 30 as CLERK as 
--per the highest to lowest salary
-- ################################################################	 
SELECT
    empno,ename,deptno,hiredate
FROM
    EMP
WHERE 
    TO_CHAR(HIREDATE,'MM')='12'
    AND
    TO_CHAR(HIREDATE,'YY')='81'
    AND
    DEPTNO=30 
    AND 
    JOB='CLERK';
    

SELECT
    empno,ename,deptno,hiredate
FROM
    EMP
WHERE 
    HIREDATE LIKE '%-12-81'
    AND
    DEPTNO=30 
    AND 
    JOB='CLERK';
    
-- ################################################################	 
-- List all emp who have joined in same month and year with martin 
-- ################################################################	 
SELECT * 
FROM 
    EMP 
WHERE 
    TO_CHAR(HIREDATE,'MM:YY')=(SELECT 
                                    TO_CHAR(HIREDATE,'MM:YY')
                                FROM 
                                    EMP 
                                WHERE 
                                    ename='MARTIN');

-- COPY OF A TABLE: COLUMNS AND DATA TYPES ARE AS ORIGINAL TABLE
-- HOWEVER NO CONSTRAINTS ARE APPLIED.
SELECT * FROM emp WHERE empno = 0;
-- create copy of emp table structure without the data
CREATE TABLE
    emp_dummy
    AS
    SELECT * FROM emp WHERE empno = 0;
    
INSERT INTO emp_dummy (SELECT * FROM emp WHERE deptno=20);

TRUNCATE TABLE emp_dummy;  

-- Employees with location New York
INSERT INTO emp_dummy(
    SELECT * FROM emp
    WHERE
        deptno IN (SELECT deptno FROM dept
                    WHERE branchno IN (SELECT branchno FROM branch WHERE location='NEW YORK'))
);

SELECT * FROM emp_dummy;
DELETE FROM emp_dummy;
ROLLBACK;
