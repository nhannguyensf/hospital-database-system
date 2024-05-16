use HospitalManagementDB;

select * from Department;
select * from Employee;
select * from Hospital;
Select * from Prescription;
Select * from MedicalRecord;
Select * from Appointment;

CALL GetDoctorScheduleForDay(1, '2024-06-15');


-- SQL query that joins the Employee table with the Hospital and Department tables to display all employees 
-- along with the names of their respective hospitals and departments:
SELECT
    e.employee_id,
    e.employee_name,
    e.email,
    e.bio,
    h.name AS hospital,
    d.name AS department
FROM
    Employee e
    LEFT JOIN Hospital h ON e.hospital = h.hospital_id
    LEFT JOIN Department d ON e.department = d.department_id
WHERE employee_id = 34;
    
SELECT Hospital.name, Hospital.location FROM Hospital WHERE Hospital.hospital_id = 2;
SELECT * FROM Employee WHERE employee_id = 2;