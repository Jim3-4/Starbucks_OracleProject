--주문상태
CREATE OR REPLACE PROCEDURE up_dUpPaymentState
(
  porder_no orders.order_no%type
  ,ppayment_status orders.payment_status%type
)
IS
  vdsql varchar2(1000);
 
BEGIN
    vdsql :=   ' UPDATE orders ';
    vdsql :=   vdsql || ' SET payment_status = :payment_status ';
    vdsql :=   vdsql || ' WHERE order_no = :order_no ';
    
   EXECUTE IMMEDIATE vdsql                    
                    USING  ppayment_status, porder_no;

-- EXCEPTION
END;

--주문번호, 상태
EXEC up_dUpPaymentState(14,'결제중');

SELECT * FROM orders;
