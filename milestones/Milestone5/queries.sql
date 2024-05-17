use HospitalManagementDB;

select * from Department;
select * from Employee;
select * from Doctor;
select * from Hospital;
Select * from Prescription;
Select * from MedicalRecord;
Select * from Appointment;
Select * from Medication;

CALL GetMonthlyAppointmentsCount();
CALL GetDepartmentsWithLongTenuredEmployees();

CALL GetEquipmentUtilizationRates('2024-06-01', '2025-01-31');
CALL GetDepartmentsByAppointmentCount();
CALL GetPatientCountByInsurancePlan (2);
CALL GetPatientDetails(1);

CALL GetEmployeeCountByDepartment(1, @emp_count); 
SELECT @emp_count AS emp_count;

SELECT GetEmployeeCountByDepartment(1) AS emp_count;

DELETE FROM Doctor 
WHERE doctor_id = 1;

CALL GetReadmissionInfo(1);

SELECT 
    a1.patient AS patient_id,
    a1.appointment_date AS first_appointment_date,
    a2.appointment_date AS readmission_date,
    DATEDIFF(a2.appointment_date, a1.appointment_date) AS days_between
FROM 
    Appointment a1
JOIN 
    Appointment a2
ON 
    a1.patient = a2.patient
    AND a2.appointment_date > a1.appointment_date
    AND DATEDIFF(a2.appointment_date, a1.appointment_date) <= 30
WHERE 
    a1.patient = 1 -- Replace 1 with the specific patient ID you want to filter by
ORDER BY 
    a1.patient, a1.appointment_date;


UPDATE Medication 
  SET stock_level = 300 
  WHERE medication_id = 2;
  
SELECT medication_id, name, managed_by, type, expiration_date, stock_level 
FROM Medication
WHERE medication_id = 2;

SELECT 
    m.medication_id, 
    m.name, 
    ps.pharmacy_staff_id AS  managed_by_pharmacy_staff_id,
    e.employee_name AS managed_by_pharmacy_staff_name, 
    m.type, 
    m.expiration_date, 
    m.stock_level
FROM 
    Medication m
LEFT JOIN 
    PharmacyStaff ps ON m.managed_by = ps.pharmacy_staff_id
LEFT JOIN 
    Employee e ON ps.pharmacy_staff_id = e.employee_id
WHERE 
    m.medication_id = 2;

CALL GetDoctorScheduleForDay(1, '2024-06-15');
CALL GetDoctorScheduleForDay(2, '2024-06-15');


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