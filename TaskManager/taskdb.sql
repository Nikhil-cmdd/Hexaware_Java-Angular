CREATE DATABASE taskdb;

USE taskdb;


create table user_data
( 
   uid int primary key auto_increment,
   name varchar(20),
   email varchar(20),
   password varchar(100),
   roles varchar(40)
)
 
select * from user_data;
commit;

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    priority ENUM('LOW', 'MEDIUM', 'HIGH'),
    status ENUM('PENDING', 'IN_PROGRESS', 'COMPLETED')
);

INSERT INTO tasks (title, description, due_date, priority, status) 
VALUES 
('Pay Electricity Bill', 'Pay the electricity bill before due date to avoid penalty.', '2025-06-30', 'HIGH', 'PENDING'),

('Doctor Appointment', 'Visit Dr. Mehta at Apollo Hospital for a regular check-up.', '2025-07-03', 'MEDIUM', 'IN_PROGRESS'),

('Grocery Shopping at Big Bazaar', 'Buy monthly groceries including rice, dal, and vegetables.', '2025-06-28', 'LOW', 'COMPLETED');
