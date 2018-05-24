"SELECT  a.PROGRAM , REQUEST_ID, 
       REQUESTOR, 
       

       

       to_char(ACTUAL_START_DATE,'DD-MON-YY HH24:MI:SS') ||'--'|| 
       to_char(ACTUAL_COMPLETION_DATE,'HH24:MI:SS') time, 
     TO_CHAR(TRUNC(SYSDATE)+(ACTUAL_COMPLETION_DATE-ACTUAL_START_DATE),'HH24:MI:SS') Exe_time, 
     

        status_code||'-'||COMPLETION_TEXT  status 
FROM apps.FND_CONC_REQUESTS_FORM_V a  
where a.program like 'OII Collection and Plan Cycle Set (Report Set)' 
 and actual_start_date is not null 
 and status_code='C' 
order by program,actual_start_date desc"