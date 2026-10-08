-- Test file for Question 17

SET SERVEROUTPUT ON;

BEGIN
    InsertStudent(
        1002,
        'Divya',
        DATE '2005-08-20',
        'Female',
        102
    );
END;
/

COMMIT;

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Student
    WHERE StudentID = 1002
      AND StudentName = 'Divya'
      AND DepartmentID = 102;

    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('TEST PASSED');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TEST FAILED');
    END IF;
END;
/
