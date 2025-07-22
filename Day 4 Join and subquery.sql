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


--- JOINS

select faculties.faculty_id, Faculty_name, department_name, department_id
from departments
join faculties
on faculties.faculty_id = departments.faculty_id

select Faculty_name, department_name 
from departments
right join faculties
on faculties.faculty_id = departments.faculty_id

select Faculty_name, department_name 
from departments
left join faculties
on faculties.faculty_id = departments.faculty_id


-- Questions
-- -- List all students along with their department name
Select concat(first_name, ' ', last_name) "Student Name", date_of_birth "Date of Birth", gender "Gender", Department_name "Department"
from students
Join Departments
on students.department_id = departments.department_id
order by date_of_birth

-- Retrieve the names of students and the courses they are enrolled in.
select stds.student_id "Matric Number", concat(first_name, ' ', last_name) "Student Name", courses.course_id "Course Code", course_name "Course Title" 
from students stds join courses_enrollments ce
on stds.student_id = ce.student_id
join courses on courses.course_id = ce.course_id
order by "Matric Number"

-- Find all courses along with the lecturer and department name they belong to
select course_id "Course Code", Course_name "Course Title", credit_unit, concat(first_name, ' ', last_name) "Lecturer", is_active, department_name "Department"
from courses co join departments dp
on dp.department_id = co.department_id
join employee_details on employee_id = lecture_id
Order by course_id

-- List all courses along with the names of the instructors teaching them.
select Course_id "Course Code", Course_name "Course Title", credit_unit "Credit Unit", first_name || ' '|| last_name "Lecturer"
from courses join employee_details
on lecture_id = employee_id

-- List all students as student name along with the names of their departments.
select concat(first_name, ' ', last_name) "Student Name", department_name "Department"
from students stds join departments dp
on dp.department_id = stds.department_id
order by last_name

-- List all employees as employee name along with their staff type and job role.
select concat(first_name, ' ', last_name) "Staff Name", employee_type_name "Employee Type", job_role_name "Job Role"
from employee_details ed join employee_types et
on et.employee_type_id = ed.employee_type_id
join job_roles jr on jr.job_role_id = ed.job_role_id
Order by jr.job_role_id

-- Find the names of students who are enrolled in the 'Introduction to Psychology' course.
select concat(first_name, ' ', last_name)
from courses_enrollments ce join students st
on st.student_id = ce.student_id
join courses co on co.course_id = ce.course_id
Where co.course_id = 'ECO 101'

-- Retrieve the courses taught by instructors who were hired after 2009
select concat(first_name, ' ', last_name) "Staff Name", course_name
from employee_details join courses
on lecture_id = employee_id
where enrollment_date >= '2009-01-01'

-- Number of courses taught by lecturers hird after 2009 and their names
select concat(first_name, ' ', last_name) "Staff Name", count(first_name) "Number of Courses"
from employee_details join courses
on lecture_id = employee_id
where enrollment_date >= '2009-01-01'
Group by "Staff Name"

-- List courses that have no students enrolled
select ce.course_id, course_name
from courses co join courses_enrollments ce
on co.course_id = ce.course_id
where ce.student_id in (select student_id from students)

-- Retrieve the names of students who scored above 80 in any course.
select concat(first_name, ' ', last_name) "Student Name", Course_id, Score
from courses_enrollments ce join students st
on ce.student_id = st.Student_id
where score > 80

-- Find students who are taking more than 2 courses and their courses
select st.student_id, concat(first_name, ' ', last_name) "Student Name", course_id
from students st join courses_enrollments ce
on st.student_id = ce.student_id
where course_id in (select course_id from courses_enrollments 
group by course_id having count(course_id) >= 2)
order by st.student_id

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
-- Subquery

-- Find the names of students who are enrolled in the 'Introduction to Psychology' course.

select concat(first_name, ' ', last_name)
from students 
Where student_id in (select student_id from courses_enrollments where course_id = 'ECO 101')

-- Retrieve the courses taught by instructors who were hired after 2009
select course_id, course_name
from courses
where lecture_id in (select employee_id from employee_details where enrollment_date > '2009-01-01')


-- List courses that have no students enrolled
select course_id, course_name
from courses
where course_id not in (select distinct course_id from courses_enrollments)

-- Retrieve the names of students who scored above 80 in any course.
select concat(first_name, ' ', last_name) "Student Name"
from students
where student_id in (select distinct student_id from courses_enrollments where score > 80)

-- Find students who are taking more than 2 courses.
select concat(first_name, ' ', last_name) "Student Name",
case when gender = 'Male' else 'Female' end
from Students"Student Name"
from students
where student_id in (select student_id from courses_enrollments group by student_id having count(course_id) >= 2)

-- Case When

select concat(first_name, ' ', last_name) "Student Name",
case 
	when gender = 'M' then 'Male' 
	else 'Female' end
from students

-- List students with their score and grades
select st.student_id, concat(first_name, ' ', last_name) "Student Name", co.course_id, course_name, score,
case
	When score >= 80 then 'A'
	When score between 70 and 79 then 'B'
	When score between 60 and 69 then 'C'
	When score between 50 and 59 then 'D'
	When score between 40 and 49 then 'E'
	Else 
		'F' End
from courses_enrollments ce join students st
on st.student_id = ce.student_id
join courses co on co.course_id = ce.course_id
ORDER BY 1

-- COALESCE
select Faculty_name, coalesce(department_name, 'No department yet') department_name 
from departments
right join faculties
on faculties.faculty_id = departments.faculty_id
