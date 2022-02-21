-- COLLECTIONS
SET SERVEROUTPUT ON;
-- ===============================================
--ASSOCIATIVE ARRAY
-- ===============================================
-- Declaring an associative array type
-- TYPE associative_array_type 
--     IS TABLE OF datatype [NOT NULL]
--     INDEX BY index_type;

-- Declaring an associative array variable
-- associative_array associative_array_type 

-- Accessing associative array elements
-- array_name(index)

-- Assigning associative array elements
-- array_name(index) := value;
DECLARE
    -- declare an associative array type
    TYPE t_capital_type 
        IS TABLE OF VARCHAR2(100) 
        INDEX BY VARCHAR2(50);
    -- declare a variable of the t_capital_type
    t_capital t_capital_type;
    -- local variable
    l_country VARCHAR2(50);
BEGIN
    
    t_capital('USA')            := 'Washington, D.C.';
    t_capital('United Kingdom') := 'London';
    t_capital('Japan')          := 'Tokyo';
    
    l_country := t_capital.FIRST;
    
    WHILE l_country IS NOT NULL LOOP
        dbms_output.put_line('The capital of ' || 
            l_country || 
            ' is ' || 
            t_capital(l_country));
        l_country := t_capital.NEXT(l_country);
    END LOOP;
END;
/

-- ======================================================
-- NESTED TABLE
-- ======================================================
DECLARE
    -- declare a cursor that return emp ename
    CURSOR c_emp IS 
        SELECT ename 
        FROM emp
        ORDER BY ename;
    -- declare a nested table type   
    TYPE t_emp_name_type 
        IS TABLE OF emp.ename%TYPE;
    
    -- declare and initialize a nested table variable
    t_emp_names t_emp_name_type := t_emp_name_type(); 
    
BEGIN
    -- populate customer names from a cursor
    FOR r_emp IN c_emp 
    LOOP
        t_emp_names.EXTEND;
        t_emp_names(t_emp_names.LAST) := r_emp.ename;
    END LOOP;
    
    -- display customer names
    FOR l_index IN t_emp_names.FIRST..t_emp_names.LAST 
    LOOP
        dbms_output.put_line(t_emp_names(l_index));
    END LOOP;
END;

-- ====================================================
-- VARRAY
-- ====================================================
DECLARE
    TYPE r_emp_type IS RECORD(
        emp_name emp.ename%TYPE,
        emp_job emp.job%TYPE
    ); 

    TYPE t_emp_type IS VARRAY(5) 
        OF r_emp_type;
    
    t_emp t_emp_type := t_emp_type();

    CURSOR c_emp IS 
        SELECT ename, job 
        FROM emp
        ORDER BY ename 
        FETCH FIRST 5 ROWS ONLY;
BEGIN
    -- fetch data from a cursor
    FOR r_emp IN c_emp LOOP
        t_emp.EXTEND;
        t_emp(t_emp.LAST).emp_name := r_emp.ename;
        t_emp(t_emp.LAST).emp_job  := r_emp.job;
    END LOOP;

    -- show all employee
    FOR l_index IN t_emp.FIRST..t_emp.LAST 
    LOOP
        dbms_output.put_line(
            'The employee ' ||
            t_emp(l_index).emp_name ||
            ' is a ' ||
            t_emp(l_index).emp_job
        );
    END LOOP;

END;
/



