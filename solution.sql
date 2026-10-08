create database collegeDB;
use colegeDB;
CREATE TABLE student (
    student_id   NUMBER PRIMARY KEY,
    first_name   VARCHAR2(50) NOT NULL,
    last_name    VARCHAR2(50) NOT NULL,
    birth_date   DATE,
    email        VARCHAR2(100) UNIQUE,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE insert_student (
    p_student_id   IN NUMBER,
    p_first_name   IN VARCHAR2,
    p_last_name    IN VARCHAR2,
    p_birth_date   IN DATE,
    p_email        IN VARCHAR2
) AS
BEGIN

    INSERT INTO student (
        student_id,
        first_name,
        last_name,
        birth_date,
        email
    ) VALUES (
        p_student_id,
        p_first_name,
        p_last_name,
        p_birth_date,
        p_email
    );

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Success: Student record inserted successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: A student with this ID or unique email already exists.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END insert_student;
/

BEGIN
    insert_student(
        p_student_id => 101,
        p_first_name => 'John',
        p_last_name  => 'Doe',
        p_birth_date => TO_DATE('2005-06-15', 'YYYY-MM-DD'),
        p_email      => 'john.doe@example.com'
    );
END;
/

SELECT * FROM student;
