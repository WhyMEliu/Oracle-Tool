-- Create table
create table A8
(
  a1 VARCHAR2(500)
);



create or replace procedure proc_add_test as
begin
   insert into A8 values('1');
  commit;
end;


declare
  job number;
BEGIN
  DBMS_JOB.SUBMIT(  
        JOB => job,  /*自动生成JOB_ID*/  
        WHAT => 'proc_add_test;',  /*需要执行的存储过程名称或SQL语句*/  
        NEXT_DATE => sysdate+1/(24*60),  /*初次执行时间-下一个1分钟*/  
        INTERVAL => 'trunc(sysdate,''mi'')+30/(24*60*60)' /*每隔30秒执行一次*/
      );  
  commit;
end;

--查看定时任务（用id进行启动）
select * from user_jobs;

begin    
      dbms_job.run(任务id); 
     -- commit;  
end;