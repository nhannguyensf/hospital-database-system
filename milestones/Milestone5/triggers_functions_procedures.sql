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
