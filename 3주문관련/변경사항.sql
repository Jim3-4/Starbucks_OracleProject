--변경사항
--orders pickup_way null 풀기
SELECT * FROM user_constraints WHERE table_name = 'ORDERS';
ALTER TABLE orders DROP CONSTRAINT SYS_C008008;
--order_detail에 메뉴당 옵션더한 가격 컬럼 추가
ALTER TABLE order_detail ADD menu_price NUMBER(10);
DESC order_detail;