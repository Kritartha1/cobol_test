       IDENTIFICATION DIVISION.
       PROGRAM-ID. MultiLineSQL.
 
       ENVIRONMENT DIVISION.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
 
 
       01  WS-STUDENT-REC.
       05 WS-STUDENT-ID          PIC 9(5).
       05 WS-STUDENT-NAME        PIC X(25).
       05 WS-STUDENT-ADDRESS.
       10 WS-STREET           PIC X(30).
       10 WS-CITY             PIC X(20).
       10 WS-STATE            PIC XX.
       10 WS-ZIP              PIC 9(5).
       05  CONTINUE-MAX-GALLONS-OTH-SW PIC 9        VALUE 0.
       88  CONTINUE-MAX-GALLONS-OTH             VALUE 0.
        
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
 
       MOVE 1001 TO WS-CUSTOMER-ID.
       EXEC SQL
           SELECT CUSTOMER_NAME, CUSTOMER_AGE
           INTO :WS-CUSTOMER-NAME, :WS-CUSTOMER-AGE
           FROM CUSTOMER_TABLE
           WHERE CUSTOMER_ID = :WS-CUSTOMER-ID
       END-EXEC.
 
       DISPLAY 'Customer Name: ' WS-CUSTOMER-NAME.
       DISPLAY 'Customer Age: ' WS-CUSTOMER-AGE.
       EXEC SQL
                   FETCH EMP_CURSOR INTO :EMPLOYEE-ID, :EMPLOYEE-NAME,
                    :EMPLOYEE-SALARY
       END-EXEC.
       EXEC SQL
               DELETE FROM EMPLOYEES
               WHERE EMP_ID = :EMPLOYEE-ID
       END-EXEC.
       EXEC SQL
              UPDATE EMPLOYEES
              SET EMP_SALARY = EMP_SALARY + 1000
              WHERE CURRENT OF EMP_CURSOR
       END-EXEC


       EXEC CICS
           INVOKE SERVICE('EmployeeService')
           URI('/employees/' || EMP-ID)
           HTTPMETHOD(GET)
           RESP(WEB-RESPONSE)
       END-EXEC

       EXEC CICS LINK PROGRAM('TRANPROG') COMMAREA(COMM-AREA) 
       LENGTH(LEN)
       END-EXEC
       
      
       
       EXEC CICS INVOKE PROGRAM('PROGNAME')
                 CHANNEL('MYCHANNEL')
       END-EXEC.
       
       
       EXEC CICS INVOKE PROGRAM('program-name')
                 [CHANNEL('channel-name')]
                 [INPUT('container-name')]
                 [OUTPUT('container-name')]
                 [SYNCONRETURN]
       END-EXEC.
       
       EXEC CICS INVOKE METHOD('method-name')
                 OBJECT(object-reference)
                 [ARGS(argument1 argument2 ...)]
                 [RESULT(result-var)]
       END-EXEC.
       
       EXEC CICS RETURN
                 [TRANSID('transaction-id')]
                 [COMMAREA(data-area)]
                 [LENGTH(data-length)]
                 [CHANNEL('channel-name')]
       END-EXEC.
 
       MOVE 1002 TO WS-CUSTOMER-ID.
       MOVE 'John Doe' TO WS-CUSTOMER-NAME.
       MOVE 30 TO WS-CUSTOMER-AGE.
       EXEC SQL
           INSERT INTO CUSTOMER_TABLE (CUSTOMER_ID, CUSTOMER_NAME, 
           CUSTOMER_AGE)
           VALUES (:WS-CUSTOMER-ID, :WS-CUSTOMER-NAME, :WS-CUSTOMER-AGE)
       END-EXEC.
 
