--개인정보수집에 대한 동의여부, 신상정보를 입력받고 랜덤한 인증번호 발행 
--바인드변수선언 
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
dbms_output.put_line('본인확인을 위해 인증을 진행해 주세요.');
if pok='동의'then
select substr(ltrim(dbms_random.value, '0.'),0,6)
into vcode from dual;
    rcode := vcode;
end if;
end;

--실행 
exec info('동의','김지민','980304','010-0000-0000' ,:ocode);

--인증코드 출력 
print ocode;

--인증코드랑 일치하는 지 확인 
create or replace procedure auth_check (
    authen_send number, --받은인증번호 
    authen_input number--입력한인증번호  
    ,authen_check out number --체크
)
is
begin
    if authen_send=authen_input
    then authen_check := 1;
    dbms_output.put_line('인증성공');
    else 
   authen_check := 0;
    dbms_output.put_line('인증실패');
    end if;
    commit;
end;

--바인드변수 선언 
var check number;
--실행 
exec auth_check(:ocode,&inputcode,:check);
