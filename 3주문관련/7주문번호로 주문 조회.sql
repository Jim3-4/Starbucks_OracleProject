--주문번호로 주문 조회
CREATE OR REPLACE PROCEDURE up_vieworderNo
(
  pmember_id orders.member_id%TYPE
  ,porder_no orders.order_no%TYPE
)
IS
    vsql varchar2(1000);
    vorder_no orders.order_no%type;
    vorder_date orders.order_date%type;
    vmenu_kor menu.menu_kor%type;
    vmenu_count order_detail.menu_count%type;
    voption_name optionprice.option_name%type;
    voo_qty orderoption.oo_qty%type;
    vmenu_price order_detail.menu_price%type;
    vpickupway orders.pickupway%type;
    vst_name stores.st_name%type;
    vorder_status orders.order_status%type;
    vpayment_status orders.payment_status%type;
    vcursor SYS_REFCURSOR;  

    
BEGIN
   vsql := 'SELECT o.order_no, order_date, menu_kor, menu_count, option_name, oo_qty, menu_price, pickupway, st_name,order_status, payment_status ';
   vsql := vsql || 'FROM orders o JOIN order_detail od ON o.order_no = od.order_no ';
   vsql := vsql || 'LEFT JOIN orderoption oo ON od.oo_no = oo.oo_no ';
   vsql := vsql || 'LEFT JOIN optionprice op ON oo.op_no = op.op_no ';
   vsql := vsql || 'LEFT JOIN menu m ON od.menu_code= m.menu_code ';
   vsql := vsql || 'LEFT JOIN stores s ON o.st_code = s.st_code ';
   vsql := vsql || 'WHERE member_id=:member_id AND o.order_no=:order_no ';
   vsql := vsql || 'ORDER BY o.order_no DESC, od.oo_no DESC ';


   OPEN  vcursor FOR vsql USING pmember_id, porder_no;
    
   LOOP
      FETCH vcursor INTO vorder_no, vorder_date, vmenu_kor, vmenu_count, voption_name, voo_qty, vmenu_price, vpickupway, vst_name,vorder_status,vpayment_status;
      EXIT WHEN vcursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE( '주문번호: ' || vorder_no || '  주문날짜: ' || vorder_date);
      DBMS_OUTPUT.PUT_LINE( '메뉴이름: ' || vmenu_kor || '  수량: ' || vmenu_count);
      DBMS_OUTPUT.PUT_LINE( '옵션이름: ' || voption_name || '   옵션수량: ' || voo_qty );
      DBMS_OUTPUT.PUT_LINE( '메뉴가격: ' || vmenu_price );
      DBMS_OUTPUT.PUT_LINE( '수령방식: ' || vpickupway );
      DBMS_OUTPUT.PUT_LINE( '지점: ' || vst_name );
      DBMS_OUTPUT.PUT_LINE( '주문상태: ' || vorder_status || '  결제상태: ' || vpayment_status);
      DBMS_OUTPUT.PUT_LINE('');
   END LOOP;

   CLOSE vcursor;
END;
--ID,주문번호
EXEC  up_vieworderNo('jaeyoung',15);  