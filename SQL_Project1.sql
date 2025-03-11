-
----------------------------------------------------------------------------------
-- 1.Create a database RG_TNT
Create database RG_TNT

---2.Create STUDENT_INFO table with following columns
---a) STUDENT_ID : should accept maximum of 11 characters , should not accept null values & 
---we must be able to identify each records uniquely using STUDENT_ID, student id must be 
---automatically generated in the format STD_YEAR_SEQUENCENO ex: std_2018_01
---b) NAME : should accept maximum of 20 characters , should not accept null values
---c) ADDRESS: should accept maximum of 90 characters , should not accept null values
---d) PHONE_NO : should accept exactly 10 numbers & each digit should be between 0-9, should not accept null values
---e) EMAIL_ID : should accept maximum of 30 characters & should contain @ , should not accept null values
---f) QUALIFICATION1: should accept maximum of 50 characters
---g) QUALIFICATION2: should accept maximum of 50 characters
---h) EXPERIENCE : should accept years ex: 2.5
---i) COMPANY NAME : should accept maximum of 50 characters
---j) COURSE_OPTED1 : should accept maximum of 50 characters, should not accept null values & should only accept following courses: REPORTING ANALYSIS POWER PACK
---BUSINESS ANALYTICS POWER PACK
---DATA ANALYTICS POWER PACK
---DATA SCIENCE MODELLING & MACHINE LEARNING
---k) COURSE_OPTED2: should accept maximum of 50 characters & only given courses
---l) COURSE_OPTED3: should accept maximum of 50 characters & only given courses
---m) ADMISSION_DATE : should accept date value & should not accept null values
---n) EXPECTED END DATE : should accept date value & automatically update using following data.
---REPORTING ANALYSIS POWER PACK – 3 MONTHS FROM ADMISSION DATE
---BUSINESS ANALYTICS POWER PACK – 6 MONTHS FROM ADMISSION DATE
---DATA ANALYTICS POWER PACK – 7 MONTHS FROM ADMISSION DATE
---DATA SCIENCE MODELLING & MACHINE LEARNING – 8 MONTHS FROM ADMISSION DATE

------------------------------------------------------------------------------
Create table STUDENT_INFO
(
ID int identity(1,1) Not Null,
STUDENT_ID as 'STD_2018_' + Right('0000' + cast(ID as varchar(10)),2) persisted primary key,
NAME varchar(20) not null,
[ADDRESS] varchar(90) not null,
PHONE_NO int not null,
				constraint chk_phone check(PHONE_NO like '%[0-9]%'),
EMAIL_ID varchar(30) not null,
				constraint chk_email check(EMAIL_ID like '%@%'),
QUALIFICATION1 varchar(50),
QUALIFICATION2 varchar(50),
EXPERIENCE Decimal(3,1),
COMPANY_NAME varchar(50),
COURSE_OPTED1 varchar(50) not null,
				constraint chk_cor_opt1 check(COURSE_OPTED1 in ('REPORTING ANALYSIS POWER PACK',
																'BUSINESS ANALYTICS POWER PACK',
																'DATA ANALYTICS POWER PACK',
																'DATA SCIENCE MODELLING & MACHINE LEARNING')),
COURSE_OPTED2 varchar(50),
				constraint chk_cor_opt2 check(COURSE_OPTED2 in ('REPORTING ANALYSIS POWER PACK',
																'BUSINESS ANALYTICS POWER PACK',
																'DATA ANALYTICS POWER PACK',
																'DATA SCIENCE MODELLING & MACHINE LEARNING')),
COURSE_OPTED3 varchar(50),
				constraint chk_cor_opt3 check(COURSE_OPTED3 in ('REPORTING ANALYSIS POWER PACK',
																'BUSINESS ANALYTICS POWER PACK',
																'DATA ANALYTICS POWER PACK',
																'DATA SCIENCE MODELLING & MACHINE LEARNING')),
ADMISSION_DATE date not null,
[EXPECTED END DATE] as Case
						when COURSE_OPTED1='REPORTING ANALYSIS POWER PACK' then dateadd(month,3,ADMISSION_DATE)
						when COURSE_OPTED1='BUSINESS ANALYTICS POWER PACK' then dateadd(month,6,ADMISSION_DATE)
						when COURSE_OPTED1='DATA ANALYTICS POWER PACK' then dateadd(month,7,ADMISSION_DATE)
						when COURSE_OPTED1='DATA SCIENCE MODELLING & MACHINE LEARNING' then dateadd(month,8,ADMISSION_DATE)
						end
)
 

SELECT * FROM STUDENT_INFO

----------------------------------------------------------------------------------
-- 2.Create R_marks_info table with following columns
-- a) Student_ID : should accept maximum of 11 characters, should not accept null values & should create a reference to student_info table
-- b) Class_start_Date : should accept date value
-- c) Class_End_Date : should accept date value
-- o) Faculty : should accept maximum of 50 characters , should not accept null values
-- d) Test_1 :
-- e) Test_2 :
-- f) Test_3 :
-- g) Retest1 :
-- h) Retest2 :
-- i) Retest3 :

Create table R_marks_info
(
Student_ID Varchar(11) not null Foreign Key References STUDENT_INFO (Student_ID),
Class_start_Date Date,
Class_End_Date Date,
Faculty varchar(50) Not Null,
[Test_1 :] float,
[Test_2 :] float,
[Test_3 :] float,
[Retest1 :] float,
[Retest2 :] float,
[Retest3 :] float
)

Select * from R_marks_info
----------------------------------------------------------------------------------
-- 3.Create SAS_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) MT-1
-- f) MT-2
-- g) Data_step_test
-- h) MT-3
-- i) Proc_Test
-- j) Base SAS Test
-- k) Retest1
-- l) Retest2
-- m) Retest3

Create table SAS_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
MT_1 float,
MT_2 float,
Data_step_test float,
MT_3 float,
Proc_Test float,
Base_SAS_Test float,
Retest1 float,
Retest2 float,
Retest3 float
)

Select * from SAS_marks_info

----------------------------------------------------------------------------------
-- 4. Create SQL_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) SQL_test1
-- f) SQL_test2
-- g) Retest1
-- h) Retest2

Create table SQL_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
SQL_test1 float,
SQL_test2 float,
Retest1 float,
Retest2 float
)

Select * from SQL_marks_info

----------------------------------------------------------------------------------
-- 5. Create EXCEL_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) Basic_excel_test
-- f) MT1
-- g) Excel_test1
-- h) Retest

Create table EXCEL_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
Basic_excel_test float,
MT_1 float,
Excel_test1 float,
Retest float
)

Select * from EXCEL_marks_info

----------------------------------------------------------------------------------
-- 6. Create VBA_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) Function_excel_Test
-- f) Function_vba_test
-- g) Final_test
-- h) Retest1

Create table VBA_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
Function_excel_Test float,
Function_vba_test float,
Final_test float,
Retest1 float
)

Select * from VBA_marks_info

----------------------------------------------------------------------------------
-- 7. Create TABLEAU_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) MT1
-- f) Test1
-- g) Retest1

Create table TABLEAU_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
MT_1 float,
Test1 float,
Retest1 float
)

Select * from TABLEAU_marks_info

----------------------------------------------------------------------------------
-- 8. Create PYTHON_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) Test1
-- f) Test2
-- g) Retest1
-- h) Retest2

Create table PYTHON_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
Test1 float,
Test2 float,
Retest1 float,
Retest2 float
)

Select * from PYTHON_marks_info

----------------------------------------------------------------------------------
-- 8. Create ML_marks_info table with following columns
-- a) Student_ID : should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) Test1
-- f) Test2
-- g) Retest

Create table ML_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
Test1 float,
Test2 float,
Retest float
)

Select * from ML_marks_info

----------------------------------------------------------------------------------
-- 9. Create ASAS_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) MT1
-- f) MT2
-- g) Final_test
-- h) Retest

Create table ASAS_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
MT_1 float,
MT_2 float,
Final_test float,
Retest float
)

Select * from ASAS_marks_info

----------------------------------------------------------------------------------
-- 10.Create FULL_LENGTH_marks_info table with following columns
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values & should create a
-- reference to student_info table
-- b) Class_start_Date
-- c) Class_End_Date
-- d) Faculty
-- e) R_test
-- f) SAS_test
-- g) SQL_test
-- h) Excel_test
-- i) VBA_test
-- j) Python_test
-- k) Tableau_test

Create table FULL_LENGTH_marks_info
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Class_start_Date date,
Class_End_Date date,
Faculty varchar(50),
R_test float,
SAS_test float,
SQL_test float,
Excel_test float,
VBA_test float,
Python_test float,
Tableau_test float
)

Select * from FULL_LENGTH_marks_info

----------------------------------------------------------------------------------
-- 11.Create Placement_Activity table with following Columns Names
-- a) Student_ID: should accept maximum of 11 characters, should not accept null values &should create a
-- reference to student_info table
-- b) Mock_interview1: should accept maximum of 50 characters
-- c) Mock_interview2: should accept maximum of 50 characters
-- d) Mock_interview3: should accept maximum of 50 characters
-- e) Resume Finalised: should accept maximum of 50 characters
-- f) Profile_Building: should accept maximum of 50 characters
-- g) Certificate_Issued: should accept only YES/NO
-- h) Actual_course_enddate

Create table Placement_Activity
(
Student_ID varchar(11) Not Null Foreign Key References STUDENT_INFO(Student_ID),
Mock_interview1 varchar(50),
Mock_interview2 varchar(50),
Mock_interview3 varchar(50),
[Resume Finalised] varchar(50),
Profile_Building varchar(50),
Certificate_Issued varchar(5),
					constraint chk_plc_act_cer_iss check (Certificate_Issued in ('YES','NO')),
Actual_course_enddate date
)

Select * from Placement_Activity

----------------------------------------------------------------------------------
