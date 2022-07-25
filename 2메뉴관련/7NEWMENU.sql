
CREATE OR REPLACE PROCEDURE NEWMENU
IS
    CURSOR vcurt IS ( SELECT menu_kor, menu_eng, menu_cost, sub FROM menu m JOIN categories c ON m.category_code = c.category_code where menu_date>sysdate-60 AND sub='»óÇ°');
    vmenu_kor menu.menu_kor%TYPE;
    vmenu_eng menu.menu_eng%TYPE;
    vmenu_cost menu.menu_cost%TYPE;
    vsub categories.sub%TYPE;
BEGIN
    OPEN vcurt;
    
    LOOP
        FETCH vcurt INTO vmenu_kor, vmenu_eng, vmenu_cost, vsub ;
        EXIT WHEN vcurt%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(vmenu_kor || ' | ' || vmenu_eng || ' | ' || vmenu_cost || '¿ø');
    END LOOP;
    
    CLOSE vcurt;
--EXCEPTION
END;

EXECUTE NEWMENU;
