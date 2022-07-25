--메뉴삭제 
create or replace procedure delete_menu
(pMENU_CODE menu.MENU_CODE%type)
is 
begin
    delete from menu where menu_code=pmenu_code;
    COMMIT;
end;

exec delete_menu('N315');

SELECT * FROM menu WHERE menu_code='N315';

