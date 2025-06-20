CREATE DATABASE AmazeCareDB;
USE AmazeCareDB;

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    contact_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO patients (name, dob, gender, contact_number, email, password, address) VALUES
('Ananya Rao', '1995-07-21', 'Female', '9876543215', 'ananya.rao@example.com', 'ananya12', 'Bangalore'),
('Ravi Mehra', '1989-03-15', 'Male', '9876543216', 'ravi.mehra@example.com', 'ravi12', 'Delhi'),
('Kavita Shah', '2001-11-05', 'Female', '9876543217', 'kavita.shah@example.com', 'kavita12', 'Mumbai'),
('Aman Gupta', '1992-08-30', 'Male', '9876543218', 'aman.gupta@example.com', 'aman12', 'Hyderabad'),
('Sneha Pillai', '1990-12-12', 'Female', '9876543219', 'sneha.pillai@example.com', 'sneha12', 'Chennai');

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    experience_years INT NOT NULL,
    qualification VARCHAR(100),
    designation VARCHAR(100),
    contact_number VARCHAR(15) UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO doctors (name, specialty, experience_years, qualification, designation, contact_number, email, password) VALUES
('Dr. Poornima C', 'Obstetrics and Gynecology', 18, 'MS (OG)', 'Associate Professor/Consultant', '9876543210', 'poornima@gmail.com', 'poornima12'),
('Dr. Rajeev Sharma', 'Cardiology', 15, 'MD (Cardiology)', 'Senior Consultant','9876543211','rajeev@gmail.com','rajeev12'),
('Dr. Aarti Verma', 'Dermatology', 8, 'MD (Dermatology)', 'Consultant','9876543212','aarti@gmail.com','aarti12'),
('Dr. Anil Kumar', 'General Medicine', 10, 'MD (General)', 'Consultant','987654323','anil@gmail.com','anil12'),
('Dr. Meena Iyer', 'Pediatrics', 12, 'MD (Pediatrics)', 'Senior Consultant','9876543214','meena@gmail.com','meena12');

CREATE TABLE Admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admins (name, email, password) VALUES
('System Admin', 'admin@amazecare.com', 'sysadmin'),
('Reception Head', 'reception@amazecare.com', 'recadmin'),
('Lab Admin', 'labadmin@amazecare.com', 'labadmin'),
('Super Admin', 'superadmin@amazecare.com', 'superadmin'),
('Records Officer', 'records@amazecare.com', 'recordadmin');

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    symptoms TEXT,
    nature_of_visit TEXT,
    appointment_date DATETIME,
    status ENUM('Pending', 'Confirmed', 'Completed', 'Cancelled', 'Rejected') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, symptoms, nature_of_visit) VALUES
(1, 1, '2025-06-05 10:30:00', 'Confirmed', 'Irregular periods', 'General check-up'),
(2, 2, '2025-06-06 11:00:00', 'Confirmed', 'Chest pain', 'Cardiac evaluation'),
(3, 4, '2025-05-30 15:00:00', 'Completed', 'Fever and fatigue', 'General illness'),
(4, 3, '2025-06-07 14:00:00', 'Confirmed', 'Rash and itching', 'Skin consultation'),
(5, 5, '2025-06-01 09:30:00', 'Completed', 'Fever and cough', 'Pediatric follow-up');

CREATE TABLE MedicalRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    doctor_id INT,
    patient_id INT,
    symptoms TEXT,
    physical_examination TEXT,
    treatment_plan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO MedicalRecords (appointment_id, doctor_id, patient_id, symptoms, physical_examination, treatment_plan) VALUES
(3, 4, 3, 'Fever, fatigue, headache', 'Temp 101°F, BP normal', '5-day antibiotics + blood test'),
(5, 5, 5, 'Cough, fever', 'Temp 100°F, chest clear', 'Paracetamol + rest'),
(1, 1, 1, 'Menstrual issues', 'Normal gyne exam', 'Scan + hormone test'),
(2, 2, 2, 'Mild chest pain', 'BP 140/90, pulse high', 'ECG + stress test'),
(4, 3, 4, 'Skin rash', 'Redness on arms', 'Antihistamines + ointment');
select * from medicalrecords;

CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(50),
    manufacturer VARCHAR(20),
    price_per_unit INT
);

INSERT INTO Medicines (medicine_name, manufacturer, price_per_unit) VALUES
('Paracetamol 500mg', 'Cipla', 2.50),
('Cetrizine 10mg', 'Sun Pharma', 1.00),
('Paracetamol 250mg', 'Zydus', 2.00),
('Dydrogesterone', 'Abbott', 5.50),
('Hydrocortisone cream', 'Dr. Reddy\'s', 3.75);

CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT,
    medicine_name VARCHAR(100),
    medicine_id INT,
    dosage VARCHAR(50),
    timing VARCHAR(50),
    duration VARCHAR(50),
    FOREIGN KEY (record_id) REFERENCES MedicalRecords(record_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id) ON DELETE CASCADE
);

INSERT INTO prescriptions (record_id, medicine_name, medicine_id, dosage, timing, duration) VALUES
(1, 'Paracetamol 500mg', 1, '1 tablet', '0-0-1 AF', '5 days'),
(1, 'Cetrizine 10mg', 2, '1 tablet', '1-0-0 BF', '5 days'),
(2, 'Paracetamol 250mg', 3, '1 tablet', '0-1-1 AF', '3 days'),
(3, 'Dydrogesterone', 4, '1 tablet', '1-0-0 BF', '10 days'),
(5, 'Hydrocortisone cream', 5, 'Apply thin layer', '2 times daily', '7 days');

select * from patients;

select * from doctors;

select * from admins;

select * from medicalrecords;

select * from appointments;

select * from medicines;

select * from prescriptions;
