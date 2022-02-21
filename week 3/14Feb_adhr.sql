SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION get_emp_by_deptno(p_deptno emp.deptno%type)
RETURN SYS_REFCURSOR
AS  
    EMP_REF_CURSOR SYS_REFCURSOR; -- DECLARATION OF SYS_REFCURSOR VARIABLE
BEGIN
    OPEN EMP_REF_CURSOR FOR  SELECT EMPNO,ENAME,JOB,SAL,COMM  FROM emp    WHERE deptno=p_deptno;
    RETURN EMP_REF_CURSOR;
END;


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
    EMP_REF_CURSOR:=get_emp_by_deptno(v_deptno);
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

CREATE OR REPLACE FUNCTION total_sal(sal emp.sal%type,comm emp.comm%type)
RETURN  emp.sal%type
AS
    v_total_sal emp.sal%type;
BEGIN
        IF 
            comm IS NULL THEN v_total_sal:=sal+0;
        ELSE
            v_total_sal:=sal+comm;
        END IF;
        RETURN v_total_sal;
END;

-- calling the defined fuction 'total_sal'
SELECT ename,sal,comm, total_sal(sal,comm) TOTAL_SAL FROM EMP;


-- create a procedure to return sal comm of empno entered by user
CREATE OR REPLACE PROCEDURE prc_get_salcomm_byempno(p_empno IN emp.empno%TYPE,
                                                    p_sal OUT emp.sal%TYPE,
                                                    p_comm OUT emp.comm%TYPE)
AS
BEGIN
    SELECT sal,comm INTO p_sal,p_comm FROM emp WHERE empno=p_empno;
END;

DECLARE
p_empno emp.empno%type:=&empno;
p_sal emp.sal%type;
p_comm emp.comm%type;
BEGIN
    prc_get_salcomm_byempno(p_empno, p_sal, p_comm);
    DBMS_OUTPUT.PUT_LINE(p_empno||': '||p_sal||', '||p_comm);
END;


CREATE OR REPLACE PROCEDURE prc_get_ename_byempno(p_empno emp.empno%type)
AS
    v_ename emp.ename%type;
BEGIN
    SELECT ename INTO v_ename FROM emp WHERE empno=p_empno;
    DBMS_OUTPUT.PUT_LINE('ename of empno '||p_empno||' is '||v_ename);
END;

EXECUTE prc_get_ename_byempno(7499);

-- ================================================
SELECT * FROM emp;
-- ================================================
-- use procedure to display all details of emp using empno->SINGLE RECORD
-- ================================================
CREATE OR REPLACE PROCEDURE prc_get_emp_byempno(p_empno IN emp.empno%type,
                                                emp_row OUT emp%ROWTYPE)
AS
BEGIN
    SELECT * INTO emp_row FROM emp WHERE empno=p_empno;
END;

DECLARE
    emp_row emp%ROWTYPE;
    v_empno emp.empno%type:=&empno;
BEGIN
    prc_get_emp_byempno(v_empno,emp_row);
    DBMS_OUTPUT.PUT_LINE(
    emp_row.empno ||', '||
    emp_row.ename||', '||
    emp_row.job   ||', '||
    emp_row.mgr   ||', '||
    emp_row.hiredate ||', '||
    emp_row.sal ||', '||
    emp_row.comm ||', '||
    emp_row.deptno
                );
END;

-- ==========================================================
-- use procedure to display all details of emp using deptno-> multiple record 'cursor'+for loop
-- ===========================================================
 CREATE OR REPLACE PROCEDURE get_emp_bydept (
     p_deptno IN emp.deptno%TYPE, 
     p_recordset OUT SYS_REFCURSOR
  ) AS 
  BEGIN 
    OPEN p_recordset FOR
      SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
      FROM  emp
      WHERE deptno = p_deptno;
  END;

DECLARE
cur SYS_REFCURSOR;
v_deptno emp.deptno%type:=&deptno;
v_empno emp.empno%type;
v_ename emp.ename%type;
v_job emp.job%type;
v_mgr emp.mgr%type;
v_hiredate emp.hiredate%type;
v_sal emp.sal%type;
v_comm emp.comm%type;
BEGIN
    get_emp_bydept( p_deptno=>v_deptno,p_recordset=>cur);
    
        LOOP
            FETCH cur INTO v_empno,v_ename,v_job,v_mgr,v_hiredate,v_sal,v_comm,v_deptno;
            EXIT WHEN cur%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(
            v_empno ||', '||
            v_ename||', '||
            v_job   ||', '||
            v_mgr   ||', '||
            v_hiredate ||', '||
            v_sal ||', '||
            v_comm ||', '||
            v_deptno
                );
        END LOOP;
END;

COMMIT;
