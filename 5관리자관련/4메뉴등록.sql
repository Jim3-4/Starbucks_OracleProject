--메뉴등록 
create or replace procedure update_menu
(pMENU_CODE menu.MENU_CODE%type,
pMENU_D menu.MENU_D%type,
pMENU_T menu.MENU_T%type, 
pMENU_KOR menu.MENU_KOR%type,
pMENU_ENG menu.MENU_ENG%type,
pMENU_DATE menu.MENU_DATE%type,
pMENU_COST menu.MENU_COST%type,
pCATEGORY_CODE menu.CATEGORY_CODE%type)
is 
begin
    insert into menu(MENU_CODE, MENU_D ,MENU_T, MENU_KOR , MENU_ENG ,MENU_DATE , MENU_COST , CATEGORY_CODE )
    values (pMENU_CODE, pMENU_D ,pMENU_T, pMENU_KOR , pMENU_ENG ,pMENU_DATE , pMENU_COST , pCATEGORY_CODE );
    COMMIT;
end;
exec update_menu('N315','프랑스산 고급 버터','	담백한 스콘입니다.', '클래식 스콘', 'Classic Scone','22/04/01',5500,'브레드');

SELECT * FROM menu WHERE menu_code='N315';