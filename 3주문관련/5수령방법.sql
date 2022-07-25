--수령방법
CREATE OR REPLACE PROCEDURE up_dUpPickupway
(
  porder_no orders.order_no%type
  ,ppickupway orders.pickupway%type
)
IS
  vdsql varchar2(1000);
 
BEGIN
    vdsql :=   ' UPDATE orders ';
    vdsql :=   vdsql || ' SET pickupway = :pickupway ';
    vdsql :=   vdsql || ' WHERE order_no = :order_no ';
    
   EXECUTE IMMEDIATE vdsql                    
                    USING  ppickupway, porder_no;

-- EXCEPTION
END;

--주문번호, 수령방법
EXEC up_dUpPickupway(15,'픽업');

SELECT * FROM orders;
