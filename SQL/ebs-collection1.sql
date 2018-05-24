SELECT r.parent_request_id,request_id,
       r.PROGRAM  program,
       substr(r.REQUESTOR,1,8) requestor,
       substr(decode(r.Phase_code,'R','Run',r.phase_code)
         ||'--'||
         decode(r.status_code ,
         'A', 'Waiting',
         'B', 'Resuming',
         'C', 'Normal',
         'D', 'Cancelled',
         'E', 'Error',
         'F', 'Scheduled',
         'G', 'Warning',
         'H', 'On Hold',
         'I', 'Normal',
         'M', 'No Manager',
         'Q', 'Standby',
         'R', 'Normal',
         'S', 'Suspended',
         'T', 'Terminating',
         'U', 'Disabled',
         'W', 'Paused',
         'X', 'Terminated',
         'Z', 'Waiting',
         r.status_code) , 1,10) status,
              TO_CHAR(TRUNC(SYSDATE)+(ACTUAL_COMPLETION_DATE-ACTUAL_START_DATE),'HH24:MI:SS') time_taken,
     --  request_date,
       to_char(actual_start_date,'DD-MON-YY HH24:mi:SS')||' - '||to_char(ACTUAL_COMPLETION_DATE,'HH24:mi:SS') start_end_time
FROM APPS.FND_CONC_REQUESTS_FORM_V r 
where  -- r.actual_start_date between trunc(sysdate-1)+18/24 and trunc(sysdate)+7/24
         r.ACTUAL_START_DATE between  to_date('16-OCT-2013 18:00:00','DD-MON-YYYY HH24:MI:SS') and to_date('17-OCT-2013 08:00:00','DD-MON-YYYY HH24:MI:SS')
  and  program not in ('OII Export Transfer Orders From ASCP To PSFT','OII Export Requisitions From ASCP To PSFT','OAM Applications Dashboard Collection',
                        'OII Export Work Orders From ASCP To PSFT','OII Export Work Orders From ASCP To PSFT')
order by actual_start_date ;

