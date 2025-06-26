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

INSERT INTO tasks (title, description, due_date, priority, status) VALUES
('Buy groceries', 'Pick up fruits and vegetables from the store', '2025-06-28', 'LOW', 'PENDING'),
('Pay electricity bill', 'Pay this month\'s electricity bill online', '2025-06-27', 'MEDIUM', 'PENDING'),
('Team meeting', 'Discuss project updates with the team', '2025-06-29', 'HIGH', 'IN_PROGRESS'),
('Call plumber', 'Fix leaking tap in the kitchen', '2025-06-30', 'LOW', 'PENDING'),
('Submit report', 'Final report submission to manager', '2025-07-01', 'HIGH', 'COMPLETED');
