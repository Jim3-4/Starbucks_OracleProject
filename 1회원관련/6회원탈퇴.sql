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
        plogonCheck := 0; --�α��μ��� 
        dbms_output.put_line('ȸ��Ż�� �Ǿ����ϴ�. ');
        
        delete from customer
        where member_id=pmember_id;
        
        else  --id ����, ��й�ȣx 
        plogonCheck:= -1; 
        dbms_output.put_line('��й�ȣ�� ��ġ�����ʽ��ϴ�.');
        end if;
else 
    plogonCheck := 1;
    dbms_output.put_line('�������� �ʴ� ȸ���Դϴ�.');
    end if; 
end;

select *
from customer;

exec del_member('�ȳ�','ssjs');