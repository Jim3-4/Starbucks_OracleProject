
CREATE OR REPLACE PROCEDURE up_Prdmenu
(
  pmenu_kor menu.menu_kor%type
)
IS
  vsql varchar2(1000);  
  vmenu_kor menu.menu_kor%type;
  vmenu_eng menu.menu_eng%type;
  vmenu_d menu.menu_d%type;
  vmenu_t menu.menu_t%type;
  vmenu_cost menu.menu_cost%type;
  vpro_size product.pro_size%type;
  vpro_temp product.pro_temp%type;
  vpr_material product_info.pr_material%type;
  vpr_org product_info.pr_org%type;
  vpr_size product_info.pr_size%type;
  vpr_date product_info.pr_date%type;
  vpr_importer product_info.pr_importer%type;
  vpr_imp_txt product_info.pr_imp_txt%type;
  vpr_country product_info.pr_country%type;
  vpr_quality product_info.pr_quality%type;
  vpr_as product_info.pr_as%type;
  vmenu_imgpath menuimg.menu_imgpath%type;

BEGIN
  vsql :=  'SELECT menu_kor, menu_eng, menu_d, menu_t, menu_cost, menu_imgpath, pro_size, pro_temp, pr_material,  pr_org, pr_size, pr_date,  pr_importer, pr_imp_txt, pr_country, pr_quality, pr_as ';
  vsql :=  vsql || 'FROM menu m JOIN menuimg i ON m.menu_code = i.menu_code JOIN product p ON m.menu_code = p.menu_code JOIN product_info i ON m.menu_code = i.menu_code ';
  vsql :=  vsql ||  'WHERE m.menu_kor = :pmenu_kor ' ;

  EXECUTE IMMEDIATE vsql
                    INTO vmenu_kor, vmenu_eng, vmenu_d, vmenu_t, vmenu_cost, vmenu_imgpath, vpro_size, vpro_temp, vpr_material,  vpr_org, vpr_size, vpr_date, vpr_importer, vpr_imp_txt, vpr_country, vpr_quality, vpr_as  
                    USING pmenu_kor;

  DBMS_OUTPUT.PUT_LINE( vmenu_imgpath );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_kor);
  DBMS_OUTPUT.PUT_LINE( vmenu_eng );
  DBMS_OUTPUT.PUT_LINE( vmenu_d );
  DBMS_OUTPUT.PUT_LINE( vmenu_t );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_cost || '��');
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '��ǰ ����' );
  DBMS_OUTPUT.PUT_LINE( '�Ǹ� ������: ' || vpro_size );
  DBMS_OUTPUT.PUT_LINE( '��� ���� �µ�: ' || vpro_temp );
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '��ǰ ���� ���� ���' );
  DBMS_OUTPUT.PUT_LINE( '����: ' || vpr_material );
  DBMS_OUTPUT.PUT_LINE( '����ǰ: ' || vpr_org );
  DBMS_OUTPUT.PUT_LINE( 'ũ��: ' || vpr_size );
  DBMS_OUTPUT.PUT_LINE( '���ϸ��� ��ó��: ' || vpr_date );
  DBMS_OUTPUT.PUT_LINE( '������/������: ' || vpr_importer );
  DBMS_OUTPUT.PUT_LINE( '���Խ�ǰ �������� Ư������ ���� ���Աⱸ ����� ��� ���Խ�ǰ �������� Ư������ ���� ���ԽŰ� ������ ����: ' || vpr_imp_txt );
  DBMS_OUTPUT.PUT_LINE( '������: ' || vpr_country );
  DBMS_OUTPUT.PUT_LINE( 'ǰ����������: ' || vpr_quality );
  DBMS_OUTPUT.PUT_LINE( 'A/S å���ڿ� ��ȭ��ȣ: ' || vpr_as );
        

-- EXCEPTION
END;



EXEC up_Prdmenu( '���帶ũ ������ �ӱ� 237ml' );


