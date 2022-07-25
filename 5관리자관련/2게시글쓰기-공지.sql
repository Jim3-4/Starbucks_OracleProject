--게시글 쓰기 (공지 ) 
--기존데이터+제꺼 쿼리만들면서 start with를 7로 했는데 이거 바꾸실 분은 바꾸셔도 돼요 
create  sequence newscode3
increment by 1
start with 7
nocache;

create or replace procedure news_write
(
ptitle news.news_title%type, --글제목
pcontent news.news_content%type, --글내용 
pwriter news.news_writer%type
)
is
begin
    insert into news values 
    (newscode3.nextval, ptitle,sysdate,pcontent,null,null,pwriter);
end;

exec news_write('사이렌 오더/딜리버스 음료 기본 설정 변경 안내 (HOT → ICED)','- 변경 사항 : 음료 기본 설정이 HOT에서 ICED로 변경됩니다.','parkjiy1359');


select *
from news;

