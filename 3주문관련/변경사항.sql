--�������
--orders pickup_way null Ǯ��
SELECT * FROM user_constraints WHERE table_name = 'ORDERS';
ALTER TABLE orders DROP CONSTRAINT SYS_C008008;
--order_detail�� �޴��� �ɼǴ��� ���� �÷� �߰�
ALTER TABLE order_detail ADD menu_price NUMBER(10);
DESC order_detail;