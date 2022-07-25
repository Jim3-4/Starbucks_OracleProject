-------------회원프로필출력-----------------
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
    dbms_output.put_line('아이디 : '||vmember_id);
    dbms_output.put_line('이름 : '||vname);
    dbms_output.put_line('주민번호 : '||vssn);
    dbms_output.put_line('전화번호 : '||vtel);
    dbms_output.put_line('이메일 : '||vemail);
    dbms_output.put_line('닉네임 : '||vnickname);
    dbms_output.put_line('레벨 : '||vlevel);
    dbms_output.put_line('별 갯수 : '||vstar);
    dbms_output.put_line('주소 : '||vaddress);
    dbms_output.put_line('위도 : '||vlatitude);
    dbms_output.put_line('경도 : '||vlongitude);
    dbms_output.put_line('고객차량번호 : '||vcar);
    dbms_output.put_line('담당직원번호 : '||vempno);
 
end;

execute cus_profile('jimin');


