--옵션추가
CREATE OR REPLACE PROCEDURE up_dinsODOsel
(
    poo_no orderoption.oo_no%type
    ,pop_no orderoption.op_no%type
    ,poo_qty orderoption.oo_qty%type
   
)
IS
  vdsql varchar2(1000);
  vorderoption_no orderoption.orderoption_no%type;

 
BEGIN

    SELECT MAX(orderoption_no)+1 INTO vorderoption_no FROM orderoption;
     
    vdsql :=  'INSERT INTO orderoption ';
    vdsql :=   vdsql || ' VALUES ( :orderoption_no, :oo_no, :op_no, :oo_qty) '; 
    

  EXECUTE IMMEDIATE vdsql                    
                    USING vorderoption_no, poo_qty, poo_no, pop_no ;

-- EXCEPTION
END;

--주문상세번호, 옵션번호, 수량
EXEC up_dinsODOsel(20, 8, 1);
SELECT * FROM orderoption;