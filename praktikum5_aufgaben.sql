--Aufgabe 1
select * from jobs;
/
create or replace function get_job (p_job_id jobs.job_id%type)
 return jobs.job_title%type is 
 b_title jobs.job_title%type;
 begin
 select job_title into b_title from jobs 
 where job_id = p_job_id;
 
 dbms_output.put_line('b_title');
 dbms_output.put_line('---------------------');
 return b_title;
 end;
/
begin
dbms_output.put_line(get_job('SA_REP'));
end;

/
--Aufgabe 2
create or replace function get_annual_comp (p_sal integer, p_comm integer)
 return integer is
begin
  return (NVL(p_sal, 0) * 12 + (NVL(p_comm, 0) * NVL(p_sal, 0) * 12));
end;
/

select employee_id, last_name, get_annual_comp(salary, COMMISSION_PCT) from employees where department_id = 30;
/

--Aufgabe 3
create or replace package job_pkg is
 function get_job (p_job_id jobs.job_id%type)
 return jobs.job_title%type;
end job_pkg;
/

create or replace package body job_pkg is 
 function get_job (p_job_id jobs.job_id%type)
 return jobs.job_title%type is
  b_title jobs.job_title%type;
  begin
   select job_title into b_title from jobs 
   where job_id = p_job_id;
 
   dbms_output.put_line('b_title');
   dbms_output.put_line('---------------------');
   return b_title;
  end;
end;
/
begin
 dbms_output.put_line(job_pkg.get_job('SA_REP'));
end;
/