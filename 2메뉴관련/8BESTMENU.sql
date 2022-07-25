
CREATE OR REPLACE PROCEDURE BESTMENU
IS
    CURSOR vcurt IS ( select t.menu_kor, t.menu_eng, t.menu_cost
        from (SELECT COUNT(o.menu_code) ordernum,  menu_kor, menu_eng, menu_cost
        FROM menu m JOIN order_detail o ON m.menu_code = o.menu_code
        group by o.menu_code, menu_kor, menu_eng, menu_cost) t
        where t.ordernum >2 );

  vmenu_kor menu.menu_kor%type;
  vmenu_eng menu.menu_eng%type;
  vmenu_cost menu.menu_cost%type; 
  
BEGIN
    OPEN vcurt;
    
    LOOP
        FETCH vcurt INTO vmenu_kor, vmenu_eng, vmenu_cost;
        EXIT WHEN vcurt%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(vmenu_kor || ' | ' || vmenu_eng || ' | ' || vmenu_cost || '¿ø');
    END LOOP;
    
    CLOSE vcurt;
--EXCEPTION
END;

EXEC BESTMENU;

