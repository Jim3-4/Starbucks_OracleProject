create or replace procedure up_logon
( pmember_id in customer.member_id%type 
     ,ppasswd in  customer.cus_passwd%type 
) 
is 
vpasswd customer.cus_passwd%type;
plogonCheck  number;  
begin
    select count(*) into  plogonCheck 
    from customer
    where member_id=pmember_id;
   
    if plogonCheck = 1 then 
        select cus_passwd into vpasswd
        from customer
        where member_id=pmember_id;
         
        
        if vpasswd=ppasswd then
        plogonCheck := 0; --로그인성공 
        dbms_output.put_line('로그인이 성공하였습니다.');
        else  --id 존재, 비밀번호x 
        plogonCheck:= -1; --로그인 실패 
        dbms_output.put_line('비밀번호가 일치하지않습니다.');
        end if;
else 
    plogonCheck := 1;
    dbms_output.put_line('아이디가 존재하지않습니다.');
    end if; 
end;


--실행 

begin
     up_logon('jimin',  'nachochip12'); 
end;
--로그인이 성공하였습니다.

begin
     up_logon('jismin',  'nachochip123'); 
end;
--아이디가 존재하지않습니다.

begin
     up_logon('jimin',  'nachochip123'); 
end;
--비밀번호가 일치하지않습니다.




