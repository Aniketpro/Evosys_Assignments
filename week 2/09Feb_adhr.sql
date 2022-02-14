SELECT * FROM c##aduser.color;
-- Public Synonym
CREATE PUBLIC SYNONYM colors FOR c##aduser.color;
SELECT * FROM colors;

--  Non Public Synonym
CREATE SYNONYM syn_emp_dummy FOR c##aduser.emp_dummy;
select * from emp_dummy;
INSERT INTO syn_emp_dummy VALUES(1234,'ANIKET','MANAGER',7839,to_date('18-06-81','dd-mm-yy'),3000,500,10);
select * from syn_emp_dummy;

-- DROP SYNONYM
DROP SYNONYM syn_emp_dummy FORCE;

-- Sequence
CREATE SEQUENCE product_id
INCREMENT BY 1
MAXVALUE 1000
MINVALUE 1
CACHE 20;

CREATE TABLE product(
pid NUMBER PRIMARY KEY,
pname VARCHAR(50) NOT NULL
);

INSERT INTO product VALUES(product_id.NEXTVAL,'pepsi 500ml');
INSERT INTO product VALUES(product_id.NEXTVAL,'pepsi 500ml');
INSERT INTO product VALUES(product_id.NEXTVAL,'pepsi 500ml');
INSERT INTO product VALUES(product_id.NEXTVAL,'pepsi 500ml');
INSERT INTO product VALUES(product_id.NEXTVAL,'pepsi 500ml');

SELECT * FROM product;

-- ALTER SEQUENCE
ALTER SEQUENCE product MAXVALUE 10000;

--DROP SEQUENCE
DROP SEQUENCE product_id;
DROP TABLE product;

-- ROLE : Group of privileges
