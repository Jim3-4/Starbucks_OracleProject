--메뉴수정
create or replace procedure modify_menu
(pMENU_CODE menu.MENU_CODE%type,
pMENU_D menu.MENU_D%type  := null,
pMENU_T menu.MENU_T%type  := null, 
pMENU_KOR menu.MENU_KOR%type  := null,
pMENU_ENG menu.MENU_ENG%type  := null,
pMENU_DATE menu.MENU_DATE%type  := null,
pMENU_COST menu.MENU_COST%type  := null,
pCATEGORY_CODE menu.CATEGORY_CODE%type  := null
)
is
vMENU_CODE menu.MENU_CODE%type;
vMENU_D menu.MENU_D%type;
vMENU_T menu.MENU_T%type; 
vMENU_KOR menu.MENU_KOR%type;
vMENU_ENG menu.MENU_ENG%type;
vMENU_DATE menu.MENU_DATE%type;
vMENU_COST menu.MENU_COST%type;
vCATEGORY_CODE menu.CATEGORY_CODE%type;
begin
if  pMENU_CODE is null or  pMENU_D is null or pMENU_T is null or pMENU_KOR is null or pMENU_ENG is null or pMENU_DATE is null or pMENU_COST is null or pCATEGORY_CODE is null then
    select MENU_CODE, MENU_D ,MENU_T, MENU_KOR , MENU_ENG ,MENU_DATE , MENU_COST , CATEGORY_CODE
    into  VMENU_CODE, VMENU_D ,VMENU_T, VMENU_KOR , VMENU_ENG ,VMENU_DATE , VMENU_COST , VCATEGORY_CODE
    from MENU
    where  MENU_CODE=PMENU_CODE;
    end if;
    
    update MENU
    set MENU_CODE=nvl(PMENU_CODE, VMENU_CODE),
    MENU_D=nvl(PMENU_D, VMENU_D),
    MENU_T=nvl(PMENU_T, VMENU_T),
    MENU_KOR=nvl(PMENU_KOR, VMENU_KOR),
    MENU_ENG=nvl(PMENU_ENG, VMENU_ENG),
    MENU_DATE=nvl(PMENU_DATE, VMENU_DATE),
    MENU_COST =nvl(PMENU_COST , VMENU_COST),
    CATEGORY_CODE=nvl(PCATEGORY_CODE, VCATEGORY_CODE)      
    where MENU_CODE=PMENU_CODE;
    COMMIT;
end;




exec MODIFY_MENU('N315',pMENU_D=>'달콤한 맛입니다.');

SELECT * FROM menu WHERE menu_code='N315';

