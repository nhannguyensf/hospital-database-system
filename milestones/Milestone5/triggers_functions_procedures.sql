USE HospitalManagementDB;

-- Procedure that retrieves a doctor's full schedule for a specific day. 
-- This procedure will include patient names, appointment information,...
-- and order the results by appointment times.
DELIMITER //
DROP PROCEDURE IF EXISTS GetDoctorScheduleForDay//
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
END //

DELIMITER ;