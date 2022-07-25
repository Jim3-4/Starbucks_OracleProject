--게시글출력 
create or replace procedure newsview 
( pcode news.news_code%type
)
is 
begin 
     for vrow in (select * from news where news_code=pcode)
       loop
        dbms_output.put_line('NEWS_CODE:'||vrow.NEWS_CODE);
        dbms_output.put_line('NEWS_TITLE:'||vrow.NEWS_TITLE); 
        dbms_output.put_line('NEWS_DC:'||vrow.NEWS_DC); 
        dbms_output.put_line('NEWS_CONTENT:'||vrow.NEWS_CONTENT); 
        dbms_output.put_line('NEWS_STARTDATE:'||vrow.NEWS_STARTDATE); 
        dbms_output.put_line('NEWS_ENDDATE:'||vrow.NEWS_ENDDATE); 
        dbms_output.put_line('NEWS_WRITER:'||vrow.NEWS_WRITER); 
        dbms_output.put_line('------------------------------');
       end loop;
end;
exec newsview(7); 

