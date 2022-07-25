create or replace procedure manager_info
is 
begin
    for vrow in (select * from managers)
       loop
        dbms_output.put_line('manager_id:'||vrow.manager_id);
        dbms_output.put_line('manager_name:'||vrow.manager_name); 
        dbms_output.put_line('manager_rank:'||vrow.manager_rank); 
          dbms_output.put_line('------------------------------');
       end loop;
end;

exec MANAGER_INFO();


