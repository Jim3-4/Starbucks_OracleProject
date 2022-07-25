--�ֹ�����
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

--�ֹ���ȣ, ����
EXEC up_dUpPaymentState(14,'������');

SELECT * FROM orders;
