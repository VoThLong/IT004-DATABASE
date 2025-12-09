-- -- Chay lenh tao CSDL truoc
-- CREATE DATABASE QUANLIGIAOVU_0208
-- GO
-- -- Refesh lai CSDL moi lam tiep cac lenh sau
-- USE QUANLIGIAOVU_0208
-- GO
-- -------------------------------------------------
-- -------------------------------------------------
-- -- Tao bang + khoa chinh,khoa ngoai
-- CREATE TABLE KHOA(
-- 	MAKHOA	char(4),
-- 	TENKHOA	varchar(40),
-- 	NGTLAP	smalldatetime,
-- 	TRGKHOA	char(4)
-- 	CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
-- )

-- CREATE TABLE MONHOC(
-- 	MAMH	char(10),
-- 	TENMH	varchar(40),
-- 	TCLT	tinyint,
-- 	TCTH	tinyint,
-- 	MAKHOA	char(4),
-- 	CONSTRAINT PK_MH PRIMARY KEY(MAMH)
-- )

-- CREATE TABLE DIEUKIEN(
-- 	MAMH		char(10),
-- 	MAMH_TRUOC	char(10),
-- 	CONSTRAINT PK_DK PRIMARY KEY(MAMH,MAMH_TRUOC)
-- )

-- CREATE TABLE GIAOVIEN(
-- 	MAGV		char(4),
-- 	HOTEN		varchar(40),
-- 	HOCVI		varchar(10),
-- 	HOCHAM		varchar(10),
-- 	GIOITINH	varchar(3),
-- 	NGSINH		smalldatetime,
-- 	NGVL		smalldatetime,
-- 	HESO		numeric(4,2),
-- 	MUCLUONG	money,
-- 	MAKHOA		char(4),
-- 	CONSTRAINT PK_GV PRIMARY KEY(MAGV)
-- )

-- CREATE TABLE LOP(
-- 	MALOP	char(3),
-- 	TENLOP	varchar(40),
-- 	TRGLOP	char(5),
-- 	SISO	tinyint,
-- 	MAGVCN	char(4),
-- 	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
-- )

-- CREATE TABLE HOCVIEN(
-- 	MAHV		char(5),
-- 	HO		varchar(40),
-- 	TEN		varchar(10),
-- 	NGSINH		smalldatetime,
-- 	GIOITINH	varchar(3),
-- 	NOISINH		varchar(40),
-- 	MALOP		char(3),
-- 	CONSTRAINT PK_HV PRIMARY KEY(MAHV)
-- )


-- CREATE TABLE GIANGDAY(
-- 	MALOP	char(3),
-- 	MAMH	char(10),
-- 	MAGV	char(4),
-- 	HOCKY	tinyint,
-- 	NAM	smallint,
-- 	TUNGAY	smalldatetime,
-- 	DENNGAY	smalldatetime,
-- 	CONSTRAINT PK_GD PRIMARY KEY(MALOP,MAMH)
-- )

-- CREATE TABLE KETQUATHI(
-- 	MAHV	char(5),
-- 	MAMH	char(10),
-- 	LANTHI	tinyint,
-- 	NGTHI	smalldatetime,
-- 	DIEM	numeric(4,2),
-- 	KQUA	varchar(10),
-- 	CONSTRAINT PK_KQ PRIMARY KEY(MAHV,MAMH,LANTHI)
-- )

-- -------------------------------------------
-- -- KHOA 	
-- ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV)
-- -------------------------------------------
-- -- MONHOC 		
-- ALTER TABLE MONHOC ADD CONSTRAINT FK_MH FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-- -------------------------------------------
-- -- DIEUKIEN 	
-- ALTER TABLE DIEUKIEN ADD CONSTRAINT FK01_DK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
-- ALTER TABLE DIEUKIEN ADD CONSTRAINT FK02_DK FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH)
-- -------------------------------------------
-- -- GIAOVIEN
-- ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GV FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-- -------------------------------------------
-- -- LOP
-- ALTER TABLE LOP ADD CONSTRAINT FK01_LOP FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
-- ALTER TABLE LOP ADD CONSTRAINT FK02_LOP FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)
-- -------------------------------------------
-- -- HOCVIEN
-- ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
-- -------------------------------------------
-- -- GIANGDAY
-- ALTER TABLE GIANGDAY ADD CONSTRAINT FK01_GD FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
-- ALTER TABLE GIANGDAY ADD CONSTRAINT FK02_GD FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
-- ALTER TABLE GIANGDAY ADD CONSTRAINT FK03_GD FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)
-- -------------------------------------------
-- -- KETQUATHI
-- ALTER TABLE KETQUATHI ADD CONSTRAINT FK01_KQ FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
-- ALTER TABLE KETQUATHI ADD CONSTRAINT FK02_KQ FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)

-- -------------------------------------------------
-- -------------------------------------------------
-- -- Nhap lieu
-- ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
-- ALTER TABLE LOP NOCHECK CONSTRAINT ALL
-- ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
-- ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
-- ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
-- ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
-- ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
-- ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL

-- delete from KHOA
-- delete from LOP
-- delete from MONHOC
-- delete from DIEUKIEN
-- delete from GIAOVIEN
-- delete from HOCVIEN
-- delete from GIANGDAY
-- delete from KETQUATHI

-- set dateformat dmy
-- -- KHOA
-- INSERT INTO KHOA VALUES('KHMT','Khoa hoc may tinh','06/07/2005','GV01')
-- INSERT INTO KHOA VALUES('HTTT','He thong thong tin','06/07/2005','GV02')
-- INSERT INTO KHOA VALUES('CNPM','Cong nghe phan mem','06/07/2005','GV04')
-- INSERT INTO KHOA VALUES('MTT','Mang va truyen thong','20/10/2005','GV03')
-- INSERT INTO KHOA VALUES('KTMT','Ky thuat may tinh','20/12/2005','Null')

-- -- LOP
-- INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
-- INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
-- INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- -- MONHOC
-- INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
-- INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
-- INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
-- INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
-- INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
-- INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
-- INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
-- INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
-- INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
-- INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
-- INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
-- INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
-- INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- -- DIEUKIEN
-- INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
-- INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
-- INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
-- INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
-- INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
-- INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
-- INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
-- INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')

-- -- GIANGDAY
-- INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'01/02/2006','05/12/2006')
-- INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'01/02/2006','05/12/2006')
-- INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'01/02/2006','05/12/2006')
-- INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
-- INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
-- INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'01/09/2006','17/5/2006')
-- INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'06/01/2006','15/7/2006')
-- INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'06/01/2006','15/7/2006')
-- INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'06/01/2006','15/7/2006')
-- INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'08/01/2006','15/12/2006')
-- INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'08/01/2006','15/12/2006')
-- INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
-- INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
-- INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'01/02/2007','18/2/2007')
-- INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'01/02/2007','20/3/2007')
-- INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

-- -- GIAOVIEN
-- INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','05/02/1950','01/11/2004',5,2250000,'KHMT')
-- INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
-- INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','08/01/1950','23/9/2004',4,1800000,'CNPM')
-- INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01/12/2005',4.5,2025000,'KTMT')
-- INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','03/12/1958','01/12/2005',3,1350000,'HTTT')
-- INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','03/11/1953','01/12/2005',4.5,2025000,'KHMT')
-- INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03/01/2005',4,1800000,'KHMT')
-- INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03/01/2005',1.69,760500,'KHMT')
-- INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03/01/2005',4,1800000,'HTTT')
-- INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03/01/2005',1.86,837000,'CNPM')
-- INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','01/12/1980','15/5/2005',2.67,1201500,'MTT')
-- INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
-- INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
-- INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
-- INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','05/04/1978','15/5/2005',3,1350000,'KHMT')

-- -- HOCVIEN
-- INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
-- INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
-- INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
-- INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
-- INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
-- INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
-- INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
-- INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
-- INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
-- INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','02/05/1986','Nu','Can Tho','K11')
-- INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
-- INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','02/11/1986','Nam','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
-- INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','03/04/1986','Nu','Kien Giang','K12')
-- INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','02/08/1986','Nu','Nghe An','K12')
-- INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','04/08/1986','Nu','Tay Ninh','K12')
-- INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','03/09/1986','Nu','Ha Noi','K12')
-- INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','03/12/1986','Nu','TpHCM','K12')
-- INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','06/09/1986','Nu','Kien Giang','K13')
-- INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
-- INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
-- INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
-- INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
-- INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
-- INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
-- INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','04/08/1986','Nam','Kien Giang','K13')
-- INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
-- INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
-- INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13')
-- INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','09/07/1986','Nu','TpHCM','K13')

-- -- KETQUATHI
-- INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'08/10/2006',4.5,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'01/05/2007',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'01/05/2007',5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'08/07/2006',4,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
-- INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
-- INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')

-- -----------------
-------- I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language): ---------
-- 1. Tạo quan hệ và khai báo tất cả các 6ràng buộc khóa chính, khóa ngoại. Thêm vào 3 Thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN. --
ALTER TABLE HOCVIEN
ADD GHICHU	varchar(50),
	DIEMTB	numeric(4,2),
	XEPLOAI	varchar(5)

-- 2. Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101” 
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_MAHV CHECK 
(
	LEN(MAHV) = 5
	AND LEFT(MAHV, 3) = MALOP
	AND ISNUMERIC(RIGHT(MAHV, 2)) = 1
)

-- 3. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”. 
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_GEN CHECK
(
	GIOITINH IN ('Nam', 'Nu')
)
-- 4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22). 
ALTER TABLE KETQUATHI
ADD CONSTRAINT CHK_DIEM CHECK
(
	DIEM BETWEEN 0.00 AND 10.00
)

-- 5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10  và “Khong dat” nếu điểm nhỏ hơn 5. 
ALTER TABLE KETQUATHI
ADD CONSTRAINT CHK_KQUA CHECK
(
	((DIEM >= 5.00) AND KQUA = ('Dat'))
	OR
	((DIEM < 5.00) AND KQUA = ('Khong Dat'))
)
GO

-- 6. Học viên thi một môn tối đa 3 lần. (TRIGGER)
CREATE TRIGGER Gioi_Han_Lan_Thi
ON KETQUATHI
AFTER INSERT, UPDATE
AS 
BEGIN
	IF EXISTS (
		SELECT KQ.MAHV, KQ.MAMH
	FROM KETQUATHI AS KQ
		JOIN INSERTED I ON KQ.MAHV = I.MAHV
			AND KQ.MAMH = I.MAMH
	GROUP BY KQ.MAHV, KQ.MAMH
	HAVING COUNT(*) > 3
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'So lần thi lại không quá 3 lần'
	END
END
GO


-- 7. Học kỳ chỉ có giá trị từ 1 đến 3. 
ALTER TABLE GIANGDAY
ADD CONSTRAINT CHK_HK CHECK
(
	HOCKY >= 1 AND HOCKY <=3
)
-- 8. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”. 
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_HOCVI CHECK
(
	HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS')
)
GO

-- 9. Lớp trưởng của một lớp phải là học viên của lớp đó. (TRIGGER)
-- Cách 1
ALTER TABLE LOP
ADD CONSTRAINT CHK_LOP_TRG
CHECK (LEFT(TRGLOP, 3) = MALOP)
GO


-- Cách 2:
CREATE TRIGGER Lop_Trg_Hop_Le
ON LOP
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (
		SELECT *
	FROM INSERTED AS I
		JOIN HOCVIEN AS HV ON I.TRGLOP = HV.MAHV
	WHERE I.MALOP <> HV.MALOP
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Lớp trưởng học khác lớp được thêm'
	END
END
GO

-- 10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”. (TRIGGER) --
-- Cách 1: --
CREATE TRIGGER CHK_TRG_KHOA
ON KHOA
AFTER INSERT,  UPDATE
AS
BEGIN
	IF EXISTS (
		SELECT *
	FROM INSERTED AS I
		JOIN GIAOVIEN AS GV ON I.TRGKHOA = GV.MAGV
	WHERE I.MAKHOA <> GV.MAKHOA

		OR
		GV.HOCVI NOT IN ('PTS', 'TS')
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'TRUONG KHOA PHAI LAM VIEC TRONG KHOA VA CO HOC  VI LA PTS HOAC TIENSI'
	END
END
GO


-- 11. Học viên ít nhất là 18 tuổi. 
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_AGE CHECK
(
	YEAR(GETDATE()) - YEAR(NGSINH) >= 18
)
-- 12. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY). 
ALTER TABLE GIANGDAY
ADD CONSTRAINT CHK_NGAY CHECK
(
	TUNGAY < DENNGAY
)
-- 13. Giáo viên khi vào làm ít nhất là 22 tuổi. 
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_TUOI_GV CHECK 
(
	YEAR(NGVL) - YEAR(NGSINH) >= 22
)

-- 14. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3. 
ALTER TABLE MONHOC
ADD CONSTRAINT CHK_TIN_CHI CHECK
(
	ABS(TCLT - TCTH) <= 3
)
GO

-- TRIGGER --

-- 15. Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này. --
CREATE TRIGGER CAU_15
ON KETQUATHI
AFTER INSERT,  UPDATE
AS
BEGIN
	IF EXISTS(
		SELECT *
	FROM INSERTED AS I
		JOIN GIANGDAY AS GD ON I.MAMH = GD.MAMH
	WHERE I.NGTHI < GD.DENNGAY
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Lop hoc phan cua sinh vien nay chua ket thuc'
	END
END
GO



-- 16. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn. --
CREATE TRIGGER CAU_16
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS(
		SELECT GD.MALOP, HOCKY, NAM
	FROM GIANGDAY AS GD
		JOIN INSERTED AS I ON GD.MALOP = I.MALOP
	GROUP BY GD.MALOP, HOCKY, GD.NAM
	HAVING COUNT(*) > 3
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Một lớp không thể học quá 3 môn trong cùng một kỳ'
	END
END
GO

-- 17. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó. --
CREATE TRIGGER CAU_17
ON HOCVIEN
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS (
		SELECT LP.MALOP, LP.SISO, COUNT(MAHV) AS SOLUONGHIENTAI
		FROM HOCVIEN AS HV
		JOIN LOP AS LP ON HV.MALOP = LP.MALOP
		GROUP BY LP.MALOP, LP.SISO
		HAVING COUNT(HV.MAHV) <> LP.SISO
	)
	BEGIN
	ROLLBACK TRANSACTION
	PRINT 'Số học viên vượt quá sĩ sỗ lớp'
	END
END
GO


-- 18. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”). 
CREATE TRIGGER CAU_18
ON DIEUKIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (
		SELECT *
		FROM INSERTED AS I
		WHERE MAMH = MAMH_TRUOC
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Ma môn học không được trùng với mã môn học tiên quyết'
	END

	IF EXISTS (
		SELECT *
		FROM INSERTED AS I 
		JOIN DIEUKIEN AS DK ON I.MAMH = DK.MAMH_TRUOC AND I.MANH_TRUOC = DK.MAMH 
	)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'Đã tồn tại mối quan hệ tiên quyết với 2 môn học này trước.'
	END
END
GO



-- 19. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau. 
-- 20. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5. 
-- 21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học). 
-- 22. Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong. 
-- 23. Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau). 
-- 24. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.

-------- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language): ---------
-- 1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa. 
UPDATE GIAOVIEN
SET HESO = HESO + 0.2
WHERE MAGV IN (SELECT TRGKHOA
	FROM KHOA)

	-- 2. Cập nhật giá trị điểm trung bình tất cả các môn học  (DIEMTB) của mỗi học viên (tất cả các môn  học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng). 

	UPDATE HOCVIEN
SET DIEMTB = 
			(SELECT AVG(DIEM)
	FROM KETQUATHI AS KQA
	WHERE LANTHI = (
							SELECT MAX(LANTHI)
		FROM KETQUATHI KQB
		WHERE KQA.MAHV = KQB.MAHV
			AND KQA.MAMH = KQB.MAMH
			)
		AND KQA.MAHV = HOCVIEN.MAHV
			)

	SELECT *
	FROM HOCVIEN

	-- 3. Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm. 
	UPDATE HOCVIEN
SET GHICHU = 'Cam Thi'
WHERE MAHV IN 
	(SELECT MAHV
	FROM KETQUATHI
	WHERE LANTHI = 3 AND DIEM < 5)
	-- 4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau: 
	-- o Nếu DIEMTB  9 thì XEPLOAI =”XS” 
	-- o Nếu  8  DIEMTB < 9 thì XEPLOAI = “G” 
	-- o Nếu  6.5  DIEMTB < 8 thì XEPLOAI = “K” 
	-- o Nếu  5    DIEMTB < 6.5 thì XEPLOAI = “TB” 
	-- o Nếu  DIEMTB < 5 thì XEPLOAI = ”Y” 
	UPDATE HOCVIEN
SET XEPLOAI = 
    (CASE 
        WHEN DIEMTB >= 9 THEN 'XS'
        WHEN DIEMTB >= 8 THEN 'G'
        WHEN DIEMTB >= 6.5 THEN 'K'
        WHEN DIEMTB >= 5 THEN 'TB'
        ELSE 'Y'  -- Dùng ELSE cho trường hợp còn lại (dưới 5) sẽ gọn hơn
    END)

	-------- III. Ngôn ngữ truy vấn dữ liệu:  ---------
	-- 1.In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp. --
	SELECT HV.HO, HV.TEN, HV.NGSINH, LP.MALOP
	FROM HOCVIEN AS HV JOIN LOP AS LP ON MAHV = TRGLOP

	-- 2.In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
	SELECT HV.MAHV, HO, TEN, LANTHI, DIEM
	FROM HOCVIEN AS HV JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
	WHERE
	HV.MALOP = 'K12'
	ORDER BY HO, TEN

	-- 3.In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt. --
	SELECT HV.MAHV, HO, TEN, KQ.MAMH, MH.TENMH
	FROM HOCVIEN AS HV JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV JOIN MONHOC AS MH ON KQ.MAMH = MH.MAMH
	WHERE
	LANTHI  = 1 AND KQUA = 'Dat'

	-- 4.In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1). --
	SELECT HV.MAHV, HV.HO, HV.TEN
	FROM HOCVIEN AS HV JOIN KETQUATHI AS KQ ON KQ.MAHV = HV.MAHV
	WHERE 
	LANTHI = 1 AND KQUA = 'Khong Dat' AND MALOP = 'K11' AND MAMH = 'CTRR'

	-- 5.* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi). --
	SELECT HV.MAHV, HV.HO, HV.TEN
	FROM HOCVIEN AS HV
	WHERE HV.MALOP LIKE  'K%'
		AND HV.MAHV IN 
(
																			SELECT MAHV
			FROM KETQUATHI AS KQ
			WHERE MAMH = 'CTRR'

		EXCEPT

			SELECT MAHV
			FROM KETQUATHI
			WHERE MAMH = 'CTRR' AND KQUA = 'Dat'
)

	-- 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006  --
	SELECT DISTINCT TENMH
	FROM MONHOC AS MH JOIN GIANGDAY AS GD ON MH.MAMH = GD.MAMH
		JOIN GIAOVIEN AS GV ON GD.MAGV = GV.MAGV
	WHERE 
	HOCKY = 1 AND NAM = 2006 AND GV.HOTEN = 'Tran Tam Thanh'

	-- 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học  kỳ 1 năm 2006. --
	SELECT MH.MAMH, MH.TENMH
	FROM LOP AS LP JOIN GIANGDAY AS GD ON LP.MAGVCN = GD.MAGV JOIN MONHOC AS MH ON MH.MAMH = GD.MAMH
	WHERE
	LP.MALOP = 'K11' AND HOCKY = 1 AND NAM = '2006'

	-- 8.Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”. --
	SELECT HV.HO, HV.TEN
	FROM LOP AS LP
		JOIN HOCVIEN AS HV ON HV.MAHV = LP.TRGLOP
		JOIN GIANGDAY AS GD ON LP.MALOP = GD.MALOP
		JOIN GIAOVIEN AS GV ON GD.MAGV = GV.MAGV
		JOIN MONHOC AS MH ON GD.MAMH = MH.MAMH
	WHERE 
	GV.HOTEN = 'Nguyen To Lan'
		AND MH.TENMH = 'Co So Du Lieu'

	-- 9.In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”. --
	SELECT DISTINCT MH.MAMH, MH.TENMH
	FROM MONHOC AS MH
	WHERE MH.MAMH IN
	(SELECT DK.MAMH_TRUOC
	FROM DIEUKIEN AS DK
		JOIN MONHOC AS MH
		ON DK.MAMH = MH.MAMH
	WHERE
		DK.MAMH = (SELECT DISTINCT MAMH
	FROM MONHOC AS MH
	WHERE MH.TENMH = 'Co So Du Lieu')
	)

	--10.Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào. --
	SELECT DISTINCT MH.TENMH, MH.MAMH
	FROM DIEUKIEN AS DK
		JOIN MONHOC AS MH
		ON DK.MAMH = MH.MAMH
	WHERE DK.MAMH_TRUOC =
		(SELECT MH.MAMH
	FROM MONHOC AS MH
	WHERE MH.TENMH = 'Cau Truc Roi Rac')

	-- 11.Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006. --
	SELECT HOTEN
	FROM GIAOVIEN
	WHERE MAGV IN (
    -- Tìm giáo viên dạy lớp K11
    										SELECT MAGV
		FROM GIANGDAY
		WHERE MALOP = 'K11'
			AND MAMH = 'CTRR'
			AND HOCKY = 1
			AND NAM = 2006

	INTERSECT

		-- Tìm giáo viên dạy lớp K12
		SELECT MAGV
		FROM GIANGDAY
		WHERE MALOP = 'K12'
			AND MAMH = 'CTRR'
			AND HOCKY = 1
			AND NAM = 2006
)

	-- 12.Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này. --
	SELECT MAHV, HO, TEN
	FROM HOCVIEN
	WHERE MAHV IN (
											SELECT MAHV
		FROM KETQUATHI
		WHERE MAMH = 'CSDL' AND LANTHI = 1 AND KQUA = 'Khong Dat'

	EXCEPT

		SELECT MAHV
		FROM KETQUATHI
		WHERE MAMH = 'CSDL' AND LANTHI > 1
)

	-- 13.Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào. --
	SELECT MAGV, HOTEN
	FROM GIAOVIEN
	WHERE MAGV IN (
											SELECT MAGV
		FROM GIAOVIEN

	EXCEPT
		SELECT MAGV
		FROM GIANGDAY
)

	-- 14.Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
	SELECT MAGV, HOTEN
	FROM GIAOVIEN
	WHERE MAGV IN (
											SELECT MAGV
		FROM GIAOVIEN

	EXCEPT


		SELECT GV.MAGV
		FROM GIAOVIEN AS GV
			JOIN GIANGDAY AS GD ON GV.MAGV = GD.MAGV
			JOIN MONHOC AS MH ON GD.MAMH = MH.MAMH
		WHERE GV.MAKHOA = MH.MAKHOA

)

	-- 15.Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm. --
	SELECT HO, TEN
	FROM HOCVIEN
	WHERE MALOP = 'K11' AND MAHV IN (
	SELECT MAHV
		FROM KETQUATHI
		WHERE (LANTHI > 3 AND KQUA = 'Khong Dat') OR (LANTHI = 2 AND MAMH = 'CTRR' AND DIEM = 5.00)
)

	-- 16.Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học. --
	SELECT HOTEN
	FROM GIAOVIEN
	WHERE MAGV IN (
	SELECT MAGV
	FROM GIANGDAY
	WHERE MAMH = 'CTRR'
	GROUP BY MAGV, HOCKY, NAM
	HAVING COUNT(MALOP) >= 2
)

	-- 17.Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng). --
	SELECT MAHV, DIEM
	FROM KETQUATHI AS KQA
	WHERE  MAMH = 'CSDL'
		AND LANTHI = (
		SELECT MAX(LANTHI)
		FROM KETQUATHI AS KQB
		WHERE KQA.MAHV = KQB.MAHV AND MAMH = 'CSDL'
	)

	-- 18.Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi). --
	SELECT KQ.MAHV, HV.HO, HV.TEN, MAX(DIEM) AS DIEMCAONHAT
	FROM HOCVIEN AS HV
		JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
		JOIN MONHOC AS MH ON KQ.MAMH = MH.MAMH
	WHERE TENMH = 'Co So Du Lieu'
	GROUP BY KQ.MAHV, HO, TEN


	-- 19.Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
	SELECT MAKHOA, TENKHOA
	FROM KHOA AS KH
	WHERE NGTLAP = (SELECT MIN(NGTLAP)
	FROM KHOA)

	-- 20.Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
	SELECT COUNT(MAGV) AS SO_GS_PGS
	FROM GIAOVIEN
	WHERE HOCHAM IN ('GS', 'PGS')

	-- 21.Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa. --
	SELECT MAKHOA, HOCVI, COUNT(HOCVI) AS SL
	FROM GIAOVIEN
	GROUP BY MAKHOA, HOCVI
	ORDER BY MAKHOA



	SELECT GV.MAKHOA, KO.TENKHOA,
		COUNT(CASE WHEN HOCVI = 'CN' THEN 1 END) AS SL_CN,
		COUNT(CASE WHEN HOCVI = 'KS' THEN 1 END) AS SL_KS,
		COUNT(CASE WHEN HOCVI = 'Ths' THEN 1 END) AS SL_Ths,
		COUNT(CASE WHEN HOCVI = 'TS' THEN 1 END) AS SL_TS,
		COUNT(CASE WHEN HOCVI = 'PTS' THEN 1 END) AS SL_PTS
	FROM GIAOVIEN AS GV
		JOIN KHOA AS KO ON GV.MAKHOA = KO.MAKHOA
	GROUP BY GV.MAKHOA, KO.TENKHOA

	-- 22.Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
	SELECT MAMH, KQUA, COUNT(KQUA) AS SL
	FROM KETQUATHI AS KQ
	GROUP BY MAMH, KQUA
	ORDER BY MAMH

	-- 23.Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
	SELECT DISTINCT LP.MAGVCN, GV.HOTEN, LP.MALOP
	FROM LOP AS LP
		JOIN GIAOVIEN AS GV ON LP.MAGVCN = GV.MAGV
		JOIN GIANGDAY AS GD ON LP.MALOP = GD.MALOP
	WHERE LP.MAGVCN = GD.MAGV

	-- 24.Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
	SELECT LP.TRGLOP, HV.HO, HV.TEN
	FROM HOCVIEN AS HV
		JOIN LOP AS LP ON HV.MAHV = LP.TRGLOP
	WHERE LP.SISO = (SELECT MAX(SISO)
	FROM LOP)

	-- 25.* Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
	SELECT HO, TEN
	FROM HOCVIEN AS HV
		JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
		JOIN LOP AS LP ON LP.TRGLOP = HV.MAHV
	WHERE NOT EXISTS (
    SELECT 1
	FROM KETQUATHI AS KQ_CON

	-- Đặt tên khác (KQ_CON)
	WHERE KQ_CON.MAHV = KQ.MAHV -- Nối: Cùng người
		AND KQ_CON.MAMH = KQ.MAMH -- Nối: Cùng môn
		AND KQ_CON.KQUA = 'Dat'               -- Tìm xem đã đậu chưa
	)
	GROUP BY HV.MAHV, HV.HO, HV.TEN
	HAVING COUNT(KQUA) > 3

	SELECT HO, TEN
	FROM HOCVIEN AS HV
		JOIN KETQUATHI AS KQ ON KQ.MAHV = HV.MAHV
	WHERE HV.MAHV IN (SELECT TRGLOP
		FROM LOP)
		AND NOT EXISTS (
        SELECT 1
		FROM KETQUATHI AS KQ2
		-- Đặt tên khác đi (KQ2)
		WHERE KQ2.MAHV = KQ.MAHV -- Nối với người bên ngoài
			AND KQ2.MAMH = KQ.MAMH -- Nối với môn học bên ngoài
			AND KQ2.KQUA = 'Dat'   -- Tìm xem môn này đã đậu lần nào chưa
    )
	GROUP BY HO, TEN
	HAVING COUNT (DISTINCT MAMH) > 3

	-- SELECT KQ1.MAHV, KQ1.MAMH
	-- FROM KETQUATHI AS KQ1
	-- WHERE NOT EXISTS (
	-- 	SELECT *
	-- 	FROM KETQUATHI AS KQ2
	-- 	WHERE KQ2.MAHV = KQ1.MAHV AND KQ2.MAMH = KQ1.MAMH AND KQ2.KQUA = 'Dat'
	-- 	GROUP BY KQ2.MAHV, KQ2.MAMH
	-- )
	-- 26.Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
	SELECT TOP 1 WITH  TIES
		HV.MAHV, HO, TEN, COUNT(DIEM) AS SOLUONGDIEMGIOI
	FROM HOCVIEN AS HV
		JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
	WHERE KQ.DIEM >= 9
	GROUP BY HV.MAHV, HV.HO, HV.TEN
	ORDER BY COUNT(DIEM) DESC

	-- 27.Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.

	-- SELECT
	-- 	LEFT(HV.MAHV, 3) AS MALOP, -- Lấy 3 ký tự đầu làm Mã lớp
	-- 	HV.MAHV,
	-- 	HO,
	-- 	TEN,
	-- 	COUNT(*) AS SO_DIEM_GIOI
	-- FROM HOCVIEN HV
	-- JOIN KETQUATHI KQ ON HV.MAHV = KQ.MAHV
	-- WHERE DIEM >= 9 -- Chỉ đếm điểm giỏi
	-- GROUP BY LEFT(HV.MAHV, 3), HV.MAHV, HO, TEN
	-- HAVING COUNT(*) >= ALL (
	-- 	-- Truy vấn con: Tìm số lượng điểm giỏi của các bạn khác
	-- 	SELECT COUNT(*)
	-- 	FROM KETQUATHI KQ2
	-- 	JOIN HOCVIEN HV2 ON KQ2.MAHV = HV2.MAHV
	-- 	WHERE KQ2.DIEM >= 9
	-- 	AND LEFT(HV2.MAHV, 3) = LEFT(HV.MAHV, 3) -- <--- MẤU CHỐT: Chỉ so sánh với bạn CÙNG LỚP
	-- 	GROUP BY HV2.MAHV
	-- )

	SELECT HV.MAHV, HO, TEN, HV.MALOP, COUNT(*) AS SODIEMGIOI
	FROM HOCVIEN AS HV
		JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
	WHERE KQ.DIEM >= 9
	GROUP BY HV.MALOP, HV.MAHV, HV.HO, HV.TEN

	HAVING COUNT(*) >= ALL (
			SELECT COUNT(*)
	FROM HOCVIEN AS HV2
		JOIN KETQUATHI AS KQ2 ON HV2.MAHV = KQ2.MAHV
	WHERE KQ2.DIEM >= 9
		AND HV2.MALOP = HV.MALOP
	GROUP BY HV2.MAHV
		)

	-- 28.Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp. --
	SELECT MAGV, COUNT(MAMH) AS SOMON, COUNT(DISTINCT MALOP) AS SOLOP
	FROM GIANGDAY
	GROUP BY MAGV, HOCKY, NAM

	-- 29.Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất. --
	SELECT A.HOCKY, A.NAM, A.MAGV, GV.HOTEN
	FROM GIANGDAY A
		JOIN GIAOVIEN GV ON A.MAGV = GV.MAGV
	GROUP BY A.HOCKY, A.NAM, A.MAGV, GV.HOTEN

	-- Lấy người dạy nhiều nhất
	HAVING COUNT(*) >= ALL (
		-- [TRUY VẤN CON]: Tìm danh sách số lượng dạy của các GV khác
		SELECT COUNT(*)
	FROM GIANGDAY B
	WHERE A.HOCKY = B.HOCKY
		AND A.NAM = B.HOCKY
	GROUP BY B.MAGV
	)


	-- 30.Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
	SELECT MH.MAMH, MH.TENMH
	FROM KETQUATHI AS KQ
		JOIN MONHOC AS MH ON KQ.MAMH = MH.MAMH
	WHERE LANTHI = 1 AND KQUA = 'Khong Dat'
	GROUP BY MH.MAMH, MH.TENMH
	ORDER BY COUNT(KQ.MAHV) DESC
	-- 31.Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).--

	-- lấy tổng số học viên trừ đi học viên bị rớt ở lần thi đầu tiên
			SELECT HV.MAHV, HO, TEN
		FROM HOCVIEN AS HV
		WHERE MAHV IN (
	SELECT DISTINCT MAHV
		FROM KETQUATHI)

	EXCEPT

		SELECT HV.MAHV, HO, TEN
		FROM HOCVIEN AS HV
			JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
		WHERE LANTHI = 1 AND KQUA = 'Khong Dat'

	-- 32.* Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).

	-- lấy tổng số học viên trừ đi học viên bị rớt ở lần thi sau cùng
			SELECT HV.MAHV, HO, TEN
		FROM HOCVIEN AS HV
		WHERE MAHV IN (SELECT DISTINCT MAHV
		FROM KETQUATHI)

	EXCEPT

		SELECT HV.MAHV, HO, TEN
		FROM HOCVIEN AS HV JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
		WHERE LANTHI = (SELECT MAX(LANTHI)
			FROM KETQUATHI AS KQ2
			WHERE KQ2.MAHV = KQ.MAHV AND KQ2.MAMH = KQ.MAMH)
			AND KQUA = 'Khong Dat'



	-- Tà đạo, ma pháp, dị giao, biến thái, bệnh hoạn, súc vật
	SELECT C.MAHV, HO + ' ' + TEN HOTEN
	FROM
		(
																		SELECT MAHV, COUNT(KQUA) SODAT
			FROM KETQUATHI A
			WHERE LANTHI = (SELECT MAX(LANTHI)
				FROM KETQUATHI B
				WHERE A.MAHV = B.MAHV AND A.MAMH = B.MAMH)
				AND KQUA = 'Dat'
			GROUP BY MAHV
		INTERSECT
			SELECT MAHV, COUNT(MAMH) SOMH
			FROM KETQUATHI
			WHERE LANTHI = 1
			GROUP BY MAHV
) C INNER JOIN HOCVIEN HV
		ON C.MAHV = HV.MAHV
GO

-- 33.* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1). -- (không được dùng WITH - AS)
SELECT HV.MAHV, HO, TEN
FROM HOCVIEN AS HV
	JOIN KETQUATHI AS KQ ON HV.MAHV = KQ.MAHV
WHERE LANTHI = 1 AND KQUA = 'Dat'
GROUP BY HV.MAHV, HO, TEN
HAVING COUNT(MAMH) = (
	SELECT COUNT(MAMH)
FROM MONHOC
)
-- 34.* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng). --
SELECT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN AS HV
	JOIN KETQUATHI AS KQ1 ON HV.MAHV = KQ1.MAHV
WHERE LANTHI = (
	SELECT MAX(LANTHI)
	FROM KETQUATHI AS KQ2
	WHERE KQ1.MAHV = KQ2.MAHV AND KQ1.MAMH = KQ2.MAMH
)
	AND KQUA = 'Dat'
GROUP BY HV.MAHV, HV.HO, HV.TEN
HAVING COUNT(MAMH) = (
	SELECT COUNT(MAMH)
FROM MONHOC
)

-- 35.** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
SELECT A.MAMH, A.MAHV, A.DIEM
FROM KETQUATHI A
WHERE A.LANTHI = (
    -- Lần thi cuối cùng của sinh viên
    SELECT MAX(LANTHI)
	FROM KETQUATHI B
	WHERE B.MAHV = A.MAHV AND B.MAMH = A.MAMH
)
	AND A.DIEM >= ALL (
    -- Điểm này phải lớn hơn điểm của người khác
    SELECT C.DIEM
	FROM KETQUATHI C
	WHERE C.MAMH = A.MAMH
		AND C.LANTHI = (
          SELECT MAX(LANTHI)
		FROM KETQUATHI D
		WHERE D.MAHV = C.MAHV AND D.MAMH = C.MAMH
      )
)