
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
  DBMS_OUTPUT.PUT_LINE( vFD_ROAST || '   바디 ' || RPAD(vfd_body, 5, '○')  || '   산미 ' || RPAD(vfd_sour, 5, '○'));
  DBMS_OUTPUT.PUT_LINE( vmenu_d );
  DBMS_OUTPUT.PUT_LINE( vmenu_t );
  
  DBMS_OUTPUT.PUT_LINE( vmenu_cost || '원');
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '커피 프로필' );
  DBMS_OUTPUT.PUT_LINE( '원산지: ' || vFD_ORIGIN );
  DBMS_OUTPUT.PUT_LINE( '가공방식: ' || vFD_process );
  DBMS_OUTPUT.PUT_LINE( 'Enjoy With: ' || vfd_enjoy );
  
  DBMS_OUTPUT.PUT_LINE( '상품 설명' );
  DBMS_OUTPUT.PUT_LINE( '판매 사이즈: ' || vpro_size );
  DBMS_OUTPUT.PUT_LINE( '사용 가능 온도: ' || vpro_temp );
  
  DBMS_OUTPUT.PUT_LINE(  ' ');
  DBMS_OUTPUT.PUT_LINE( '식품의 유형: ' || vfd_type );
  DBMS_OUTPUT.PUT_LINE( '생산자 및 소재지: ' || vfd_area );
  DBMS_OUTPUT.PUT_LINE( '수입여부와 수입자: ' || vfd_import );
  DBMS_OUTPUT.PUT_LINE( '유통기한: ' || vfd_exp );
  DBMS_OUTPUT.PUT_LINE( '제조년월일: ' || vfd_date );
  DBMS_OUTPUT.PUT_LINE( '포장단위별 내용물의 용량(중량), 수량, 크기: ' || vfd_packsize );
  DBMS_OUTPUT.PUT_LINE( '주원료/함량(원료원산지): ' || vfd_material );
  DBMS_OUTPUT.PUT_LINE( '영양성분표시대상여부: ' || vfd_nu_tf );
  DBMS_OUTPUT.PUT_LINE( '영양성분: ' || vfd_nu );
  DBMS_OUTPUT.PUT_LINE( '유전자 변형식품 여부와 포함내역: ' || vfd_gene );
  DBMS_OUTPUT.PUT_LINE( '사용할 때 주의사항: ' || vfd_caution );
  DBMS_OUTPUT.PUT_LINE( '소비자 상담 관련 전화번호: ' || vfd_custel );
  DBMS_OUTPUT.PUT_LINE( '수입식품안전관리특별법에 따른 수입신고 필함 여부: ' || vfd_safety );

-- EXCEPTION
END;




EXEC up_PrdFdMenu( '비아 아이스 커피 5개입' );


