--�������������� ���� ���ǿ���, �Ż������� �Է¹ް� ������ ������ȣ ���� 
--���ε庯������ 
var ocode number;

create or replace procedure info (
   pok in varchar2,
   pname in varchar2,
   pssn in varchar2,
   ptel in varchar2,
   rcode out number
)
is
vcode number;
begin
dbms_output.put_line('����Ȯ���� ���� ������ ������ �ּ���.');
if pok='����'then
select substr(ltrim( ltrim(dbms_random.value, '0.'),'0'),0,6)
  into vcode from dual; 
    rcode := vcode;
end if;
end;

--���� 
exec info('����','������','980304','010-0000-0000' ,:ocode);

--�����ڵ� ��� 
print ocode;

--�����ڵ�� ��ġ�ϴ� �� Ȯ�� 
create or replace procedure auth_check (
    authen_send number, --����������ȣ 
    authen_input number--�Է���������ȣ  
    ,authen_check out number --üũ
)
is
begin
    if authen_send=authen_input
    then authen_check := 1;
    dbms_output.put_line('��������');
    else 
   authen_check := 0;
    dbms_output.put_line('��������');
    end if;
    commit;
end;

--���ε庯�� ���� 
var check number;
--���� 
exec auth_check(:ocode,&inputcode,:check);