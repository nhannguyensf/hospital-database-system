-- inserts.sql for HospitalManagementDB
-- This file contains sample data for the HospitalManagementDB to facilitate testing and development.
-- It populates each table with initial data to represent realistic scenarios within a hospital management system.

USE HospitalManagementDB;

-- Insert sample data into Hospital
INSERT INTO Hospital (hospital_id, name, location) VALUES
(1, 'Metro Health Hospital', '123 Main St, Metroville'),
(2, 'Green Valley Hospital', '456 Green St, Valleytown'),
(3, 'Riverside Medical Center', '789 River Rd, Riverside'),
(4, 'Hilltop General Hospital', '101 Hill St, Summitville'),
(5, 'Lakeside Health Clinic', '202 Lake Ave, Lakeshore'),
(6, 'Downtown Medical Center', '303 City Rd, Downtown'),
(7, 'Sunrise Specialty Hospital', '404 Sun St, Eastside'),
(8, 'Moonlight Medical Clinic', '505 Moon Ave, Nighttown'),
(9, 'Starlight Pediatric Center', '606 Star Rd, Starville'),
(10, 'Seaside Rehabilitation Hospital', '707 Sea St, Seaside');

-- Insert sample data into Department
INSERT INTO Department (department_id, hospital, name, manager) VALUES
(1, 1, 'Cardiology', 1),
(2, 1, 'Pediatrics', 2),
(3, 2, 'Neurology', 3),
(4, 2, 'Emergency', 4),
(5, 3, 'Orthopedics', 5),
(6, 4, 'Maternity', 6),
(7, 5, 'Oncology', 7),
(8, 6, 'Cardiology', 8),
(9, 7, 'Neurology', 9),
(10, 8, 'Pediatrics', 10);

-- Insert sample data into Employee
INSERT INTO Employee (employee_id, employee_name, hospital, department, bio, email) VALUES
(1, 'Dr. Sarah Connor', 1, 1, 'Lead Cardiologist with 10 years of experience', 'sarah.connor@metrohealth.com'),
(2, 'Nurse John Carter', 1, 2, 'Experienced Pediatric Nurse', 'john.carter@metrohealth.com'),
(3, 'Dr. Derek Shepherd', 2, 3, 'Renowned Neurosurgeon', 'derek.shepherd@greenvalley.com'),
(4, 'Dr. Meredith Grey', 2, 4, 'Expert in General Surgery with a focus on emergency cases', 'meredith.grey@greenvalley.com'),
(5, 'Nurse Carla Espinosa', 3, 5, 'Senior Nurse with expertise in ICU and patient care', 'carla.espinosa@riverside.com'),
(6, 'Dr. Gregory House', 3, 6, 'Diagnostic Medicine Specialist known for solving puzzling cases', 'gregory.house@riverside.com'),
(7, 'Nurse Sam Bennett', 1, 1, 'Cardiac Nurse Specialist providing exceptional patient support', 'sam.bennett@metrohealth.com'),
(8, 'Dr. Lisa Cuddy', 2, 2, 'Hospital Administrator with a background in endocrinology', 'lisa.cuddy@greenvalley.com'),
(9, 'Nurse Jackie Peyton', 2, 7, 'Emergency Department nurse with a talent for efficiency under pressure', 'jackie.peyton@greenvalley.com'),
(10, 'Dr. Chris Taub', 3, 8, 'Plastic Surgeon with a keen eye for detail and patient care', 'chris.taub@riverside.com'),
(11, 'Nurse Haleh Adams', 1, 9, 'ER Nurse with decades of experience in fast-paced environments', 'haleh.adams@metrohealth.com'),
(12, 'Dr. Miranda Bailey', 1, 10, 'General Surgeon with a strong leadership role in surgical residency program', 'miranda.bailey@metrohealth.com'),
(13, 'Nurse Molly Hooper', 3, 5, 'Laboratory Specialist with a focus on pathology and research contributions', 'molly.hooper@riverside.com');

-- Insert sample data into Doctor
INSERT INTO Doctor (doctor_id, specialization, license_number) VALUES
(1, 'Cardiology', 'LIC123456'),
(3, 'Neurology', 'LIC789012'),
(4, 'Dermatology', 'DER123456'),
(5, 'Psychiatry', 'PSY654321'),
(6, 'Radiology', 'RAD112233'),
(7, 'General Surgery', 'SUR445566'),
(8, 'Anesthesiology', 'ANE778899'),
(9, 'Orthopedics', 'ORT990011'),
(10, 'Gastroenterology', 'GAS223344');

-- Insert sample data into Nurse
INSERT INTO Nurse (nurse_id, qualification, specialized_area) VALUES
(2, 'RN, BSN', 'Pediatrics'),
(3, 'LPN', 'General Care'),
(4, 'RN, MSN', 'Critical Care'),
(5, 'RN, BSN', 'Oncology'),
(6, 'RN, BSN', 'Emergency'),
(7, 'RN, Ph.D.', 'Research'),
(8, 'RN, BSN', 'Surgical'),
(9, 'LPN', 'Pediatrics'),
(10, 'RN, BSN', 'Neonatal');

-- Insert sample data into Patient
INSERT INTO Patient (patient_id, patient_name, patient_DOB, contact_number) VALUES
(1, 'Alice Smith', '1980-02-15', '555-0100'),
(2, 'Bob Johnson', '1992-07-24', '555-0101'),
(3, 'Carol Williams', '1985-05-30', '555-0102'),
(4, 'Daniel Moore', '1990-03-21', '555-0200'),
(5, 'Eva Long', '1987-08-14', '555-0201'),
(6, 'Frank Ocean', '1992-10-28', '555-0202'),
(7, 'Grace Hall', '1976-01-07', '555-0203'),
(8, 'Henry Ford', '1984-04-17', '555-0204'),
(9, 'Isla Fisher', '1989-05-25', '555-0205'),
(10, 'Jack Black', '1970-08-28', '555-0206');

-- Insert sample data into MedicalRecord
INSERT INTO MedicalRecord (medicalRecord_id, patient, doctor, record_date, notes) VALUES
(1, 1, 1, '2024-01-10', 'Patient presented with symptoms of a common cold. Advised rest and hydration.'),
(2, 2, 1, '2024-01-15', 'Follow-up visit for blood pressure monitoring. Medication adjustment needed.'),
(3, 3, 2, '2024-02-05', 'Annual physical exam completed. All results within normal ranges.'),
(4, 4, 3, '2024-02-20', 'Patient reports persistent headaches. MRI scheduled to rule out serious conditions.'),
(5, 5, 3, '2024-03-10', 'Consultation for elective surgical procedure. Patient considering options.'),
(6, 6, 2, '2024-03-15', 'Acute asthma attack. Prescribed corticosteroids and advised follow-up.'),
(7, 7, 1, '2024-04-01', 'Routine diabetes management check. Blood sugar levels stable.'),
(8, 8, 2, '2024-04-18', 'Patient experiencing back pain. Recommended physical therapy.'),
(9, 9, 3, '2024-05-05', 'Pre-operative visit for scheduled surgery. Pre-op labs and EKG performed.'),
(10, 10, 1, '2024-05-20', 'Skin rash identified as allergic reaction. Prescribed antihistamines.');


-- Insert sample data into Prescription
INSERT INTO Prescription (prescription_id, medical_record, medication_name) VALUES
(1, 1, 'Aspirin'),
(2, 3, 'Ibuprofen'),
(3, 1, 'Metformin'),
(4, 4, 'Lorazepam'),
(5, 5, 'Citalopram'),
(6, 6, 'Warfarin'),
(7, 7, 'Insulin'),
(8, 8, 'Prednisone'),
(9, 9, 'Hydrochlorothiazide'),
(10, 10, 'Amoxicillin');

-- Insert sample data into Appointment
INSERT INTO Appointment (appointment_id, patient, doctor, appointment_date, appointment_time) VALUES
(1, 1, 1, '2024-04-15', '09:00'),
(2, 2, 3, '2024-04-16', '10:00'),
(3, 3, 1, '2024-04-17', '11:00'),
(4, 4, 4, '2024-05-20', '09:00'),
(5, 5, 5, '2024-06-15', '10:30'),
(6, 6, 6, '2024-07-10', '11:00'),
(7, 7, 7, '2024-08-05', '14:00'),
(8, 8, 8, '2024-09-01', '15:30'),
(9, 9, 9, '2024-10-20', '16:00'),
(10, 10, 10, '2024-11-15', '08:30');

-- Insert sample data into InventoryManager
INSERT INTO InventoryManager (inventory_manager_id, assigned_warehouses, areas_of_responsibility) VALUES
(1, 'Main Hospital Warehouse', 'Responsible for all medical equipment'),
(2, 'Pharmacy Storage', 'Oversees pharmacy inventory'),
(3, 'Secondary Storage Facility', 'Pharmaceuticals'),
(4, 'Off-site Archive', 'Medical Records Storage'),
(5, 'Primary Hospital Warehouse', 'All Medical Supplies');

-- Insert sample data into Equipment
INSERT INTO Equipment (equipment_id, name, department, appointment) VALUES
(1, 'Ultrasound Machine', 1, NULL),
(2, 'MRI Scanner', 3, NULL),
(3, 'EKG Machine', 1, 1),
(4, 'Blood Pressure Monitor', 2, NULL),
(5, 'Ventilator', 3, NULL),
(6, 'X-ray Machine', 3, NULL),
(7, 'Treadmill for Stress Test', 1, NULL),
(8, 'Defibrillator', 1, NULL),
(9, 'Autoclave', NULL, NULL),
(10, 'Centrifuge', NULL, NULL);

-- Insert sample data into InsurancePlan
INSERT INTO InsurancePlan (insurance_plan_id, plan_name, provider, policy) VALUES
(1, 'Basic Health Plan', 'SafeLife Insurance', 'Covers up to $10,000 annually'),
(2, 'Comprehensive Health Plan', 'CarePlus Insurance', 'Covers up to $50,000 annually'),
(3, 'Emergency Care Plan', 'QuickCare Insurance', 'Covers emergency room visits and urgent care'),
(4, 'Dental Plan', 'SmileBright Insurance', 'Covers annual check-ups, cleanings, and basic dental work'),
(5, 'Vision Plan', 'Eyesight Insurance', 'Covers eye exams, glasses, and contact lenses'),
(6, 'Senior Care Plan', 'GoldenYears Insurance', 'Designed for individuals over the age of 65, covering specialty senior care'),
(7, 'Maternity Care Plan', 'FamilyStart Insurance', 'Covers prenatal, delivery, and postnatal care'),
(8, 'Mental Health Plan', 'MindWell Insurance', 'Covers therapy sessions, psychiatric visits, and medications'),
(9, 'Comprehensive Plus Plan', 'TotalCare Insurance', 'A premium plan covering all aspects of health with minimal copay'),
(10, 'Travel Health Plan', 'GlobeTrotter Insurance', 'Covers health care needs when traveling abroad');

-- Insert sample data into InsuranceRecord
INSERT INTO InsuranceRecord (insurance_record_id, patient, insurance_plan, expiration_date) VALUES
(1, 1, 1, '2025-12-31'),
(2, 2, 2, '2024-12-31'),
(3, 3, 1, '2025-11-30'),
(4, 4, 4, '2026-12-31'),
(5, 5, 5, '2026-12-31'),
(6, 6, 6, '2026-12-31'),
(7, 7, 7, '2027-12-31'),
(8, 8, 8, '2027-12-31'),
(9, 9, 9, '2027-12-31'),
(10, 10, 10, '2028-12-31');

-- Insert sample data into PharmacyStaff
INSERT INTO PharmacyStaff (pharmacy_staff_id, qualifications, specialization_area) VALUES
(1, 'PharmD', 'General Pharmacy'),
(2, 'PharmD, Certified in Oncology', 'Oncology'),
(3, 'Certified Pharmacy Technician', 'General Pharmacy'),
(4, 'PharmD, Specialized in Geriatric Care', 'Geriatrics'),
(5, 'PharmD, Immunization Certified', 'Vaccinations'),
(6, 'B.Pharm, Certified in Pediatric Pharmacy', 'Pediatrics'),
(7, 'PharmD, Certified Diabetes Educator', 'Diabetes Care');

-- Insert sample data into Medication
INSERT INTO Medication (medication_id, name, managed_by, type, expiration_date) VALUES
(1, 'Aspirin', 1, 'Anti-inflammatory', '2025-12-31'),
(2, 'Ibuprofen', 1, 'Anti-inflammatory', '2025-12-31'),
(3, 'Metformin', 2, 'Diabetes', '2025-12-31'),
(4, 'Paracetamol', 2, 'Pain Reliever', '2026-05-31'),
(5, 'Simvastatin', 3, 'Cholesterol', '2026-06-30'),
(6, 'Amlodipine', 3, 'Blood Pressure', '2026-07-31'),
(7, 'Amoxicillin', 4, 'Antibiotic', '2026-08-31'),
(8, 'Gabapentin', 4, 'Neuropathic Pain', '2026-09-30');

-- Insert sample data into InsuranceContract
INSERT INTO InsuranceContract (insurance_contract_id, insurance_plan, patient, annual_coverage_limit) VALUES
(1, 1, 1, 10000.00),
(2, 2, 2, 50000.00),
(3, 1, 3, 10000.00),
(4, 3, 4, 2000.00),
(5, 4, 5, 1000.00),
(6, 5, 6, 1500.00),
(7, 6, 7, 2500.00),
(8, 7, 8, 3000.00),
(9, 8, 9, 3500.00),
(10, 9, 10, 4000.00);

-- Insert sample data into PrescriptionMedication
INSERT INTO PrescriptionMedication (prescription_medication_id, prescription, medication, dosage, frequency) VALUES
(1, 1, 1, '100mg', 'Once a day'),
(2, 2, 2, '200mg', 'Twice a day'),
(3, 3, 3, '500mg', 'Once a day'),
(4, 4, 4, '500mg', 'Every 6 hours'),
(5, 5, 5, '20mg', 'Once daily'),
(6, 6, 6, '5mg', 'Once daily'),
(7, 7, 7, '250mg', 'Every 8 hours'),
(8, 8, 8, '300mg', 'Twice daily');
