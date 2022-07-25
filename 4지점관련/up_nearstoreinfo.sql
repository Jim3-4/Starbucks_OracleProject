
CREATE OR REPLACE PROCEDURE up_nearstoreinfo
(
  pcusname customer.cus_name%type
)
IS
  vsql varchar2(1000);  
--  vcusname customer.cus_name%type;
  vst_name stores.st_name%type;
  vst_adr stores.st_address%type;
   vcursor SYS_REFCURSOR;
BEGIN
 vsql := 'SELECT st_name, st_address ';
   vsql := vsql || 'FROM customer c, stores s ';
   vsql := vsql || 'WHERE cus_latitude BETWEEN st_latitude-10 AND st_latitude+10
        AND cus_longitude BETWEEN st_longtitude-10 AND st_longtitude+10
        AND cus_name= :cus_name ORDER BY ABS((cus_latitude + cus_longitude)-(st_latitude + st_longtitude)) ';

     OPEN  vcursor FOR vsql USING pcusname;
   
   
   LOOP
      FETCH vcursor INTO vst_name, vst_adr;
      EXIT WHEN vcursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE( vst_name );
      DBMS_OUTPUT.PUT_LINE( vst_adr);
      
      DBMS_OUTPUT.PUT_LINE( ' ' );
   END LOOP;
   
   CLOSE vcursor;
END;



EXEC up_nearstoreinfo( '¹ÚÀç¿µ' );


