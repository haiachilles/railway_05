-- Extra Assignment 4
-- Exercise 1:
-- Cho table sau:
-- Department (Department_Number, Department_Name)
-- Employee_Table (Employee_Number, Employee_Name,
-- Department_Number)
-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

-- CREATE TABLE
DROP DATABASE IF EXISTS Extra_Assignment_4 ;
CREATE DATABASE Extra_Assignment_4 ;
USE Extra_Assignment_4 ;

/* ======TẠO BẢNG DỮ LIỆU (Q1)========*/
-- Department (Department_Number, Department_Name)
-- Employee_Table (Employee_Number, Employee_Name, Department_Number)
-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)
DROP DATABASE IF EXISTS Department ;
CREATE TABLE Department(
 Department_Number  TINYINT UNSIGNED PRIMARY KEY ,
 Department_Name	NVARCHAR(50)UNIQUE KEY NOT NULL
 );
 
 
 DROP DATABASE IF EXISTS Employee_Table ;
 CREATE TABLE Employee_Table(
 Employee_Number  TINYINT UNSIGNED PRIMARY KEY ,
 Employee_Name    NVARCHAR NOT NULL,
 Department_Number TINYINT UNSIGNED NOT NULL,
 FOREIGN KEY  (Department_Number)  REFERENCES Department(Department_Number)
 );
 
 DROP DATABASE IF EXISTS Employee_Skill_Table ;
 CREATE TABLE Employee_Skill_Table (
 Employee_Number  TINYINT UNSIGNED PRIMARY KEY,
 Skill_Code       NVARCHAR(50) NOT NULL,
 Date_Registered  DATETIME DEFAULT NOW(),
FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number),
);

-- INSERT dữ liệu vào 
INSERT INTO					 Department_Number  			 DepartmentName_Name
VALUE    					(	1	,							'Marketing'		),
							(	2 	,							'Sale'			),
							(	3   ,							'Bảo vệ'		),
							(	4	,							'Nhân sự'		),
							(	5	,							'Kỹ thuật'		),
							(	6	,							'Tài chính'		),
							(	7	,							'Phó giám đốc'	),
							(	8	,							'Giám đốc'		),
							(	9	,							'Thư kí'		),
							(	10	,							'Bán hàng'		);
						
            
INSERT INTO Employee_Table	(Employee_Number	 Employee_Name			, Department_Number	)
VALUE						(1,					'Nguyễn Thùy Anh'		,		1			),
							(2,					'Trần Thị Ngọc Trang'	,		1			),
							(3,					'Hoàng Thủy Tiên'		,		2			),
							(4,					'Hoàng Thị Cẩm Chi'		,		5			),
							(5,					'Nguyễn Thị Ngọc'		,		6			),
							(6,					'Cù Thị Hiền'			,		5			),
							(7,					'Nguyễn Thảo Vân'		,		5			),
							(8,					'Mai Trịnh Linh Chi'	,		1			),
							(9,					'Hoàng Thanh Lan'		,		9			),
							(10,				'Trần Thị Tú Anh'		,		10			);
                            
INSERT INTO Employee_Skill_Table 	(Employee_Number, Skill_Code	, Date_Registered	)
VALUE								( 	1,				'Java'		, '2020-03-15'		),
									( 	2,				'Android'	, '2020-03-16'		),
									( 	3,				'C#'		, '2020-03-17'		),
									( 	1,				'SQL'		, '2020-03-20'		),
									( 	1,				'Postman'	, '2020-03-21'		),
									( 	4,				'Ruby'		, '2020-04-22'		),
									( 	5,				'Java'		, '2020-04-24'		),
									( 	6,				'C++'		, '2020-04-27'		),
									( 	7,				'C Sharp'	, '2020-04-04'		),
									( 	10,				'PHP'		, '2020-04-10'		);

                            
	--  Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
    --  Hướng dẫn: sử dụng UNION
    /* ======TRUY VẤN DỮ LIỆU (Q3)========*/

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT 	ET.Employee_Number, ET.Employee_Name, ET.Department_Number, EST.Skill_Code 
FROM	Employee_Table ET 
RIGHT JOIN Employee_Skill_Table EST
ON		ET.Employee_Number = EST.Employee_Number
WHERE	EST.Skill_Code = 'Java';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên
SELECT		D.Department_Number, D.Department_Name, COUNT(ET.Department_Number)
FROM		Department D 
INNER JOIN Employee_Table ET ON		D.Department_Number = ET.Department_Number
GROUP BY 	ET.Department_Number
HAVING		COUNT(ET.Department_Number)>=3
ORDER BY	D.Department_Number ASC;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT		ET.*
FROM		Department D INNER JOIN Employee_Table ET ON	D.Department_Number = ET.Department_Number
ORDER BY	D.Department_Number ASC;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT 		ET.*, COUNT(EST.Employee_Number)
FROM		Employee_Table ET 
RIGHT JOIN Employee_Skill_Table EST  ON		ET.Employee_Number = EST.Employee_Number
GROUP BY	ET.Employee_Number
HAVING 		COUNT(EST.Employee_Number)>1;

                            
						

            
            
            
            