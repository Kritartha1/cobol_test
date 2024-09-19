
       IDENTIFICATION DIVISION.
       PROGRAM-ID. InputExample.
        
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        
       DATA DIVISION.
       FILE SECTION.
        
       WORKING-STORAGE SECTION.
       01 WS-USER-NAME      PIC A(30).  *> Variable to hold the user's name
       01 WS-USER-AGE       PIC 99.     *> Variable to hold the user's age
       01 WS-AGE-GROUP      PIC X(20).  *> Variable to store age group description
        
       PROCEDURE DIVISION.
           DISPLAY 'Enter your name:'
           ACCEPT WS-USER-NAME
           DISPLAY 'Enter your age:'
           ACCEPT WS-USER-AGE
        
           IF WS-USER-AGE < 18 THEN
               MOVE 'Minor' TO WS-AGE-GROUP
           ELSE
               MOVE 'Adult' TO WS-AGE-GROUP
           END-IF
        
           DISPLAY 'Hello, ' WS-USER-NAME '!'
           DISPLAY 'You are classified as: ' WS-AGE-GROUP
        
           STOP RUN.
        
