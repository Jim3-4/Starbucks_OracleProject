--ȸ������
create or replace procedure join_member
(
   pmember_id in customer.member_id%type
   ,ppwd in customer.cus_passwd%type
   ,ppwd_check in customer.cus_passwd%type
) 
is
vidCheck  number;  
vpwdCheck  number; 
begin
    select count(*) into vidcheck
    from customer
    where member_id=pmember_id;   
    if vidcheck = 1 then 
        dbms_output.put_line('���̵� �����մϴ�.');
    else --���̵� �ߺ����ϸ� 
        if (length(pmember_id) not between 4 and 13) or (length(ppwd) not between 10 and 20) then
            if length(pmember_id) not between 4 and 13 then 
            dbms_output.put_line('���̵��Ŀ� �°� �Է����ּ���.');
            elsif length(ppwd) not between 10 and 20 then 
            dbms_output.put_line('��й�ȣ��Ŀ� �°� �Է����ּ���.');
            else 
            dbms_output.put_line('��й�ȣ�� ���� ��ġ���� �ʽ��ϴ�.');
            end if;         
        else  --����� �´´ٸ� 
           if ppwd=ppwd_check then dbms_output.put_line('ȸ�������� �Ϸ�Ǿ����ϴ�.');
             insert into customer(member_id,cus_passwd) values (pmember_id,ppwd);
            end if;
            end if;
        end if;
end;

--�����ڿ��� ȸ������ �Ұ� 
--���̵��Ŀ� �°� �Է����ּ���.
exec JOIN_MEMBER('��sť','bbq','bhc');

--��й�ȣ��Ŀ� �°� �Է����ּ���.
exec JOIN_MEMBER('abcabe','abc','abc');

--ȸ�������� �Ϸ�Ǿ����ϴ�.
exec JOIN_MEMBER('abcabe','abcasdasda','abcasdasda');

select * from customer where member_id='abcabe';


--���̵� �����մϴ�.
exec JOIN_MEMBER('abcabe','abc','abc');



