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
     dbms_output.put_line(vmember_id||' 님은 현재 '|| vlevel ||'입니다.');
    dbms_output.put_line('스타벅스에 대한 지속적인 사랑에 감사드리며,');
    dbms_output.put_line(vlevel ||'만의 특별한 혜택을 누려보세요.' );
end;
--실행
execute cus_level('jimin');

