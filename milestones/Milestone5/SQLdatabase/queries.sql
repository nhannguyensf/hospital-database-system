use HospitalManagementDB;

select * from Department;
select * from Employee;

-- SQL query that joins the Employee table with the Hospital and Department tables to display all employees 
-- along with the names of their respective hospitals and departments:
SELECT
    e.employee_id,
    e.employee_name,
    e.email,
    e.bio,
    h.name AS hospital_name,
    d.name AS department_name
FROM
    Employee e
    LEFT JOIN Hospital h ON e.hospital = h.hospital_id
    LEFT JOIN Department d ON e.department = d.department_id;
