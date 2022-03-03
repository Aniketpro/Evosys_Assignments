SET SERVEROUTPUT ON;
--1) Create a Package and do the following tasks
--2) Write a PL/SQL explicit cursor that will display customer name, 
--total billing amount and their category based on their billing amount.
--    < 100 Category A
--    >= 100 and < 1000 Category B
--    >= 1000 and <=10000 Category C
--    Insert the Resultant Data in some Other Customer-Purchase Tbl
create table Customer_Purchase (

   cp_name VARCHAR2(50) NOT NULL,
   cp_total_bill NUMBER NOT NULL,
   cp_category VARCHAR2(1) NOT NULL
);
TRUNCATE TABLE customer_purchase;

CREATE OR REPLACE PACKAGE pack1
AS
PROCEDURE category_by_price;
END pack1;


CREATE OR REPLACE PACKAGE BODY pack1
AS
PROCEDURE category_by_price AS
    cname customer.cust_name%type;
    bill product.p_price%type;
    cursor c1 is select 
        cust_name, sum(p_price)
         from
        product y join purchase z
        on y.p_id = z.p_id
        join customer x
        on x.cust_id = z.cust_id
        group by
        cust_name;
begin
    open c1;
    loop
        fetch c1 into cname,bill;
        exit when c1%notfound;
        
        if(bill < 100) then
            insert into Customer_Purchase values (cname, bill,'A');
        ELSIF (bill >= 100  and bill <=1000) then
            insert into Customer_Purchase values (cname, bill,'B');
        elsif(bill >= 1000  and bill <=10000) then
            insert into Customer_Purchase values (cname, bill,'C');
        end if;
        
    end loop;
    close c1;
end;
END pack1;
EXEC pack1.category_by_price;

SELECT * FROM customer_purchase;

select current_timestamp from dual;
select curtime 

--3) Create a Trigger that will Auto-populate the data in History table 
--when anything is inserted or updated in Customer-Purchase Tbl with created timestamp
create table history_table (action varchar2(50) not null, Date_Time TIMESTAMP WITH LOCAL TIME ZONE);

  
    CREATE OR REPLACE TRIGGER cust_purchase_trigger
    AFTER 
    INSERT OR UPDATE
    ON Customer_Purchase
    FOR EACH ROW    
    DECLARE
       action varchar2(50);
       Date_Time TIMESTAMP WITH LOCAL TIME ZONE;
    BEGIN
       action := CASE  
             WHEN INSERTING THEN 'INSERT'
             WHEN UPDATING THEN 'UPDATE'
       END;
       select current_timestamp into date_time from dual;

         insert into history_table values (action, date_time);
    END;
/
insert into customer_purchase values('ANIKET',50,'A');
SELECT
    * FROM
    history_table;
--4) PL/SQL Function to find item which has minimum price in a table
CREATE OR REPLACE FUNCTION min_val_item
RETURN product.p_name%type
AS
p_item product.p_name%type;
BEGIN
    SELECT
        p_name INTO p_item
    FROM
        product
    WHERE
        p_price=(select min(p_price) from product WHERE rownum=1);
    RETURN p_item;
END;


BEGIN
    dbms_output.put_line(min_val_item());
END;

--5) Create Index for Customer-Purchase Tbl
CREATE INDEX cNameIndex 
    ON Customer_Purchase(cp_name);

    SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
    FROM 
        all_indexes
    WHERE 
        table_name = 'Customer_Purchase';
--6) Write a Stored Procedure to find the total purchase for each customer and
--total sale of each product using this table and insert these values in two other tables.
--  CREATING TABLE FOR TOTAL PURCAHSE
CREATE TABLE totalpurchase (CustomerId Number, TotalPurchase Number);

--  CREATING TABLE FOR TOTAL SALE
CREATE TABLE totalsale (ProductID Number, TotalSale Number);


CREATE OR REPLACE PROCEDURE find_sale_purchase() AS

xcid purchase.cust_id%type;
xpurchase number;

ypid purchase.p_id%type;
ytotalsale number;


CURSOR c1 IS
SELECT
    p.cust_id, sum(p_price) AS total_purchase
FROM
    customer c JOIN purchase p
    ON c.cust_id=p.cust_id
    JOIN product prod
    ON p.p_id=prod.p_id
GROUP BY p.cust_id
ORDER BY p.cust_id;

CURSOR c2 IS
SELECT p.p_id, SUM(prod.p_price) AS total_sale
FROM purchase p join product prod
    ON p.p_id=prod.p_id
GROUP BY p.p_id
ORDER BY p.p_id;

TOTAL_PURCHASE number:=0;
TOTAL_SALE number:=0;
BEGIN

    open c1;
    loop
        fetch c1 into xcid, xpurchase;
        exit when c1%notfound;
        insert into totalpurchase values (xcid, xpurchase);
    end loop;
    close c1;
    
    open c2;
    loop
        fetch c2 into ypid, ytotalsale;
        exit when c2%notfound;
        insert into totalsale values (ypid, ytotalsale);
    end loop;
    close c2;

END;
/




--CREATE OR REPLACE VIEW num_sale(prod_id,prod_count)
--AS
SELECT p.p_id, SUM(prod.p_price) AS total_sale
FROM purchase p join product prod
    ON p.p_id=prod.p_id
GROUP BY p.p_id
ORDER BY p.p_id;
--SELECT n.*,prod_count*p_price
--FROM product p,num_sale n
--WHERE p.p_id = n.prod_id;

SELECT
    p.cust_id, sum(p_price) AS total_purchase
FROM
    customer c JOIN purchase p
    ON c.cust_id=p.cust_id
    JOIN product prod
    ON p.p_id=prod.p_id
GROUP BY p.cust_id
ORDER BY p.cust_id;

