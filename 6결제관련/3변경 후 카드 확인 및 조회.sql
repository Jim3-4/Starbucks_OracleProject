--[잔액 or 카드이름 변경 후 확인]
CREATE OR REPLACE PROCEDURE up_selstcard
IS
    CURSOR vcurstcard IS ( SELECT * FROM starbuckscard );
    vrowstcard starbuckscard%ROWTYPE;
BEGIN
    OPEN vcurstcard;
    
    LOOP
        FETCH vcurstcard INTO vrowstcard;
        EXIT WHEN vcurstcard%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(vrowstcard.card_no
                       ||','||vrowstcard.card_name 
                       ||','||vrowstcard.card_balance
                       ||','||vrowstcard.member_id);
    END LOOP;
    
    CLOSE vcurstcard;
--EXCEPTION
END;

EXECUTE up_selstcard;