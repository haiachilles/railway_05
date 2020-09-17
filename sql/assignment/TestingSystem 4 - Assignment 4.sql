-- SQL – Assignment 4
-- Tiếp tục với Database Testing System
-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT A.Email , A. Username , A. FullName , A. DepartmentID , D.DepartmentName
FROM `Account` A 
INNER JOIN Department D  ON A. DepartmentID = D.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
SELECT *
FROM `Account`
WHERE CreateDate > '2010-12-20' ;

-- Question 3: Viết lệnh để lấy ra tất cả các developer 
SELECT *
FROM Position
WHERE PositionName =  'Dev' ;


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.DepartmentName, count(A.AccountID) AS so_nhan_vien
FROM `Account` A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName 
HAVING count(A.AccountID)>2;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
 -- nhất examexamquestion
SELECT 		*,COUNT(Q.Content) AS so_cau_hoi
FROM	ExamQuestion E
INNER JOIN	question Q ON E.QuestionID = Q.QuestionID
GROUP BY Q.Content
HAVING Count(Q.Content) = (	SELECT MAX(CountQ)
							FROM 
								(	SELECT 	COUNT(Q.QuestionID) AS CountQ
									FROM	ExamQuestion E
									INNER JOIN	question Q ON E.QuestionID = Q.QuestionID
									GROUP BY Q.QuestionID)AS MaxContent);
                                    
    --      Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT COUNT(Q.QuestionID) , Q.Content
FROM Question Q
JOIN CategoryQuestion CQ ON  Q.CategoryID = CQ.CategoryID
GROUP BY Q.QuestionID  ;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT COUNT(Q.QuestionID)  , E.Title
FROM Exam E
JOIN Question Q ON E.CategoryID = Q.CategoryID
Group BY Q.QuestionID ;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Q.content, COUNT(A.Answers)
FROM Question Q
INNER JOIN Answer A ON A.QuestionID = Q.QuestionID
GROUP BY A.QuestionID 
HAVING COUNT(A.Answers) = (SELECT MAX(CountA)
							FROM(	SELECT COUNT(A.Answers) AS CountA
									FROM Question Q
									INNER JOIN Answer A ON A.QuestionID = Q.QuestionID
									GROUP BY A.QuestionID )AS MaxCountA ) ;
	

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Q.content, COUNT(A.Answers)-- kết quả này sẽ được thêm vào phần HAVING bên dưới :))
FROM Question Q -- đặt tên Question của bảng Question thành Question Q
JOIN Answer A ON Q.QuestionID	= A.QuestionID -- JOIN bảng Question Q với Answer A ( có 2 trường Question của 2 bảng giống nhau )
GROUP BY A.QuestionID -- nhóm lại...cũng k rõ :v
HAVING COUNT(A.Answers) = (SELECT MAX(Cau_tra_loi)
							FROM (	SELECT COUNT(A.Answers) AS Cau_tra_loi
									FROM Question Q
									JOIN Answer A ON Q.QuestionID = A.QuestionID 
									GROUP BY A.QuestionID) AS CountA );
							
                            
   --   Question 9: Thống kê số lượng account trong mỗi group 
SELECT COUNT(GA.AccountID) AS SO_Luong , G.GroupID , G.GroupName
FROM `Group` G
JOIN `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY GA.AccountID ;

  -- Question 10: Tìm chức vụ có ít người nhất
SElECT 		P.PositionName , GROUP_CONCAT(A.FullName),  COUNT(A.AccountID) AS chuc_vu_it_nguoi
FROM 		`Account`A
JOIN  		Position P ON P.PositionID = A.PositionID
GROUP BY  	A.PositionID
HAVING 		COUNT(A.AccountID) = (SELECT MIN(chuc_vu)
								FROM ( SElECT COUNT(A.AccountID) AS chuc_vu
										FROM `Account`A
										JOIN  Position P ON P.PositionID = A.PositionID
										GROUP BY  A.PositionID  ) as min_chuc_vu) ;
                                
	-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
			
            
            
	-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
	--     question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì ?
    SELECT *
    FROM Question Q
    JOIN Answer A ON Q.QuestionID = A.QuestionID ;
    
    
    -- Question 14:Lấy ra group không có account nào
    SELECT *
    FROM  `Group` G
    LEFT JOIN  `GroupAccount` GA ON G.GroupID = GA.GroupID
    WHERE GA.GroupID IS NULL;
    
--  Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question Q
LEFT JOIN Answer A ON Q.QuestionID = A.QuestionID
WHERE A.QuestionID IS NULL;

-- Exercise 2: Union
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
 
 select *
 from `GroupAccount`
 WHERE GroupID = 1
 UNION
 SELECT *
 FROM `GroupAccount`
 WHERE GroupID = 2;


-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT G.GroupName, COUNT(A.AccountID)
FROM `Account` A
JOIN `GroupAccount` GA ON A.AccountID = GA.AccountID
JOIN `Group`G ON G.GroupID = GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(A.AccountID)>2
UNION
SELECT G.GroupName, COUNT(A.AccountID)
FROM `Account` A
JOIN `GroupAccount` GA ON A.AccountID = GA.AccountID
JOIN `Group`G ON G.GroupID = GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(A.AccountID)<7;






    
    
    
    
    


								










