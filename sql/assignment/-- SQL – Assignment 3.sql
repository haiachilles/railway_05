-- SQL – Assignment 3
-- Question 2: lấy ra tất cả các phòng ban
USE TestingSystem;
SELECT * 
FROM Department ;
-- Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'Bán hàng';


-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT  MAX(FullName)
FROM `Account`;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id
 -- = 2
 SELECT MAX(FullName), DepartmentID
FROM  `Account`
WHERE DepartmentID = 2 ;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName, CreateDate
FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID
FROM Answer
GROUP BY QuestionID 
HAVING COUNT(QuestionID) >= 4 ;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày
-- 20/12/2019

SELECT Duration , CreateDate
FROM Exam
WHERE Duration >60 AND CreateDate < '2019-12-20' ;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT GroupName , CreateDate
FROM `Group`
GROUP BY GroupName
ORDER BY CreateDate DESC 
LIMIT 5 ;

--
-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(AccountID)
FROM `Account`
WHERE departmentID = 2 ;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT FullName
FROM `Account`
WHERE FullName LIKE 'D%o' ;

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
-- Question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE 
FROM 		Exam 
WHERE 		CreateDate < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
-- SELECT * FROM  question
-- WHERE (SUBSTRING_INDEX(question) = 'Câu hỏi ';

-- Question 14: Update thông tin của account có id =  5 thành tên "Nguyễn Bá Lộc" và
  -- email thành loc.nguyenba@vti.com.vn
UPDATE `Account`
SET FullName = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

select * from `Account`
WHERE AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
SELECT *
FROM groupaccount
WHERE AccountID = 5;

UPDATE groupaccount
SET GroupID = 4
WHERE AccountID = 5;