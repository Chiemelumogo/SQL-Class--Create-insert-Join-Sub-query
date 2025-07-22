--Table Creation
create table academic_sessions
(
session_id varchar(8) primary key,
Session_name varchar(20) Not Null,
is_active boolean Not Null,
date_created timestamp default current_timestamp
)

create table semesters
(
Semester_id serial primary key,
Semester_Name varchar(40) not null,
Session_id varchar(8),
Date_Created timestamp default current_timestamp,
foreign key (session_id) references academic_sessions(session_id)
)


-- Add column to an exising table
alter table semesters
add start_date date

alter table semesters
add end_date date


-- Change/alter column
alter table academic_sessions
alter column Session_name type varchar(40)


--Drop Table (Discard the table, remove the table from the database)
Drop table semester


--Delete record in a table
delete table semester
where semester_id = 1


--Truncate table (To empty the table)
truncate table semester


--Back to table creation
create table job_roles
(
job_role_id serial primary key,
job_role_name varchar(30) not null,
date_created timestamp default current_timestamp
)

create table employee_types
(
employee_type_id serial primary key,
employee_type_name varchar(30) not null,
date_created timestamp default current_timestamp
)

create table employee_details
(
employee_id serial primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
gender char(1) not null,
date_of_birth date not null,
job_role_id int,
employee_type_id int,
enrollment_date date not null,
is_active boolean not null,
date_created timestamp default current_timestamp,
foreign key (job_role_id) references job_roles(job_role_id),
foreign key (employee_type_id)references employee_types(employee_type_id)
)

create table faculties
(
faculty_id char(3) primary key,
faculty_name varchar(100) not null,
faculty_dean_id int,
session_id varchar(8),
date_created timestamp default current_timestamp,
foreign key (faculty_dean_id) references employee_details(employee_id),
foreign key (session_id) references academic_sessions(session_id)
)

create table departments
(
department_id char(4) primary key,
department_name varchar(100),
department_head_id int,
faculty_id char(3),
session_id varchar(8),
date_created timestamp default current_timestamp,
foreign key (session_id) references academic_sessions(session_id),
foreign key (department_head_id) references employee_details(employee_id),
foreign key (faculty_id) references faculties(faculty_id),
)

create table students
(
student_id serial primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date not null,
gender char(1) not null,
enrollment_date date not null,
department_id char(4),
faculty_id char(3),
session_id varchar(8),
address varchar(250) not null,
phone_number varchar(14) not null,
email_address varchar(100) not null,
CGPA float,
date_created timestamp default current_timestamp,
foreign key (session_id) references academic_sessions(session_id),
foreign key (department_id) references departments(department_id),
foreign key (faculty_id) references faculties(faculty_id)
)

create table courses
(
course_id char(7) primary key,
course_name varchar(100) not null,
department_id char(4),
credit_unit int not null,
session_id varchar(8),
lecture_id int,
date_created timestamp default current_timestamp,
foreign key (department_id) references departments(department_id),
foreign key (lecture_id) references employee_details(employee_id),
foreign key (session_id) references academic_sessions(session_id)
)

create table courses_enrollments
(
enrollment_id serial primary key,
student_id int,
course_id char(7),
semster_id int,
enrollment_date timestamp default current_timestamp,
score int,
grade varchar(2),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id),
foreign key (semster_id) references semesters(Semester_id)
)


