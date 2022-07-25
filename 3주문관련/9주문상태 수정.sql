--주문상태
CREATE OR REPLACE PROCEDURE up_dUpOrderState
(
  porder_no orders.order_no%type
  ,porder_status orders.order_status%type
)
IS
  vdsql varchar2(1000);
 
BEGIN
    vdsql :=   ' UPDATE orders ';
    vdsql :=   vdsql || ' SET order_status = :order_status ';
    vdsql :=   vdsql || ' WHERE order_no = :order_no ';
    
   EXECUTE IMMEDIATE vdsql                    
                    USING  porder_status, porder_no;

-- EXCEPTION
END;

--주문번호, 상태
EXEC up_dUpOrderState(15,'결제준비');

SELECT * FROM orders;
