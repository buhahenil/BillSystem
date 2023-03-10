USE [master]
GO
/****** Object:  Database [BillSystem]    Script Date: 06-02-2023 18:57:03 ******/
CREATE DATABASE [BillSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BillSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BillSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BillSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BillSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BillSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BillSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BillSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BillSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BillSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BillSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BillSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BillSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BillSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BillSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BillSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BillSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BillSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BillSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BillSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BillSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BillSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BillSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BillSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BillSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BillSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BillSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BillSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BillSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BillSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BillSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BillSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BillSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BillSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BillSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BillSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BillSystem', N'ON'
GO
ALTER DATABASE [BillSystem] SET QUERY_STORE = OFF
GO
USE [BillSystem]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFirstName] [varchar](255) NULL,
	[CustomerLastName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItem]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItem](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](255) NULL,
	[ItemName] [nvarchar](255) NULL,
	[Price] [nvarchar](10) NULL,
	[GST] [nvarchar](5) NULL,
	[Discount] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ItemId] [int] NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderMaster]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderMaster](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](10) NOT NULL,
	[OrderDate] [date] NULL,
	[ItemId] [int] NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (1, N'tsetA', N'tset tset A')
INSERT [dbo].[tblCustomer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (2, N'tsetB', N'tset tset B')
INSERT [dbo].[tblCustomer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (3, N'tsetC', N'tset tset C')
INSERT [dbo].[tblCustomer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (4, N'tsetD', N'tset tset D')
INSERT [dbo].[tblCustomer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (5, N'tsetE', N'tset tset E')
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
SET IDENTITY_INSERT [dbo].[tblItem] ON 

INSERT [dbo].[tblItem] ([ItemId], [ItemCode], [ItemName], [Price], [GST], [Discount]) VALUES (1, N'ITEM001', N'ITEM Pen', N'10', N'5', N'2')
INSERT [dbo].[tblItem] ([ItemId], [ItemCode], [ItemName], [Price], [GST], [Discount]) VALUES (2, N'ITEM002', N'ITEM Keybord', N'300', N'12', N'10')
INSERT [dbo].[tblItem] ([ItemId], [ItemCode], [ItemName], [Price], [GST], [Discount]) VALUES (3, N'ITEM003', N'ITEM Mouse', N'150', N'18', N'10')
INSERT [dbo].[tblItem] ([ItemId], [ItemCode], [ItemName], [Price], [GST], [Discount]) VALUES (4, N'ITEM004', N'ITEM Laptop', N'25000', N'28', N'15')
INSERT [dbo].[tblItem] ([ItemId], [ItemCode], [ItemName], [Price], [GST], [Discount]) VALUES (5, N'ITEM005', N'ITEM Mobile', N'15000', N'12', N'20')
SET IDENTITY_INSERT [dbo].[tblItem] OFF
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[tblItem] ([ItemId])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrderMaster] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrderMaster]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[tblOrderMaster]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[tblItem] ([ItemId])
GO
/****** Object:  StoredProcedure [dbo].[spSelectAllCustomers]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectAllCustomers]
@CustomerFirstName nvarchar(50)
AS
begin
	SELECT CustomerFirstName FROM tblCustomer WHERE CustomerFirstName LIKE @CustomerFirstName +'%'
End
GO
/****** Object:  StoredProcedure [dbo].[spSelectItemCode]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectItemCode]
@ItemCode nvarchar(50)
AS
begin
	SELECT ItemCode FROM tblItem WHERE ItemCode LIKE @ItemCode +'%'
End
GO
/****** Object:  StoredProcedure [dbo].[spSelectItemCode1]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectItemCode1]
@ItemCode nvarchar(50),
@ItemName nvarchar(50)
AS
begin
	SELECT ItemCode,ItemName,GST,Price,Discount FROM tblItem WHERE (
		ItemCode LIKE @ItemCode +'%' or 
		ItemName LIKE @ItemCode +'%') 
End
select *from tblItem
GO
/****** Object:  StoredProcedure [dbo].[spSelectItemName]    Script Date: 06-02-2023 18:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectItemName]
@ItemName nvarchar(50)
AS
begin
	SELECT ItemName FROM tblItem WHERE ItemName LIKE @ItemName +'%'
End
GO
USE [master]
GO
ALTER DATABASE [BillSystem] SET  READ_WRITE 
GO
