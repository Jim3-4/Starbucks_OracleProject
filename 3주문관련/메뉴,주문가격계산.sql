
--
CREATE OR REPLACE PROCEDURE up_dUpMenuPriceCal
(
  poo_no order_detail.oo_no%type
)
IS
  vdsql varchar2(1000);

 
BEGIN
    vdsql :=   ' UPDATE order_detail ';
    vdsql :=   vdsql || ' SET menu_price = ( ';
    vdsql :=   vdsql || 'SELECT ((SELECT menu_cost FROM menu ';-- 메뉴 가격
    vdsql :=   vdsql || 'WHERE menu_code = (SELECT menu_code  FROM orders o JOIN order_detail od ON  o.order_no = od.order_no   ';
    vdsql :=   vdsql || 'LEFT JOIN orderoption oo ON od.oo_no = oo.oo_no ';
    vdsql :=   vdsql || 'WHERE  od.oo_no = :oo_no  ';
    vdsql :=   vdsql || ' GROUP BY menu_code)) + ';
    vdsql :=   vdsql || ' NVL((SELECT SUM(option_price)  ';-- +수량*가격(샷)
    vdsql :=   vdsql || ' FROM orderoption oo JOIN optionprice op ON oo.op_no = op.op_no ';
    vdsql :=   vdsql || ' WHERE oo_no =:oo_no AND oo.op_no!=8 AND oo_qty >0  ';
    vdsql :=   vdsql || ' GROUP BY oo_no),0) + ';
    vdsql :=   vdsql || ' NVL((SELECT option_price*oo_qty ';-- +가격(시럽...)
    vdsql :=   vdsql || ' FROM orderoption oo JOIN optionprice op ON oo.op_no = op.op_no ';
    vdsql :=   vdsql || ' WHERE oo_no =:oo_no AND oo.op_no=8 AND oo_qty >0),0))sum ';
    vdsql :=   vdsql || 'FROM dual ';
    vdsql :=   vdsql || ') WHERE oo_no = :oo_no ';
    

  EXECUTE IMMEDIATE vdsql                    
                    USING poo_no, poo_no, poo_no, poo_no;

-- EXCEPTION
END;
--주문상세번호 입력
EXEC up_dUpMenuPriceCal(27);
SELECT * FROM order_detail;


--
CREATE OR REPLACE PROCEDURE up_dUptotPrCal
(
  porder_no order_detail.order_no%type
)
IS
  vdsql varchar2(1000);

 
BEGIN
    vdsql :=   ' UPDATE orders ';
    vdsql :=   vdsql || ' SET order_totalcost = ( ';
    vdsql :=   vdsql || ' SELECT SUM(menu_price) ';
    vdsql :=   vdsql || ' FROM order_detail ';
    vdsql :=   vdsql || ' WHERE order_no = :order_no ';
    vdsql :=   vdsql || ' ) WHERE order_no = :order_no ';
    
   EXECUTE IMMEDIATE vdsql                    
                    USING porder_no, porder_no;

-- EXCEPTION
END;
--주문번호 입력
EXEC up_dUptotPrCal(15);

SELECT * FROM orders;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--메뉴 한개 계산 쿼리
SELECT ((SELECT menu_cost
FROM menu
WHERE menu_code = (SELECT menu_code  FROM orders o JOIN order_detail od ON  o.order_no = od.order_no 
                                        LEFT JOIN orderoption oo ON od.oo_no = oo.oo_no 
                                        WHERE  od.oo_no = :oo_no
                                        GROUP BY menu_code))--메뉴 가격
+
--수량*가격
NVL((SELECT SUM(option_price)
FROM orderoption oo JOIN optionprice op ON oo.op_no = op.op_no
WHERE oo_no =:oo_no AND oo.op_no!=8 AND oo_qty >0
GROUP BY oo_no),0)
+
--가격
NVL((SELECT option_price*oo_qty
FROM orderoption oo JOIN optionprice op ON oo.op_no = op.op_no
WHERE oo_no =:oo_no AND oo.op_no=8 AND oo_qty >0),0))sum
FROM dual;

UPDATE order_detail
SET menu_price = (가격)
WHERE oo_no = :oo_no;

SELECT SUM(menu_price)
FROM order_detail
WHERE order_no = :order_no;