
CREATE OR REPLACE PROCEDURE up_FdBevMenu
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
  vcarbohydrate foodbev.carbohydrate%type;
  vcalorie foodbev.calorie%type;
  vsugar foodbev.sugar%type;
  vnatrium foodbev.natrium%type;
  vprotein foodbev.protein%type;
  vfat foodbev.fat%type;
  vcholesterol foodbev.cholesterol%type;
  vsaturated_fat foodbev.saturated_fat%type;
  vcaffeine foodbev.caffeine%type;
  vtrans_fat foodbev.trans_fat%type;
  vmenu_imgpath menuimg.menu_imgpath%type;
  vallergy allergy.allergy_cause%type;
  
BEGIN
  vsql :=  'SELECT menu_kor, menu_eng, menu_d, menu_t, menu_cost, menu_imgpath, allergy_cause, carbohydrate, calorie, sugar, natrium, protein, fat, cholesterol, saturated_fat, caffeine, trans_fat ';
  vsql :=  vsql || 'FROM menu m JOIN menuimg i ON m.menu_code = i.menu_code JOIN allergy a ON m.menu_code = a.menu_code JOIN foodbev f ON m.menu_code = f.menu_code ';
  vsql :=  vsql ||  'WHERE m.menu_kor = :pmenu_kor ' ;

  EXECUTE IMMEDIATE vsql
                    INTO vmenu_kor, vmenu_eng, vmenu_d, vmenu_t, vmenu_cost, vmenu_imgpath, vallergy, vcarbohydrate, vcalorie, vsugar, vnatrium,  vprotein, vfat, vcholesterol, vsaturated_fat, vcaffeine, vtrans_fat
                    USING pmenu_kor;

  DBMS_OUTPUT.PUT_LINE( vmenu_imgpath );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_kor);
  DBMS_OUTPUT.PUT_LINE( vmenu_eng );
  DBMS_OUTPUT.PUT_LINE( vmenu_d );
  DBMS_OUTPUT.PUT_LINE( vmenu_cost || '��');
  
  DBMS_OUTPUT.PUT_LINE( vmenu_t );
  

  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '��ǰ ���� ����' );
  DBMS_OUTPUT.PUT_LINE( 'ź��ȭ��: ' || vcarbohydrate );
  DBMS_OUTPUT.PUT_LINE( 'Į�θ�: ' || vcalorie );
  DBMS_OUTPUT.PUT_LINE( '���: ' || vsugar );
  DBMS_OUTPUT.PUT_LINE( '��Ʈ��: ' || vnatrium );
  DBMS_OUTPUT.PUT_LINE( '�ܹ���: ' || vprotein );
  DBMS_OUTPUT.PUT_LINE( '����: ' || vfat );
  DBMS_OUTPUT.PUT_LINE( '�ݷ����׷�: ' || vcholesterol );
  DBMS_OUTPUT.PUT_LINE( '��ȭ����: ' || vsaturated_fat );
  DBMS_OUTPUT.PUT_LINE( 'Ʈ��������: ' || vtrans_fat );
  DBMS_OUTPUT.PUT_LINE( 'ī����: ' || vcaffeine );
  DBMS_OUTPUT.PUT_LINE( '�˷����� ���� ����: ' || vallergy );
        

-- EXCEPTION
END;



EXEC up_FdBevMenu( '���̽� ī�� ��' );