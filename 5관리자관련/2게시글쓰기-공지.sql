--�Խñ� ���� (���� ) 
--����������+���� ��������鼭 start with�� 7�� �ߴµ� �̰� �ٲٽ� ���� �ٲټŵ� �ſ� 
create  sequence newscode3
increment by 1
start with 7
nocache;

create or replace procedure news_write
(
ptitle news.news_title%type, --������
pcontent news.news_content%type, --�۳��� 
pwriter news.news_writer%type
)
is
begin
    insert into news values 
    (newscode3.nextval, ptitle,sysdate,pcontent,null,null,pwriter);
end;

exec news_write('���̷� ����/�������� ���� �⺻ ���� ���� �ȳ� (HOT �� ICED)','- ���� ���� : ���� �⺻ ������ HOT���� ICED�� ����˴ϴ�.','parkjiy1359');


select *
from news;

