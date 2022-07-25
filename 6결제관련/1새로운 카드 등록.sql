--          [새로운 카드 등록]
--1. 시퀀스 만들기
CREATE SEQUENCE seq_stcard
INCREMENT BY 500
START WITH 1544678513459987
MAXVALUE 9999999999999999
NOCACHE;


--2. 저장프로시저
CREATE OR REPLACE PROCEDURE up_newstcard
(
    pcard_no   starbuckscard.card_no%TYPE 
    , pcard_name   starbuckscard.card_name%TYPE 
    , ppin_no starbuckscard.pin_no%type
    , pmember_id starbuckscard.member_id%type
)
IS
BEGIN
   INSERT INTO starbuckscard ( card_no, card_name, pin_no, member_id  ) VALUES ( seq_stcard.nextval, pcard_name, ppin_no,  pmember_id );
   
   -- COMMIT;  
--EXCEPTION
   -- ROLLBACK;
END;

--값 넣기
INSERT INTO starbuckscard ( card_no, card_name, pin_no,member_id  ) VALUES ( seq_stcard.nextval, 'test카드', '451124','chaeyoung' );


select *
from starbuckscard;




