select * from academic_sessions
select * from semesters
select * from job_roles
select * from employee_types
select * from employee_details
select * from faculties
select * from departments
select * from students
select * from courses
select * from courses_enrollments



--insert records in each tables
insert into academic_sessions (session_id, session_name,is_active)
values
('20222023', '2022-2023 Academic Session', false),
('20232024', '2023-2024 Academic Session', false),
('20242025', '2024-2025 Academic Session', True),
('20252026', '2025-2026 Academic Session', false),
('20262027', '2026-2027 Academic Session', false)


insert into semesters (semester_name, session_id, start_date, end_date)
values
('22/23 First semster', '20222023', '2022-11-01', '2023-02-28'),
('22/23 Second semster', '20222023', '2023-04-01', '2023-07-31'),
('23/24 First semster', '20232024', '2023-11-01', '2024-02-28'),
('23/24 Second semster', '20232024', '2024-04-01', '2024-07-31'),
('24/25 First semster', '20242025', '2024-11-01', '2025-02-28'),
('24/25 Second semster', '20242025', '2024-04-01', '2025-07-31'),
('25/26 First semster', '20252026', '2025-11-01', '2026-02-28'),
('25/26 Second semster', '20252026', '2026-04-01', '2026-07-31'),
('26/27 First semster', '20262027', '2026-11-01', '2027-02-28'),
('26/27 Second semster', '20262027', '2027-04-01', '2027-07-31')


insert into job_roles (job_role_name)
values
('Professor'),
('Associate Professor'),
('Senior Lecturer'),
('Lecturer 1'),
('Lecturer 2'),
('Assistant Lecturer'),
('Graduate Assistant')


insert into employee_types (employee_type_name)
values
('Acedamic Staff'),
('Non-Acedamic Staff')


insert into employee_details (first_name, last_name, gender, date_of_birth, job_role_id, employee_type_id, enrollment_date, is_active)
values
('Prof. Emmanuel', 'Nwosu', 'M', '1975-05-11', 1, 1, '1998-11-01', True),
('Prof.(Mrs.) Stella', 'Madueme', 'F', '1965-01-25', 1, 1, '1993-11-01', False),
('Prof.(Mrs.) Gladys', 'Aneke', 'F', '1967-08-21', 1, 1, '1993-11-01', True),
('Prof. Ezebuilo', 'Ukwueze', 'M', '1976-08-21', 1, 1, '2002-11-01', True),
('Dr. Fredrick', 'Asogwa', 'M', '1979-07-30', 2, 1, '2004-11-01', True),
('Dr. Anthony', 'Orji', 'M', '1984-11-03', 3, 1, '2009-11-01', True),
('Dr.(Mrs) Ifeoma', 'Mba', 'F', '1987-04-19', 4, 1, '2010-11-01', True),
('Dr. Onyinye', 'David-Wayas', 'F', '1987-12-05', 4, 1, '2010-11-01', True),
('Vivian', 'Nnetu-Okoliuwa', 'F', '1991-07-11', 6, 1, '2013-11-01', True),
('Stephen', 'Aguegboh', 'M', '1992-01-02', 7, 1, '2014-11-01', False)


insert into faculties (faculty_id, faculty_name, faculty_dean_id, session_id)
values
('SS', 'Faculty of Socal Sciences', 3, '20222023'),
('MED', 'Faculty of Medical Sciences', 3, '20222023'),
('LAW', 'Faculty of Law', 3, '20222023'),
('DEN', 'Faculty of Dentistry', 3, '20222023'),
('ENV', 'Faculty of Environmental Sciences', 3, '20222023'),
('BA', 'Faculty of Business Administration', 3, '20222023'),
('BS', 'Faculty of Biological Sciences', 3, '20222023'),
('ENG', 'Faculty of Engineering', 3, '20222023'),
('EDU', 'Faculty of Education', 3, '20222023'),
('ART', 'Faculty of ART', 3, '20222023')


insert into departments (department_id, department_name, department_head_id, faculty_id, session_id)
values
('ECON', 'Department of Economics', 4, 'SS', '20222023'),
('GEO', 'Department of Geography', 4, 'SS', '20222023'),
('URP', 'Department of Urban and Regional Planning', 3, 'ENV', '20222023'),
('EMGT', 'Department of Estate Management', 3, 'ENV', '20222023'),
('ACCT', 'Department of Accountancy', 3, 'BA', '20222023'),
('B&F', 'Department of Banking and Finance', 3, 'BA', '20222023'),
('MECH', 'Department of Mechanical Engineering', 2, 'ENG', '20222023'),
('CIV', 'Department of Civil Engineering', 2, 'ENG', '20222023'),
('BIO', 'Department of Biochenistry', 2, 'BS', '20222023'),
('MIC', 'Department of Microbiology', 2, 'BS', '20222023')



insert into students (first_name, last_name, date_of_birth, gender, enrollment_date, department_id, faculty_id, session_id, address, phone_number, email_address)
values
('Chiemelumogo', 'Amadi', '1993-04-27', 'M', '2022-11-01', 'ECON', 'SS', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Chidinma', 'Nwizu', '1994-07-19', 'F', '2022-11-01', 'ECON', 'SS', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Odinaka', 'Okeke', '1991-08-20', 'F', '2022-11-01', 'ECON', 'SS', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('kaodilichukwu', 'Echem', '1993-06-11', 'M', '2022-11-01', 'ECON', 'SS', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Ugochukwu', 'Aroun', '1994-01-20', 'M', '2022-11-01', 'CIV', 'ENG', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Obiora', 'Amuta', '1993-09-23', 'M', '2022-11-01', 'MECH', 'ENG', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Tobechukwu', 'Ndunagu', '1994-01-18', 'M', '2022-11-01', 'ACCT', 'BA', '20222023', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Lauryn', 'Okafu', '2002-10-23', 'F', '2024-11-01', 'ACCT', 'BA', '20242025', 'UNN', '+2348123456789',  'abcdefg@gmail.com'),
('Chinenye', 'Nwangwu', '1998-10-16', 'F', '2023-11-01', 'BIO', 'BS', '20232024', 'UNN', '+2348123456789', 'abcdefg@gmail.com'),
('Chiazamoku', 'Amadi', '1998-11-25', 'F', '2023-11-01', 'MECH', 'ENG', '20232024', 'UNN', '+2348123456789', 'abcdefg@gmail.com')


insert into courses (course_id, course_name, department_id, credit_unit, session_id, lecture_id)
values
('ECO 101', 'Principles of Economics 1', 'ECON', 2, '20222023', 9),
('ECO 121', 'Introduction to Accounting', 'ECON', 2, '20222023', 10),
('ECO 131', 'Introduction to Economic Statistics 1', 'ECON', 2, '20222023', 7),
('ECO 102', 'Principles of Economics II', 'ECON', 2, '20222023', 9),
('ECO 122', 'Introduction to Business Management', 'ECON', 2, '20222023', 5),
('ECO 124', 'Principles of Business Finance', 'ECON', 2, '20222023', 9),
('ECO 132', 'Introduction to Economic Statistics II', 'ECON', 2, '20222023', 7),
('ECO 201', 'Microeconomic Theory I', 'ECON', 2, '20232024', 8),
('ECO 203', 'Macroeconomic Theory I', 'ECON', 2, '20232024', 4),
('ECO 233', 'Intermediate Mathematical Economics I', 'ECON', 2, '20232024', 1),
('ECO 281', 'History and Structure of the Nigerian Economy1', 'ECON', 2, '20232024', 3)


insert into courses_enrollments (student_id, course_id, semster_id)
values
(1, 'ECO 101', 1),
(1, 'ECO 131', 1),
(2, 'ECO 121', 1),
(3, 'ECO 101', 1),
(4, 'ECO 101', 1),
(1, 'ECO 201', 3),
(1, 'ECO 233', 3),
(2, 'ECO 203', 3),
(3, 'ECO 201', 3),
(4, 'ECO 281', 3)




