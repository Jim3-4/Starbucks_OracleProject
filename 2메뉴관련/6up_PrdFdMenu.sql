
CREATE OR REPLACE PROCEDURE up_PrdFdMenu
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
  vFD_ORIGIN fdproduct_info.fd_origin%type;
vFD_T fdproduct_info.fd_t%type;
vFD_ROAST fdproduct_info.fd_roast%type;
vFD_BODY fdproduct_info.fd_body%type;
vFD_SOUR fdproduct_info.fd_sour%type;
vFD_PROCESS fdproduct_info.fd_process%type;
vFD_ENJOY fdproduct_info.fd_enjoy%type;
vFD_TEMP fdproduct_info.fd_temp%type;
vFD_TYPE fdproduct_info.fd_type%type;
vFD_AREA fdproduct_info.fd_area%type;
vFD_IMPORT fdproduct_info.fd_import%type;
vFD_EXP fdproduct_info.fd_exp%type;
vFD_PRD fdproduct_info.fd_prd%type;
vFD_DATE fdproduct_info.fd_date%type;
vFD_PACKSIZE fdproduct_info.fd_packsize%type;
vFD_MATERIAL fdproduct_info.fd_material%type;
vFD_NU_TF fdproduct_info.fd_nu_tf%type;
vFD_NU fdproduct_info.fd_nu%type;
vFD_GENE fdproduct_info.fd_gene%type;
vFD_CAUTION fdproduct_info.fd_caution%type;
vFD_CUSTEL fdproduct_info.fd_custel%type;
vFD_SAFETY fdproduct_info.fd_safety%type;
  vmenu_imgpath menuimg.menu_imgpath%type;
  
  
BEGIN
  vsql :=  'SELECT menu_kor, menu_eng, menu_d, menu_t, menu_cost, menu_imgpath, pro_size, pro_temp, FD_ORIGIN, FD_T, FD_ROAST, FD_BODY, FD_SOUR,FD_PROCESS,FD_ENJOY,FD_TEMP,FD_TYPE,FD_AREA,FD_IMPORT,FD_EXP,FD_PRD,FD_DATE,FD_PACKSIZE,FD_MATERIAL,FD_NU_TF,FD_NU,FD_GENE,FD_CAUTION,FD_CUSTEL,FD_SAFETY ';
  vsql :=  vsql || 'FROM menu m JOIN menuimg i ON m.menu_code = i.menu_code JOIN product p ON m.menu_code = p.menu_code JOIN fdproduct_info f ON m.menu_code = f.menu_code ';
  vsql :=  vsql ||  'WHERE m.menu_kor = :pmenu_kor ' ;

  EXECUTE IMMEDIATE vsql
                    INTO vmenu_kor, vmenu_eng, vmenu_d, vmenu_t, vmenu_cost, vmenu_imgpath, vpro_size, vpro_temp, vFD_ORIGIN, vFD_T, vFD_ROAST, vFD_BODY, vFD_SOUR, vFD_PROCESS, vFD_ENJOY, vFD_TEMP, vFD_TYPE, vFD_AREA, vFD_IMPORT, vFD_EXP, vFD_PRD, vFD_DATE, vFD_PACKSIZE, vFD_MATERIAL, vFD_NU_TF, vFD_NU, vFD_GENE, vFD_CAUTION, vFD_CUSTEL, vFD_SAFETY 
                    USING pmenu_kor;

  DBMS_OUTPUT.PUT_LINE( vmenu_imgpath );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_kor);
  DBMS_OUTPUT.PUT_LINE( vmenu_eng );
  DBMS_OUTPUT.PUT_LINE( vFD_ROAST || '   �ٵ� ' || RPAD(vfd_body, 5, '��')  || '   ��� ' || RPAD(vfd_sour, 5, '��'));
  DBMS_OUTPUT.PUT_LINE( vmenu_d );
  DBMS_OUTPUT.PUT_LINE( vmenu_t );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_cost || '��');
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( 'Ŀ�� ������' );
  DBMS_OUTPUT.PUT_LINE( '������: ' || vFD_ORIGIN );
  DBMS_OUTPUT.PUT_LINE( '�������: ' || vFD_process );
  DBMS_OUTPUT.PUT_LINE( 'Enjoy With: ' || vfd_enjoy );
  
  DBMS_OUTPUT.PUT_LINE( '��ǰ ����' );
  DBMS_OUTPUT.PUT_LINE( '�Ǹ� ������: ' || vpro_size );
  DBMS_OUTPUT.PUT_LINE( '��� ���� �µ�: ' || vpro_temp );
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '��ǰ�� ����: ' || vfd_type );
  DBMS_OUTPUT.PUT_LINE( '������ �� ������: ' || vfd_area );
  DBMS_OUTPUT.PUT_LINE( '���Կ��ο� ������: ' || vfd_import );
  DBMS_OUTPUT.PUT_LINE( '�������: ' || vfd_exp );
  DBMS_OUTPUT.PUT_LINE( '���������: ' || vfd_date );
  DBMS_OUTPUT.PUT_LINE( '��������� ���빰�� �뷮(�߷�), ����, ũ��: ' || vfd_packsize );
  DBMS_OUTPUT.PUT_LINE( '�ֿ���/�Է�(���������): ' || vfd_material );
  DBMS_OUTPUT.PUT_LINE( '���缺��ǥ�ô�󿩺�: ' || vfd_nu_tf );
  DBMS_OUTPUT.PUT_LINE( '���缺��: ' || vfd_nu );
  DBMS_OUTPUT.PUT_LINE( '������ ������ǰ ���ο� ���Գ���: ' || vfd_gene );
  DBMS_OUTPUT.PUT_LINE( '����� �� ���ǻ���: ' || vfd_caution );
  DBMS_OUTPUT.PUT_LINE( '�Һ��� ��� ���� ��ȭ��ȣ: ' || vfd_custel );
  DBMS_OUTPUT.PUT_LINE( '���Խ�ǰ��������Ư������ ���� ���ԽŰ� ���� ����: ' || vfd_safety );

-- EXCEPTION
END;




EXEC up_PrdFdMenu( '��� ���̽� Ŀ�� 5����' );


