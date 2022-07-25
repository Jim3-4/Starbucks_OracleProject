

CREATE OR REPLACE PROCEDURE up_cate
IS
    CURSOR vcurcate IS ( SELECT * FROM categories );
    vrowcate categories%ROWTYPE;
BEGIN
    OPEN vcurcate;
    
    LOOP
        FETCH vcurcate INTO vrowcate;
        EXIT WHEN vcurcate%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(RPAD(vrowcate.sub, 13, ' ') || '|     ' || vrowcate.category_code);
    END LOOP;
    
    CLOSE vcurcate;
--EXCEPTION
END;


EXECUTE up_cate;






