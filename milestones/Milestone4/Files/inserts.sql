-- inserts.sql for HospitalManagementDB
-- This file contains sample data for the HospitalManagementDB to facilitate testing and development.
-- It populates each table with initial data to represent realistic scenarios within a hospital management system.

USE HospitalManagementDB;

SET FOREIGN_KEY_CHECKS=0;

-- Insert sample data into Hospital
INSERT INTO Hospital (hospital_id, name, location) VALUES
(1, 'Metro Health Hospital', '123 Main St, Metroville'),
(2, 'Green Valley Hospital', '456 Green St, Valleytown'),
(3, 'Riverside Medical Center', '789 River Rd, Riverside');

-- Insert sample data into Department
INSERT INTO Department (department_id, hospital, name, manager) VALUES
(1, 1, 'Cardiology', 1),
(2, 1, 'Pediatrics', 2),
(3, 2, 'Neurology', 3);

-- Insert sample data into Employee
INSERT INTO Employee (employee_id, employee_name, hospital, department, bio, email) VALUES
(1, 'Dr. Sarah Connor', 1, 1, 'Lead Cardiologist with 10 years of experience', 'sarah.connor@metrohealth.com'),
(2, 'Nurse John Carter', 1, 2, 'Experienced Pediatric Nurse', 'john.carter@metrohealth.com'),
(3, 'Dr. Derek Shepherd', 2, 3, 'Renowned Neurosurgeon', 'derek.shepherd@greenvalley.com');

-- Insert sample data into Doctor
INSERT INTO Doctor (doctor_id, specialization, license_number) VALUES
(1, 'Cardiology', 'LIC123456'),
(3, 'Neurology', 'LIC789012');

-- Insert sample data into Nurse
INSERT INTO Nurse (nurse_id, qualification, specialized_area) VALUES
(2, 'RN, BSN', 'Pediatrics');

-- Insert sample data into Patient
INSERT INTO Patient (patient_id, patient_name, patient_DOB, contact_number) VALUES
(1, 'Alice Smith', '1980-02-15', '555-0100'),
(2, 'Bob Johnson', '1992-07-24', '555-0101'),
(3, 'Carol Williams', '1985-05-30', '555-0102');

-- Insert sample data into MedicalRecord
INSERT INTO MedicalRecord (medicalRecord_id, patient, doctor) VALUES
(1, 1, 1),
(2, 2, NULL),
(3, 3, 3);

-- Insert sample data into Prescription
INSERT INTO Prescription (prescription_id, medical_record, medication_name) VALUES
(1, 1, 'Aspirin'),
(2, 3, 'Ibuprofen'),
(3, 1, 'Metformin');

-- Insert sample data into Appointment
INSERT INTO Appointment (appointment_id, patient, doctor, appointment_date, appointment_time) VALUES
(1, 1, 1, '2024-04-15', '09:00'),
(2, 2, 3, '2024-04-16', '10:00'),
(3, 3, 1, '2024-04-17', '11:00');

-- Insert sample data into InventoryManager
INSERT INTO InventoryManager (inventory_manager_id, assigned_warehouses, areas_of_responsibility) VALUES
(1, 'Main Hospital Warehouse', 'Responsible for all medical equipment'),
(2, 'Pharmacy Storage', 'Oversees pharmacy inventory');

-- Insert sample data into Equipment
INSERT INTO Equipment (equipment_id, name, department, appointment) VALUES
(1, 'Ultrasound Machine', 1, NULL),
(2, 'MRI Scanner', 3, NULL),
(3, 'EKG Machine', 1, 1);

-- Insert sample data into InsurancePlan
INSERT INTO InsurancePlan (insurance_plan_id, plan_name, provider, policy) VALUES
(1, 'Basic Health Plan', 'SafeLife Insurance', 'Covers up to $10,000 annually'),
(2, 'Comprehensive Health Plan', 'CarePlus Insurance', 'Covers up to $50,000 annually');

-- Insert sample data into InsuranceRecord
INSERT INTO InsuranceRecord (insurance_record_id, patient, insurance_plan, expiration_date) VALUES
(1, 1, 1, '2025-12-31'),
(2, 2, 2, '2024-12-31'),
(3, 3, 1, '2025-11-30');

-- Insert sample data into PharmacyStaff
INSERT INTO PharmacyStaff (pharmacy_staff_id, qualifications, specialization_area) VALUES
(1, 'PharmD', 'General Pharmacy'),
(2, 'PharmD, Certified in Oncology', 'Oncology');

-- Insert sample data into Medication
INSERT INTO Medication (medication_id, name, type, expiration_date) VALUES
(1, 'Aspirin', 'Anti-inflammatory', '2025-12-31'),
(2, 'Ibuprofen', 'Anti-inflammatory', '2025-12-31'),
(3, 'Metformin', 'Diabetes', '2025-12-31');

-- Insert sample data into InsuranceContract
INSERT INTO InsuranceContract (insurance_contract_id, insurance_plan, patient, annual_coverage_limit) VALUES
(1, 1, 1, 10000.00),
(2, 2, 2, 50000.00),
(3, 1, 3, 10000.00);

-- Insert sample data into PrescriptionMedication
INSERT INTO PrescriptionMedication (prescription_medication_id, prescription, medication, dosage, frequency) VALUES
(1, 1, 1, '100mg', 'Once a day'),
(2, 2, 2, '200mg', 'Twice a day'),
(3, 3, 3, '500mg', 'Once a day');
