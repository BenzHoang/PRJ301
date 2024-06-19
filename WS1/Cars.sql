create database MyStock
go

use MyStock
go

create table Cars(
CarID int primary key not null,
CarName varchar(50),
Manufacturer varchar(50),
Price money,
ReleasedYear int
)
go

insert into Cars values(1,'Accord','Honda',24970.0000,2021),
(2,'Clarity','Honda',33400.0000,2021),
(3,'BMW 8 Series','BMW',85000.0000,2021),
(4,'Audi 6','Audi',14000.0000,2020),
(5,'Vios','Toyota',50000.0000,2022)
go

select * from Cars
go

delete from Cars
go


create table Users(
UserName varchar(30) primary key not null,
Password varchar(30),
LastName nvarchar(50),
isAdmin bit
)
go

insert into Users values('U001', '1210', 'Minh', 'True'),
('U002', '456', 'David', 'False'),
('U003', '789', 'John', 'False'),
('U004', '012', 'Mark', 'True'),
('U005', '134', 'Kate', 'False')
go

select * from Users
go