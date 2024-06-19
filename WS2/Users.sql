create database UserWS2
go

use UserWS2
go

create table Users(
UserID varchar(30) primary key not null,
Password varchar(30),
LastName varchar(50) not null,
[role] bit
)
go

insert into Users values('U001', '1210', 'Minh', 'True'),
('U002', '0209', 'Nhi',  'True'),
('U003', '0201', 'Huy',  'False'),
('U004', '2209', 'Vy',  'False'),
('U005', '1234', 'Emily', 'False'),
('U006', '0987', 'Benz', 'False')
go

select * from Users
go

delete from Users
