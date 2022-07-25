--�ֹ�����
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

--�ֹ���ȣ, ����
EXEC up_dUpOrderState(15,'�����غ�');

SELECT * FROM orders;
