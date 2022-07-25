--초기 주문번호 생성
CREATE OR REPLACE PROCEDURE up_dinsOrders
(
  pmember_id orders.member_id%type
)
IS
  vdsql varchar2(1000);
  vorder_no orders.order_no%type;
BEGIN

    SELECT MAX(order_no)+1 INTO vorder_no FROM orders;
       
  vdsql :=  'INSERT INTO orders ';
  vdsql :=   vdsql || ' VALUES ( :order_no, SYSDATE, ''메뉴선택'', null, null, null, null,:id) '; 
  

  EXECUTE IMMEDIATE vdsql                    
                    USING vorder_no,pmember_id;
-- EXCEPTION
END;
EXEC up_dinsOrders('jaeyoung');

SELECT * FROM orders;