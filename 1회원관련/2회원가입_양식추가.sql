--회원가입
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
        dbms_output.put_line('아이디가 존재합니다.');
    else --아이디 중복안하면 
        if (length(pmember_id) not between 4 and 13) or (length(ppwd) not between 10 and 20) then
            if length(pmember_id) not between 4 and 13 then 
            dbms_output.put_line('아이디양식에 맞게 입력해주세요.');
            elsif length(ppwd) not between 10 and 20 then 
            dbms_output.put_line('비밀번호양식에 맞게 입력해주세요.');
            else 
            dbms_output.put_line('비밀번호가 서로 일치하지 않습니다.');
            end if;         
        else  --양식이 맞는다면 
           if ppwd=ppwd_check then dbms_output.put_line('회원가입이 완료되었습니다.');
             insert into customer(member_id,cus_passwd) values (pmember_id,ppwd);
            end if;
            end if;
        end if;
end;

--세글자여서 회원가입 불가 
--아이디양식에 맞게 입력해주세요.
exec JOIN_MEMBER('비s큐','bbq','bhc');

--비밀번호양식에 맞게 입력해주세요.
exec JOIN_MEMBER('abcabe','abc','abc');

--회원가입이 완료되었습니다.
exec JOIN_MEMBER('abcabe','abcasdasda','abcasdasda');

select * from customer where member_id='abcabe';


--아이디가 존재합니다.
exec JOIN_MEMBER('abcabe','abc','abc');



