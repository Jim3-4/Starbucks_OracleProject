-------------ȸ�����������-----------------
create or replace procedure cus_profile(
    pmember_id in customer.member_id%type
)
is 
   vmember_id  customer.member_id%type;
   vname customer.cus_name%type;
   vssn varchar(20);
   vtel customer.cus_tel%type;
   vemail customer.cus_email%type;
   vnickname customer.cus_nickname%type;
   vlevel customer.cus_level%type;
   vstar customer.cus_star%type;
    vaddress customer.cus_adr%type;
   vlatitude customer.cus_latitude%type;
   vlongitude customer.cus_longitude%type;
   vcar customer.cus_car_no%type;
   vempno customer.cus_emp_no%type;
begin
select rpad(concat(concat(substr(cus_ssn,0,6),'-'),substr(cus_ssn,7,1)),14,'******')
into vssn
from customer
where member_id=pmember_id;
    select member_id, cus_name,
    cus_tel,cus_email,cus_nickname,cus_level,cus_star, cus_adr,
    cus_latitude,cus_longitude,cus_car_no,cus_emp_no
    into vmember_id, vname,
    vtel,vemail,vnickname,vlevel,vstar, vaddress,
    vlatitude,vlongitude,vcar,vempno
    from customer
    where member_id= pmember_id;
    dbms_output.put_line('���̵� : '||vmember_id);
    dbms_output.put_line('�̸� : '||vname);
    dbms_output.put_line('�ֹι�ȣ : '||vssn);
    dbms_output.put_line('��ȭ��ȣ : '||vtel);
    dbms_output.put_line('�̸��� : '||vemail);
    dbms_output.put_line('�г��� : '||vnickname);
    dbms_output.put_line('���� : '||vlevel);
    dbms_output.put_line('�� ���� : '||vstar);
    dbms_output.put_line('�ּ� : '||vaddress);
    dbms_output.put_line('���� : '||vlatitude);
    dbms_output.put_line('�浵 : '||vlongitude);
    dbms_output.put_line('��������ȣ : '||vcar);
    dbms_output.put_line('���������ȣ : '||vempno);
 
end;

execute cus_profile('jimin');


