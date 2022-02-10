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
INSERT INTO emp_dummy(SELECT * FROM emp);
COMMIT;

UPDATE emp_dummy
    SET comm = 0.1
    WHERE comm IS NULL;
    
SELECT deptno FROM dept WHERE dname='ACCOUNTING';

SELECT *
FROM 
    emp_dummy
WHERE deptno = (SELECT deptno FROM dept WHERE dname='ACCOUNTING');

UPDATE emp_dummy
    SET sal = sal + sal*0.19
    WHERE empno IN (SELECT
                        empno 
                    FROM 
                        emp_dummy 
                    WHERE 
                        deptno=(SELECT deptno FROM dept WHERE dname='ACCOUNTING'));

DELETE FROM emp_dummy
WHERE empno IN (SELECT
                        empno 
                    FROM 
                        emp_dummy 
                    WHERE 
                        deptno=(SELECT deptno FROM dept WHERE dname='ACCOUNTING'));

