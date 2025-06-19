create database AmazeCare;
use AmazeCare;

CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    MedicalHistory TEXT,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Specialty VARCHAR(255) NOT NULL,
    ExperienceYears INT NOT NULL,
    Qualification VARCHAR(255) NOT NULL,
    Designation VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL
);

CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Symptoms TEXT,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    ConsultationDetails TEXT,
    Prescription TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
);

CREATE TABLE MedicalRecord (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    Diagnosis TEXT,
    TreatmentPlan TEXT,
    PrescribedTests TEXT,
    RecordDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Token (
    TokenID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    UserType ENUM('Patient', 'Doctor', 'Admin') NOT NULL,
    TokenHash VARCHAR(255) NOT NULL,
    ExpirationDate DATETIME NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE Test (
    TestID INT AUTO_INCREMENT PRIMARY KEY,
    TestName VARCHAR(255) NOT NULL,
    Description TEXT,
    Cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Prescription (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    MedicineName VARCHAR(255) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Instructions VARCHAR(255),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE AuditLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    UserType ENUM('Patient', 'Doctor', 'Admin') NOT NULL,
    Action VARCHAR(255) NOT NULL,
    ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Patient 
(FullName, DateOfBirth, Gender, ContactNumber, Email, PasswordHash, MedicalHistory, RegistrationDate)
VALUES
('Arun Kumar', '1990-01-01', 'Male', '9876543210', 'arun.kumar@example.com', 'hash_password1', 'Allergic to penicillin', '2025-05-30 10:00:00'),
('Sri Priya', '1992-06-15', 'Female', '8765432109', 'sri.priya@example.com', 'hash_password2', 'History of asthma', '2025-05-30 10:10:00'),
('kavi Naya', '1985-12-20', 'Female', '7654321098', 'kavi.naya@example.com', 'hash_password3', 'No major issues', '2025-05-30 10:20:00'),
('Bob J', '2000-07-11', 'Male', '6543210987', 'bob.j@example.com', 'hash_password4', 'Diabetic', '2025-05-30 10:30:00'),
('Sree Kumar', '1998-05-30', 'Female', '5432109876', 'sree.kumar@example.com', 'hash_password5', 'High blood pressure', '2025-05-30 10:40:00'),
('David S', '1995-11-01', 'Male', '4321098765', 'david.s@example.com', 'hash_password6', 'No known allergies', '2025-05-30 10:50:00');

select * from Patient;

INSERT INTO Doctor 
(FullName, Specialty, ExperienceYears, Qualification, Designation, ContactNumber, Email, PasswordHash)
VALUES
('Dr. Emily Carter', 'Cardiology', 10, 'MD, Cardiology', 'Senior Consultant', '9876543210', 'emily.carter@example.com', 'hash_password1'),
('Dr. Michael Brown', 'Orthopedics', 8, 'MS, Orthopedics', 'Consultant', '8765432109', 'michael.brown@example.com', 'hash_password2'),
('Dr. Sarah Johnson', 'Pediatrics', 12, 'MD, Pediatrics', 'Head of Department', '7654321098', 'sarah.johnson@example.com', 'hash_password3'),
('Dr. Daniel Wilson', 'Neurology', 15, 'DM, Neurology', 'Senior Neurologist', '6543210987', 'daniel.wilson@example.com', 'hash_password4'),
('Dr. Laura Martinez', 'Dermatology', 6, 'MD, Dermatology', 'Junior Consultant', '5432109876', 'laura.martinez@example.com', 'hash_password5'),
('Dr. Thomas Walker', 'General Medicine', 20, 'MD, General Medicine', 'Chief Medical Officer', '4321098765', 'thomas.walker@example.com', 'hash_password6');

select * from Doctor;

INSERT INTO Appointment 
(PatientID, DoctorID, AppointmentDate, Symptoms, Status, ConsultationDetails, Prescription)
VALUES
(1, 2, '2025-05-01 10:30:00', 'Fever, Cough', 'Scheduled', NULL, NULL),
(2, 3, '2025-05-02 15:00:00', 'Back Pain', 'Completed', 'Routine checkup done, follow-up in 2 weeks', 'Ibuprofen 200mg twice a day'),
(3, 1, '2025-05-03 09:00:00', 'Chest Pain', 'Cancelled', NULL, NULL),
(4, 5, '2025-05-04 11:45:00', 'Skin Rash', 'Completed', 'Allergy identified, advised to avoid allergen', 'Antihistamine cream once daily'),
(5, 4, '2025-05-05 14:15:00', 'Headache, Dizziness', 'Scheduled', NULL, NULL),
(6, 6, '2025-05-06 12:00:00', 'General Checkup', 'Completed', 'General health is good, recommended daily exercise', 'Vitamin D supplements');

INSERT INTO Admin 
(FullName, Email, PasswordHash, ContactNumber) 
VALUES
('Arun Kumar', 'arun.kumar@example.com', 'hash_password1', '9876543210'),
('Sri Priya', 'sri.priya@example.com', 'hash_password2', '8765432109'),
('Kavi Naya', 'kavi.naya@example.com', 'hash_password3', '7654321098'),
('Bob J', 'bob.j@example.com', 'hash_password4', '6543210987'),
('Sree Kumar', 'sree.kumar@example.com', 'hash_password5', '5432109876'),
('David S', 'david.s@example.com', 'hash_password6', '4321098765');

INSERT INTO MedicalRecord 
(PatientID, DoctorID, Diagnosis, TreatmentPlan, PrescribedTests, RecordDate)
VALUES
(1, 1, 'Common Cold', 'Rest, hydration, paracetamol', 'None', '2025-05-30 09:00:00'),
(2, 3, 'Asthma Attack', 'Bronchodilators, inhaler use education', 'Lung function tests', '2025-05-30 10:00:00'),
(3, 2, 'Back Pain', 'Physical therapy, NSAIDs', 'X-ray of the spine', '2025-05-30 11:00:00'),
(4, 4, 'Diabetes', 'Diet modification, insulin therapy', 'HbA1c test', '2025-05-30 12:00:00'),
(5, 5, 'High Blood Pressure', 'Lifestyle changes, antihypertensive drugs', 'ECG, blood tests', '2025-05-30 13:00:00'),
(6, 6, 'No Known Issues', 'Regular check-up', 'Complete blood count', '2025-05-30 14:00:00');

INSERT INTO Token 
(UserID, UserType, TokenHash, ExpirationDate, IsActive)
VALUES
(1, 'Patient', 'tokenhash1', '2025-06-01 23:59:59', TRUE),
(2, 'Doctor', 'tokenhash2', '2025-06-01 23:59:59', TRUE),
(3, 'Admin', 'tokenhash3', '2025-05-31 23:59:59', TRUE),
(4, 'Patient', 'tokenhash4', '2025-06-02 23:59:59', FALSE),
(5, 'Doctor', 'tokenhash5', '2025-06-02 23:59:59', TRUE),
(6, 'Admin', 'tokenhash6', '2025-06-03 23:59:59', TRUE);

INSERT INTO Test (TestName, Description, Cost)
VALUES
('Blood Test', 'General blood analysis including CBC', 50.00),
('X-Ray', 'Chest and limb X-ray imaging', 150.00),
('MRI Scan', 'Magnetic Resonance Imaging for detailed organ views', 1200.00),
('Urine Test', 'Urinalysis for kidney and infection screening', 30.00),
('ECG', 'Electrocardiogram for heart monitoring', 100.00),
('COVID-19 PCR', 'Polymerase Chain Reaction test for COVID-19 detection', 250.00);

INSERT INTO Prescription (AppointmentID, MedicineName, Dosage, Instructions)
VALUES
(1, 'Paracetamol', '500mg', 'Take one tablet every 6 hours after food'),
(2, 'Amoxicillin', '250mg', 'Take one capsule every 8 hours for 7 days'),
(3, 'Ibuprofen', '400mg', 'Take one tablet every 8 hours with water'),
(4, 'Cetirizine', '10mg', 'Take one tablet daily for allergies'),
(5, 'Metformin', '500mg', 'Take one tablet twice daily with meals'),
(6, 'Aspirin', '75mg', 'Take one tablet daily as blood thinner');

INSERT INTO AuditLog (UserID, UserType, Action, ActionTimestamp)
VALUES
(1, 'Patient', 'Logged in', '2025-06-01 09:00:00'),
(2, 'Doctor', 'Updated prescription', '2025-06-01 09:30:00'),
(3, 'Admin', 'Added new user', '2025-06-01 10:00:00'),
(1, 'Patient', 'Booked appointment', '2025-06-01 10:15:00'),
(2, 'Doctor', 'Reviewed test results', '2025-06-01 10:45:00'),
(3, 'Admin', 'Deleted old records', '2025-06-01 11:00:00');
