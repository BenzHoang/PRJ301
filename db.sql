USE [master]
GO
/****** Object:  Database [project_prj]    Script Date: 3/14/2024 6:29:03 PM ******/
CREATE DATABASE [project_prj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project_prj', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_prj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_prj_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_prj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [project_prj] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project_prj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project_prj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project_prj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project_prj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project_prj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project_prj] SET ARITHABORT OFF 
GO
ALTER DATABASE [project_prj] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [project_prj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project_prj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project_prj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project_prj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project_prj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project_prj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project_prj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project_prj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project_prj] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project_prj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project_prj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project_prj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project_prj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project_prj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project_prj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project_prj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project_prj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project_prj] SET  MULTI_USER 
GO
ALTER DATABASE [project_prj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project_prj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project_prj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project_prj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project_prj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project_prj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [project_prj] SET QUERY_STORE = OFF
GO
USE [project_prj]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](255) NULL,
	[AccountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [date] NULL,
	[RequiredDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[TotalProducts] [int] NULL,
	[ShipAddress] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Orders__C3905BAFD7AF89A2] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[ProductImage] [nvarchar](max) NULL,
	[Desciption] [nvarchar](max) NULL,
 CONSTRAINT [PK__Products__B40CC6ED15B160E8] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/14/2024 6:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (1, N'Minh', N'1', 2)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (2, N'Nhi', N'1', 2)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (3, N'Phong', N'1', 2)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (4, N'Đạt', N'1', 2)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (5, N'Emily', N'1', 2)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (6, N'Mer', N'1', 2)
GO
INSERT [dbo].[Account] ([AccountID], [UserName], [Password], [Type]) VALUES (8, N'Staff', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Pizza cỡ lớn', N'Pizza với kích thước cỡ lớn phù hợp cho nhóm người')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Cỡ vừa', N'Pizza cỡ vừa phù hợp cho nhóm 2-3 người')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Cỡ nhỏ', N'Pizza cỡ nhỏ thích hợp cho ăn một mình hoặc thêm món')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (1, N'Hoàng Lê Nhật Minh', N'14 đường 28, Quận 2, TPHCM', N'0902855644', 1)
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (2, N'Huỳnh Thị Hồng Nhi', N'Vinhome, Quận 9, TPHCM', N'0123456790', 2)
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (3, N'Nguyễn Lê Thái Phong', N'15 , Quận 9, Tp.HCM', N'0988000111', 3)
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (4, N'Ngô Doãn Đạt', N'23 Đường Thảo Điền, Quận 2, TP.HCM', N'0988000222', 4)
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (5, N'Phước', N'4 Đường Nguyễn Trãi, Quận 5, TP.HCM', N'0988000333', 5)
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (6, N'Thuận', N'12 Đường Ba Tháng Hai, Quận 10, TP.HCM', N'0988000444', 6)
GO
INSERT [dbo].[Customers] ([CustomerID], [ContactName], [Address], [Phone], [AccountID]) VALUES (7, N'Phúc', N'8 Đường Hai Bà Trưng, Quận 3, TP.HCM', N'0988000555', 7)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (1, 1, 1, CAST(200000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 2, 1, CAST(22000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (4, 2, 3, CAST(160000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 1, 3, CAST(160000.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (6, 1, 2, CAST(12000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (7, 3, 1, CAST(120000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (9, 4, 2, CAST(150000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (10, 5, 1, CAST(120000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[Order_Details] ([OrderDetailID], [OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (12, 6, 1, CAST(360000.00 AS Decimal(10, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [TotalProducts], [ShipAddress], [Status]) VALUES (1, 1, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-14' AS Date), CAST(N'2024-03-14' AS Date), 9, N'15 Đường 3/2, Quận 10, TP.HCM', 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [TotalProducts], [ShipAddress], [Status]) VALUES (2, 2, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date), 6, N'27 Lê Lợi, Quận 1, TP.HCM', 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [TotalProducts], [ShipAddress], [Status]) VALUES (3, 1, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-14' AS Date), CAST(N'2024-03-14' AS Date), 4, N'hcm', 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [TotalProducts], [ShipAddress], [Status]) VALUES (4, 1, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-14' AS Date), CAST(N'2024-03-14' AS Date), 1, N'hcm', 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [TotalProducts], [ShipAddress], [Status]) VALUES (5, 1, CAST(N'2024-03-14' AS Date), CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date), 5, N'hcm
', 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [TotalProducts], [ShipAddress], [Status]) VALUES (6, 1, CAST(N'2024-03-14' AS Date), CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date), 5, N'hcm', 4)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [ProductImage], [Desciption]) VALUES (1, N'Pizza Phô mai', 1, 1, CAST(120000.00 AS Decimal(10, 2)), N'/IMG/1.jpg', N'Thưởng thức vị gà Karaage chiên giòn cắt lát trên nền pizza đậm vị, cùng nấm tươi, hành tây hoà quyện xốt phô mai')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [ProductImage], [Desciption]) VALUES (2, N'Pizza Hải sản', 2, 1, CAST(150000.00 AS Decimal(10, 2)), N'/IMG/2.jpg', N'Khi biển cả cũng được thu gọn trong một chiếc pizza với đầy ắp tôm, thanh cua, xen lẫn cà chua, bắp, thơm, thì là trên nền phô mai đậm vị')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [ProductImage], [Desciption]) VALUES (3, N'Pizza Cá Ngừ', 1, 1, CAST(160000.00 AS Decimal(10, 2)), N'/IMG/3.jpg', N'Mang Hương Vị Biển Cả Nhẹ Nhàng Với Cá Ngừ, Thanh Cua, HàNh Tây, Thơm Trên Nền Xốt Pesto')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [ProductImage], [Desciption]) VALUES (4, N'Pizza thập cẩm', 3, 2, CAST(180000.00 AS Decimal(10, 2)), N'/IMG/4.jpg', N'Thịt bò, thịt xông khói, pepperoni, thơm, ớt chuông, nấm, hành tây trên nền xốt cà chua, phô mai mozzarella')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [ProductImage], [Desciption]) VALUES (8, N'Pepperoni ', 4, 2, CAST(1750000.00 AS Decimal(10, 2)), N'/IMG/image_858af4ca-8837-46ae-a8a6-4473068c3ca9.jpg', N'Pepperoni Với Phô Mai Mozzarella Tuyệt Hảo')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [ProductImage], [Desciption]) VALUES (9, N'Pizza Hawaiian', 4, 3, CAST(1790000.00 AS Decimal(10, 2)), N'/IMG/image_03285ba8-89bb-45d4-ab7b-9365d1d451cf.jpg', N'Phủ Giăm Bông Và Thơm Ngọt Dịu Trên Nền Sốt Cà Chua Truyền Thống')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (1, N'Nhà Cung Cấp Nguyên Liệu ABC', N'1234 Đường Phạm Thế Hiển, Quận 8, TP.HCM', N'0987654321')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (2, N'The Pizza Company', N'1 Đường Số 1, Quận 7, TP.HCM', N'0988100111')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (3, N'Pizza Aloha', N'10 Đường Số 3, Quận 7, TP.HCM', N'0988100222')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (4, N'Pizza Hut', N'320 Đường Số 5, Quận 10, TP.HCM', N'0988100333')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (5, N'The Pizza Company - Bà Hom', N'15 Đường Bà Hom, Quận 6, TP.HCM', N'0988100444')
GO
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__Order__4316F928] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK__Order_Det__Order__4316F928]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__Produ__440B1D61] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK__Order_Det__Produ__440B1D61]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__403A8C7D] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__403A8C7D]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__3D5E1FD2] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__3D5E1FD2]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Suppli__3C69FB99] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Suppli__3C69FB99]
GO
USE [master]
GO
ALTER DATABASE [project_prj] SET  READ_WRITE 
GO