-- inserts.sql for HospitalManagementDB
-- This file contains sample data for the HospitalManagementDB to facilitate testing and development.
-- It populates each table with initial data to represent realistic scenarios within a hospital management system.

USE HospitalManagementDB;

-- Insert sample data into Hospital
INSERT INTO Hospital (name, location) VALUES
('Metro Health Center', '1234 Metro St'),
('City Hospital', '5678 City Ave'),
('Green Valley Clinic', '9123 Green Rd'),
('Riverside Hospital', '4567 River Ln'),
('Eastside Medical', '8910 East St'),
('West End Wellness', '1112 West Ave'),
('North Hospital', '1314 North Rd'),
('South Community Clinic', '1516 South St'),
('Central Healthcare', '1718 Central Blvd'),
('Suburban Health Network', '1920 Suburb Ln');

-- Insert sample data into Department
INSERT INTO Department (hospital, name, manager) VALUES
(1, 'Cardiology', null),
(1, 'Neurology', null),
(2, 'Orthopedics', null),
(2, 'Pediatrics', null),
(3, 'Oncology', null),
(4, 'Geriatrics', null),
(4, 'Emergency', null),
(5, 'Dermatology', null),
(5, 'Psychiatry', null),
(6, 'Endocrinology', null),
(6, 'Rheumatology', null),
(7, 'Nephrology', null),
(7, 'Gastroenterology', null),
(8, 'Pulmonology', null),
(8, 'Infectious Disease', null),
(9, 'Hematology', null),
(9, 'Pathology', null),
(10, 'Radiology', null),
(10, 'Anesthesiology', null);

-- Insert sample data into Employee
INSERT INTO Employee (employee_name, hospital, department, bio, email, hire_date) VALUES
('John Smith', 1, 1, 'Specializes in cardiology', 'john.smith@email.com', '2005-06-15'),
('Jane Doe', 1, 2, 'Pediatric expert', 'jane.doe@email.com', '2008-09-21'),
('Alice Johnson', 1, 3, 'Experienced nurse', 'alice.johnson@email.com', '2010-03-11'),
('Bob Williams', 1, 4, 'Hospital administration', 'bob.williams@email.com', '2012-01-19'),
('Charlie Brown', 1, 5, 'Imaging technician', 'charlie.brown@email.com', '2000-11-07'),
('Diana Prince', 2, 1, 'Dermatology specialist', 'diana.prince@email.com', '2003-05-23'),
('Evan Green', 2, 2, 'Orthopedic surgeon', 'evan.green@email.com', '2006-07-14'),
('Fiona Gallagher', 2, 3, 'Pharmacy knowledge', 'fiona.gallagher@email.com', '2009-02-26'),
('George Hall', 2, 4, 'Emergency physician', 'george.hall@email.com', '2011-08-30'),
('Hannah Montana', 2, 5, 'General practice', 'hannah.montana@email.com', '2014-04-10'),
('Ian Gruffudd', 3, 1, 'Cardiologist with a decade of experience', 'ian.gruffudd@email.com', '2001-09-15'),
('Jill Valentine', 3, 2, 'Pediatric care specialist', 'jill.valentine@email.com', '2004-12-22'),
('Karl Heisenberg', 3, 3, 'Senior nurse', 'karl.heisenberg@email.com', '2007-03-18'),
('Lucy Heartfilia', 3, 4, 'Administrative lead', 'lucy.heartfilia@email.com', '2010-06-09'),
('Morgan Stark', 3, 5, 'Radiology tech', 'morgan.stark@email.com', '2013-09-27'),
('Nina Williams', 4, 1, 'Skin care expert', 'nina.williams@email.com', '2016-01-02'),
('Oscar Wilde', 4, 2, 'Sports injury management', 'oscar.wilde@email.com', '2018-03-15'),
('Patty Jenkins', 4, 3, 'Pharmaceuticals', 'patty.jenkins@email.com', '2020-05-19'),
('Quentin Tarantino', 4, 4, 'Critical care specialist', 'quentin.tarantino@email.com', '2022-08-11'),
('Rachel Green', 4, 5, 'Family medicine practitioner', 'rachel.green@email.com', '2002-10-25'),
('Steve Rogers', 5, 1, 'Heart specialist', 'steve.rogers@email.com', '2005-04-12'),
('Tony Stark', 5, 2, 'Child health specialist', 'tony.stark@email.com', '2008-07-28'),
('Ursula Monn', 5, 3, 'Nursing staff leader', 'ursula.monn@email.com', '2011-11-03'),
('Victor Creed', 5, 4, 'Operations manager', 'victor.creed@email.com', '2014-02-17'),
('Wanda Maximoff', 5, 5, 'X-ray expert', 'wanda.maximoff@email.com', '2017-06-29'),
('Xavier Woods', 6, 1, 'Dermatologist', 'xavier.woods@email.com', '2020-08-07'),
('Yvonne Strahovski', 6, 2, 'Orthopedist', 'yvonne.strahovski@email.com', '2023-01-14'),
('Zachary Levi', 6, 3, 'Drug specialist', 'zachary.levi@email.com', '2000-02-21'),
('Aaron Paul', 6, 4, 'ER doctor', 'aaron.paul@email.com', '2003-05-10'),
('Bella Swan', 6, 5, 'Primary care doctor', 'bella.swan@email.com', '2006-07-04'),
('Carl Grimes', 7, 1, 'Cardiac surgeon', 'carl.grimes@email.com', '2009-09-12'),
('Daenerys Targaryen', 7, 2, 'Pediatric oncologist', 'daenerys.targaryen@email.com', '2012-12-08'),
('Edward Elric', 7, 3, 'Lead nurse', 'edward.elric@email.com', '2015-03-06'),
('Frank Underwood', 7, 4, 'Administrative director', 'frank.underwood@email.com', '2018-06-18'),
('Grace Adler', 7, 5, 'Tech in MRI', 'grace.adler@email.com', '2021-09-23'),
('Harvey Specter', 8, 1, 'Dermatology consultant', 'harvey.specter@email.com', '2001-02-05'),
('Irene Adler', 8, 2, 'Orthopedic consultant', 'irene.adler@email.com', '2004-04-30'),
('Jack Sparrow', 8, 3, 'Head pharmacist', 'jack.sparrow@email.com', '2007-08-20'),
('Kara Danvers', 8, 4, 'Emergency services manager', 'kara.danvers@email.com', '2010-11-15'),
('Loki Laufeyson', 8, 5, 'General practitioner', 'loki.laufeyson@email.com', '2013-01-29');

-- Insert sample data into Doctor
INSERT INTO Doctor (doctor_id, specialization, license_number) VALUES
(1, 'Cardiology', 'LIC001'),
(2, 'Pediatrics', 'LIC002'),
(3, 'Dermatology', 'LIC003'),
(4, 'Orthopedics', 'LIC004'),
(5, 'Cardiology', 'LIC005'),
(6, 'Pediatrics', 'LIC006'),
(7, 'Dermatology', 'LIC007'),
(8, 'Orthopedics', 'LIC008'),
(9, 'Cardiology', 'LIC009'),
(10, 'Pediatrics', 'LIC010');

-- Insert sample data into Nurse
INSERT INTO Nurse (nurse_id, qualification, specialized_area) VALUES
(11, 'MSN', 'General Nursing'),
(12, 'BSN', 'Radiology'),
(13, 'MSN', 'Geriatric'),
(14, 'BSN', 'Cardiology'),
(15, 'MSN', 'Surgical'),
(16, 'BSN', 'Pediatric'),
(17, 'MSN', 'Emergency Care'),
(18, 'BSN', 'Neonatal'),
(19, 'MSN', 'Pharmacy'),
(20, 'BSN', 'General Practice');

-- Insert sample data into Patient
INSERT INTO Patient (patient_name, patient_DOB, contact_number) VALUES
('John Doe', '1980-04-12', '5550101001'),
('Jane Smith', '1992-08-25', '5550101002'),
('Alice Johnson', '1975-11-15', '5550101003'),
('Bob Brown', '1988-05-30', '5550101004'),
('Charlie Davis', '1995-07-21', '5550101005'),
('Diana Brooks', '2001-01-12', '5550101006'),
('Evan Ray', '1983-03-03', '5550101007'),
('Fiona Campbell', '1972-09-17', '5550101008'),
('George Wilson', '1986-12-22', '5550101009'),
('Hannah Lewis', '1998-02-08', '5550101010'),
('Ian Morris', '1977-06-19', '5550101011'),
('Julia Scott', '1982-10-10', '5550101012'),
('Kevin Turner', '1990-03-26', '5550101013'),
('Laura Martin', '2000-07-15', '5550101014'),
('Mason King', '1965-11-30', '5550101015'),
('Nina Perez', '1994-04-09', '5550101016'),
('Oscar White', '1969-12-25', '5550101017'),
('Patricia Thompson', '1985-01-01', '5550101018'),
('Quentin Stewart', '2003-05-20', '5550101019'),
('Rachel Green', '1979-08-09', '5550101020');

INSERT INTO MedicalRecord (patient, doctor, record_date, notes) VALUES
(1, 3, '2024-04-05', 'Routine dental checkup. No cavities found.'),
(2, 1, '2024-03-12', 'Patient experiencing insomnia. Prescribed sleep aid.'),
(3, 2, '2024-05-02', 'Patient reports increased anxiety. Referred to a psychologist.'),
(4, 1, '2024-04-14', 'Regular follow-up for chronic back pain. Improvement noted.'),
(5, 4, '2024-03-30', 'Routine eye examination. Vision stable.'),
(6, 3, '2024-02-15', 'Patient reports chest pain. ECG performed. Results normal.'),
(7, 2, '2024-01-25', 'Follow-up visit for COVID-19 recovery. Symptoms resolved.'),
(8, 1, '2024-05-09', 'Annual physical examination. Blood work ordered.'),
(9, 4, '2024-04-22', 'Patient reports dizziness and fatigue. Blood tests ordered.'),
(10, 3, '2024-03-20', 'Patient diagnosed with early-stage arthritis. Physical therapy recommended.'),
(1, 2, '2024-04-18', 'Patient complains of digestive issues. Referred to a gastroenterologist.'),
(2, 3, '2024-05-08', 'Patient reports skin rash. Prescribed topical ointment.'),
(3, 1, '2024-02-25', 'Patient experiencing ear pain. Diagnosed with an ear infection.'),
(3, 2, '2024-03-28', 'Regular check-up for high blood pressure. Medication adjusted.'),
(3, 3, '2024-01-10', 'Patient reports joint pain. Recommended supplements.'),
(3, 4, '2024-04-12', 'Follow-up for asthma. Condition stable.'),
(7, 1, '2024-03-18', 'Patient reports recurring migraines. MRI scheduled.'),
(7, 2, '2024-05-05', 'Patient diagnosed with seasonal allergies. Prescribed antihistamines.'),
(9, 3, '2024-02-22', 'Patient experiencing severe stomach pain. Ultrasound ordered.'),
(10, 1, '2024-04-08', 'Follow-up visit for hypertension. Blood pressure improving.');

-- Insert sample data into Prescription
INSERT INTO Prescription (medical_record, medication_name) VALUES
(1, 'Atorvastatin'),
(2, 'Cough Syrup'),
(3, 'Multivitamin 65+'),
(4, 'Ibuprofen'),
(5, 'X-ray Contrast'),
(6, 'Corticosteroid Cream'),
(7, 'Diclofenac Gel'),
(8, 'Omega-3 Supplements'),
(9, 'Antibiotic Ointment'),
(10, 'Sumatriptan');

-- Insert sample data into Appointment
INSERT INTO Appointment (patient, doctor, equipment, appointment_date, appointment_time) VALUES
-- Patient 1 with multiple appointments
(1, 1, 1, '2024-06-01', '09:00:00'),
(1, 1, 1, '2024-07-08', '09:00:00'),
(1, 1, 1, '2024-08-15', '09:00:00'),
(1, 2, 2, '2024-09-22', '09:00:00'),
(1, 2, 2, '2024-10-29', '09:00:00'),

-- Patient 2 with multiple appointments
(2, 3, 3, '2024-06-05', '10:00:00'),
(2, 3, 3, '2024-07-12', '10:00:00'),
(2, 1, 2, '2024-08-15', '09:30:00'),
(2, 4, 4, '2024-09-20', '11:00:00'),

-- Patient 3 with multiple appointments
(3, 5, 5, '2024-06-10', '11:00:00'),
(3, 5, 5, '2024-07-15', '10:00:00'),
(3, 6, 6, '2024-08-22', '11:00:00'),
(3, 7, 7, '2024-09-29', '12:00:00'),

-- Patient 4 with multiple appointments
(4, 4, 4, '2024-06-01', '10:30:00'),
(4, 4, 4, '2024-07-10', '10:30:00'),
(4, 4, 4, '2024-08-18', '10:30:00'),

-- Patient 5 with multiple appointments
(5, 5, 5, '2024-06-03', '11:00:00'),
(5, 5, 5, '2024-07-10', '11:00:00'),
(5, 5, 5, '2024-08-19', '11:00:00'),

-- Patient 6 with multiple appointments
(6, 6, null, '2024-06-05', '11:30:00'),
(6, 6, null, '2024-07-12', '11:30:00'),
(6, 6, null, '2024-08-20', '11:30:00'),

-- Patient 7 with multiple appointments
(7, 1, 7, '2024-06-01', '12:00:00'),
(7, 2, 2, '2024-07-08', '12:30:00'),
(7, 3, 3, '2024-08-15', '13:00:00'),

-- Patient 8 with multiple appointments
(8, 8, 8, '2024-06-04', '12:30:00'),
(8, 8, 8, '2024-07-11', '12:30:00'),
(8, 8, 8, '2024-08-22', '12:30:00'),

-- Patient 9 with multiple appointments
(9, 9, 9, '2024-06-02', '13:00:00'),
(9, 9, 9, '2024-07-09', '13:00:00'),
(9, 9, 9, '2024-08-16', '13:00:00'),
(9, 9, 9, '2024-09-23', '13:00:00'),

-- Patient 10 with multiple appointments
(10, 10, 10, '2024-06-03', '13:30:00'),
(10, 10, 10, '2024-07-10', '13:30:00'),
(10, 10, 10, '2024-08-17', '13:30:00'),
(10, 10, 10, '2024-09-24', '13:30:00');


-- Insert sample data into InventoryManager
INSERT INTO InventoryManager (inventory_manager_id, assigned_warehouses, areas_of_responsibility) VALUES
(21, 'Warehouse A', 'Manage medical supplies and equipment'),
(22, 'Warehouse B', 'Oversee pharmaceutical stock'),
(23, 'Warehouse C', 'Handle surgical instruments inventory'),
(24, 'Warehouse D', 'Coordinate medical device logistics'),
(25, 'Warehouse E', 'Oversee clinic supplies'),
(26, 'Warehouse F', 'Manage hospital furniture stock'),
(27, 'Warehouse G', 'Administer vaccine storage'),
(28, 'Warehouse H', 'Supervise cleaning supplies distribution'),
(29, 'Warehouse I', 'Control biotechnology products'),
(30, 'Warehouse J', 'Oversee laboratory equipment');

-- Insert sample data into Equipment
INSERT INTO Equipment (name, department, appointment, managed_by) VALUES
('Ultrasound Machine', 1, 1, 21),
('MRI Scanner', 2, 2, 22),
('CT Scanner', 3, 3, 23),
('X-Ray Machine', 4, 4, 24),
('EKG Machine', 5, 5, 25),
('Treadmill for Stress Test', 6, 6, 26),
('Surgical Laser', 7, 7, 27),
('Defibrillator', 8, 8, 28),
('Ventilator', 9, 9, 29),
('Dialysis Machine', 10, 10, 30);

-- Insert sample data into InsurancePlan
INSERT INTO InsurancePlan (plan_name, provider, policy) VALUES
('Basic Health Cover', 'HealthPlus Insurance', 'Covers all general physician visits, basic tests.'),
('Comprehensive Health Plan', 'Universal Care', 'Covers all medical expenses with a premium.'),
('Family Health Plan', 'Family Secure', 'Covers spouse and children with medium copay.'),
('Senior Citizen Plan', 'Golden Years Insurance', 'Special plan for individuals over 60 years.'),
('Student Health Plan', 'Academic Health', 'Designed for students with budget in mind.'),
('Corporate Health Plan', 'Corporate Shield', 'Covers employees of registered companies.'),
('Travel Health Insurance', 'Global Health', 'Covers health issues during travel abroad.'),
('Accident Health Plan', 'Accident Care', 'Focuses on accidents including emergency treatments.'),
('Maternity Health Plan', 'Mother and Child', 'Covers all maternity-related medical needs.'),
('Dental Plan', 'Smile Bright', 'Covers dental treatments and regular check-ups.');

-- Insert sample data into InsuranceRecord
INSERT INTO InsuranceRecord (patient, insurance_plan, expiration_date) VALUES
(1, 1, '2025-12-31'),
(2, 2, '2025-12-31'),
(3, 3, '2025-12-31'),
(4, 4, '2025-12-31'),
(5, 5, '2025-12-31'),
(6, 6, '2025-12-31'),
(7, 7, '2025-12-31'),
(8, 8, '2025-12-31'),
(9, 9, '2025-12-31'),
(10, 10, '2025-12-31');

-- Insert sample data into PharmacyStaff
INSERT INTO PharmacyStaff (pharmacy_staff_id, qualifications, specialization_area) VALUES
(31, 'PharmD', 'Clinical Pharmacy'),
(32, 'PharmD', 'Medication Therapy Management'),
(33, 'PharmD', 'Community Pharmacy'),
(34, 'PharmD', 'Hospital Pharmacy'),
(35, 'PharmD', 'Compounding Pharmacy'),
(36, 'PharmD', 'Oncology Pharmacy'),
(37, 'PharmD', 'Regulatory Affairs'),
(38, 'PharmD', 'Pharmacoeconomics'),
(39, 'PharmD', 'Ambulatory Care'),
(40, 'PharmD', 'Critical Care Pharmacy');

-- Insert sample data into Medication
INSERT INTO Medication (name, managed_by, type, expiration_date, stock_level) VALUES
('Amoxicillin', 31, 'Antibiotic', '2026-01-01', 100),
('Metformin', 32, 'Antidiabetic', '2026-01-01', 150),
('Simvastatin', 33, 'Cholesterol', '2026-01-01', 200),
('Lisinopril', 34, 'Blood Pressure', '2026-01-01', 120),
('Levothyroxine', 35, 'Thyroid', '2026-01-01', 180),
('Atorvastatin', 36, 'Cholesterol', '2026-01-01', 220),
('Albuterol', 37, 'Asthma', '2026-01-01', 90),
('Hydrochlorothiazide', 38, 'Diuretic', '2026-01-01', 110),
('Amlodipine', 39, 'Blood Pressure', '2026-01-01', 130),
('Gabapentin', 40, 'Neurological Pain', '2026-01-01', 170),
('Ibuprofen', 31, 'Pain Reliever', '2024-05-15', 80),
('Omeprazole', 32, 'Antacid', '2024-05-20', 75),
('Citalopram', 33, 'Antidepressant', '2024-05-25', 60),
('Losartan', 34, 'Blood Pressure', '2024-05-30', 95),
('Montelukast', 35, 'Asthma', '2024-06-01', 85),
('Fluticasone', 36, 'Allergy', '2024-06-05', 50),
('Warfarin', 37, 'Anticoagulant', '2024-06-10', 70),
('Doxycycline', 38, 'Antibiotic', '2024-06-15', 65),
('Furosemide', 39, 'Diuretic', '2024-06-20', 90),
('Clopidogrel', 40, 'Antiplatelet', '2024-06-25', 55);

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
