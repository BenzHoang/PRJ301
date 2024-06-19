CREATE DATABASE MyShop
GO

USE MyShop
GO

create table Mobiles(
mobileID varchar(10) primary key not null,
[description] nvarchar(250) not null,
price float,
mobileName nvarchar(50) not null,
producerName nvarchar(50),
yearOfProduction INT,
quantity int,
notSale bit
)
go



select * from Mobiles

--samsung
insert into Mobiles values('M001', N'Sử dụng chip Snapdragon 8 Gen 3 for Galaxy, camera 200 MP và tích hợp nhiều tính năng AI',33990.0000,'Galaxy S24 Ultra','Samsung',2024,400,'True'),
('M002', N'Trang bị màn hình Super AMOLED cùng con chip Exynos 1380 tiên tiến',8290.0000,'Galaxy A54 5G','Samsung',2023,150,'True'),
('M003', N'Thiết kế gập độc đáo, hiệu năng mạnh mẽ nhờ chip Snapdragon 8 Gen 2 for Galaxy cùng camera quay chụp sắc nét',40990.0000,' Galaxy Z Fold5 5G','Samsung',2023,300,'True'),
('M004', N'Nhiều tính năng và công nghệ nổi bật, đánh dấu một bước tiến đột phá của Samsung trong năm 2023',27990.0000,'Galaxy S23 Ultra 5G','Samsung',2023,100,'False'),

--apple
('M005', N'A17 Pro, chất liệu bền và thời lượng pin cao',30990.0000,'iPhone 15 Pro Max','Apple',2023,400,'True'),
('M006', N'A17 Pro, chất liệu bền và thời lượng pin cao',29690.0000,'iPhone 15 Pro','Apple',2023,450,'True'),
('M007', N'Trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế màn hình mới',27390.0000,'iPhone 14 Pro Max','Apple',2022,250,'True'),
('M008', N'Được xem là một trong những phiên bản iPhone "giá rẻ" của bộ 3 iPhone 11 series',11490.0000,'iPhone 11','Apple',2019,150,'False')
go

delete from Mobiles where mobileID = '010'