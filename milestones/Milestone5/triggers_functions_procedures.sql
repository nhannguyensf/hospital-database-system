USE HospitalManagementDB;

-- Procedure that retrieves a doctor's full schedule for a specific day. 
-- This procedure will include patient names, appointment information,...
-- and order the results by appointment times.
DELIMITER $$
DROP PROCEDURE IF EXISTS GetDoctorScheduleForDay$$
CREATE PROCEDURE GetDoctorScheduleForDay(
    IN doctorId INT,
    IN scheduleDate DATE
)
BEGIN
    SELECT 
        doc.doctor_id,
        emp.employee_name AS doctor_name,
        pat.patient_id,
        pat.patient_name,
        app.appointment_id,
        app.appointment_date,
        app.appointment_time
	FROM 
        Doctor doc
    INNER JOIN 
        Employee emp ON doc.doctor_id = emp.employee_id
    INNER JOIN 
        Appointment app ON doc.doctor_id = app.doctor
    INNER JOIN 
        Patient pat ON app.patient = pat.patient_id
    WHERE 
        doc.doctor_id = doctorId 
        AND app.appointment_date = scheduleDate
    GROUP BY 
        app.appointment_id
    ORDER BY 
        app.appointment_time;
END $$

DELIMITER ;

-- Procedure to get readmission information for a specific patient
-- The query selects patients who have a second appointment within 30 days of their first appointment.
-- It joins the Appointment table with itself on the patient field and ensures the second appointment (a2) is after the first appointment (a1).
-- The DATEDIFF function calculates the number of days between the two appointments.
DELIMITER $$
DROP PROCEDURE IF EXISTS GetReadmissionInfo$$
CREATE PROCEDURE GetReadmissionInfo(IN patient_id INT)
BEGIN
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
        a1.patient = patient_id
    ORDER BY 
        a1.patient, a1.appointment_date;
END $$

DELIMITER ;

-- Procedure to quickly find patient information, medical records, and insurance information by patient ID, 
DELIMITER $$
DROP PROCEDURE IF EXISTS GetPatientDetails$$
CREATE PROCEDURE GetPatientDetails(IN patient_id INT)
BEGIN
    SELECT 
        p.patient_id,
        p.patient_name,
        p.patient_DOB,
        p.contact_number,
        mr.medicalRecord_id,
        mr.doctor AS doctor_id,
        mr.record_date,
        mr.notes,
        ir.insurance_record_id,
        ip.plan_name,
        ip.provider,
        ir.expiration_date AS insurance_expiration_date,
        ip.policy
    FROM 
        Patient p
    LEFT JOIN 
        MedicalRecord mr ON p.patient_id = mr.patient
    LEFT JOIN 
        InsuranceRecord ir ON p.patient_id = ir.patient
    LEFT JOIN 
        InsurancePlan ip ON ir.insurance_plan = ip.insurance_plan_id
    WHERE 
        p.patient_id = patient_id;
END $$

DELIMITER ;

-- Function to return the number of employees in a specific department within a hospital management database. 
-- It takes a department ID as input and outputs the count of employees associated with that department.
DELIMITER $$
DROP FUNCTION IF EXISTS GetEmployeeCountByDepartment$$
CREATE FUNCTION GetEmployeeCountByDepartment(dept_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*)
    INTO emp_count
    FROM Employee
    WHERE department = dept_id;
    RETURN emp_count;
END $$

DELIMITER ;

-- Procedure that reports on the utilization rates of medical equipment in appointments
-- between a period of time.
DELIMITER $$
DROP PROCEDURE IF EXISTS GetEquipmentUtilizationRates$$
CREATE PROCEDURE GetEquipmentUtilizationRates(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT
        e.equipment_id,
        e.name AS equipment_name,
        COUNT(a.appointment_id) AS total_appointments,
        DATEDIFF(end_date, start_date) + 1 AS total_days,
        COUNT(a.appointment_id) / (DATEDIFF(end_date, start_date) + 1) AS utilization_rate
    FROM
        Equipment e
        LEFT JOIN Appointment a ON e.equipment_id = a.equipment
    WHERE
        a.appointment_date BETWEEN start_date AND end_date
    GROUP BY
        e.equipment_id,
        e.name
    ORDER BY
        COUNT(a.appointment_id) DESC;
END $$

DELIMITER ;

-- Retrieves the department with the highest number of scheduled appointments
DELIMITER $$
DROP PROCEDURE IF EXISTS GetDepartmentsByAppointmentCount$$
CREATE PROCEDURE GetDepartmentsByAppointmentCount()
BEGIN
    SELECT
        d.department_id,
        d.name AS department_name,
        COUNT(a.appointment_id) AS total_appointments
    FROM
        Department d
        JOIN Employee e ON d.department_id = e.department
        JOIN Appointment a ON e.employee_id = a.doctor
    GROUP BY
        d.department_id,
        d.name
    ORDER BY
        total_appointments DESC;
END $$

DELIMITER ;

-- Procedure to count the number of patients subscribed to a specific insurance plan
DELIMITER $$
DROP PROCEDURE IF EXISTS GetPatientCountByInsurancePlan $$
CREATE PROCEDURE GetPatientCountByInsurancePlan(IN insurance_plan_id INT)
BEGIN
    SELECT 
        ip.plan_name,
        COUNT(ir.patient) AS patient_count
    FROM 
        InsuranceRecord ir
        JOIN InsurancePlan ip ON ir.insurance_plan = ip.insurance_plan_id
    WHERE 
        ir.insurance_plan = insurance_plan_id;
END $$

DELIMITER ;

-- Get department that has doctor(s) and nurse(s) that have been working for more than 5 years
DELIMITER $$

DROP PROCEDURE IF EXISTS GetDepartmentsWithLongTenuredEmployees $$

CREATE PROCEDURE GetDepartmentsWithLongTenuredEmployees()
BEGIN
    SELECT 
        result.department_id,
        result.department_name
    FROM (
        SELECT 
            d.department_id,
            d.name AS department_name
        FROM 
            Department d
        JOIN 
            Employee e ON d.department_id = e.department
        JOIN 
            Doctor doc ON e.employee_id = doc.doctor_id
        WHERE 
            TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 5
        
        UNION
        
        SELECT 
            d.department_id,
            d.name AS department_name
        FROM 
            Department d
        JOIN 
            Employee e ON d.department_id = e.department
        JOIN 
            Nurse n ON e.employee_id = n.nurse_id
        WHERE 
            TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 5
    ) as result
    GROUP BY 
        result.department_id,
        result.department_name
    HAVING 
        COUNT(*) > 1;
END $$

DELIMITER ;

-- Procedure to get the total number of medications managed by each pharmacy staff member
DELIMITER $$
DROP PROCEDURE IF EXISTS GetTotalMedicationsManagedByEachPharmacyStaff $$
CREATE PROCEDURE GetTotalMedicationsManagedByEachPharmacyStaff()
BEGIN
    SELECT 
        ps.pharmacy_staff_id,
        e.employee_name AS pharmacy_staff_name,
        COUNT(m.medication_id) AS total_medications_managed
    FROM 
        PharmacyStaff ps
    JOIN 
        Employee e ON ps.pharmacy_staff_id = e.employee_id
    LEFT JOIN 
        Medication m ON ps.pharmacy_staff_id = m.managed_by
    GROUP BY 
        ps.pharmacy_staff_id,
        e.employee_name;
END $$

DELIMITER ;

-- Monthly appointments count to get the number of appointments per month
DELIMITER $$
DROP PROCEDURE IF EXISTS GetMonthlyAppointmentsCount $$
CREATE PROCEDURE GetMonthlyAppointmentsCount()
BEGIN
    SELECT 
        DATE_FORMAT(appointment_date, '%Y-%m') AS month,
        COUNT(*) AS appointment_count
    FROM 
        Appointment
    GROUP BY 
        DATE_FORMAT(appointment_date, '%Y-%m')
    ORDER BY 
        DATE_FORMAT(appointment_date, '%Y-%m');
END $$

DELIMITER ;

-- Retrieves a patient's complete medical history
DELIMITER $$
DROP PROCEDURE IF EXISTS GetPatientMedicalHistory $$
CREATE PROCEDURE GetPatientMedicalHistory(IN patient_id INT)
BEGIN
    -- Retrieve past medical history
    SELECT 
        a.appointment_id,
        a.appointment_date,
        a.appointment_time,
        d.employee_name AS doctor_name,
        e.name AS equipment_name,
        mr.medicalRecord_id,
        mr.record_date,
        mr.notes,
        p.prescription_id,
        pm.name AS medication_name,
        pm.dosage,
        pm.frequency
    FROM
        Appointment a
            LEFT JOIN
        Doctor d ON a.doctor = d.doctor_id
            LEFT JOIN
        Equipment e ON a.equipment = e.equipment_id
            LEFT JOIN
        MedicalRecord mr ON a.patient = mr.patient
            LEFT JOIN
        Prescription p ON mr.medicalRecord_id = p.medical_record
            LEFT JOIN
        Medication pm ON p.prescription_id = pm.prescription_id
    WHERE
        a.patient = patient_id
    ORDER BY a.appointment_date, a.appointment_time;
    
    -- Retrieve upcoming appointments
    SELECT 
        a.appointment_id,
        a.appointment_date,
        a.appointment_time,
        d.employee_name AS doctor_name,
        e.name AS equipment_name
    FROM
        Appointment a
            LEFT JOIN
        Doctor d ON a.doctor = d.doctor_id
            LEFT JOIN
        Equipment e ON a.equipment = e.equipment_id
    WHERE
        a.patient = patient_id
        AND a.appointment_date >= CURDATE()
    ORDER BY a.appointment_date, a.appointment_time;
END $$

DELIMITER ;

