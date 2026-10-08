-- Question 17:
-- Write a PL/SQL procedure to insert a student record into the Student table.

SET SERVEROUTPUT ON;

CREATE TABLE Student (
    StudentID NUMBER(5) PRIMARY KEY,
    StudentName VARCHAR2(20) NOT NULL,
    DOB DATE,
    Gender VARCHAR2(10),
    DepartmentID NUMBER(5)
);

-- Write your procedure below.
