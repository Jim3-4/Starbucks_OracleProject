--�ֹ���ȣ�� �ֹ� ��ȸ
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
      DBMS_OUTPUT.PUT_LINE( '�ֹ���ȣ: ' || vorder_no || '  �ֹ���¥: ' || vorder_date);
      DBMS_OUTPUT.PUT_LINE( '�޴��̸�: ' || vmenu_kor || '  ����: ' || vmenu_count);
      DBMS_OUTPUT.PUT_LINE( '�ɼ��̸�: ' || voption_name || '   �ɼǼ���: ' || voo_qty );
      DBMS_OUTPUT.PUT_LINE( '�޴�����: ' || vmenu_price );
      DBMS_OUTPUT.PUT_LINE( '���ɹ��: ' || vpickupway );
      DBMS_OUTPUT.PUT_LINE( '����: ' || vst_name );
      DBMS_OUTPUT.PUT_LINE( '�ֹ�����: ' || vorder_status || '  ��������: ' || vpayment_status);
      DBMS_OUTPUT.PUT_LINE('');
   END LOOP;

   CLOSE vcursor;
END;
--ID,�ֹ���ȣ
EXEC  up_vieworderNo('jaeyoung',15);  