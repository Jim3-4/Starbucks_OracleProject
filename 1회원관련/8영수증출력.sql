          
CREATE OR REPLACE PROCEDURE up_receipt
(
  porder_no orders.order_no%type
)
IS
  vsql  varchar2(1000);
  vorder_no  orders.order_no%type;
  vst_name   stores.st_name%type;
  vst_address   stores.st_address%type;
  vst_manager   stores.st_manager%type;
  vst_code   stores.st_code%type;
  vst_tel   stores.st_tel%type;
  vpos  pay.pos%type;
  vpay_no pay.pay_no%type;
  vpay_method pay.pay_method%type;
  vamount pay.amount%type;
  vcus_nickname customer.cus_nickname%type;
  vmember_id customer.member_id%type;
  vcus_tel customer.cus_tel%type;
  vcus_level customer.cus_level%type;
  vorder_date orders.order_date%type;
  vorder_totalcost orders.order_totalcost%type;
  vmenu_kor menu.menu_kor%type;
  vmenu_count order_detail.menu_count%type;
  voption_name optionprice.option_name%type;
  vop_no optionprice.op_no%type;
 -- voption_price optionprice.option_price%type;
  vmenu_cost menu.menu_cost%type;
  vcursor SYS_REFCURSOR; 


BEGIN
     vsql := ' select s.st_name, s.st_address, s.st_manager,s.st_tel, s.st_code, p.pos, pay_method, cus_nickname,c.cus_level,o.order_date,o.order_totalcost, m.menu_kor, c.member_id, c.cus_tel, p.pay_no, m.menu_cost, od.menu_count, op.OPTION_NAME, op.op_no';
   vsql := vsql || ' FROM ORDERS O JOIN STORES S ON o.st_code = s.st_code JOIN PAY P ON O.order_no = P.order_no JOIN CUSTOMER C ON o.member_id = c.member_id JOIN order_detail od ON o.order_no = od.order_no JOIN orderoption oo ON od.oo_no = oo.oo_no JOIN menu m ON m.menu_code = od.menu_code JOIN optionprice op ON op.op_no = oo.op_no';
   vsql := vsql || '  WHERE order_no = :porder_no  ';    
   
     OPEN  vcursor FOR vsql USING porder_no;
     
     LOOP
      FETCH vcursor INTO vst_name, vst_address, vst_manager,vst_tel, vst_code, vpos,vpay_method, vcus_nickname,vcus_level,vorder_date,vorder_totalcost, vmenu_kor, vmember_id, vcus_tel, vpay_no, vmenu_cost, vmenu_count, voption_name, vop_no;
      
      DBMS_OUTPUT.PUT_LINE('��������������������������������������������������������������������������������������������������������������������');
      DBMS_OUTPUT.PUT_LINE( '                          STARBUCKS                           ');
      DBMS_OUTPUT.PUT_LINE( vst_name||'                                     T:'||vst_tel);
      DBMS_OUTPUT.PUT_LINE( vst_address);
      DBMS_OUTPUT.PUT_LINE( vst_manager);
      DBMS_OUTPUT.PUT_LINE( '����'||vst_code||','||vpos||'                                         '||vorder_date);
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      DBMS_OUTPUT.PUT_LINE('                           '|| vcus_nickname ||'                      ');
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      DBMS_OUTPUT.PUT_LINE(vmenu_kor||'    '|| vmenu_cost||'  '||vmenu_count);
      DBMS_OUTPUT.PUT_LINE(vop_no || voption_name);
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      DBMS_OUTPUT.PUT_LINE('�����ݾ�(�ΰ�������)'||'                                   '|| vorder_totalcost);
     
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      DBMS_OUTPUT.PUT_LINE('�� ��Ÿ���� ������' ||'('||vmember_id||')');
      DBMS_OUTPUT.PUT_LINE('*'||vcus_level||'����');
      DBMS_OUTPUT.PUT_LINE('*�湮��:1  �̺�Ʈ��:1  ����');
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      DBMS_OUTPUT.PUT_LINE('���ݿ����� �߱�'|| '                                     '||SUBSTR(vcus_tel,0,3)||'-****-'||SUBSTR(vcus_tel,-4,4));
      DBMS_OUTPUT.PUT_LINE('���αݾ�'|| '                                                '||vorder_totalcost);
      DBMS_OUTPUT.PUT_LINE('���ι�ȣ'|| '                                                '||vpay_no);
      DBMS_OUTPUT.PUT_LINE('                     ���ݿ����� ���� : 126-1-1                      ');
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��');
      DBMS_OUTPUT.PUT_LINE('               e-��ƼĿ�� ���� �� ��� ������ �����մϴ�.');
      DBMS_OUTPUT.PUT_LINE('                   �������� ������ �����Ͻ� ���忡��');
      DBMS_OUTPUT.PUT_LINE('                    �����ϸ�, �ݵ�� ���� ��������');
      DBMS_OUTPUT.PUT_LINE('                 ���ŷ� ���������� �����ϼž� �մϴ�.');
      DBMS_OUTPUT.PUT_LINE( '                                                              ');
      DBMS_OUTPUT.PUT_LINE( '                                                              ');
      DBMS_OUTPUT.PUT_LINE( '                       www.starbucks.co.kr                       ');
      DBMS_OUTPUT.PUT_LINE( '                     ???????????????????????????????????????             ');
      DBMS_OUTPUT.PUT_LINE( '                      *241913122206130579*             ');
      DBMS_OUTPUT.PUT_LINE('�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ');
      DBMS_OUTPUT.PUT_LINE( '                  Wi-fi SSID : KT_starbucks                       ');
      DBMS_OUTPUT.PUT_LINE( '                        ��й�ȣ : ����                       ');
      DBMS_OUTPUT.PUT_LINE( '               ���Ե� ��Ż翡 ������� ���� ��밡��                    ');
      DBMS_OUTPUT.PUT_LINE( '               KT�� ���� ������� �� ���� �� ��밡��                    ');
      
      EXIT WHEN vcursor%FOUND;
   END LOOP;
   
   CLOSE vcursor;
END; 
     


exec up_receipt(2);


