-- Testing_System_5
-- Chú ý: Tạo 1 File SQL đặt tên là "Testing_System_Assignment_5"
-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale

DROP VIEW IF EXISTS danh_sach_nhan_vien;
CREATE VIEW danh_sach_nhan_vien AS
SELECT FullName
FROM `Account`
WHERE DepartmentID = 2;

SELECT *
FROM danh_sach_nhan_vien ;


-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW account_tham_gia_nhieu_nhat AS
SELECT 		A.Username, A.FullName, COUNT(GA.GroupID) AS number_of_groups  
FROM		`Account` A 
INNER JOIN 	GroupAccount GA ON A.AccountID = GA.AccountID
GROUP BY	GA.AccountID
HAVING number_of_groups = (SELECT MAX(number_of_groups) FROM (SELECT GA.AccountID, COUNT(GroupID) AS number_of_groups
															 FROM GroupAccount GA
															 GROUP BY GA.AccountID) AS temp)
                                                             
SELECT *
FROM  account_tham_gia_nhieu_nhat ;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS phong_ban_nhieu_nhat;
CREATE VIEW phong_ban_nhieu_nhat AS
SELECT D.DepartmentName,   COUNT(A.AccountID) AS account_deparment
FROM Department D
JOIN `Account` A ON D.DepartmentID = A.DepartmentID
GROUP BY A.DepartmentID
HAVING account_deparment = (SELECT MAX(account_deparment)
							FROM ( SELECT A.DepartmentID, COUNT(A.AccountID) AS account_deparment
									FROM `Account` A
                                    GROUP BY A.DepartmentID ) AS he_he ) ;
                                    
 SELECT *
 FROM phong_ban_nhieu_nhat;
 
 
--  Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS User_Ho_Nguyen_Tao ;
CREATE VIEW User_Ho_Nguyen_Tao AS
SELECT A.FullName , Q.QuestionID , Q.Content
FROM `Account` A
JOIN Question Q ON Q.CreatorID = A.AccountID
WHERE FullName LIKE  'Nguyen%' ;




 
									