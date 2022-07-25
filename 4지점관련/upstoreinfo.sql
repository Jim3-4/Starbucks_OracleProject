
CREATE OR REPLACE PROCEDURE upstoreinfo
(
  pst_name stores.st_name%type
)
IS
  vsql varchar2(1000);
  vcursor SYS_REFCURSOR;  
  vst_d stores.st_d%type;
  vSTORE_IMGPATH store_img.store_imgpath%type;
  vst_name stores.st_name%type;
  vst_adr stores.st_address%type;
  vst_tel stores.st_tel%type;
  vst_way stores.st_way%type;
  vst_parking stores.st_parking%type;
  VOH_MONO openinghours.oh_mono%type;
  VOH_MONC openinghours.oh_monc%type;
  VOH_TUEO openinghours.oh_tueo%type;
  VOH_TUEC openinghours.oh_tuec%type;
  VOH_WEDO openinghours.oh_wedo%type;
  VOH_WEDC openinghours.oh_wedc%type;
  VOH_THUO openinghours.oh_thuo%type;
  VOH_THUC openinghours.oh_thuc%type;
  VOH_FRIO openinghours.oh_frio%type;
  VOH_FRIC openinghours.oh_fric%type;
  VOH_SATO openinghours.oh_sato%type;
  VOH_SATC openinghours.oh_satc%type;
  VOH_SUNO openinghours.oh_suno%type;
  VOH_SUNC openinghours.oh_sunc%type;
  vloctype locates.loc_type%type;
    
BEGIN
  vsql :=  'SELECT st_d, STORE_IMGPATH, st_name,  st_address, st_tel, st_way, st_parking,  OH_MONO, OH_MONC, OH_TUEO,  OH_TUEC , OH_WEDO,  OH_WEDC , OH_THUO, OH_THUC, OH_FRIO, OH_FRIC, OH_SATO, OH_SATC, OH_SUNO, OH_SUNC, loc_type ';
  vsql :=  vsql || 'FROM stores s JOIN store_img i ON s.st_code = i.st_code JOIN openinghours o ON s.st_code = o.st_code JOIN LOCATES l ON s.st_code = l.st_code ';
  vsql :=  vsql ||  'WHERE s.st_name = :pst_name ' ;


 OPEN  vcursor FOR vsql USING pst_name;

    LOOP
    FETCH vcursor INTO vst_d, vSTORE_IMGPATH, vst_name, vst_adr, vst_tel, vst_way, vst_parking,  VOH_MONO, VOH_MONC,VOH_TUEO, VOH_TUEC , VOH_WEDO,  VOH_WEDC , VOH_THUO, VOH_THUC, VOH_FRIO, VOH_FRIC, VOH_SATO, VOH_SATC, VOH_SUNO, VOH_SUNC, vloctype ;
    EXIT WHEN vcursor%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE( vst_d );
  DBMS_OUTPUT.PUT_LINE( '--------------------------------------------');
  DBMS_OUTPUT.PUT_LINE( vSTORE_IMGPATH );
  DBMS_OUTPUT.PUT_LINE( '--------------------------------------------');
  DBMS_OUTPUT.PUT_LINE( vst_name );
  DBMS_OUTPUT.PUT_LINE( '--------------------------------------------');
  DBMS_OUTPUT.PUT_LINE( '월요일 '|| VOH_MONO || '~' || VOH_MONC );
  DBMS_OUTPUT.PUT_LINE( '화요일 '|| VOH_TUEO || '~' || VOH_TUEC );
  DBMS_OUTPUT.PUT_LINE( '수요일 '|| VOH_WEDO || '~' || VOH_WEDC );
  DBMS_OUTPUT.PUT_LINE( '목요일 '|| VOH_THUO || '~' || VOH_THUC );
  DBMS_OUTPUT.PUT_LINE( '금요일 '|| VOH_FRIO || '~' || VOH_FRIC );
  DBMS_OUTPUT.PUT_LINE( '토요일 '|| VOH_SATO || '~' || VOH_SATC );
  DBMS_OUTPUT.PUT_LINE( '일요일 '|| VOH_SUNO || '~' || VOH_SUNC );
  DBMS_OUTPUT.PUT_LINE( '--------------------------------------------');
  DBMS_OUTPUT.PUT_LINE( '매장주소     ' ||  vst_adr);
  DBMS_OUTPUT.PUT_LINE( '전화번호     ' ||  vst_tel);
  DBMS_OUTPUT.PUT_LINE( '위치 및 시설 ' ||  vloctype);
  DBMS_OUTPUT.PUT_LINE( '주차정보     ' ||  vst_parking);
  DBMS_OUTPUT.PUT_LINE( '오시는 길    ' ||  vst_way);
  DBMS_OUTPUT.PUT_LINE( ' ' );
  
     END LOOP;
   
   CLOSE vcursor;
  
END;



EXEC upstoreinfo( '스타벅스 별다방점' );




