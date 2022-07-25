--매장선택
CREATE OR REPLACE PROCEDURE up_dUpSt_code
(
  porder_no orders.order_no%type
  ,pst_code orders.st_code%type
)
IS
  vdsql varchar2(1000);
 
BEGIN
    vdsql :=   ' UPDATE orders ';
    vdsql :=   vdsql || ' SET st_code = :st_code ';
    vdsql :=   vdsql || ' WHERE order_no = :order_no ';
    
   EXECUTE IMMEDIATE vdsql                    
                    USING  pst_code, porder_no;

-- EXCEPTION
END;

--주문번호, 지점
EXEC up_dUpSt_code(15,'ST04631');

SELECT * FROM orders;

