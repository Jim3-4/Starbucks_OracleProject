--카드잔액/ 카드이름 변경 
CREATE OR REPLACE PROCEDURE up_upstcard
(
      pcard_no in  starbuckscard.card_no%TYPE 
    , pcard_name in  starbuckscard.card_name%TYPE default null
    , pcard_balance in starbuckscard.card_balance%type default null
)
IS
  vcard_name  starbuckscard.card_name%TYPE;  
  vcard_balance  starbuckscard.card_balance%TYPE; 

BEGIN
   IF  pcard_name IS NULL OR pcard_balance IS NULL  THEN
      SELECT  card_name, card_balance INTO vcard_name,vcard_balance
      FROM starbuckscard
      WHERE card_no = pcard_no;
   END IF;

   UPDATE starbuckscard
   SET    card_balance = NVL( pcard_balance, vcard_balance  )
          ,  card_name  = NVL( pcard_name, vcard_name  )
   WHERE card_no = pcard_no;
    
   -- COMMIT;  
--EXCEPTION
   -- ROLLBACK;
END;
--Procedure UP_UPSTCARD이(가) 컴파일되었습니다.

EXEC up_upstcard( 1245774588746610, '초록카드',  5000 );  --카드이름, 잔액변경
EXEC up_upstcard( 1245774588746610, pcard_name => '그냥카드' ); --카드이름만 변경
EXEC up_upstcard( 1245774588746610, pcard_balance => 56800 );

select *
from starbuckscard;


rollback;