create or replace procedure cus_level(
    pmember_id in customer.member_id%type
)
is 
   vmember_id  customer.member_id%type;
   vstar customer.cus_star%type;
   vlevel customer.cus_level%type;
begin
    select member_id, cus_star, cus_level
    into vmember_id, vstar,vlevel
    from customer
    where member_id= pmember_id;
     dbms_output.put_line(vstar);
     dbms_output.put_line(vmember_id||' ���� ���� '|| vlevel ||'�Դϴ�.');
    dbms_output.put_line('��Ÿ������ ���� �������� ����� ����帮��,');
    dbms_output.put_line(vlevel ||'���� Ư���� ������ ����������.' );
end;
--����
execute cus_level('jimin');

