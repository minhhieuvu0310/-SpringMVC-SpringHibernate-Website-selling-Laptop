USE [master]
GO
/****** Object:  Database [LapTop]    Script Date: 2/10/2023 6:34:47 PM ******/
CREATE DATABASE [LapTop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LapTop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LapTop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LapTop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LapTop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LapTop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LapTop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LapTop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LapTop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LapTop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LapTop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LapTop] SET ARITHABORT OFF 
GO
ALTER DATABASE [LapTop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LapTop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LapTop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LapTop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LapTop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LapTop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LapTop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LapTop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LapTop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LapTop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LapTop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LapTop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LapTop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LapTop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LapTop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LapTop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LapTop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LapTop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LapTop] SET  MULTI_USER 
GO
ALTER DATABASE [LapTop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LapTop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LapTop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LapTop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LapTop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LapTop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LapTop] SET QUERY_STORE = OFF
GO
USE [LapTop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[totalmoney] [float] NULL,
	[created] [date] NULL,
	[updated] [date] NULL,
	[status] [int] NULL,
	[content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[cartItemId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[cartId] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[amount] [float] NULL,
	[created] [date] NULL,
	[updated] [date] NULL,
	[note] [text] NULL,
	[color] [nvarchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CataLogs]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CataLogs](
	[catalogId] [int] IDENTITY(1,1) NOT NULL,
	[catalogName] [nvarchar](100) NULL,
	[descriptions] [nvarchar](100) NULL,
	[parentId] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[catalogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[colorId] [int] IDENTITY(1,1) NOT NULL,
	[colorName] [nvarchar](100) NULL,
	[status] [int] NULL,
	[natation] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[colorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageLink]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageLink](
	[imageLinkId] [int] IDENTITY(1,1) NOT NULL,
	[imageLinkName] [nvarchar](100) NULL,
	[productId] [int] NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[imageLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderdetail]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderdetail](
	[orderdetailid] [int] IDENTITY(1,1) NOT NULL,
	[ordersid] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[amount] [float] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status] [int] NULL,
	[note] [nvarchar](100) NULL,
	[color] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderdetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ordersid] [int] IDENTITY(1,1) NOT NULL,
	[ordername] [nvarchar](100) NULL,
	[ordernumber] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[totalamount] [float] NULL,
	[paymentdate] [date] NULL,
	[createddate] [date] NULL,
	[status] [int] NULL,
	[userid] [int] NULL,
	[paymentmethod] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ordersid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[productcontent] [ntext] NULL,
	[productcontentdetail] [ntext] NULL,
	[images] [nvarchar](100) NULL,
	[views] [int] NULL,
	[buyitem] [int] NULL,
	[priceinput] [float] NULL,
	[priceoutput] [float] NULL,
	[quantity] [int] NULL,
	[catalogid] [int] NULL,
	[providerid] [int] NULL,
	[created] [date] NULL,
	[discount] [float] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[productColorId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[colorId] [int] NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[providerId] [int] IDENTITY(1,1) NOT NULL,
	[providerName] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [varchar](15) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [nvarchar](100) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[phone] [varchar](15) NULL,
	[email] [nvarchar](100) NULL,
	[created] [date] NULL,
	[updated] [date] NULL,
	[userimage] [nvarchar](100) NULL,
	[status] [int] NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Roles]    Script Date: 2/10/2023 6:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[roleid] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartId], [userId], [totalmoney], [created], [updated], [status], [content]) VALUES (1, 1, NULL, CAST(N'2022-11-25' AS Date), CAST(N'2022-11-28' AS Date), 1, N'chua có')
INSERT [dbo].[Cart] ([cartId], [userId], [totalmoney], [created], [updated], [status], [content]) VALUES (2, 2, NULL, CAST(N'2022-12-31' AS Date), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CataLogs] ON 

INSERT [dbo].[CataLogs] ([catalogId], [catalogName], [descriptions], [parentId], [status]) VALUES (1, N'Gaming', NULL, 0, 1)
INSERT [dbo].[CataLogs] ([catalogId], [catalogName], [descriptions], [parentId], [status]) VALUES (2, N'Sinh Viên - Văn Phòng', NULL, 0, 1)
INSERT [dbo].[CataLogs] ([catalogId], [catalogName], [descriptions], [parentId], [status]) VALUES (3, N'Thiết kế đồ họa', NULL, 0, 1)
INSERT [dbo].[CataLogs] ([catalogId], [catalogName], [descriptions], [parentId], [status]) VALUES (4, N'Mỏng Nhẹ', NULL, 0, 1)
INSERT [dbo].[CataLogs] ([catalogId], [catalogName], [descriptions], [parentId], [status]) VALUES (5, N'Doanh Nhân', NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[CataLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (1, N'Màu đỏ', 1, N'Red')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (2, N'Màu xanh', 1, N'Blue')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (3, N'Màu đen', 1, N'Black')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (4, N'Màu trắng', 1, N'White')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (5, N'Màu hồng', 1, N'Pink')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (6, N'Màu vàng', 1, N'Yellow')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (7, N'Xanh', 1, N'Green')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (8, N'Tím', 1, N'Purple')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (9, N'Xám', 1, N'Grey')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (10, N'Cam', 1, N'Orange')
INSERT [dbo].[Color] ([colorId], [colorName], [status], [natation]) VALUES (11, N'Nâu', 1, N'Brown')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageLink] ON 

INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (1, N'Acer1.jpg', 1, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (2, N'Acer2.jpg', 1, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (3, N'Acer3.jpg', 1, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (4, N'Acer4.jpg', 1, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (5, N'Acer5.jpg', 1, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (6, N'Acer(2)1.jpg', 2, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (7, N'Acer(2)2.jpg', 2, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (8, N'Acer(2)3.jpg', 2, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (9, N'Acer(2)4.jpg', 2, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (10, N'Acer(2)5.jpg', 2, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (11, N'Acer(3)1.jpg', 3, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (12, N'Acer(3)2.jpg', 3, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (13, N'Acer(3)3.jpg', 3, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (14, N'Acer(3)4.jpg', 3, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (15, N'Acer(3)5.jpg', 3, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (16, N'Acer(4)1.jpg', 4, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (17, N'Acer(4)2.jpg', 4, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (18, N'Acer(4)3.jpg', 4, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (19, N'Acer(4)4.jpg', 4, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (20, N'Acer(4)5.jpg', 4, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (21, N'Acer(5)1.jpg', 5, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (22, N'Acer(5)2.jpg', 5, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (23, N'Acer(5)3.jpg', 5, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (24, N'Acer(5)4.jpg', 5, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (25, N'Acer(5)5.jpg', 5, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (26, N'Acer(6)1.jpg', 6, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (27, N'Acer(6)2.jpg', 6, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (28, N'Acer(6)3.jpg', 6, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (29, N'Acer(6)4.jpg', 6, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (30, N'Acer(6)5.jpg', 6, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (31, N'Acer(6)1.jpg', 7, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (32, N'Acer(6)2.jpg', 7, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (33, N'Acer(6)3.jpg', 7, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (34, N'Acer(6)4.jpg', 7, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (35, N'Acer(6)5.jpg', 7, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (36, N'Acer(6)1.jpg', 8, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (37, N'Acer(6)2.jpg', 8, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (38, N'Acer(6)3.jpg', 8, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (39, N'Acer(6)4.jpg', 8, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (40, N'Acer(6)5.jpg', 8, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (41, N'Acer(6)1.jpg', 9, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (42, N'Acer(6)2.jpg', 9, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (43, N'Acer(6)3.jpg', 9, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (44, N'Acer(6)4.jpg', 9, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (45, N'Acer(6)5.jpg', 9, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (46, N'msi(1)1.jpg', 10, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (47, N'msi(1)2.jpg', 10, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (48, N'msi(1)3.jpg', 10, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (49, N'msi(1)4.jpg', 10, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (50, N'lenlovo(1)1.jpg', 11, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (51, N'lenlovo(1)2.jpg', 11, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (52, N'lenlovo(1)3.jpg', 11, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (53, N'lenlovo(1)4.jpg', 11, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (54, N'lenlovo(1)5.jpg', 11, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (55, N'msi(2)1.jpg', 12, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (56, N'msi(2)2.jpg', 12, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (57, N'msi(2)3.jpg', 12, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (58, N'msi(2)4.jpg', 12, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (59, N'msi(2)5.jpg', 12, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (60, N'dell(1)1.jpg', 13, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (61, N'dell(1)2.jpg', 13, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (62, N'dell(1)3.jpg', 13, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (63, N'dell(1)4.jpg', 13, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (64, N'dell(1)5.jpg', 13, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (65, N'hp(1)1.jpg', 14, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (66, N'hp(1)2.jpg', 14, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (67, N'hp(1)3.jpg', 14, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (68, N'hp(1)4.jpg', 14, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (69, N'hp(1)5.jpg', 14, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (70, N'lenlovo(1)1.jpg', 15, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (71, N'lenlovo(1)2.jpg', 15, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (72, N'lenlovo(1)3.jpg', 15, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (73, N'lenlovo(1)4.jpg', 15, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (74, N'lenlovo(1)5.jpg', 15, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (75, N'hp(1)1.jpg', 16, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (76, N'hp(1)2.jpg', 16, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (77, N'hp(1)3.jpg', 16, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (78, N'hp(1)4.jpg', 16, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (79, N'hp(1)5.jpg', 16, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (80, N'asusvivobook(1)1.jpg', 17, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (81, N'asusvivobook(1)2.jpg', 17, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (82, N'asusvivobook(1)3.jpg', 17, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (83, N'asusvivobook(1)4.jpg', 17, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (84, N'asusvivobook(1)5.jpg', 17, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (85, N'asusvivobook(2)1.jpg', 18, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (86, N'asusvivobook(2)2.jpg', 18, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (87, N'asusvivobook(2)3.jpg', 18, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (88, N'asusvivobook(2)4.jpg', 18, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (89, N'asusvivobook(2)5.jpg', 18, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (90, N'asusvivobook(3)1.jpg', 19, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (91, N'asusvivobook(3)2.jpg', 19, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (92, N'asusvivobook(3)3.jpg', 19, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (93, N'asusvivobook(3)4.jpg', 19, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (94, N'asusvivobook(3)5.jpg', 19, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (95, N'hp(1)1.jpg', 20, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (96, N'hp(1)2.jpg', 20, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (97, N'hp(1)3.jpg', 20, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (98, N'hp(1)4.jpg', 20, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (99, N'hp(1)5.jpg', 20, 1)
GO
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (100, N'lenlovo(1)1.jpg', 21, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (101, N'lenlovo(1)2.jpg', 21, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (102, N'lenlovo(1)3.jpg', 21, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (103, N'lenlovo(1)4.jpg', 21, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (104, N'lenlovo(1)5.jpg', 21, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (105, N'lenlovo(1)1.jpg', 22, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (106, N'lenlovo(1)2.jpg', 22, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (107, N'lenlovo(1)3.jpg', 22, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (108, N'lenlovo(1)4.jpg', 22, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (109, N'lenlovo(1)5.jpg', 22, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (110, N'lenlovo(1)1.jpg', 23, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (111, N'lenlovo(1)2.jpg', 23, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (112, N'lenlovo(1)3.jpg', 23, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (113, N'lenlovo(1)4.jpg', 23, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (114, N'lenlovo(1)5.jpg', 23, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (115, N'asusvivobook(1)1.jpg', 24, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (116, N'asusvivobook(1)2.jpg', 24, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (117, N'asusvivobook(1)3.jpg', 24, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (118, N'asusvivobook(1)4.jpg', 24, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (119, N'asusvivobook(1)5.jpg', 24, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (120, N'macbook(1)1.jpg', 25, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (121, N'macbook(1)2.jpg', 25, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (122, N'macbook(1)3.jpg', 25, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (123, N'macbook(1)4.jpg', 25, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (124, N'macbook(1)5.jpg', 25, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (125, N'macbook(1)1.jpg', 26, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (126, N'macbook(1)2.jpg', 26, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (127, N'macbook(1)3.jpg', 26, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (128, N'macbook(1)4.jpg', 26, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (129, N'macbook(1)5.jpg', 26, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (130, N'macbook(1)1.jpg', 27, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (131, N'macbook(1)2.jpg', 27, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (132, N'macbook(1)3.jpg', 27, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (133, N'macbook(1)4.jpg', 27, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (134, N'macbook(1)5.jpg', 27, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (135, N'macbook(1)1.jpg', 28, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (136, N'macbook(1)2.jpg', 28, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (137, N'macbook(1)3.jpg', 28, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (138, N'macbook(1)4.jpg', 28, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (139, N'macbook(1)5.jpg', 28, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (140, N'macbook(1)1.jpg', 29, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (141, N'macbook(1)2.jpg', 29, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (142, N'macbook(1)3.jpg', 29, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (143, N'macbook(1)4.jpg', 29, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (144, N'macbook(1)5.jpg', 29, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (145, N'macbook(1)1.jpg', 30, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (146, N'macbook(1)2.jpg', 30, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (147, N'macbook(1)3.jpg', 30, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (148, N'macbook(1)4.jpg', 30, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (149, N'macbook(1)5.jpg', 30, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (150, N'macbook(1)1.jpg', 31, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (151, N'macbook(1)2.jpg', 31, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (152, N'macbook(1)3.jpg', 31, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (153, N'macbook(1)4.jpg', 31, 1)
INSERT [dbo].[ImageLink] ([imageLinkId], [imageLinkName], [productId], [status]) VALUES (154, N'macbook(1)5.jpg', 31, 1)
SET IDENTITY_INSERT [dbo].[ImageLink] OFF
GO
SET IDENTITY_INSERT [dbo].[Orderdetail] ON 

INSERT [dbo].[Orderdetail] ([orderdetailid], [ordersid], [productId], [amount], [price], [quantity], [status], [note], [color]) VALUES (1, 1, 31, 109782000, 54891000, 2, 1, N'Color : Pink; Quantity : 2', N'Pink')
SET IDENTITY_INSERT [dbo].[Orderdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ordersid], [ordername], [ordernumber], [phone], [email], [address], [totalamount], [paymentdate], [createddate], [status], [userid], [paymentmethod]) VALUES (1, N'Vũ Đình Nghị', NULL, N'0373664234', N'vuluy3000@gmail.com', N'Trung Lao - Trực Ninh - Nam Định', 109782000, NULL, CAST(N'2022-11-29' AS Date), 0, 1, N'Thanh Toán khi nhận hàng')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (1, N'Acer Nitro 5(LapTop Gaming)', N'[NEW REF] Laptop chơi game Acer Nitro 5 2021 AN515-57 (Core i5 - 11400H, 8GB, 256GB, GTX1650, 15.6'''' FHD IPS 144Hz)', N'Vi xử lý Tiger Lake H-Series cực mạnh
Laptop Acer Nitro 5 AN515-57 sở hữu bộ vi xử lý mà chắc chắn game thủ nào cũng rất thích thú. Con chip Intel Core i5 11400H là mẫu CPU mới nhất của thế hệ thứ 11, dù là i5 nhưng có tới 6 nhân 12 luồng, tốc độ tối đa 4.50GHz, bộ nhớ đệm 12MB, cho sức mạnh không thua kém gì những CPU Core i7 trước đây
Hiệu suất chơi game ấn tượng
Sở hữu card rời GTX 1650, bạn sẽ được tận hưởng hiệu suất đồ họa đột phá của kiến trúc NVIDIA Turing danh tiếng trên Acer Nitro 5 AN515 57. Hầu như các trò chơi phổ biến nhất đều tương thích và chơi tốt ở thiết lập Full HD trên GTX 1650
Trải nghiệm game mượt mà
Không chỉ cấu hình, màn hình máy tính với tần số quét lên đến 144Hz cũng là một “vũ khí” lợi hại khác của Acer Nitro 5 AN515-57.Viền màn hình giờ đây đã được thu hẹp chỉ còn 7.02mm, tăng tỉ lệ màn hình trên thân máy 80%, mang đến hình ảnh sống động như thật
Kết nối nhanh và ổn định
Laptop cũng có đầy đủ những cổng kết nối khác như 3 cổng USB 3.2 Type-A, 1 cổng USB Type-C, 1 cổng HDMI và cổng tai nghe 3.5mm
Tản nhiệt mát mẻ, hiệu suất tối ưu
Acer Nitro 5 AN515-57 sử dụng hệ thống tản nhiệt mới với 2 quạt và công nghệ Acer CoolBoost giúp tăng 10% tốc độ quạt, cho hiệu quả cao hơn và giảm nhiệt độ CPU lẫn GPU xuống 9%. Khả năng lưu thông khí cũng tốt hơn 25% nhờ 4 khe hút gió thoát nhiệt thông minh

THÔNG SỐ KỸ THUẬT
CPU: Intel Core i5-11400H
RAM: 8 GB, DDR4, 3200 MHz
Màn hình: 15.6", 1920 x 1080 Pixel, IPS, 144 Hz, Acer ComfyView LED-backlit
Đồ họa: NVIDIA GeForce GTX 1650 4 GB
Ổ cứng: SSD 256 GB
Hệ điều hành: Windows 11
Trọng lượng (kg): 2.2
Kích thước (mm): 363.4 x 255 x 23.9
Năm ra mắt: 2021

•	Bảo hành 12 tháng , 1 đổi 1 trong 15 ngày đầu tiên nếu có lỗi
•	Tặng phụ kiện gồm :  túi xách cao cấp, chuột xịn, bàn di chuột bo viền
•	Mua hàng online thật dễ dàng, ở nhà mà vẫn mua được sản phẩm ưng ý mà không cần phải đi đâu
•	Bạn ở xa còn phân vân chưa biết ở đâu bán hàng chất lượng thì hãy đến với shop LAPTOPGAME
•	Uy tín và chất lượng đã được Khách hàng khẳng định qua những sản phẩm chúng tôi bán ra
•	Hỗ trợ tư vấn khách hàng chọn mua laptop nhiệt tình chu đáo tận tâm', N'1.jpg', 0, 103, 18000000, 19000000, 200, 1, 1, CAST(N'2022-12-05' AS Date), 0.10000000149011612, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (2, N'Acer Nitro 5(LapTop Gaming)', N'Laptop Acer Nitro 5 AN515-45-R6EV/ R5 - 5600H/ RAM 8GB/ 512GB SSD/GTX1650/144Hz', N'Laptop Acer Nitro 5 AN515-45-R6EV (NH.QBMSV.006)/ Đen/ AMD Ryzen 5 - 5600H/ RAM 8GB/ 512GB SSD/ NVIDIA GeForce GTX 1650



➡ CAM KẾT ĐỔI TRẢ HÀNG LỖI

➡ BẢO HÀNH CHÍNH HÃNG 12 THÁNG

➡ TEST KỸ SẢN PHẨM TRƯỚC KHI GIAO

------------------------------------------------------

☀ Phá cách với diện mạo mạnh mẽ đến từ laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) mang đến cho người dùng hiệu năng ổn định, hỗ trợ bạn trong mọi tác vụ hằng ngày hay chiến những trận gaming cực căng một cách mượt mà.



THÔNG SỐ KỸ THUẬT

•Hãng sản xuất: Acer 

•Part Number: NH.QBMSV.006

•Màu sắc: Black

•Bảo hành: 12 tháng

•Bộ vi xử lý: AMD Ryzen™ 5-5600H (3.3GHz, up to 4.2GHz) L2 Cache: 3MB-L3 Cache: 16MB

•RAM: 8GB, 8GB khe rời DDR4 3200Mhz 2 khe Max 32GB

•VGA: NVIDIA GeForce GTX 1650 4GB

•Ổ cứng: 512GB NVMe SSD

•Ổ quang: Không

•Màn hình: 15.6 inch FHD (1920 x 1080)

•Cổng giao tiếp: 1 x USB 3.2 Gen 2 port featuring power-off USB charging

-2 x USB 3.2 Gen 1 ports

-1 x USB Type-C port: USB 3.2 Gen 2 (up to 10 Gbps)

-1 x HDMI® 2.0 port with HDCP support

•Kết nối mạng Intel® Wireless Wi-Fi 6 AX200 Bluetooth® 5.0

•Pin 57 Wh, 4-cell

•Kích thước : 363.4 (W) x 255 (D) x 23.9 (H) mm

•Cân nặng: ~2.2 kg

•Hệ điều hành: Windows 11 Home

•Đèn LED: Không

•Phụ kiện đi kèm: Sạc, Sách HDSD



"Chính sách bảo hành 3S1

Tất cả các sản phẩm Gaming Acer được cam kết bảo hành 3S1, trong vòng 03 ngày (72 giờ) bao gồm cả ngày thứ bảy và ngày chủ nhật tính từ lúc Trung Tâm Bảo Hành Acer nhận thiết bị. Acer cam kết sẽ đổi sản phẩm mới cùng loại hoặc tương đương (1 đổi 1) cho các trường hợp không hoàn thành bảo hành trong 03 ngày.

Máy tính để bàn Gaming và Màn hình máy tính Gaming trên 32 inch được bảo hành tận nơi (On-site) tại 02 thành phố Hồ Chí Minh và Hà Nội. Các sản phẩm Gaming khác áp dụng hình thức dịch vụ khách hàng mang sản phẩm đến Trung tâm Bảo hành (Carry-in) tại các tỉnh thành có Trung tâm Bảo hành của Acer

Liên hệ hotline TTBH Acer: 1900969601"



• Bảo hành 12 tháng chính hãng

• Bảo hành chính hãng 12 tháng tại TTBH của Acer

• Sản phẩm full box (Sản phẩm+ sạc + hướng dẫn sử dụng )

***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công.

---------------------------------------------------

🏢 ĐỊA CHỈ: BENCOMPUTER – SỐ 7 NGÕ 92, NGUYỄN KHÁNH TOÀN, CẦU GIẤY, HÀ NỘI

☎ HOTLINE/ZALO MUA HÀNG: 0966.469.269



#laptopacer #laptopacernitro5 #laptopaceraspire7 #laptop #laptopgaming #laptopcorei3 #laptopcorei7

#maytinhxachtay #gtx1650 #laptopacernitro5 #laptopgtx1650 #laptopcorei5 #acergaming #laptop #aceraspire #ryzen5 #corei5 #corei7', N'2.jpg', 0, 100, 22490000, 23490000, 300, 1, 1, CAST(N'2022-12-05' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (3, N'Acer Nitro 5(LapTop Gaming)', N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-52SP/ i5-12500H/8GB/512GB SSD/RTX3050/144Hz', N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-52SP/ i5-12500H/8GB/512GB SSD/RTX™ 3050 4GB/144Hz/Win11

➡ CAM KẾT ĐỔI TRẢ HÀNG LỖI

➡ BẢO HÀNH CHÍNH HÃNG 12 THÁNG

➡ TEST KỸ SẢN PHẨM TRƯỚC KHI GIAO

----------------------------

THÔNG SỐ KỸ THUẬT

•Hãng sản xuất: Acer 

•Part Number: NH.QFHSV.001

•Màu sắc: Đen

•Bảo hành: 12 tháng

•Bộ vi xử lý: Intel Core i5-12500H (up to 4.5Ghz, 18MB)

•Chipset: Intel

•RAM: 8GB DDR4 3200MHz (2 khe rời, Nâng cấp tối đa 32GB)

•VGA: NVIDIA® GeForce RTX 3050 4GB GDDR6

•Ổ cứng: 512GB PCIe NVMe SED SSD cắm sẵn (nâng cấp tối đa 2TB Gen4, 16 Gb/s, NVMe và 1 TB 2.5-inch 5400 RPM)

•Ổ quang: Không

•Màn hình: 15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel

•Công nghệ màn hình:

- Acer ComfyView

- Công nghệ IPS

- LED Backlit

- TFT

•Cổng giao tiếp: 

• 1 x USB Type-C port supporting:

• USB 3.2 Gen 2 (up to 10 Gbps)

• DisplayPort over USB-C

• Thunderbolt 4

• USB charging 5 V; 3 A

• DC-in port 20 V; 65 W

1 x USB 3.2 Gen 2 port featuring power-off USB charging 1 USB 3.2 Gen 2 port

1 x USB 3.2 Gen 1 port

1 x Ethernet (RJ-45) port

1 x HDMI®2.1 port with HDCP support

1 x 3.5 mm headphone/speaker jack, supporting headsets with built-in microphone

1 x DC-in jack for AC adapter

Kết nối mạng:

• KillerTM Wi-Fi 6 AX 1650i

• 802.11 a/b/g/n+acR2+ax wireless LAN

• KillerTM Ethernet E2600

• 10/100/1000 Mbps 

•Bluetooth® 5.1

•Webcam: HD Camera

•Pin: 4-cell 57.5 Wh 

•Kích thước : 360.4 (W) x 271.09 (D) x 25.9 (H) mm

•Cân nặng: ~2.5 kg

•Hệ điều hành: Windows 11 SL 64 Bit

•Bàn phím RGB (4-Zone) Keyboard

•Phụ kiện đi kèm: Adapter, dây nguồn



"Chính sách bảo hành 3S1

Tất cả các sản phẩm Gaming Acer được cam kết bảo hành 3S1, trong vòng 03 ngày (72 giờ) bao gồm cả ngày thứ bảy và ngày chủ nhật tính từ lúc Trung Tâm Bảo Hành Acer nhận thiết bị. Acer cam kết sẽ đổi sản phẩm mới cùng loại hoặc tương đương (1 đổi 1) cho các trường hợp không hoàn thành bảo hành trong 03 ngày.

Máy tính để bàn Gaming và Màn hình máy tính Gaming trên 32 inch được bảo hành tận nơi (On-site) tại 02 thành phố Hồ Chí Minh và Hà Nội. Các sản phẩm Gaming khác áp dụng hình thức dịch vụ khách hàng mang sản phẩm đến Trung tâm Bảo hành (Carry-in) tại các tỉnh thành có Trung tâm Bảo hành của Acer

Liên hệ hotline TTBH Acer: 1900969601"



• Bảo hành 12 tháng chính hãng

• Bảo hành chính hãng 12 tháng tại TTBH của Acer

• Sản phẩm full box (Sản phẩm+ sạc + hướng dẫn sử dụng )

***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công.

----------------------------

🏢 ĐỊA CHỈ: BENCOMPUTER – SỐ 7 NGÕ 92, NGUYỄN KHÁNH TOÀN, CẦU GIẤY, HÀ NỘI

☎ HOTLINE/ZALO MUA HÀNG: 0966.469.269', N'3.jpg', 0, 100, 26490000, 27490000, 200, 1, 1, CAST(N'2022-12-05' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (4, N'Acer Niro 5(LapTop Gaming)', N'Laptop Gaming Acer Nitro 5 2021 AN515-57-536Q Core i5 11400H, 8GB, 256GB, GTX1650, 15.6'''' FHD IPS', N'THÔNG TIN CHUNG
CPU: Intel® Core™ i5-11400H (2.70GHz up to 4.50GHz, 12MB)
Ram: 8GB DDR4 3200Mhz khe rời (2 khe, tối đa 32GB)
Ổ cứng: 256GB NVMe SSD (nâng cấp tối đa 2TB SSD PCIe Gen3, 8 Gb/s, NVMe và 2TB HDD 2.5-inch 5400 RPM)
VGA: NVIDIA® GeForce GTX 1650 4GB GDDR6
Display: 15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel, 144Hz, Acer ComfyView LED-backlit TFT LCD
Pin: 4 Cell 57WHrs
Weight: 2.25 kg
Color: Shale Black (Đen)
Tính năng: Đèn LED 4 vùng màu
OS: Windows 11 Home bản quyền

THÔNG TIN CHI TIẾT
Hệ điều hành 
- Operation System	Windows 11 Home bản quyền

Bộ xử lý 
- CPU Intel® Core™ i5-11400H (2.70GHz up to 4.50GHz, 12MB, 4 lõi, 8 luồng)

Màn hình 
- Monitor 15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel, 144Hz, Acer ComfyView LED-backlit TFT LCD

Bộ nhớ trong 
- Ram 8GB DDR4 3200Mhz khe rời (2 khe, tối đa 32GB)

Ổ đĩa cứng 
- 256GB NVMe SSD (nâng cấp tối đa 2TB SSD PCIe Gen3, 8 Gb/s, NVMe và 2TB HDD 2.5-inch 5400 RPM)

Card đồ hoạ 
- VideoNVIDIA® GeForce GTX 1650 4GB GDDR6

Webcam	
- HD webcam

Giao tiếp mạng - Communications	
- Intel® Wireless Wi-Fi 6 AX200 10/100/1000 Mbps

Cổng giao tiếp - Port	
- 1 x USB 3.2 Gen 2 port featuring power-off USB charging
- 2 x USB 3.2 Gen 1 ports
- 1 x USB Type-C port: USB 3.2 Gen 2 (up to 10 Gbps)
- 1 x HDMI® 2.0 port with HDCP support
- 1 x 3.5 mm headphone/speaker jack, supporting headsets with built-in
microphone

Bluetooth	
- Bluetooth 5.0

Pin
- 4Cell 57WHrs

Trọng lượng
- 2.2 kg

Xuất xứ
- Nhập khẩu USA like new 99% không box', N'4.jpg', 0, 99, 14300000, 15000000, 200, 1, 1, CAST(N'2022-12-05' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (5, N'Acer Niro 5(LapTop Gaming)', N'[Gaming - Đồ Họa] Laptop Acer Nitro 5 AN515-54 Core i5 9300H/ Ram 16Gb/ Card đồ họa Nvidia GTX1050/ 15.6'''' IPS Full HD .', N'⚜️OneShop xin gửi tới quý khách hàng siêu phẩm Acer Gaming NITRO 5 AN515-54 chính hãng đã qua sử dụng. Là dòng máy chuyên Gaming Cao Cấp đến từ Thương hiệu Acer, máy được sở hữu một thiết kiểu dáng hầm hố đặc trưng của 1 chiếc máy dòng Gaming. Kèm theo đó máy được trang bị nhiều opiton cao cấp như màn hình độ phân giải cao, led phím sáng, hệ thống âm thanh khủng ...vv, cấu hình phần cứng siêu mạnh mẽ đem lại hiệu năng đáp ứng mọi nhu cầu chơi game hay làm đồ họa nặng nhất .
 ❄ Tuy là hàng đã qua sử dụng nhưng chất lượng còn tuyệt đối zin 100% . Hình thức máy đẹp keng như hình ảnh - video shop đã cung cấp . Chỉ cần bỏ ra số tiền vừa phải các bạn đã sở hữu đc ngay 1 chiếc laptop Gaming cao cấp, thương hiệu và hiệu năng cực cao. Đáp ứng mọi nhu cầu từ chơi game khủng đến đồ họa nặng...
 ❄ Mọi hình ảnh ,video shop cung cấp đều là thực tế nhất để khách hàng có thể có cái nhìn rõ nhất về sản phẩm mình đang quan tâm.
✡️✡️✡️Thông số✡️✡️✡️
⚙️CPU: intel Core i5 9300H 8 luồng Max turbo lên tới 4.1ghz ( Dòng chip Core i5 thế hệ 9 dòng H siêu phân luồng đem lại 1 hiệu năng cực mạnh )
⚙️Ram : DDR4 8Gb hoặc nâng cấp lên 16Gb tùy chọn ( KHÁCH HÀNG TÙY CHỌN DUNG LƯỢNG RAM TẠI PHẦN ĐẶT HÀNG]
⚙️Ổ Cứng : SSD M2 128Gb, hoặc nâng cấp SSD M2 256Gb -512Gb , Hoặc sử dụng cùng lúc 2 ổ cứng SSD M2 512Gb + HDD 1Tb ( KHÁCH HÀNG TÙY CHỌN TẠI PHẦN ĐẶT HÀNG )
⚙️Card Đồ họa : Máy trang bị cùng lúc 2 card đồ họa luân phiên nhau tùy từng tác vụ sử dụng:
- Card đồ họa rời :Nvidia GTX1050TI DDR5 4Gb turbo 8Gb cực mạnh mẽ ( bao chiến mọi tựa game - làm đồ họa nặng nhất )
- Card đồ họa Onboar : Intel Graphic UHD 630 ( Card đồ họa intel thế hệ 8 máy sử dụng cho các tác vụ đồ họa thông thường - luôn đảm bảo cho độ bền - sự ổn định cảu máy tốt nhất )
⚙️Màn hình: 15.6 inch IPS FullHD 1080P 280Nits tràn viền siêu sắc nét , đem lại sự thoải mái khi các bạn sử dụng máy trong thời gian dài.
⚙️Pin : onscreen 3-5 h tùy nhu cầu sử dụng .
⚙️Cổng giao tiếp: 3 x USB 3.0, HDMI, LAN (RJ45) ,Bluetooth 5.0, Wedcam HD...vv
⚙️Hệ điều hành: Windows 10 pro bản quyền.
✡️Bộ phụ kiện kèm theo: túi xách cao cấp, chuột ko dây chính hãng, tai phone extrabass, bàn lót chuột cao cấp, thẻ bảo hành... các bạn chỉ việc dùng ko cần mua sắm thêm bất cứ gì.
✡️Để mua sản phẩm các bạn vui lòng đặt hàng tại Shopee để đc giao hàng nhanh nhất, an toàn và tiết kiệm nhất.
☎️Mọi thắc mắc về sản phẩm xin vui lòng inbox shop để đc tư vấn nhiệt tình nhé!
✪Sản phẩm bán ra đc shop bảo hành 6 tháng phần cứng , hổ trợ trọn đời máy phần mềm qua teamview 24/24.
Cảm ơn quý khách hàng đã quan tâm và ủng hộ sản phẩm của shop!', N'5.jpg', 0, 100, 13990000, 17190000, 200, 1, 1, CAST(N'2022-12-05' AS Date), 0.05, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (6, N'Acer Gaming Aspire 7(LapTop Gaming)', N'Acer Gaming Aspire 7 A715-42G-R4XX (Chip AMD Ryzen R5-5500U / GTX 1650 4GB)', N'Laptop Acer Aspire 7 A715-42G-R4XX (NH.QAYSV.008)/ Đen/ AMD Ryzen 5 5500U/ RAM 8GB/ 256GB SSD/NVIDIA GTX 1650/15.6" FHD

➡ CAM KẾT ĐỔI TRẢ HÀNG LỖI
➡ BẢO HÀNH CHÍNH HÃNG 12 THÁNG
➡ TEST KỸ SẢN PHẨM TRƯỚC KHI GIAO
➡ FREESHIP TOÀN QUỐC
----------------------------
THÔNG SỐ KỸ THUẬT
•Hãng sản xuất: ACER 
•Part Number: NH.QAYSV.008
•Màu sắc: Đen
•Bảo hành:12 tháng
•Bộ vi xử lý: AMD Ryzen 5 5500U (up to 4.0Ghz, 11MB)
•RAM: 8GB DDR4 2 khe (1 khe 8GB + 1 khe rời) 3200 MHz, up to 32GB
•VGA: NVIDIA GeForce GTX 1650 4 GB
•Ổ cứng: 256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)
•Không hỗ trợ khe cắm HDD
•Không hỗ trợ khe cắm SSD M2 mở rộng thêm
•Ổ quang: Không
•Màn hình 15.6" FHD (1920 x 1080) IPS, Acer ComfyView, 
•Chống chói Anti Glare
•Công nghệ IPS
•Cổng giao tiếp 2 x USB 3.2
-HDMI
-Jack tai nghe 3.5 mm
-LAN (RJ45)
-USB 2.0
-USB Type-C
•Kết nối mạng	Bluetooth 5.1Wi-Fi 6 (802.11ax)
•Pin Li-ion: 48 Wh
•Kích thước Dài 363.4 mm - Rộng 254.5 mm - Dày 22.9 mm 
•Cân nặng~Nặng 2.1 kg
•Hệ điều hành: Win 11SL
•Đèn LED	 
•Phụ kiện đi kèm: Sạc, Sách HDSD

"Chính sách bảo hành 3S1
Tất cả các sản phẩm Gaming Acer được cam kết bảo hành 3S1, trong vòng 03 ngày (72 giờ) bao gồm cả ngày thứ bảy và ngày chủ nhật tính từ lúc Trung Tâm Bảo Hành Acer nhận thiết bị. Acer cam kết sẽ đổi sản phẩm mới cùng loại hoặc tương đương (1 đổi 1) cho các trường hợp không hoàn thành bảo hành trong 03 ngày.
Máy tính để bàn Gaming và Màn hình máy tính Gaming trên 32 inch được bảo hành tận nơi (On-site) tại 02 thành phố Hồ Chí Minh và Hà Nội. Các sản phẩm Gaming khác áp dụng hình thức dịch vụ khách hàng mang sản phẩm đến Trung tâm Bảo hành (Carry-in) tại các tỉnh thành có Trung tâm Bảo hành của Acer
Liên hệ hotline TTBH Acer: 1900969601"
----------------------------
***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công. 


AnPhatPC - Hơn 18 năm kinh nghiệm phân phối sản phẩm IT.
Cam kết bảo hành 
- Cam kết 100% chính hãng.
- Bảo hành theo chính sách của nhà sản xuất: Tem serial trên sản phẩm + Phiếu bảo hành
- Đổi trả trong vòng 7 ngày: Lỗi nhà sản xuất, hư hỏng trong quá trình vận chuyển, giao sai hoặc thiếu phụ kiện.
- Hotline Chăm sóc Khách hàng: 0902.11.12.13
- Facebook Page: https://www.facebook.com/An-Ph%C3%A1t-Computer-Shopee-112629741455805 
- Youtube : https://www.youtube.com/c/AnPhatComputerpc
Địa chỉ shop : 
1. 49 Thái Hà - Đống Đa - Hà Nội
2. 151 Lê Thanh Nghị - Hai Bà Trưng - Hà Nội
3. 63 Trần Thái Tông - Phường Dịch Vọng - Cầu Giấy - Hà Nội
4. 84T/14 Trần Đình Xu-P.Cô Giang-Q.1-TPHCM
5. 158 - 160 Lý Thường Kiệt P.14 - Q.10 - TPHCM
6. 330-332 Võ Văn Tần, Phường 5, Q.3, TPHCM', N'6.jpg', 0, 100, 16290000, 17290000, 300, 1, 1, CAST(N'2022-12-05' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (7, N'Acer Gaming Aspire 7(LapTop Gaming)', N'Laptop Acer Gaming Aspire 7 A715 42G R1SB NH.QAYSV.005 (Ryzen 5 5500U/ 8Gb/ 256Gb SSD/ 15.6" FHD/ Nvidia GTX1650 4Gb.', N'- Bộ VXL: Ryzen 5 5500U 2.1Ghz up to 4.0GHz-3Mb
- Cạc đồ họa: Nvidia GeForce GTX 1650 4GB GDDR6 DDR5
- Bộ nhớ: 8Gb
- Ổ cứng/ Ổ đĩa quang: 256GB PCIe NVMe SSD cắm sẵn
- Màn hình: 15.6Inch Full HD
- Hệ điều hành: Windows 10 Home
- Màu sắc/ Chất liệu: Black
Laptop Acer Gaming Aspire 7 A715 42G R1SB NH.QAYSV.005 (Ryzen 5 5500U/ 8Gb/ 256Gb SSD/ 15.6" FHD/ Nvidia GTX1650 4Gb DDR6/ Win10/Black) 
Không bị bó buộc về vị trí lắp đặt, laptop gaming đang dần trở thành những lựa chọn của các game thủ.  Laptop Acer Gaming Aspire 7 là một cỗ máy "chiến game" sẵn sàng theo chân các game thủ "chinh chiến" mọi nơi, mọi lúc. Đồng thời cũng giải quyết tốt các công việc đồ họa - kỹ thuật.
Thiết kế sang trọng tinh tế và tối ưu
Với khung máy của Laptop Acer Gaming Aspire 7 được chế tác bằng vỏ nhựa cứng polycarbonate, được gia công vân xước, với đường cắt Diamond Cut mạnh mẽ. Đem lại cảm giác nhìn sang trọng cũng như chắc chắn khi cầm trên tay. Cùng với đó sản phẩm laptop gaming của Acer còn được thiết kế để tối ưu hóa cho việc chơi game liên tục nhờ hệ thống hai quạt tản nhiệt, 3 ống đồng fullsize, heatsink size lớn giúp tối ưu khả năng tản nhiệt. Bản lề thiết kế chắc chắn ít bị rung lắc khi chơi, có khả năng mở góc 180 độ giúp bảo vệ máy tốt hơn.
Sức mạnh tốt nhất trong phân khúc
Sở hữu bộ vi xử lý AMD Ryzen 5 5500U, cùng với đó là card đồ họa NVIDIA GTX1650 4Gb DDR6 chiến tốt những tựa game hiện có dành cho PC, vận hành mượt mà có thể đạt được tốc độ khung hình trên 100 fps ở độ phân giải FullHD đi cùng cài đặt đồ họa từ trung bình đến cao nhất. Ngoài chơi game người dùng cũng có thể thoải mái sử dụng các tác vụ chỉnh sửa hỉnh ảnh, video với chất lượng cao.

Laptop Acer Gaming Aspire 7 được trang bị sẵn bộ nhớ RAM 8GB 2 khe cắm hỗ trợ nâng cấp tối đa 32GB cùng ổ cứng SSD 512GB PCIe NVMe có thể mở rộng lên 1TB.
Kết nối mạnh mẽ
Tích hợp công nghệ Wi-Fi 6 AX200 thế hệ mang wifi mới nhất, cải thiện tốc độ kế nối. Chơi game, trò truyện trực tuyến siêu tốc.

Bên cạnh đó Aspire 7 hỗ trợ các cổng vật lý truyền thống: 2 USB 3.2, 1  USB Type C, 1 x USB 2.0, 1  HDMI, 1 Ethernet

Phúc Anh Smart World - Thương hiệu 22 năm khách hàng tín nhiệm
⛔️ Cam kết đổi trả hàng lỗi do nhà sản xuất
⛔️100% hàng chính hãng
⛔️ Test sản phẩm trước khi giao cho khách hàng
📞 Tư vấn mua hàng Hotline/Zalo         : 0916142266
📞 Hỗ Trợ Bảo Hành                               : 19002173
📞 Hỗ Trợ Kỹ Thuật                                 : 19002165

—————
Địa chỉ: 
CS1: Số 89 Lê Duẩn, Cửa Nam, Hoàn Kiếm, Hà Nội
CS2: 15 Xã Đàn, Phương Liên, Đống Đa, Hà Nội
CS3: 134 Thái Hà, Trung Liệt Đống Đa, Hà Nội
CS4: 152 Trần Duy Hưng, Trung Hòa, Cầu Giấy, Hà Nội
CS5: 63 Nguyễn Hoàng, Nam Từ Liêm, Hà Nội
CS6: 141 Phạm Văn Đồng, Cầu Giấy, Hà Nội
👍 CAM KẾT HÀNG CHÍNH HÃNG, UY TÍN TẠO THƯƠNG HIỆU', N'7.jpg', 0, 100, 13990000, 14990000, 200, 1, 1, CAST(N'2022-12-05' AS Date), 0.07, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (8, N'Acer Gaming Aspire 7(LapTop Gaming)', N'Laptop Acer Aspire Gaming 7 A715-75G-58U4 (i510300H|8GB|512GB|15.6''''|GTX1650|Win11 )', N'Hãng sản xuất	Laptop Acer
Tên sản phẩm   	Acer Gaming Aspire 7 A715-75G-58U4 NH.Q97SV.004 
Dòng Laptop	Laptop  | Laptop Văn Phòng | Laptop Gaming | Laptop Acer Aspire | Laptop Đồ Họa
Bộ vi xử lý 

Công nghệ CPU

Intel® Core™ i5-10300H

Số nhân

4
Số luồng

8

Tốc độ CPU

2.50 GHz
Tốc độ tối đa

4.50 GHz
Bộ nhớ đệm

8 MB
Bộ nhớ trong (RAM)

RAM

8GB(2*4GB) 

Loại RAM

DDR4

Tốc độ Bus RAM

 
Số khe cắm

2 khe
Hỗ trợ RAM tối đa

Nâng cấp tối đa 32GB
Ổ cứng 

Dung lượng

512GB PCIe NVMe SSD

Tốc độ vòng quay

 

Khe cắm SSD mở rộng

 nâng cấp tối đa 1TB SSD

Ổ đĩa quang (ODD) 

Không có

Màn hình

Kích thước màn hình

15.6 inch 

Độ phân giải

FHD (1920 x 1080)

Tần số quét

60Hz
Công nghệ màn hình

IPS SlimBezel, 60Hz, Acer ComfyView LCD
Đồ Họa (VGA) 

Card màn hình

NVIDIA® GeForce® GTX 1650 4GB GDDR6

Kết nối (Network) 

Wireless

 Intel® Wireless-Wi-Fi 6 AX200

LAN

 Gigabit Ethernet

Bluetooth

Bluetooth® 4.1

Bàn phím , Chuột 

Kiểu bàn phím

Bàn phím tiêu chuẩn, có bàn phím số - Đèn nền bàn phím

Chuột

Cảm ứng đa điểm

Giao tiếp mở rộng 

Kết nối USB

2 x USB 3.2 Gen 1 ports with one featuring power-off USB charging
1 x USB Type-C port: USB 3.2 Gen 1 (up to 5 Gbps)
1 x USB 2.0 port
Kết nối HDMI/VGA

1 x HDMI® port with HDCP support

Tai nghe

1 x 3.5 mm headphone/speaker jack, supporting headsets with built-in
microphone

Camera

1280 x 720 resolution

Card mở rộng

-

LOA

2 Loa

Kiểu Pin

48Wh

Sạc pin

Đi kèm

Hệ điều hành (bản quyền) đi kèm 

Windows 11 Home

Kích thước (Dài x Rộng x Cao)

363.4 (W) x 254.5 (D) x 22.9 (H) mm
Trọng Lượng

2.15kg

Màu sắc

Charcoal Black

Xuất Xứ

Trung Quốc', N'8.jpg', 0, 198, 19490000, 19490000, 300, 1, 1, CAST(N'2022-12-05' AS Date), 0.070000000298023224, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (9, N'Acer Gaming Aspire 7(LapTop Gaming)', N'Acer Gaming Aspire 7 A715-43G-R8GA (Ryzen 5-5625U + RTX™ 3050 4GB)', N'THÔNG TIN SẢN PHẨM

Thông số Acer Aspire 7 A715-43G-R8GA

CPU	AMD Ryzen 5-5625U 2.3GHz up to 4.3GHz 16MB

RAM	8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)

Ổ cứng	512GB PCIe® NVMe™ M.2 SSD (1 slot)

Card đồ họa	NVIDIA GeForce RTX 3050 4GB GDDR6

Màn hình	15.6" FHD (1920 x 1080) 144Hz SlimBezel, Acer ComfyView™ IPS LED LCD

Cổng giao tiếp	1 x USB Type-C™ port: USB 3.2 Gen 1 (up to 5 Gbps)

2 x USB 3.2 Gen 1 ports with one featuring power-off USB charging

1x USB 2.0 port

1 x 3.5 mm headphone/speaker jack, supporting headsets with built-in

1x HDMI® port with HDCP support

1x Ethernet (RJ-45) port

1x DC-in jack for AC adapter

FingerPrint

Led-Keyboard	Có

Audio	True Harmony; Dolby® Audio Premium

Đọc thẻ nhớ	None

Chuẩn LAN	Gigabit

Chuẩn WIFI	Wi-Fi 6E (2x2)

Bluetooth	v5.2

Webcam	HD Webcam

Hệ điều hành	Windows 11 Home

Pin	3 Cell 50Whr

Trọng lượng	2.1 kg

Màu sắc	Đen

Kích thước	363.4 x 254.5 x 22.9 (mm)



•	Bảo hành	12 tháng chính hãng

•	Xuất xứ:  Trung Quốc

•	Bảo hành chính hãng 12 tháng tại TTBH của Acer

•	Sản phẩm full box (Sản phẩm+ sạc + hướng dẫn sử dụng )



•	Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.



•	Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá shopee nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.



=================

***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công. 





AnPhatPC - Hơn 18 năm kinh nghiệm phân phối sản phẩm IT.

Cam kết bảo hành 

- Cam kết 100% chính hãng.

- Bảo hành theo chính sách của nhà sản xuất: Tem serial trên sản phẩm + Phiếu bảo hành

- Đổi trả trong vòng 7 ngày: Lỗi nhà sản xuất, hư hỏng trong quá trình vận chuyển, giao sai hoặc thiếu phụ kiện.

- Hotline Chăm sóc Khách hàng: 0902.11.12.13

- Facebook Page: https://www.facebook.com/An-Ph%C3%A1t-Computer-Shopee-112629741455805 

- Youtube : https://www.youtube.com/c/AnPhatComputerpc

Địa chỉ shop : 

1. 49 Thái Hà - Đống Đa - Hà Nội

2. 151 Lê Thanh Nghị - Hai Bà Trưng - Hà Nội

3. 63 Trần Thái Tông - Phường Dịch Vọng - Cầu Giấy - Hà Nội

4. 84T/14 Trần Đình Xu-P.Cô Giang-Q.1-TPHCM

5. 158 - 160 Lý Thường Kiệt P.14 - Q.10 - TPHCM

6. 330-332 Võ Văn Tần, Phường 5, Q.3, TPHCM

================', N'9.jpg', 0, 100, 23990000, 23990000, 200, 1, 1, CAST(N'2022-12-05' AS Date), 0.11, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (10, N'Laptop Asus ROG Strix G15(LapTop Gaming)', N'Laptop Asus ROG Strix G15 G513IH-HN015W/Ryzen 7-4800H/15.6"FHD/8GB/512GB/GTX 1650 4GB', N'Laptop Asus ROG Strix G15 G513IH-HN015W/Ryzen 7-4800H/15.6"FHD/8GB/512GB/GTX 1650 4GB

Tên sản phẩm
Asus ROG Strix G15 G513IH-HN015W
Nhóm thuộc tính
Laptop | Laptop Asus Gaming | Laptop Gaming 
Bộ vi xử lý 
Bộ vi xử lý
AMD Ryzen 7-4800H
Tốc độ
2.9GHz up to 4.2GHz, 8 cores 16 threads
Bộ nhớ đệm
L2 Cache: 4MB
L3 Cache: 8MB
Bộ nhớ trong (RAM)
Dung lượng
8GB DDR4 3200MHz 
Số khe cắm
(2x SO-DIMM slot)
Ổ cứng 
Dung lượng
512GB M.2 NVMe™ PCIe® 3.0 SSD
Tốc độ vòng quay
 
Khe cắm SSD mở rộng
 
Ổ đĩa quang (ODD) 
 
Hiển thị 
Màn hình
15.6 inch FHD (1920 x 1080) IPS, Non-Glare, 144Hz AdaptiveSync, Nanoedge
Độ phân giải
1920 x 1080
Đồ Họa (VGA) 
Card màn hình
NVIDIA Geforce GTX 1650 4GB GDDR6
Kết nối (Network) 
Wireless
Intel Wi-Fi 6(Gig+)(802.11ax)
LAN
 
Bluetooth
BT
Bàn phím , Chuột 
Kiểu bàn phím
Bàn phím tiêu chuẩn - 4-Zone RGB KB
Chuột
Cảm ứng đa điểm
Giao tiếp mở rộng 
Kết nối USB
- 1x Type C USB 3.2 Gen 1 with Power Delivery and Display Port
- 3x USB 3.2 Gen 1 Type-A

Kết nối HDMI/VGA
- 1 x HDMI 2.0b
- Tai nghe
- 1x 3.5mm Combo Audio Jack
Camera

Card mở rộng

LOA: 2 Loa
Kiểu Pin: 4-cell, 56WHrs
Sạc pin: Đi kèm
Hệ điều hành (bản quyền) đi kèm : Windows 11 Home
Kích thước (Dài x Rộng x Cao): 35.4(W) x 25.9(D) x 2.26 ~ 2.72(H) cm
Trọng Lượng: 2.1Kg
Màu sắc: Xám
Xuất xứ: Trung Quốc
Bảo hành: 24 tháng', N'10.jpg', 0, 100, 18690000, 18690000, 300, 1, 4, CAST(N'2022-12-05' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (11, N'Laptop LENOVO Yoga Slim 7 Pro(LapTop Văn phòng)', N'Laptop LENOVO Yoga Slim 7 Pro 14IHU5 i5-11300H|16GB|512GB|Intel Iris Xe|14.0-2.8K|W11', N'Thông số sản phẩm:



Yoga Slim 7 Pro - Hiệu năng cao/mỏng nhẹ - Màn hình 2.8K OLED, Camera IR, Bảo hành 3 năm



CPU: Intel Core i5-11300H (3.1GHz~4.4GHz) 

Card VGA: Intel Iris Xe Graphics 

RAM: 16GB LPDDR4x 

Ổ cứng: 512GB SSD M.2 PCIe Gen 3.0

Màn hình: 14 Inch 2.8K (2880 x 1800) OLED, 16:10, 400Nits

Cổng kết nối:

1 x USB 3.2 Gen1 Type-A

2 x USB-C (USB 4.0/ Thunderbolt 4/ DP/ hỗ trợ PD)

1 x Audio jack

Hỗ trợ Finger 

Pin: 61Wh

Trọng lượng: 1.3 kg

Kích thước: 312.4 x 221.4 x 14.6~16.9mm

---------------------

🛠Thông tin hỗ trợ bảo hành Lenovo🛠

Tổng đài Chăm sóc khách hàng Lenovo được sử dụng trong mọi trường hợp cần hỗ trợ và giải quyết khiếu nại của đại lý/ khách hàng

Hotline: 1800 6318 - +(84)28-73006318 

10.2 Danh sách các Trung tâm bảo hành hiện nay:

Giờ làm việc: Thứ hai – thứ sáu (ngoại trừ Lễ, Tết) 8:00-12:00 sáng, 1:00 – 5:00 chiều

📌Hà Nội 

156 Thái Thịnh, P.Láng Hạ, Q.Đống Đa, Hà Nội sđt  84-24-32757 666 ( ext 108)

📌Hải Phòng 

Tầng 7, tòa nhà CPN, Số 7 lô 2A , Lê hồng Phòng, Hải Phòng sđt 84-225-3722950 (ext 123)

📌Nghệ An 

171-175 Lê Lợi - TP Vinh - Nghệ An  sđt 84-238-3833933

📌Đà Nẵng

 108 Hoàng Hoa Thám, P Thạc Gián, Q Thanh Khê, TP Đà Nẵng sđt 84 -236- 3688 266

📌HCM 

45 Trần Quang Khải, P.Tân Định, Quận 1, HCM sđt 84-28- 3526 8885

📌Cần Thơ 

138 Trần Hưng Đạo, P. An Nghiệp Ward, Q.Ninh Kiều, Cần Thơ 84-292- 376 5576

📌Khánh Hòa

218 Thong Nhat , P.Phương Sai , Nha Trang , Khanh Hoa sđt 84-(258)-3810822

Email: aseanvn@lenovo.com', N'11.jpg', 0, 100, 26690000, 26690000, 300, 2, 5, CAST(N'2022-07-06' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (12, N'Laptop MSI Gaming GF63(LapTop Gaming)', N'Laptop MSI GF63 Thin 11SC-664VN (Core™ i5-11400H + GTX1650 Max Q 4GB)', N'Laptop MSI GF63 Thin 11SC-664VN (Core™ i5-11400H | 8GB | 512GB | GTX1650 Max Q 4GB | 15.6 inch FHD | Win 11 | Đen)

CPU: Intel® Core™ i5-11400H (tối đa 4.50 GHz, 12 MB)
RAM: 8GB(8GBx1) DDR4 3200MHz (2 Khe, tối đa 64GB)
Ổ cứng: 512GB NVMe PCIe SSD
VGA: NVIDIA® GeForce GTX1650 Max Q 4GB GDDR6
Màn hình: 15.6 inch FHD (1920*1080), 144Hz 45%NTSC IPS-LevelPin: 3 cell, 51Whr
Màu sắc: Đen
Tính năng: Đèn nền bàn phím
Cân nặng: 1.86 kg
Phụ kiện : Máy + sạc
Bảo hành : 12 tháng tại TTBH MSI trên toàn quốc (đổi mới 7 ngày đầu) 

=============
***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công. 


AnPhatPC - Hơn 18 năm kinh nghiệm phân phối sản phẩm IT.
Cam kết bảo hành 
- Cam kết 100% chính hãng.
- Bảo hành theo chính sách của nhà sản xuất: Tem serial trên sản phẩm + Phiếu bảo hành
- Đổi trả trong vòng 7 ngày: Lỗi nhà sản xuất, hư hỏng trong quá trình vận chuyển, giao sai hoặc thiếu phụ kiện.
- Hotline Chăm sóc Khách hàng: 0902.11.12.13
- Facebook Page: https://www.facebook.com/An-Ph%C3%A1t-Computer-Shopee-112629741455805 
- Youtube : https://www.youtube.com/c/AnPhatComputerpc
Địa chỉ shop : 
1. 49 Thái Hà - Đống Đa - Hà Nội
2. 151 Lê Thanh Nghị - Hai Bà Trưng - Hà Nội
3. 63 Trần Thái Tông - Phường Dịch Vọng - Cầu Giấy - Hà Nội
4. 84T/14 Trần Đình Xu-P.Cô Giang-Q.1-TPHCM
5. 158 - 160 Lý Thường Kiệt P.14 - Q.10 - TPHCM
6. 330-332 Võ Văn Tần, Phường 5, Q.3, TPHCM

==============', N'12.jpg', 0, 100, 18990000, 18990000, 300, 1, 3, CAST(N'2022-07-06' AS Date), 0.13, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (13, N'Laptop Dell Vostro V3510(LapTop Văn Phòng)', N'Laptop Dell Vostro V3510 i5 1135G7/8GB/512GB/15.6FHD/MX350 2GB/Win 11+Office HS21', N'Dell Vostro 3510 đã được cải tiến rất nhiều về thiết kế so với thế hệ trước, mang tới một chiếc laptop gọn nhẹ, thanh thoát và hiện đại hơn. Phần viền màn hình được làm mỏng hơn, webcam thiết kế nhỏ hơn, nâng cao tính thẩm mỹ, đồng thời cho trải nghiệm xem tuyệt vời. Đặc biệt, laptop vô cùng mỏng nhẹ với trọng lượng chỉ 1,69kg và độ mỏng 18,9mm, kích thước hiếm thấy trên một chiếc laptop màn hình 15,6 inch. Phần sơn màu đen tuyền mạnh mẽ kết hợp cùng kiểu dáng thanh mảnh hiện đại thể hiện đúng tinh thần doanh nhân của dòng Dell Vostro.
Làm việc thoải mái và thuận tiện hơn
Dell Vostro 3510 sở hữu bàn di chuột Touchpad diện tích lớn và bàn phím được thiết kế tràn viền với các phím bấm lớn hơn tới 6,4% so với thế hệ trước, giúp bạn thao tác một cách nhanh chóng, chính xác. Bàn phím chống tràn giảm thiểu nguy cơ bị hỏng ngay cả khi vô tình đổ nước lên.
Hiệu suất đáp ứng công việc cường độ cao
Dell Vostro 3510 sở hữu cấu hình với những linh kiện mới nhất hiện nay, đảm bảo cho bạn sử dụng ổn định trong thời gian dài. Điểm nhấn của laptop đến từ bộ vi xử lý Intel Core i5 1135G7, con chip Intel thế hệ thứ 11 Tiger Lake, sản xuất trên tiến trình 10nm SuperFin tiên tiến, bao gồm 4 nhân 8 luồng cực mạnh, tốc độ tối đa lên tới 4.20GHz.
Hoàn thành các tác vụ đồ họa chuyên nghiệp
Hiển thị rõ ràng và sắc nét
Luôn tràn đầy năng lượng
Dell Mobile Connect, hợp nhất các thiết bị của bạn
Dell Mobile Connect là giải pháp đồng bộ không dây tiện lợi giữa Dell Vostro 3510 và smartphone Android hoặc iOS của bạn. Bạn có thể nhận thông báo, cuộc gọi, tin nhắn ngay trên chiếc laptop của mình mà không cần phải nhìn vào điện thoại. Hơn thế nữa, tính năng phản chiếu hình ảnh cho phép bạn chuyển mọi ảnh, video hay những ứng dụng khác từ màn hình smartphone lên màn hình lớn của laptop.
Kết nối đầy đủ, có cả cổng mạng LAN
Hệ thống bảo mật thông minh
Dell Vostro 3510 sở hữu Trusted Platform Module 2.0 (TPM 2.0). Đây là con chip bảo mật cấp thương mại được cài đặt ngay trên bo mạch chủ, con chip này có trách nhiệm lưu trữ và mã hóa mật khẩu của bạn. Đồng thời TPM 2.0 sẽ kiểm tra lại xem laptop có bị xâm hại hay không trước khi khởi động và bảo vệ phần mềm của bạn trước các cuộc tấn công đến từ phần mềm độc hại bên ngoài.', N'13.jpg', 0, 100, 22990000, 22990000, 300, 2, 8, CAST(N'2022-07-06' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (14, N'Laptop HP Pavilion 15-eg0509TU(LapTop Văn Phòng)', N'Laptop HP Pavilion 15-eg0509TU (46M08PA)/ Core i3/ RAM 4GB/ 512GB SSD/ 15.6 inch', N'➡ CAM KẾT ĐỔI TRẢ HÀNG LỖI
➡ BẢO HÀNH CHÍNH HÃNG 12 THÁNG
➡ TEST KỸ SẢN PHẨM TRƯỚC KHI GIAO
➡ FREESHIP TOÀN QUỐC
----------------------------
SẢN PHẨM ĐƯỢC BẢO HÀNH TOÀN DIỆN TỪ HP VIỆT NAM
- Tổng đài hỗ trợ khách hàng 24/7: 1800588868
- Bảo hành tận nhà miến phí Giao & Nhận (quý khách liên hệ Tổng đài để được tư vấn chi tiết)
- Bảo hành cấp tốc Nhận lại ngày kế tiếp (quý khách liên hệ Tổng đài để được tư vấn chi tiết)
- Bảo hành VIP chỉ 30 phút (quý khách liên hệ tổng đài để được tư vấn chi tiết)
- Địa chỉ TTBH HP toàn quốc : https://support.hp.com/vn-en/document/c02986380
----------------------------
THÔNG SỐ KỸ THUẬT
Hãng sản xuất: HP
Part Number: 46M08PA 
Màu sắc: Gold
Bảo hành: 12 tháng
Bộ vi xử lý: Intel Core i3-1125G4 (up to 3.70 Ghz, 8 MB)
Chipset: Intel
RAM: RAM 4GB DDR4
VGA: Intel UHD Graphics
Ổ cứng: SSD 512GB NVMe PCIe
Màn hình: 15.6 inch FHD (1920x1080) 
Cổng giao tiếp	
HDMI
2 x USB 3.1
USB Type-C
Kết nối mạng: Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac 
 Pin: 3 Cell 41 Whrs
Kích thước: Dài 324 mm - Rộng 225.9 mm - Dày 19.9 mm
Cân nặng: ~1.47 kg
Hệ điều hành: Windows 10 Home SL
----------------------------
🏢 Địa chỉ: BenComputer - Số 7 ngõ 92 Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội
👍 UY TÍN LÀ SỐ 1
👍 BẢO ĐẢM HÀNG CHẤT LƯỢNG, AN TÂM TUYỆT ĐỐI
 ----------------------------', N'14.jpg', 0, 100, 16490000, 16490000, 300, 2, 7, CAST(N'2022-07-06' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (15, N'Laptop Lenovo IdeaPad Slim 3(LapTop Văn Phòng)', N'Laptop Lenovo Ideapad Slim 3 14ITL6 (82H700G1VN) Blue (Cpu i5-1135G7, Ram 4GB + 4GB Onboard DDR4, 512GB SSD,14 inch FHD)', N'Lenovo IDEAPAD  Slim 3 14ITL6 (82H700G1VN) sở hữu ngoại hình đẹp cùng cấu hình mạnh mẽ còn giải quyết gọn gàng những công việc văn phòng, có tính chất đồ họa cao bảo đảm cho công việc của bạn ngay bây giờ và trong tương lai cũng không bị lỗi thời. Lenovo Ideapad Slim 3 14ITL6 (82H700G1VN) là dòng laptop hướng tới đối tượng khách hàng là người dùng phổ thông hoặc các doanh nghiệp.

Đặc điểm sản phẩm Laptop Lenovo Ideapad Slim 3 14ITL6 (82H700G1VN)

Kích thước màn hình 14 inch với độ phân giải FHD (1920 x 1080) giúp chất lượng ảnh sắc nét vượt trội và vô cùng chi tiết. Viền được thu hẹp tối đa chỉ 4,9mm ở chiều ngang trái và phải cho sự tập trung ánh nhìn của bạn được tối đa, không bị phân tâm, giúp mặt được thư giãn trong khi làm việc với tần suất cao, hạn chế tình trạng nhức mỏi mắt.

Laptop Lenovo Ideapad Slim 3 14ITL6 (82H700G1VN) trang bị chip xử lý Intel Core i5-1135G7 (upto 4.20GHz, 8MB). Máy có thể thực hiện tốt các nhu cầu cơ bản, đơn giản của người dùng. RAM 8GB, ổ cứng 512GB SSD mang lại khả năng giúp bạn có thể xử lý đa nhiệm tốt và nhanh hơn. Ngoài ra, chơi game không thành ván đề với đồ họa tích hợp Intel Iris Xe Graphics 

Hệ thống bàn phím đơn giản, tối ưu để hỗ trợ người dùng thao tác chuẩn xác và nhanh chóng, tiện lợi tránh tính trạng người dùng gõ nhầm. Các phím với màu xám được làm vòm hơi lõm ở giữa giúp ôm đầu ngón tay, nâng cao độ nảy của bàn phím giúp bạn gõ văn bản hàng giờ mà không cảm thấy mỏi tay. Touchpad được thiết kế rộng và sử dụng trackpad của Microsoft Precision với hai phím chuột được làm chìm càng mở rộng diện tích cho Touchpad, cảm ứng đa điểm giúp các thao tác cuộn, trượt, di trở nên chính xác và nhanh hơn.

Máy tính có đa dạng cổng, khe cắm giúp bạn sử dụng dễ dàng.được trang bị những chuẩn kết nối thông dụng như cổng USB 3.0, USB 3.1, HDMI, … cho phép kết nối máy với nhiều thiết bị ngoại vi dễ dàng hơn.

Ở Mega, có rất nhiều mẫu mã Laptop đa dạng theo nhiều phân khúc khác nhau. Bạn có thể lựa chọn Mega làm địa chỉ uy tín để mua Laptop tại Đà Nẵng', N'15.jpg', 0, 100, 14350000, 14350000, 300, 2, 5, CAST(N'2022-07-06' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (16, N'Laptop HP 15s-fq5080TU(LapTop Văn Phòng)', N'[Mã ELMALL4 giảm 4% đơn 500K] Laptop HP 15s-fq5080TU 6K7A0PA i5-1235U| 8GB| 256GB| OB| 15.6"FHD| Win11', N'[Mã ELMALL4 giảm 4% đơn 500K] Laptop HP 15s-fq5080TU 6K7A0PA i5-1235U| 8GB| 256GB| OB| 15.6"FHD| Win11', N'16.jpg', 0, 100, 16200000, 16200000, 300, 2, 7, CAST(N'2022-05-04' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (17, N'Laptop Asus Vivobook(LapTop Văn Phòng)', N'Laptop Asus Vivobook A415EA-EB1474W i5-1135G7/Black/14.0FHD/8G RAM/512G SSD/Win11
', N'Laptop Asus A415EA-EB1474W i5-1135G7/Black/14.0FHD/\8G RAM/512G SSD/Win 11

CPU
Intel Core i5-1135G7 0.9GHz up to 4.2GHz 8MB

RAM
8GB DDR4 3200MHz Onboard

Ổ cứng
512GB SSD M.2 PCIE G3X4 (Còn trống 1 khe SSD M.2 PCIE)

Card đồ họa
Intel Iris Xe Graphics 

Màn hình
14" FHD (1920 x 1080), IPS, Anti-Glare with 45% NTSC, NanoEdge

Cổng giao tiếp
1 x Type-A USB 3.2 Gen 1
1 x Type-C USB 3.2
2 x USB 2.0 port(s)
1 x HDMI 1.4

Audio
Harman Kardon
Đọc thẻ nhớ
Multi-format card reader (SD/SDHC)
Chuẩn LAN
None
Chuẩn WIFI
802.11 AX (2x2)

Bluetooth
v5.0
Webcam
HD Web Camera

Hệ điều hành
Windows 11 Home

Pin
3 Cells 42WHrs

Trọng lượng
1.4 kg

Màu sắc
Đen

Kích thước
324 x 215 x 17.9 mm

Bảo hành
24 tháng', N'17.jpg', 0, 100, 16790000, 16790000, 300, 3, 4, CAST(N'2022-05-04' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (18, N'Laptop ASUS Vivobook(LapTop Văn Phòng)', N'Laptop ASUS Vivobook X415EA-EK675W I3-1115G4| 4GB| 256GB| OB| 14″FHD| Win11', N'BẢO HÀNH : 24 Tháng Bảo Hành Chính Hãng Tại TTBH Asus Trên Toàn Cầu
(Đổi mới trong vòng 7 ngày theo tiêu chuẩn nhà sản xuất)

✨  Thông số kỹ thuật
CPU Intel Core i3-1115G4 (1.7Ghz up to 4.1GHz, 2 nhân 4 luồng, 6MB)
RAM 4GB Onboard DDR4 2666MHz (1 KHE CẮM , UP TO 12GB)
Ổ cứng SSD 256GB M.2 PCIE (1 x 2.5″ SATA)
Card đồ họa Intel UHD Graphics
Màn hình 14″FULL HD 1920×1080 (16:9) màn hình chống chói Anti-glare display, LED Backlit, 220nits, 60Hz, NTSC: 45%, không cảm ứng
Hệ điều hành : Win 11 home bản quyền
Lan	none
Wifi	802.11AC (2×2)
Bluetooth	V4.1
Màu sắc	Bạc
Audio	SonicMaster
Tính năng khác	VGA Web Camera, Trang bị bảo mật vân tay, Không đèn bàn phím
Cổng kết nối	1x USB 3.2,1x USB 3.2 Gen 1 Type-C,2x USB 2.0,1x HDMI 1.4,1x 3.5mm Combo Audio Jack
Pin	Lithium-ion 2 Cells 37WHrs
Kích thước	32x22x1.99 cm
Trọng lượng	1.5kg
Chất liệu	Nhựa cứng
Năm ra mắt	2021
Bộ sản phẩm bao gồm : Laptop , Thùng , Cáp sạc, Sách hướng dẫn sử dụng

✨ Mô tả sản phẩm
Laptop Asus Vivobook X415EA-EK675W - Khả năng di chuyển dễ dàng, hiệu năng mượt mà
Là một người thường di chuyển mỗi ngày, một chiếc laptop gọn nhẹ với hiệu suất ổn định sẽ vô cùng phù hợp với bạn. Nếu đang muốn thay thế hoặc tìm mua một chiếc laptop mới, hãy chọn laptop Asus Vivobook X415EA-EK675W. Với thiết kế nhỏ gọn, hiệu năng mượt mà, máy sẽ đáp ứng mọi nhu cầu sử dụng cơ bản hàng ngày của bạn nhanh chóng và hiệu quả.

Hiệu năng nhanh chóng và hiệu quả với bộ xử lý Intel Core i3
Với bộ xử lý Intel Core i3 và 4GB RAM, Asus Vivobook X415EA-EK675W có thể giúp bạn hoàn thành công việc một cách nhanh chóng và hiệu quả hơn với khả năng tải nhanh và xử lý đa nhiệm mượt mà. Đồng thời, máy còn có card đồ họa Intel UHD Graphics giúp bạn thoải mái thực hiện các công việc thiết kế đồ họa hoặc chỉnh sửa ảnh đơn giản trên Photoshop, Lightroom.
Ổ cứng SSD PCIe sẽ cung cấp cho bạn không gian lưu trữ nhiều hơn, làm được nhiều hơn. Kết hợp với thiết kế lưu trữ kép, máy mang lại cho bạn hiệu suất dữ liệu nhanh hơn và dung lượng lưu trữ lớn.

Thiết kế năng động, màn hình 14” FHD viền mỏng
Với trọng lượng tổng thể chỉ 1,6 kg, Vivobook X415EA-EK675W có tính di động cao. Nó đúng nghĩa là một chiếc laptop nhẹ và bắt kịp nhịp sống nhanh của bạn mỗi ngày. Và nó cũng trông thật đẹp với lớp hoàn thiện bạc sang trọng.

Màn hình NanoEdge 14 inch FHD mang đến cho ASUS X415 một diện tích màn hình rộng lớn để cho bạn trải nghiệm xem đắm chìm hơn đối với công việc lẫn giải trí. Màn hình FHD góc nhìn rộng của máy có lớp phủ chống chói giúp giảm bớt ánh sáng chói và phản xạ khó chịu không mong muốn, vì vậy bạn có thể tập trung hoàn toàn vào những gì hiển thị trước mắt.

★★★★★★★★★★★★★★★★★★★
♛♛♛ CHẾ ĐỘ BẢO HÀNH:
Sản phẩm được bảo hành chính hãng tại TTBH Asus trên toàn cầu trong vòng 24 tháng (Hổ trợ giao-nhận bảo hành trên toàn quốc) và được đổi trả trong vòng 7 ngày từ khi nhận hàng nếu có lỗi từ nhà sản xuất.
☎ 𝑯𝑶𝑻𝑳𝑰𝑵𝑬 kĩ thuật: 028 3836 6801 (line 0)
☎ 𝑯𝑶𝑻𝑳𝑰𝑵𝑬 hỗ trợ kỹ thuật Asus miễn phí 24/7: 1800-6588', N'18.jpg', 0, 100, 16500000, 16500000, 300, 3, 4, CAST(N'2022-05-04' AS Date), 0.5, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (19, N'Laptop ASUS VivoBook(LapTop Văn Phòng)', N'Laptop ASUS VivoBook 15X OLED A1503ZA-L1421W i5-12500H | 8GB | 512GB| 15.6'' FHD OLED', N'THÔNG TIN SẢN PHẨM

Thông số ASUS VivoBook 15X OLED A1503ZA-L1421W

•	CPU	Intel Core i5-12500H 2.5GHz up to 4.5GHz 18MB

•	RAM	8GB Onboard DDR4 3200MHz (1x SO-DIMM socket, up to 16GB SDRAM)

•	Ổ cứng	512GB M.2 NVMe™ PCIe® 3.0 SSD (1 slot, support M.2 2280 PCIe 4.0x4)

•	Card đồ họa	Intel® Iris Xe Graphics

•	Màn hình	15.6" FHD (1920 x 1080) OLED 16:9 aspect ratio, 0.2ms response time, 600nits peak brightness, 100% DCI-P3 color gamut, Contrast ratio: 1,000,000:1, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, PANTONE Validated, Glossy display, 70% less harmful blue light, SGS Eye Care Display, Screen-to-body ratio: 86%

•	Cổng giao tiếp	1x USB 3.2 Gen 1 Type-C

•	2x USB 3.2 Gen 1 Type-A

•	1x USB 2.0 Type-A

•	1x HDMI 1.4

•	1x 3.5mm Combo Audio Jack

•	1x DC-in

•	Finger Print

•	Led-Keyboard	Backlit Chiclet Keyboard

•	Audio	SonicMaster

•	Đọc thẻ nhớ	None

•	Chuẩn LAN	None

•	Chuẩn WIFI	Wi-Fi 6(802.11ax) (2x2)

•	Bluetooth	v5.1

•	Webcam	720p HD camera With privacy shutter

•	Hệ điều hành	Windows 11 Home

•	Pin	3 Cells 70WHrs

•	Trọng lượng	1.7 kg

•	Màu sắc	Transparent Silver

•	Kích thước	35.68 x 22.76 x 1.99 cm



• Bảo hành 24 tháng chính hãng

• Xuất xứ: Trung Quốc

• Bảo hành chính hãng 24 tháng tại TTBH của Asus

• Sản phẩm full box (Sản phẩm+ cáp + hướng dẫn sử dụng )



• Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.



• Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.



•Sản phẩm được phân phối bởi : CHI NHÁNH CÔNG TY CỔ PHẦN THẾ GIỚI SỐ



***Trong quá trình sử dụng nếu cần hỗ trợ về kỹ thuật hãy đến các chi nhánh sau.

396 - 398 Nguyễn Kiệm, P. 3, Q. Phú Nhuận, HCM

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)



55 Chu Mạnh Trinh, P. Bình Thọ, Q. Thủ Đức, HCM

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 (9:00 – 18:00)



184/41 Nguyễn Xí, Phường 26, Q. Bình Thạnh, HCM

☞ Thứ 2 – Thứ 6 (8:30 – 17:30)

☞ Thứ 7 (8:30 – 12:30)



204 Nguyễn Văn Tuyết, Trung Liệt, Đống Đa, Hà Nội

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)



❖ Thời gian bảo hành

☞ Thứ 2 – Thứ 6 (8:30 – 17:30)

☞ Thứ 7 (8:30 – 12:00)', N'19.jpg', 0, 100, 19990000, 19990000, 300, 3, 4, CAST(N'2022-05-04' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (20, N'Laptop HP Pavilion (LapTop Văn Phòng)', N'Laptop HP Pavilion 15-eg2058TU (6K788PA) (i5-1240P | 8GB | 256GB | 15.6'' FHD | Win 11)', N'THÔNG TIN SẢN PHẨM

Thông số HP Pavilion 15-eg2058TU (6K788PA)

CPU	Intel Core i5-1240P 1.7GHz up to 4.4GHz 12MB

RAM	8GB (4x2) DDR4 3200MHz (2x SO-DIMM socket, up to 16GB SDRAM)

Ổ cứng	256 GB PCIe® NVMe™ M.2 SSD

Card đồ họa	Intel® Iris® Xᵉ Graphics

Màn hình	15.6" FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC

Cổng giao tiếp	1x SuperSpeed USB Type-C® 10Gbps signaling rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge)

2x SuperSpeed USB Type-A 5Gbps signaling rate

1x HDMI 2.1

1x AC smart pin

1x headphone/microphone combo

Led-Keyboard	None

Audio	B&O, Dual Speakers, HP Audio Boost

Đọc thẻ nhớ	None

Chuẩn LAN	None

Chuẩn WIFI	MediaTek Wi-Fi 6 MT7921 (2x2)

Bluetooth	v5.2

Webcam	HP Wide Vision 720p HD camera with temporal noise reduction and integrated dual array digital microphones

Hệ điều hành	Windows 11 Home

Pin	3 Cell 41WHr

Trọng lượng	1.74 kg

Màu sắc	Warm gold

Kích thước	36.02 x 23.4 x 1.79 cm







•	Bảo hành	12 tháng chính hãng

•	Xuất xứ:  Trung Quốc

•	Bảo hành chính hãng 12 tháng tại TTBH của HP

•	Sản phẩm full box (Sản phẩm+ sạc + hướng dẫn sử dụng )



•	Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.



•	Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá shopee nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.



•Sản phẩm được phân phối bởi  : 	CÔNG TY CỔ PHẦN THẾ GIỚI SỐ

***Trong quá trình sử dụng nếu cần hỗ trợ về kỹ thuật hãy đến các chi nhánh sau.

396 - 398 Nguyễn Kiệm, P. 3, Q. Phú Nhuận, HCM

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)



55 Chu Mạnh Trinh, P. Bình Thọ, Q. Thủ Đức, HCM

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 (9:00 – 18:00)



184/41 Nguyễn Xí, Phường 26, Q. Bình Thạnh, HCM

☞ Thứ 2 – Thứ 6 (8:30 – 17:30)

☞ Thứ 7 (8:30 – 12:30)



204 Nguyễn Văn Tuyết, Trung Liệt, Đống Đa, Hà Nội

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)



❖ Thời gian bảo hành

☞ Thứ 2 – Thứ 6 (8:30 – 17:30)

☞ Thứ 7 (8:30 – 12:00)

', N'20.jpg', 0, 100, 17990000, 18990000, 300, 3, 7, CAST(N'2022-05-04' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (21, N'LapTop Lenovo IdeaPad Slim 5(LapTop Văn Phòng)', N'LapTop Lenovo IdeaPad Slim 5', N'THÔNG SỐ KỸ THUẬT
CPU	11th Generation Intel® Tiger Lake Core™ i5 _ 1135G7 Processor (2.40 GHz, 8M Cache, Up to 4.20 GHz)
Memory	8GB DDr4 Bus 3200Mhz Onboard
Hard Disk	512GB PCIe® NVMe™ M.2 SSD (Support x 1 Slot HDD/ SSD 2.5")
VGA	Integrated Intel® Iris® Xe Graphics
Display	15.6 inch Full HD IPS (1920 x 1080) 250 Nits Anti Glare LED Backlit Display
Other	Speakers with Dolby Audio™, USB 3.2 Gen 1 Type A (Always On), USB 3.2 Gen 1 Type C (Support Data Transfer, Power Delivery 3.0 and DisplayPort™ 1.2), HDMI 1.4b, SD Card Reader, Headphone / Microphone Combo Jack, Firmware TPM 2.0, FingerPrint Reader, Keyboard White Backlit, Webcam HD 720p ThinkShutter Camera Cover
Wireless	802.11ac + Bluetooth 5.0, 2.4 GHz
Battery	3 Cells 45 Whrs Battery
Weight	1,70 Kg
SoftWare	Windows 10 Home SL 64bit
Xuất xứ	Brand New 100%, Hàng Phân Phối Chính Hãng Tại Việt Nam, Bảo Hành Chính Hãng
Màu sắc	Abyss Blue (Xanh)
-------------------------------------------------------------------------------------------------------------------------------
MÔ TẢ TÍNH NĂNG
Laptop LENOVO IdeaPad 5 mang thiết kế cơ bản của dòng Lenovo IdeaPad 5, với tông màu xanh sang trọng, tinh tế. Kích thước nhỏ gọn cùng trọng lượng nhẹ, phù hợp với người dùng cần đem theo laptop thường xuyên.

Màn hình 15.6 inch Full HD IPS (1920 x 1080) hiển thị, văn bản và hình ảnh sắc nét, sống động. Thiết kế viền màn hình mỏng hợp với xu hướng hiện nay, tăng không gian nhìn trong tổng thể máy vẫn nhỏ gọn.

Trang bị bộ vi xử lý Intel Core i5 thế hệ 11 chạy mượt ứng dụng văn phòng hay lướt web, xem phim,... RAM 8GB có khả năng đa nhiệm nhanh, không giật lắc cho dù bạn mở nhiều ứng dụng. Với ổ cứng SSD 512 GB giúp lưu trữ thoải mái nhiều tựa phim, game hay tài liệu,... mà không lo hết bộ nhớ. 

Bàn phím có kích thước lớn, độ nảy tốt sẽ giúp bạn gõ phím êm ái, chính xác hơn. Hàng phím số được thiết kế riêng biệt phù hợp cho người thường xuyên nhập số liệu.', N'21.jpg', 0, 100, 15000000, 17000000, 300, 2, 5, CAST(N'2022-06-22' AS Date), 0.15, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (22, N'Lenovo Ideapad 3(LapTop Văn Phòng)
', N'Lenovo Ideapad 3 15ITL05|81X800KRVN|15.6"HD|i3|1115G4|8GBDDR4|SSD256GB|Win11', N'📌 Thông số kỹ thuật:

Bộ xử lý: Intel Core i3-1115G4 (2C / 4T, 3.0 / 4.1GHz, 6MB)

Đồ họa: Intel UHD tích hợp

Chipset: Intel SoC Platform

Ram: 4GB DDR4-2666 được hàn + 4GB SO-DIMM DDR4-2666

Ổ cứng: 256GB SSD M.2 2242 PCIe 3.0x4 NVMe

Camera: 720p with Privacy Shutter

Pin: Integrated 35Wh

Cân nặng: 1.7 kg

Màn hình: 15.6" HD (1366x768) TN 220nits Anti-glare

Kích thước: 362.2 x 253.4 x 19.9 mm (14.26 x 9.98 x 0.78 inches)

Màu sắc : Xám

🛠Thông tin hỗ trợ bảo hành Lenovo🛠

Tổng đài Chăm sóc khách hàng Lenovo được sử dụng trong mọi trường hợp cần hỗ trợ và giải quyết khiếu nại của đại lý/ khách hàng

Hotline: 1800 6318 - +(84)28-73006318 

10.2 Danh sách các Trung tâm bảo hành hiện nay:

Giờ làm việc: Thứ hai – thứ sáu (ngoại trừ Lễ, Tết) 8:00-12:00 sáng, 1:00 – 5:00 chiều

📌Hà Nội 

156 Thái Thịnh, P.Láng Hạ, Q.Đống Đa, Hà Nội sđt  84-24-32757 666 ( ext 108)

📌Hải Phòng 

Tầng 7, tòa nhà CPN, Số 7 lô 2A , Lê hồng Phòng, Hải Phòng sđt 84-225-3722950 (ext 123)

📌Nghệ An 

171-175 Lê Lợi - TP Vinh - Nghệ An  sđt 84-238-3833933

📌Đà Nẵng

 108 Hoàng Hoa Thám, P Thạc Gián, Q Thanh Khê, TP Đà Nẵng sđt 84 -236- 3688 266

📌HCM 

45 Trần Quang Khải, P.Tân Định, Quận 1, HCM sđt 84-28- 3526 8885

📌Cần Thơ 

138 Trần Hưng Đạo, P. An Nghiệp Ward, Q.Ninh Kiều, Cần Thơ 84-292- 376 5576

📌Khánh Hòa

218 Thong Nhat , P.Phương Sai , Nha Trang , Khanh Hoa sđt 84-(258)-3810822

Email: aseanvn@lenovo.com .

---------------------------------------------------

💪💪💪CHÚNG TÔI LÀ GIAN HÀNG CHÍNH HÃNG CỦA LENOVO TẠI SHOPEE VIỆT NAM💪💪💪', N'22.jpg', 0, 100, 14000000, 15000000, 300, 2, 5, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (23, N'Laptop Lenovo IdeaPad 5 Pro(LapTop Văn Phòng)', N'Laptop Lenovo IdeaPad 5 Pro 14ARH7 (82SJ0026VN) (R5-6600HS | 16GB | 512GB | AMD Radeon 660M Graphics | 14'' 2.8K 90Hz)', N'THÔNG TIN SẢN PHẨM

Thông số Lenovo IdeaPad 5 Pro 14ARH7 (82SJ0026VN)

•	CPU	AMD Ryzen 5 6600HS 3.3GHz up to 4.5GHz 16MB

•	RAM	16GB (8x2) LPDDR5 6400MHz Onboard

•	Ổ cứng	512GB SSD M.2 2242 PCIe 4.0x4 NVMe (1 slot)

•	Card đồ họa	AMD Radeon 660M Graphics

•	Màn hình	14" 2.8K (2880x1800) IPS 400nits Anti-glare, 90Hz, 100% sRGB, TÜV Low Blue Light, Eyesafe

•	Cổng giao tiếp	2x USB-C 3.2 Gen 1 (support data transfer, Power Delivery 3.0, and DisplayPort 1.4)

•	2x USB 3.2 Gen 1 (One Always On)

•	1x HDMI 2.0

•	1x headphone / microphone combo jack (3.5mm)

•	Led Keyboard	Có

•	Audio	Stereo speakers, 2W x2, optimized with Dolby Atmos

•	Đọc thẻ nhớ	4-in-1 Card Reader

•	Chuẩn LAN	None

•	Chuẩn WIFI	802.11AX (2x2)

•	Bluetooth	v5.1

•	Webcam	ToF, FHD 1080p & IR

•	Hệ điều hành	Windows 11 Home

•	Pin	3 Cells 56.5WHrs

•	Trọng lượng	1.41 kg

•	Màu sắc	Cloud Grey Aluminium

•	Kích thước	312.2 x 221 x 15.9 mm



• Bảo hành 36 tháng chính hãng

• Xuất xứ: Trung Quốc

• Bảo hành chính hãng 36 tháng tại TTBH của Lenovo

• Sản phẩm full box (Sản phẩm+ sạc + hướng dẫn sử dụng )



• Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.



• Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.



•Sản phẩm được phân phối bởi : 

***Trong quá trình sử dụng nếu cần hỗ trợ về kỹ thuật hãy đến các chi nhánh sau.

396 - 398 Nguyễn Kiệm, P. 3, Q. Phú Nhuận, HCM

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)



55 Chu Mạnh Trinh, P. Bình Thọ, Q. Thủ Đức, HCM

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 (9:00 – 18:00)



184/41 Nguyễn Xí, Phường 26, Q. Bình Thạnh, HCM

☞ Thứ 2 – Thứ 6 (8:30 – 17:30)

☞ Thứ 7 (8:30 – 12:30)



204 Nguyễn Văn Tuyết, Trung Liệt, Đống Đa, Hà Nội

☞ Thứ 2 – Thứ 6 (9:00 – 20:00)

☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)



❖ Thời gian bảo hành

☞ Thứ 2 – Thứ 6 (8:30 – 17:30)

☞ Thứ 7 (8:30 – 12:00)', N'23.jpg', 0, 100, 22990000, 22990000, 300, 4, 5, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (24, N'Laptop Asus Vivobook Pro(LapTop Văn Phòng)', N'Laptop Asus Vivobook Pro 14 OLED M3401QA-KM025W (Ryzen™ 7-5800H + 14.0-inch 2.8K )', N'Laptop Asus Vivobook Pro 14 OLED M3401QA-KM025T (Ryzen™ 7-5800H | 8GB | 512GB | AMD Radeon | 14.0-inch 2.8K | Win 11



CPU: AMD Ryzen™ 7-5800H (3.2GHz Up to 4.4GHz, 16MB)

RAM: 8GB DDR4 on board

Ổ cứng: 512GB M.2 NVMe™ PCIe® 3.0 SSD

VGA: AMD Radeon™ Graphics

Màn hình: 14.0-inch 2.8K (2880 x 1800) - 16:10, 90 Hz, OLED, 100% DCI-P3

Pin: 3-cell, 63WHrs Li-ion

Cân nặng: 1.40 kg

Tính năng: Đèn nền bàn phím

Màu sắc: Bạc

OS: Windows 11 Home

Bảo hành : 24 tháng



==============

***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công. 





AnPhatPC - Hơn 18 năm kinh nghiệm phân phối sản phẩm IT.

Cam kết bảo hành 

- Cam kết 100% chính hãng.

- Bảo hành theo chính sách của nhà sản xuất: Tem serial trên sản phẩm + Phiếu bảo hành

- Đổi trả trong vòng 7 ngày: Lỗi nhà sản xuất, hư hỏng trong quá trình vận chuyển, giao sai hoặc thiếu phụ kiện.

- Hotline Chăm sóc Khách hàng: 0902.11.12.13

- Facebook Page: https://www.facebook.com/An-Ph%C3%A1t-Computer-Shopee-112629741455805 

- Youtube : https://www.youtube.com/c/AnPhatComputerpc

Địa chỉ shop : 

1. 49 Thái Hà - Đống Đa - Hà Nội

2. 151 Lê Thanh Nghị - Hai Bà Trưng - Hà Nội

3. 63 Trần Thái Tông - Phường Dịch Vọng - Cầu Giấy - Hà Nội

4. 84T/14 Trần Đình Xu-P.Cô Giang-Q.1-TPHCM

5. 158 - 160 Lý Thường Kiệt P.14 - Q.10 - TPHCM

6. 330-332 Võ Văn Tần, Phường 5, Q.3, TPHCM

', N'24.jpg', 0, 100, 22990000, 22990000, 400, 5, 4, CAST(N'2022-06-22' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (25, N'Apple Macbook (macbook,laptop văn phòng)', N'Apple Macbook Pro (2022) M2 chip, 13.3 inches, 8GB, 256GB SSD', N'Apple Macbook Pro (2022) M2 chip, 13.3 inches, 8GB, 256GB SSD
(SVL : màu Silver; SPG: màu Space Gray)

Bộ xử lý
Hãng CPU: Apple
Công nghệ CPU: M2
 Loại CPU: 8 - Core
Tốc độ CPU: 2.40 GHz

RAM
Dung lượng RAM: 8 GB
Loại RAM: LPDDR4
Tốc độ RAM: 3200 MHz
Số khe cắm rời: 0
Số khe RAM còn lại: 0
Số RAM onboard: 1
Hỗ trợ RAM tối đa: 8 GB

Màn hình
 Kích thước màn hình: 13.3 inches
Công nghệ màn hình: Retina
Độ phân giải: 2560 x 1600 Pixels
Loại màn hình: LED
Độ sáng: 500 nits
Màn hình cảm ứng: Không

Đồ họa
Card onboard
Hãng: Apple
Model GPU: 10 nhân

Lưu trữ	
Loại SSD: M2. PCIe
Dung lượng: 256 GB

Bảo mật
Mở khóa vân tay
Mật khẩu

Giao tiếp & kết nối
Cổng giao tiếp	
1 Jack 3.5 mm
2 Type C

Wifi: 802.11 ax
Bluetooth: v5.0
Webcam: HD Webcam (720p Webcam)

Âm thanh
Số lượng loa: 2
Công nghệ âm thanh: Stereo speakers with high dynamic range

Bàn phím & TouchPad
Kiểu bàn phím: English International Backlit Keyboard
Bàn phím số: Không
Đèn bàn phím: LED
Công nghệ đèn bàn phím: Đơn sắc
Màu đèn LED: Trắng
TouchPad: Multi-touch touchpad

Thông tin pin & Sạc
Loại PIN: Lithium polymer
Power Supply: 67 W
Dung lượng pin: 20 Giờ

Hệ điều hành
OS: macOS
Version: macOS 12

Thông tin bảo hành:
Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.
Kích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/

Hướng dẫn kiểm tra địa điểm bảo hành gần nhất:
Bước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN 
Bước 2: Chọn sản phẩm.
Bước 3: Điền Apple ID, nhập mật khẩu.
Sau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.', N'25.jpg', 0, 100, 30000000, 31000000, 400, 5, 9, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (26, N'Apple MacBook Air 13', N'Apple MacBook Air 13" 2020 (M1/8GB/256GB)', N'MacBook Air (M1, 2020)



MÔ TẢ SẢN PHẨM

MacBook Air là máy tính xách tay mỏng và nhẹ nhất của Apple – nay thay đổi ngoạn mục với chip Apple M1 mạnh mẽ. 

Tạo ra một cú nhảy vọt về hiệu năng CPU và đồ họa, cùng thời lượng pin lên đến 18 giờ.



Tính năng nổi bật

• Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU

• Tăng thời gian sử dụng với thời lượng pin lên đến 18 giờ1

• CPU 8 lõi cho tốc độ nhanh hơn đến 3.5x, xử lý công việc nhanh chóng hơn bao giờ hết 2

• GPU lên đến 8 lõi với tốc độ xử lý đồ họa nhanh hơn đến 5x cho các ứng dụng và game đồ họa khủng2

• Neural Engine 16 lõi cho công nghệ máy học hiện đại

• Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy

• Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc

• Thiết kế không quạt giảm tối đa tiếng ồn khi sử dụng

• Màn hình Retina 13.3 inch với dải màu rộng P3 cho hình ảnh sống động và chi tiết ấn tượng3

• Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn

• Bộ ba micro phối hợp tập trung thu giọng nói của bạn, không thu tạp âm môi trường

• Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn

• Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện

• Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn

• macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages

và Maps

• Hiện có màu vàng kim, xám bạc và bạc



Bộ sản phẩm bao gồm

1. MacBook

2. Dây sạc

3. Củ sạc 30W

4. HDSD bảo hành điện tử 12 tháng



Pháp lý

Hiện có sẵn các lựa chọn để nâng cấp.

1. Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin.

2. So với thế hệ máy trước.

3. Kích thước màn hình tính theo đường chéo.

', N'26.jpg', 0, 100, 23490000, 23490000, 400, 5, 9, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (27, N'Apple MacBook Pro (2020)', N'Apple MacBook Air 13" 2020 Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD', N'Chip Apple M1 định nghĩa lại MacBook Pro 13 inch. Sở hữu CPU 8 lõi xử lý siêu tốc các luồng công việc phức tạp về hình ảnh, mã hóa, biên tập video cùng nhiều việc khác. GPU 8 lõi siêu mạnh xử lý gọn các tác vụ đồ họa khủng và chạy game siêu mượt. Neural Engine 16 lõi tiên tiến tăng cường sức mạnh công nghệ máy học tích hợp trong các ứng dụng yêu thích của bạn. Bộ nhớ thống nhất siêu nhanh cho mọi hoạt động mượt mà. Và thời lượng pin dài nhất từng có trên máy Mac, lên đến 20 giờ. (2) Đây chính là chiếc máy tính xách tay chuyên nghiệp thịnh hành nhất của Apple. Hiệu năng cao hơn hẳn, pro hơn hẳn. 

Tính năng nổi bật 
•        Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU 
•        Làm được nhiều việc hơn với thời lượng pin lên đến 20 giờ, thời lượng pin lâu nhất trong các dòng máy tính Mac từ trước đến nay (2) 
•        CPU 8 lõi cho hiệu năng nhanh hơn đến 2.8x, xử lý các luồng công việc nhanh hơn bao giờ hết (1) 
•        GPU 8 lõi với tốc độ xử lý đồ họa nhanh gấp 5x cho các ứng dụng và game có đồ họa khủng (1) 
•        Neural Engine 16 lõi cho công nghệ máy học hiện đại 
•        Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy 
•        Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc 
•        Hệ thống tản nhiệt chủ động mang lại hiệu năng tuyệt vời 
•        Màn hình Retina với độ sáng 500 nit cho màu sắc sống động và chi tiết ấn tượng (3) 
•        Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn 
•        Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn 
•        Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn 
•        Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện 
•        Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn 
•        macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps 
•        Hiện có màu xám bạc và bạc  

Pháp lý 
Hiện có sẵn các lựa chọn để nâng cấp. 
(1) So với thế hệ máy trước. 
(2) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. 
(3) Kích thước màn hình tính theo đường chéo.

Thông tin bảo hành:
Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.
Kích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/

Hướng dẫn kiểm tra địa điểm bảo hành gần nhất:
Bước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN 
Bước 2: Chọn sản phẩm.
Bước 3: Điền Apple ID, nhập mật khẩu.
Sau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.
Silver: MYDC2SA/A
Space Gray: MYD92SA/A', N'27.png', 0, 100, 35500000, 36500000, 300, 4, 9, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (28, N'Apple Macbook Air (2022)', N'Apple Macbook Air (2022) M2 chip, 13.6 inches, 8GB, 256GB SSD', N'Apple Macbook Air (2022) M2 chip  (năm SX 2022), 13.6 inches, 8GB, 256GB SSD
SPG (Space Gray), STL (Starlight), MDN (Midnight). 
Bộ xử lý
Hãng CPU: Apple
Công nghệ CPU: M2
Loại CPU: 8 - Core
Tốc độ CPU: 100GB/s memory bandwidth

RAM & Ổ cứng
Dung lượng RAM: 8 GB
Dung lượng ổ cứng: 256GB SSD

Màn hình
Kích thước màn hình: 13.6 inches
Công nghệ màn hình: Liquid Retina, True Tone Technology, Wide color (P3)
Độ phân giải: 2560 x 1664 Pixels
Loại màn hình: LED
Độ sáng: 500 nits
Colors: 1 triệu màu

Đồ họa
Card onboard
Hãng: Apple
Model GPU: 8 - Core

Bảo mật
Mở khóa vân tay
Mật khẩu

Giao tiếp & kết nối
Cổng giao tiếp	
2 x Thunderbolt 3/USB 4
1 x Jack tai nghe 3.5 mm
1 x MagSafe 3

Wifi: 802.11ax
Bluetooth: v5.0
Webcam: 1080p FaceTime HD camera

 m thanh
Số lượng loa: 4
Số lượng microphones: 3
Công nghệ âm thanh: Spatial Audio, Dolby Atmos

Bàn phím & TouchPad
Kiểu bàn phím: Backlit Magic Keyboard
Bàn phím số: Không
Đèn bàn phím: Có
Touch ID: Có
TouchPad: Multi-touch touchpad

Thông tin pin & Sạc
Loại PIN: Lithium polymer
Nguồn vào: 30W USB-C Power Adapter 
Dung lượng pin: 
- Lên tới 18 giờ Apple TV app movie playback
- Lên tới 15 giờ wireless web

Hệ điều hành
OS: macOS

Thông tin bảo hành:
Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.
Kích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/

Hướng dẫn kiểm tra địa điểm bảo hành gần nhất:
Bước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN 
Bước 2: Chọn sản phẩm.
Bước 3: Điền Apple ID, nhập mật khẩu.
Sau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.', N'28.jpg', 0, 100, 29290000, 29290000, 300, 4, 9, CAST(N'2022-06-22' AS Date), 0.1, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (29, N'Apple Macbook Pro (2022)', N'Apple Macbook Pro (2022) M2 chip, 13.3 inches, 8GB, 512GB SSD', N'Apple Macbook Pro (2022) M2 chip, 13.3 inches, 8GB, 512GB SSD

( SPG : màu Space Gray; SLV: màu Silver)



Bộ xử lý

Hãng CPU: Apple

Công nghệ CPU: M2

 Loại CPU: 8 - Core

Tốc độ CPU: 2.40 GHz



RAM

Dung lượng RAM: 8 GB

Loại RAM: LPDDR4

Tốc độ RAM: 3200 MHz

Số khe cắm rời: 0

Số khe RAM còn lại: 0

Số RAM onboard: 1

Hỗ trợ RAM tối đa: 8 GB



Màn hình

 Kích thước màn hình: 13.3 inches

Công nghệ màn hình: Retina

Độ phân giải: 2560 x 1600 Pixels

Loại màn hình: LED

Độ sáng: 500 nits

Màn hình cảm ứng: Không



Đồ họa

Card onboard

Hãng: Apple

Model GPU: 10 nhân



Lưu trữ	

Loại SSD: M2. PCIe

Dung lượng: 512 GB



Bảo mật

Mở khóa vân tay

Mật khẩu



Giao tiếp & kết nối

Cổng giao tiếp	

1 Jack 3.5 mm

2 Type C



Wifi: 802.11 ax

Bluetooth: v5.0

Webcam: HD Webcam (720p Webcam)



Âm thanh

Số lượng loa: 2

Công nghệ âm thanh: Stereo speakers with high dynamic range



Bàn phím & TouchPad

Kiểu bàn phím: English International Backlit Keyboard

Bàn phím số: Không

Đèn bàn phím: LED

Công nghệ đèn bàn phím: Đơn sắc

Màu đèn LED: Trắng

TouchPad: Multi-touch touchpad



Thông tin pin & Sạc

Loại PIN: Lithium polymer

Power Supply: 67 W

Dung lượng pin: 20 Giờ



Hệ điều hành

OS: macOS

Version: macOS 12



Thông tin bảo hành:

Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.

Kích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/



Hướng dẫn kiểm tra địa điểm bảo hành gần nhất:

Bước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN 

Bước 2: Chọn sản phẩm.

Bước 3: Điền Apple ID, nhập mật khẩu.

Sau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.', N'29.jpg', 0, 100, 35650000, 35650000, 300, 3, 9, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (30, N'Apple Macbook Pro', N'Apple Macbook Pro 13.3-inch M2 (2022)', N'CPU:Apple M2 100GB/s memory bandwidth

RAM:8 GB

Ổ cứng:256 GB SSD

Màn hình:13.3"Retina (2560 x 1600)

Card màn hình:Card tích hợp 10 nhân GPU

Cổng kết nối:2 x Thunderbolt 3Jack tai nghe 3.5 mm

Đặc biệt:Có đèn bàn phím

Hệ điều hành:Mac OS

Thiết kế:Vỏ kim loại

Kích thước, trọng lượng:Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg

Thời điểm ra mắt:6/2022



Chip

Chip Apple M2

CPU 8 lõi với 4 lõi hiệu suất và 4 lõi hiệu quả

GPU 10 lõi

Công cụ thần kinh 16 lõi

Băng thông bộ nhớ 100GB / s



Trưng bày

Màn hình hiển thị võng mạc

Màn hình LED-backlit 13,3 inch (chéo) với công nghệ IPS; Độ phân giải gốc 2560 x 1600 ở 227 pixel mỗi inch với hỗ trợ hàng triệu màu

Độ sáng 500 nits

Màu rộng (P3)

Công nghệ True Tone



Pin và nguồn

Lên đến 20 giờ phát lại phim ứng dụng Apple TV

Lên đến 17 giờ web không dây

Pin lithium-polymer 58,2 watt-giờ

Bộ đổi nguồn USB-C 67W



Máy ảnh

Camera FaceTime HD 720p

Bộ xử lý tín hiệu hình ảnh tiên tiến với video tính toán



Kích thước và trọng lượng

Chiều cao: 0,61 inch (1,56 cm)

Chiều rộng: 11,97 inch (30,41 cm)

Chiều sâu: 8,36 inch (21,24 cm)

Trọng lượng: 3,0 pound (1,4 kg) 



Trong cái hộp

MacBook Pro 13 inch

Bộ đổi nguồn USB-C 67W

Cáp sạc USB-C (2 m)



Thời hạn bảo hành : 12 tháng', N'30.jpg', 0, 100, 34490000, 34490000, 400, 3, 9, CAST(N'2022-06-22' AS Date), 0, 1)
INSERT [dbo].[Product] ([productId], [productName], [productcontent], [productcontentdetail], [images], [views], [buyitem], [priceinput], [priceoutput], [quantity], [catalogid], [providerid], [created], [discount], [status]) VALUES (31, N'Apple MacBook Pro', N'Apple MacBook Pro 16 inch - M1 Pro 10 CPU - 16 GPU 16GB', N'Mô tả sản phẩm

Bộ sản phẩm bao gồm: thân máy liền pin, bộ sạc USB-C, cáp sạc USB-C sang Magsafe 3 (2m)

MacBook Pro (16 inch) mới mang đến hiệu năng cao ấn tượng cho người dùng pro. Lựa chọn M1 Pro mạnh mẽ hay M1 Max còn mạnh hơn thế để tăng tốc xử lý các luồng công việc đẳng cấp pro cùng thời lượng pin đáng kinh ngạc. Với màn hình Liquid Retina XDR 16 inch sống động và nhiều cổng kết nối chuyên nghiệp, bạn có thể làm

được nhiều việc hơn bao giờ hết với MacBook Pro.

• Chip M1 Max hoặc M1 Pro do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU 

• CPU lên đến 10 lõi cho hiệu năng nhanh hơn đến 2x, xử lý các luồng công việc chuyên nghiệp nhanh hơn bao giờ hết

• GPU lên đến 32 lõi với tốc độ xử lý đồ họa nhanh hơn đến 4x cho các ứng dụng và game có đồ họa khủng

• Neural Engine 16 lõi cho hiệu năng máy học nhanh hơn đến 5x

• Thời lượng pin lâu hơn, lên đến 21 giờ

• Bộ nhớ thống nhất lên đến 64GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy

• Ổ lưu trữ SSD siêu nhanh lên đến 8TB giúp mở các ứng dụng và tập tin chỉ trong tích tắc

• Màn hình Liquid Retina XDR 16 inch sắc nét với Extreme Dynamic Range và tỷ lệ tương phản cực cao

• Camera FaceTime HD 1080p với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video sắc nét hơn

• Hệ thống âm thanh 6 loa với loa trầm khử lực

• Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn

• Ba cổng Thunderbolt 4, cổng HDMI, khe thẻ nhớ SDXC, jack cắm tai nghe, cổng MagSafe 3

• Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn

• Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn

• macOS Monterey cho phép bạn kết nối, chia sẻ và sáng tạo hơn bao giờ hết, với các bản cập nhật FaceTime

mới đầy thú vị và Safari đã được thiết kế lại

• Hiện có màu xám bạc và bạc

Các thông tin Apple đảm bảo ( Pháp lý) 

Hiện có sẵn các lựa chọn để nâng cấp. 

Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. Màn hình của MacBook Pro 16 inch có các góc trên được bo tròn. Khi tính theo hình chữ nhật chuẩn, kích thước màn hình theo đường chéo là 16.2 inch (diện tích hiển thị thực tế nhỏ hơn). So với thế hệ trước.', N'31.jpg', 0, 98, 60990000, 60990000, 200, 5, 9, CAST(N'2022-06-22' AS Date), 0.10000000149011612, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (2, 1, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (3, 1, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (4, 1, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (5, 2, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (6, 2, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (7, 2, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (8, 2, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (9, 3, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (10, 3, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (11, 3, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (12, 3, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (13, 4, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (14, 4, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (15, 4, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (16, 4, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (17, 5, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (18, 5, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (19, 5, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (20, 5, 11, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (21, 6, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (22, 6, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (23, 6, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (24, 6, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (25, 7, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (26, 7, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (27, 7, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (28, 7, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (29, 8, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (30, 8, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (31, 8, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (32, 8, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (33, 9, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (34, 9, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (35, 9, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (36, 9, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (37, 10, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (38, 10, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (39, 10, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (40, 10, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (41, 11, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (42, 11, 11, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (43, 11, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (44, 11, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (45, 12, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (46, 12, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (47, 12, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (48, 12, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (49, 13, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (50, 13, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (51, 13, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (52, 13, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (53, 14, 11, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (54, 14, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (55, 14, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (56, 14, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (57, 15, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (58, 15, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (59, 15, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (60, 15, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (61, 16, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (62, 16, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (63, 16, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (64, 16, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (65, 17, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (66, 17, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (67, 17, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (68, 17, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (69, 18, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (70, 18, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (71, 18, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (72, 18, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (73, 19, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (74, 19, 11, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (75, 19, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (76, 19, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (77, 20, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (78, 20, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (79, 20, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (80, 20, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (81, 21, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (82, 21, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (83, 21, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (84, 21, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (85, 22, 11, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (86, 22, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (87, 22, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (88, 22, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (89, 23, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (90, 23, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (91, 23, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (92, 23, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (93, 24, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (94, 24, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (95, 24, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (96, 24, 11, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (97, 25, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (98, 25, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (99, 25, 3, 1)
GO
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (100, 25, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (101, 26, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (102, 26, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (103, 26, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (104, 26, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (105, 27, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (106, 27, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (107, 27, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (108, 27, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (109, 28, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (110, 28, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (111, 28, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (112, 28, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (113, 29, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (114, 29, 8, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (115, 29, 9, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (116, 29, 10, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (117, 30, 1, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (118, 30, 2, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (119, 30, 3, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (120, 30, 4, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (121, 31, 5, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (122, 31, 6, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (123, 31, 7, 1)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [status]) VALUES (124, 31, 8, 11)
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (1, N'Acer', N'Hà Nội', N'Acer@gmail.com', N'0423456786', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (2, N'LG', N'Hà Nội', N'LG@gmail.com', N'0487656987', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (3, N'MSI', N'Nam Định', N'MSI@gmail.com', N'0487645632', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (4, N'Asus', N'Hồ Chí Minh', N'Asus@gmail.com', N'0867854321', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (5, N'Lenovo', N'Nam Định', N'Lenovo@gmail.com', N'0845678398', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (6, N'Microsoft(Surface)', N'Hà Nội', N'Microsoft@gmail.com', N'0856743965', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (7, N'HP', N'Hà Nội', N'HP@gmail.com', N'0435673198', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (8, N'DELL', N'Nam Định', N'DELL@gmail.com', N'0856789345', 1)
INSERT [dbo].[Provider] ([providerId], [providerName], [address], [email], [phone], [status]) VALUES (9, N'Apple (Macbook)', N'Hồ Chí Minh', N'Apple@gmail.com', N'0498754612', 1)
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleid], [rolename], [status]) VALUES (1, N'Khách Hàng', 1)
INSERT [dbo].[Role] ([roleid], [rolename], [status]) VALUES (2, N'Quản Lý', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userid], [username], [password], [fullname], [phone], [email], [created], [updated], [userimage], [status], [address]) VALUES (1, N'minhhieu0310', N'123456', N'Vũ Minh Hiếu', N'0868259241', N'vuluy3000@gmail.com', CAST(N'2022-11-23' AS Date), CAST(N'2023-01-14' AS Date), N'thiennhien.jpg', 1, N'Trung Lao - Trực Ninh - Nam Định')
INSERT [dbo].[Users] ([userid], [username], [password], [fullname], [phone], [email], [created], [updated], [userimage], [status], [address]) VALUES (2, N'uyen', N'123456', N'Nam Cung Uyển', N'0373664234', N'uyennhi@gmail.com', CAST(N'2022-12-31' AS Date), NULL, N'default.png', 1, N'Trung Lao - Trực Ninh - Nam Định')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Users_Roles] ON 

INSERT [dbo].[Users_Roles] ([id], [userid], [roleid], [status]) VALUES (1, 1, 2, 1)
INSERT [dbo].[Users_Roles] ([id], [userid], [roleid], [status]) VALUES (2, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Users_Roles] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_cartItem_cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_cartItem_cart]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_cartItem_product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_cartItem_product]
GO
ALTER TABLE [dbo].[ImageLink]  WITH CHECK ADD  CONSTRAINT [FK_product_image] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[ImageLink] CHECK CONSTRAINT [FK_product_image]
GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_orderdt_order] FOREIGN KEY([ordersid])
REFERENCES [dbo].[Orders] ([ordersid])
GO
ALTER TABLE [dbo].[Orderdetail] CHECK CONSTRAINT [FK_orderdt_order]
GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_orderdt_product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Orderdetail] CHECK CONSTRAINT [FK_orderdt_product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_user] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_user]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Catalog] FOREIGN KEY([catalogid])
REFERENCES [dbo].[CataLogs] ([catalogId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Catalog]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Provider] FOREIGN KEY([providerid])
REFERENCES [dbo].[Provider] ([providerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Provider]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_productcolor_color] FOREIGN KEY([colorId])
REFERENCES [dbo].[Color] ([colorId])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_productcolor_color]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_productcolor_product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_productcolor_product]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_RoleId] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [FK_RoleId]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [FK_UserId]
GO
USE [master]
GO
ALTER DATABASE [LapTop] SET  READ_WRITE 
GO
