SET SERVEROUTPUT ON;
-- =================================================
-- PACKAGE
-- =================================================
-- CREATE PACKAGE
--CREATE [OR REPLACE] PACKAGE [schema_name.]<package_name> IS | AS
--    declarations;
--END [<package_name>];
-- ==================================================

CREATE OR REPLACE PACKAGE emp_details
AS
FUNCTION get_emp_by_deptno(p_deptno emp.deptno%type)
RETURN SYS_REFCURSOR;
CURSOR c_emp(p_empno emp.empno%TYPE)
IS
    SELECT
        e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,d.dname,b.location
        
    FROM
        emp e JOIN dept d USING (deptno)
        JOIN branch b USING (branchno)
    WHERE
        e.empno = p_empno;
END emp_details; 

-- ========================================================
-- PACKAGE BODY
--CREATE [OR REPLACE] PACKAGE BODY [schema_name.]<package_name> IS | AS
--    declarations
--    implementations;
--[BEGIN
--EXCEPTION]
--END [<package_name>];
-- =========================================================

CREATE OR REPLACE PACKAGE BODY emp_details
AS
FUNCTION get_emp_by_deptno(p_deptno emp.deptno%type)
RETURN SYS_REFCURSOR
AS  
    EMP_REF_CURSOR SYS_REFCURSOR; -- DECLARATION OF SYS_REFCURSOR VARIABLE
BEGIN
    OPEN EMP_REF_CURSOR FOR  SELECT EMPNO,ENAME,JOB,SAL,COMM  FROM emp    WHERE deptno=p_deptno;
    RETURN EMP_REF_CURSOR;
END;
END emp_details;

-- ========================================================
DECLARE
    v_empno emp.empno%TYPE:=&empno;
    v_ename emp.ename%TYPE;
    v_job emp.job%TYPE;
    v_hiredate emp.hiredate%TYPE;
    v_sal emp.sal%TYPE;
    v_comm emp.comm%TYPE;
    v_dname dept.dname%TYPE;
    v_location branch.location%TYPE;
BEGIN
    OPEN emp_details.c_emp(v_empno);
    FETCH emp_details.c_emp INTO v_empno,v_ename,v_job,v_hiredate,v_sal,v_comm,v_dname,v_location;
    DBMS_OUTPUT.PUT_LINE(v_empno || ', ' ||
                         v_ename || ', ' ||
                         v_job   || ', ' ||
                         v_hiredate || ', ' ||
                         v_sal   || ', ' ||
                         v_comm  || ', ' ||
                         v_dname || ', ' ||
                         v_location);
    CLOSE emp_details.c_emp;
END;
-- =========================================================
DECLARE 
    EMP_REF_CURSOR SYS_REFCURSOR;
    v_EMPNO emp.empno%type;
    v_ENAME emp.ename%type;
    v_JOB   emp.job%type;
    v_SAL   emp.sal%type;
    v_COMM  emp.comm%type;
    v_deptno emp.deptno%type:=&deptno;
BEGIN
    --   call the function
    EMP_REF_CURSOR:=emp_details.get_emp_by_deptno(v_deptno);
    --   READ THE RECORDS FROM THE REF CURSOR    
        LOOP
            FETCH EMP_REF_CURSOR INTO v_EMPNO, v_ENAME,v_JOB,v_SAL,v_COMM;
            EXIT WHEN EMP_REF_CURSOR%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(
                v_EMPNO ||', '||
                v_ENAME ||', '||
                v_JOB   ||', '||
                v_SAL   ||', '||
                v_COMM 
                );
        END LOOP;  
END;

-- DROP PACKAGE
-- DROPS ONLY THE PACKAGE BODY
DROP PACKAGE BODY emp_details;
-- DROPS BOTH PAKAGE BODY AND SPECIFICATION
DROP PACKAGE emp_details;

