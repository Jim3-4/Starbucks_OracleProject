CREATE OR REPLACE PROCEDURE up_dinsODsel
(
  pmenu_code order_detail.menu_code%type
  ,porder_no orders.order_no%type
  ,pmenu_count order_detail.menu_count%type
)
IS
  vdsql varchar2(1000);
  voo_no order_detail.oo_no%type;
 
BEGIN

    SELECT MAX(oo_no)+1 INTO voo_no FROM order_detail;
     
    vdsql :=  'INSERT INTO order_detail(oo_no, order_no, menu_code, menu_count) ';
    vdsql :=   vdsql || ' VALUES ( :oo_no, :order_no, :menu_code, :menu_count) '; 
    

  EXECUTE IMMEDIATE vdsql                    
                    USING voo_no, porder_no, pmenu_code,  pmenu_count ;

-- EXCEPTION
END;
--메뉴 추가할때마다 
--메뉴번호, 주문번호, 수량
EXEC up_dinsODsel('N32', 7, 1);
SELECT * FROM order_detail;
