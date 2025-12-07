CREATE DATABASE Lab_1;

-- DROP DATABASE Lab_1;

IF OBJECT_ID('KhachHang', 'U') IS NOT NULL
    DROP TABLE KhachHang;

CREATE TABLE KhachHang
(
    MaKH char(4) PRIMARY KEY,
    TenKH nvarchar(40) NOT NULL,
    DiaChi nvarchar(40) NOT NULL,
    NgaySinh smalldatetime,
    DoanhSo money
);

-- Insert sample data
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH01', N'Lê Minh Tuấn', N'15 Võ Văn Tần, Q.3, TP.HCM', '1988-05-20', 5450000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH02', N'Trần Ngọc Hân', N'212 Nguyễn Trãi, Q.1, TP.HCM', '1992-11-03', 12300000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH03', N'Phạm Thị Thu Thủy', N'89 Cách Mạng Tháng 8, Q.Tân Bình', '1975-02-14', 8600000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH04', N'Huỳnh Anh Dũng', N'33 Nguyễn Thị Minh Khai, Q.1', '2001-09-30', 2100000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH05', N'Võ Thanh Mai', N'404 Lê Văn Sỹ, Q.3', '1998-07-19', 15720000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH06', N'Đặng Hoài Nam', N'65 Pasteur, Q.1, TP.HCM', '1985-12-25', 950000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH07', N'Nguyễn Bảo Ngọc', N'18 Bis/22 Nguyễn Thị Minh Khai, Q.1', '1999-04-01', 3300000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH08', N'Lý Văn Hùng', N'720 Điện Biên Phủ, Q.Bình Thạnh', '1993-06-08', 7850000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH09', N'Bùi Thị Lan Anh', N'90 Sư Vạn Hạnh, Q.10, TP.HCM', '2003-01-10', 1200000);
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, DoanhSo) VALUES ('KH10', N'Hoàng Minh Khôi', N'227 Nguyễn Văn Cừ, Q.5, TP.HCM', '1980-08-17', 21500000);

SELECT * FROM KhachHang;

-- DROP TABLE KhachHang;