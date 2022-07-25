
CREATE OR REPLACE PROCEDURE up_MenuSearch
(
  pmenu_kor menu.menu_kor%type
)
IS
  vksql varchar2(1000);
  vkrow menu%ROWTYPE;
  vkcursor SYS_REFCURSOR; 
BEGIN
   vksql := 'SELECT * ';
   vksql := vksql || 'FROM menu ';
   vksql := vksql || 'WHERE menu_kor LIKE ''%''||:menu_kor||''%''';

   OPEN  vkcursor FOR vksql USING pmenu_kor;
   
   LOOP
      FETCH vkcursor INTO vkrow;
      EXIT WHEN vkcursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE( vkrow.menu_kor );
      DBMS_OUTPUT.PUT_LINE( vkrow.menu_eng );
      DBMS_OUTPUT.PUT_LINE( vkrow.menu_cost||'¿ø' );
      DBMS_OUTPUT.PUT_LINE( ' ' );
   END LOOP;
   
   CLOSE vkcursor;
END;



EXEC up_MenuSearch( '¶ó¶¼' );


