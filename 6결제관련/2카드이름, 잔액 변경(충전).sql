--ī���ܾ�/ ī���̸� ���� 
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
--Procedure UP_UPSTCARD��(��) �����ϵǾ����ϴ�.

EXEC up_upstcard( 1245774588746610, '�ʷ�ī��',  5000 );  --ī���̸�, �ܾ׺���
EXEC up_upstcard( 1245774588746610, pcard_name => '�׳�ī��' ); --ī���̸��� ����
EXEC up_upstcard( 1245774588746610, pcard_balance => 56800 );

select *
from starbuckscard;


rollback;