

CREATE OR REPLACE PROCEDURE up_menu01
(
  pcategory_code menu.category_code%type
)
IS
  vsql varchar2(1000);
  vrow menu%ROWTYPE;
  vcursor SYS_REFCURSOR; 
BEGIN
   vsql := 'SELECT * ';
   vsql := vsql || 'FROM menu ';
   vsql := vsql || 'WHERE category_code = :category_code ';


   OPEN  vcursor FOR vsql USING pcategory_code;
   
   
   LOOP
      FETCH vcursor INTO vrow;
      EXIT WHEN vcursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE( vrow.menu_kor );
      DBMS_OUTPUT.PUT_LINE( vrow.menu_eng );
       DBMS_OUTPUT.PUT_LINE( vrow.menu_cost||'원');
       DBMS_OUTPUT.PUT_LINE(' ');
   END LOOP;
   
   CLOSE vcursor;
END;


EXEC UP_MENU01( '에스프레소' );









