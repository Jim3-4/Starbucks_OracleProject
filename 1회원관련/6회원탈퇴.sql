create or replace procedure del_member
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
        dbms_output.put_line('회원탈퇴가 되었습니다. ');
        
        delete from customer
        where member_id=pmember_id;
        
        else  --id 존재, 비밀번호x 
        plogonCheck:= -1; 
        dbms_output.put_line('비밀번호가 일치하지않습니다.');
        end if;
else 
    plogonCheck := 1;
    dbms_output.put_line('존재하지 않는 회원입니다.');
    end if; 
end;

select *
from customer;

exec del_member('안녕','ssjs');