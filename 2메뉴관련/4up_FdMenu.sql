
CREATE OR REPLACE PROCEDURE up_FdMenu
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
  
  vFOOD_TYPE food_info.food_type%type;
  vFOOD_ORIGIN food_info.food_origin%type;
  vFOOD_IMPORT food_info.food_import%type;
  vFOOD_EXP food_info.food_exp%type;
  vFOOD_PRD food_info.food_prd%type;
  vFOOD_PACKSIZE food_info.food_packsize%type;
  vFOOD_MATERIAL food_info.food_material%type;
  vFOOD_NU_TF food_info.food_nu_tf%type;
  vFOOD_NU food_info.food_nu%type;
  vFOOD_GENE food_info.food_gene%type;
  vFOOD_CAUTION food_info.food_caution%type;
  vFOOD_TEL food_info.food_tel%type;
  vFOOD_SAFETY food_info.food_safety%type;
  
BEGIN
  vsql :=  'SELECT menu_kor, menu_eng, menu_d, menu_t, menu_cost, menu_imgpath, allergy_cause, carbohydrate, calorie, sugar, natrium, protein, fat, cholesterol, saturated_fat, caffeine, trans_fat, FOOD_TYPE, FOOD_ORIGIN, FOOD_IMPORT, FOOD_EXP, FOOD_PRD, FOOD_PACKSIZE, FOOD_MATERIAL, FOOD_NU_TF, FOOD_NU, FOOD_GENE, FOOD_CAUTION, FOOD_TEL, FOOD_SAFETY ';
  vsql :=  vsql || 'FROM menu m JOIN menuimg i ON m.menu_code = i.menu_code JOIN allergy a ON m.menu_code = a.menu_code JOIN foodbev f ON m.menu_code = f.menu_code JOIN food_info x ON m.menu_code = x.menu_code ';
  vsql :=  vsql ||  'WHERE m.menu_kor = :pmenu_kor ' ;

  EXECUTE IMMEDIATE vsql
                    INTO vmenu_kor, vmenu_eng, vmenu_d, vmenu_t, vmenu_cost, vmenu_imgpath, vallergy, vcarbohydrate, vcalorie, vsugar, vnatrium,  vprotein, vfat, vcholesterol, vsaturated_fat, vcaffeine, vtrans_fat, vFOOD_TYPE, vFOOD_ORIGIN, vFOOD_IMPORT, vFOOD_EXP, vFOOD_PRD, vFOOD_PACKSIZE, vFOOD_MATERIAL, vFOOD_NU_TF, vFOOD_NU, vFOOD_GENE, vFOOD_CAUTION, vFOOD_TEL, vFOOD_SAFETY 
                    USING pmenu_kor;

  DBMS_OUTPUT.PUT_LINE( vmenu_imgpath );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_kor);
  DBMS_OUTPUT.PUT_LINE( vmenu_eng );
  DBMS_OUTPUT.PUT_LINE( vmenu_d );
  DBMS_OUTPUT.PUT_LINE( vmenu_t );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_cost || '원');
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '제품 영양 정보' );
  DBMS_OUTPUT.PUT_LINE( '탄수화물: ' || vcarbohydrate );
  DBMS_OUTPUT.PUT_LINE( '칼로리: ' || vcalorie );
  DBMS_OUTPUT.PUT_LINE( '당류: ' || vsugar );
  DBMS_OUTPUT.PUT_LINE( '나트륨: ' || vnatrium );
  DBMS_OUTPUT.PUT_LINE( '단백질: ' || vprotein );
  DBMS_OUTPUT.PUT_LINE( '지방: ' || vfat );
  DBMS_OUTPUT.PUT_LINE( '콜레스테롤: ' || vcholesterol );
  DBMS_OUTPUT.PUT_LINE( '포화지방: ' || vsaturated_fat );
  DBMS_OUTPUT.PUT_LINE( '트랜스지방: ' || vtrans_fat );
  DBMS_OUTPUT.PUT_LINE( '카페인: ' || vcaffeine );
  DBMS_OUTPUT.PUT_LINE( '알레르기 유발 요인: ' || vallergy );
  
  DBMS_OUTPUT.PUT_LINE( '식품의 유형: ' || vFOOD_TYPE );
  DBMS_OUTPUT.PUT_LINE( '생산자 및 소재지: ' || vFOOD_ORIGIN );
  DBMS_OUTPUT.PUT_LINE( '수입여부와 수입자: ' || vfood_import );
  DBMS_OUTPUT.PUT_LINE( '유통기한: ' || vfood_exp );
  DBMS_OUTPUT.PUT_LINE( '제조년월일: ' || vfood_prd );
  DBMS_OUTPUT.PUT_LINE( '포장단위별 내용물의 용량(중량), 수량, 크기: ' || vfood_packsize );
  DBMS_OUTPUT.PUT_LINE( '주원료/함량(원료원산지): ' || vfood_material );
  DBMS_OUTPUT.PUT_LINE( '영양성분표시대상여부: ' || vfood_nu_tf );
  DBMS_OUTPUT.PUT_LINE( '영양성분: ' || vfood_nu );
  DBMS_OUTPUT.PUT_LINE( '유전자 변형식품 여부와 포함내역: ' || vfood_gene );
  DBMS_OUTPUT.PUT_LINE( '사용할 때 주의사항: ' || vfood_caution );
  DBMS_OUTPUT.PUT_LINE( '소비자 상담 관련 전화번호: ' || vfood_tel );
  DBMS_OUTPUT.PUT_LINE( '수입식품안전관리특별법에 따른 수입신고 필함 여부: ' || vfood_safety );
        

-- EXCEPTION
END;



EXEC up_FdMenu( '트리플 치즈 크로크무슈' );
