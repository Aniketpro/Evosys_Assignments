-- PL/SQL Anonymous Block
-- Anonymous block without name
-- Named Blocks -> CALL AGAIN AND AGAIN PROCEDURES OR FUNCTIONS
-- BLOCK BEGIN ... END;
-- SPACE BEFORE
SET SERVEROUTPUT ON;
BEGIN 
    DBMS_OUTPUT.put_line ('Hello World!');
    DBMS_OUTPUT.put_line (10+20);
  --  BBMS_OUTPUT.put_line ()
END;

BEGIN
   DBMS_OUTPUT.put_line ('Hello World!');
   DBMS_OUTPUT.put_line (10+20);
END;

--###########################################################################
-- PRINT MESSAGE='HELLO WORLD!' USING VARIABLE 
-- = is used for comparison operator for equality check 
-- n=10-> checking whether n has value as 10 if yes it returns true otherwise false
-- pl/sql we use ':=' as an assignment operator
--lhs:=rhs will have rhs value
--lhs=rhs indicates lhs is equal to rhs
--###########################################################################
DECLARE 
    v_message VARCHAR2(100):='HELLO WORLD!';
BEGIN
    DBMS_OUTPUT.put_line(v_message);
END;

--###########################################################################    
--    v_message   -> Naming convention
--                  -> all variables must start with v_
--                  -> must be meaningful names in camelcase if varying values
--                  -> must be meaningful names in capitalcase if constant values
--###########################################################################    
--###########################################################################                        
--   EXCEPTION HANDLING 
--  NUMBER CAN'T BE DEVIDED BY ZERO =>ERROR DEVIDE BY ZERO
--###########################################################################                        
-- without handling exception
--###########################################################################                        
    DECLARE
        v_result number:=0;
    BEGIN
            v_result:=1/0;
            
    END;
--###########################################################################                        
-- with handling exception
--###########################################################################                        
    DECLARE
        v_result number:=0;
    BEGIN
            v_result:=1/0;
            EXCEPTION
                WHEN ZERO_DIVIDE THEN
--                                DBMS_OUTPUT.put_line('zero devide error');
                                DBMS_OUTPUT.put_line(SQLERRM );
    END;
--###########################################################################                            
--    DBMS_OUTPUT.put_line(SQLERRM );
--    ORA-01476: divisor is equal to zero    
--    PL/SQL procedure successfully completed.
--###########################################################################                        
--    DBMS_OUTPUT.put_line('zero devide error');
--    zero devide error
--    PL/SQL procedure successfully completed.
--###########################################################################                        

