create or replace package scott.update_pack
as 
procedure update_info(pmember_id in customer.member_id%type ,
    pssn in   customer.cus_ssn%type := null,
    pemail in customer.cus_email%type := null,
    pcashreceipt in customer.cus_cashreceipt%type := null );
procedure update_info2(pmember_id in customer.member_id%type );
end update_pack;

--바디
CREATE OR REPLACE PACKAGE BODY UPDATE_PACK 
as
procedure update_info
(
    pmember_id in customer.member_id%type ,
    pssn in   customer.cus_ssn%type := null,
    pemail in customer.cus_email%type := null,
    pcashreceipt in customer.cus_cashreceipt%type := null
)
is 
vssn number;
vemail varchar(100);
vcashreceipt varchar2(100);
begin 

    if pssn is null or pemail is null or pcashreceipt is null then
    select cus_ssn,cus_email,cus_cashreceipt
    into  vssn,vemail,vcashreceipt
    from customer
    where member_id=pmember_id;
    end if;
    
    update customer 
    set cus_ssn=nvl(pssn, vssn),
        cus_email=nvl(pemail, vemail),
        cus_cashreceipt=nvl(pcashreceipt, vcashreceipt)
    where member_id=pmember_id;
end update_info;

procedure update_info2
(
    pmember_id in customer.member_id%type
)
is 
vmember_id  customer.member_id%type;
vname customer.cus_name%type;
vtel customer.cus_tel%type;
vssn customer.cus_ssn%type;
vemail customer.cus_email%type;
vcashreceipt customer.cus_cashreceipt%type;
begin 
    select rpad(substr(member_id,0,length(member_id)-2),length(member_id),'*')as member_id
    ,substr(cus_name,0,1)||'*'||substr(cus_name,3,1)as cus_name,
    lpad(substr(cus_ssn,3,4),length(cus_ssn)+1,'*') as cus_ssn,
    substr(cus_tel,0,3)||'****'||substr(cus_tel,7,4)as cus_tel,
    rpad(substr(cus_email,0,2),instr(cus_email,'@')-1,'*')
    ||substr(cus_email,instr(cus_email,'@')) as cus_email,
    substr(cus_cashreceipt,0,3)||'****'||substr(cus_cashreceipt,7,4)as cus_cashreceipt
    into vmember_id, vname,vssn,vtel,vemail,vcashreceipt
    from customer
    where member_id= pmember_id;
    dbms_output.put_line('아이디 : '||vmember_id);
    dbms_output.put_line('이름 : '||vname);
    dbms_output.put_line('생년월일 : '||vssn);
    dbms_output.put_line('전화번호 : '||vtel);
    dbms_output.put_line('이메일 : '||vemail);
    dbms_output.put_line('현금영수증 : '||vcashreceipt);
end update_info2;
end UPDATE_PACK;

--회원정보 가려서 출력
exec update_pack.update_info2('chaeyoung');

select *
from customer
where member_id='chaeyoung';

--회원정보 수정 
exec update_pack.update_info('chaeyoung','9505012','clote@naver.com','01011112222');

select *
from customer
where member_id='chaeyoung';