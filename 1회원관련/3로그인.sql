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
        plogonCheck := 0; --�α��μ��� 
        dbms_output.put_line('�α����� �����Ͽ����ϴ�.');
        else  --id ����, ��й�ȣx 
        plogonCheck:= -1; --�α��� ���� 
        dbms_output.put_line('��й�ȣ�� ��ġ�����ʽ��ϴ�.');
        end if;
else 
    plogonCheck := 1;
    dbms_output.put_line('���̵� ���������ʽ��ϴ�.');
    end if; 
end;


--���� 

begin
     up_logon('jimin',  'nachochip12'); 
end;
--�α����� �����Ͽ����ϴ�.

begin
     up_logon('jismin',  'nachochip123'); 
end;
--���̵� ���������ʽ��ϴ�.

begin
     up_logon('jimin',  'nachochip123'); 
end;
--��й�ȣ�� ��ġ�����ʽ��ϴ�.




