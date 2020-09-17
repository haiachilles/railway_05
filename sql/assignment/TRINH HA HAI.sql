-- Requirement 1:
-- Để quản lý Thực tập của sinh viên, người ta xây dựng một cơ sở dữ liệu có tên là
-- ThucTap gồm các sơ đồ quan hệ sau (trường có dấu gạch chân là PrimaryKey):
--  GiangVien(magv, hoten, luong)
--  SinhVien(masv, hoten, namsinh, quequan)
--  DeTai(madt, tendt, kinhphi, NoiThucTap)
--  HuongDan(id, masv, madt, magv, ketqua)
-- Questions
-- 1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 3 bản ghi vào table

DROP DATABASE IF EXISTS THUC_TAP_SINH_VIEN ;
CREATE DATABASE THUC_TAP_SINH_VIEN ;
USE  THUC_TAP_SINH_VIEN ;

DROP TABLE IF EXISTS GiangVien ;
CREATE TABLE GiangVien(
Magiaovien 		TINYINT UNSIGNED PRIMARY KEY,
hoten 			NVARCHAR(30) NOT NULL UNIQUE KEY,
luong			MEDIUMINT UNSIGNED 
);
INSERT INTO GiangVien (Magiaovien,		 hoten,					luong)
VALUES				('1',			'Tran Thi Ha',				'6000000'	),
					('2',			'Hoang Mai Phuong',			'1000000'  ),
                    ('3',			'Pham Thi Lien',			'6700000'   ),
                    ('4',			'Tran Thi Huong',			'5000000'	),
                    ('5',			'Pham Thi Rang',			'2000000'	);
DROP TABLE IF EXISTS SinhVien ;
CREATE TABLE SinhVien(
Masinhvien    	TINYINT UNSIGNED PRIMARY KEY,
Hoten			NVARCHAR(30) NOT NULL ,
Namsinh			MEDIUMINT UNSIGNED,
Quequan			NVARCHAR(100) NOT NULL 
);
INSERT INTO SinhVien	(Masinhvien , 		Hoten,							Namsinh,		Quequan		 		)
VALUES					('1',				'TRinh Ha Hai'		,			'1997',			'Thanh Hoa'			),
						('2',				'Nguyen Quoc Thang' , 			'1996',			'Yen Hoa'			),
                        ('3',				'Pham Tuan Anh'		,			'1997',			'Tran Duy Huong'	),
						('4',				'Pham Ngoc Toan'	,			'1989',			'Tay Ho'			),
                        ('5',				'Dinh Cong Tuan'	,			'1995',			'Thanh Hoa'			);
 DROP TABLE IF EXISTS   DeTai;
CREATE TABLE DeTai(
`Madetai`    	 TINYINT UNSIGNED PRIMARY KEY,
Tendetai	 	 NVARCHAR(100) NOT NULL,
Kinhphi		 MEDIUMINT UNSIGNED,
Noithuctap		 NVARCHAR(100) NOT NULL
);

INSERT INTO DeTai ( Madetai,		Tendetai,						Kinhphi,		Noithuctap   )	
VALUES 			  ('1',			'Cong Nghe Sinh Hoc'	,			'10000000' ,	'Ha Noi'	 ),
				  ('2',			'Giao Duc The Chat' 	,			'12000000' ,	'Ha Noi'	 ),
                  ('3',			'Cong Nghe AI'			,			'9999999'  ,	'USA' 		 ),
                  ('4',			'Cong Nghe Di Truyen'	,			'1000000'  ,	'Moscow'	 ),
                  ('0',			'Chua Co De Tai'		,			'0' 	   ,	'Ho Chi Minh');
                
                
DROP TABLE IF EXISTS	HuongDan;
CREATE TABLE  HuongDan(
ID 			TINYINT UNSIGNED PRIMARY KEY,
`Masinhvien` 	TINYINT UNSIGNED ,
`Madetai`   	TINYINT UNSIGNED ,
Magiaovien  TINYINT UNSIGNED ,
KetQua     NVARCHAR(30) NOT NULL,
FOREIGN KEY(Masinhvien) REFERENCES SinhVien(Masinhvien),
FOREIGN KEY(Madetai)	REFERENCES	Detai(Madetai),
FOREIGN KEY(Magiaovien)	REFERENCES	GiangVien(Magiaovien)
);

INSERT INTO  HuongDan(ID,		Masinhvien,			Madetai,		Magiaovien,		Ketqua		)
VALUES				('1',		'1',				'1',			'1',			'Dat'		),
                    ('2',		'2',				'2',			'2',			'Khong Dat' ),
                    ('3',		'3',				'3',			'3',			'Dat'		),
                    ('4',		'4',				'4',			'4',			'Dat'		),
                    ('5',		'5',				'0',			'5',			'Khong Dat' );
                    

-- 2. Viết lệnh để
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT DT.Tendetai, HD.Masinhvien
FROM HuongDan HD
LEFT JOIN  DeTai DT ON HD.Madetai = DT.Madetai
WHERE DT.Tendetai  IS NULL ;

-- b) Lấy ra số sinh viên của khoa ‘CONG NGHE SINH HOC’
SELECT *
FROM Sinhvien SV
JOIN HuongDan HD ON SV.Masinhvien = HD.Masinhvien
WHERE Madetai = '1';


-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
-- mã số, họ tên và tên đề tài
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
DROP VIEW IF EXISTS SinhVienInfo;
CREATE VIEW  SinhVienInfo AS
SELECT SV.Masinhvien , SV.Hoten, DT.Tendetai
FROM Sinhvien SV
JOIN HuongDan HD ON SV.Masinhvien = HD.Masinhvien
JOIN Detai DT ON DT.Madetai = HD.Madetai ;

SELECT *
FROM SinhVienInfo ;





