USE [master]
GO
/****** Object:  Database [QuanLyQuanCafe]    Script Date: 10/17/2023 10:56:04 PM ******/
CREATE DATABASE [QuanLyQuanCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanCafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanCafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyQuanCafe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyQuanCafe', N'ON'
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[BAN]    Script Date: 10/17/2023 10:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAN](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_BAN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/17/2023 10:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] NOT NULL,
	[ngayvao] [datetime2](7) NOT NULL,
	[ngayra] [datetime2](7) NULL,
	[idBan] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL,
	[tongtien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 10/17/2023 10:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](100) NULL,
	[pricem] [float] NULL,
	[pricel] [float] NULL,
 CONSTRAINT [PK__MENU__3213E83FE10C1A63] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinBill]    Script Date: 10/17/2023 10:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinBill](
	[id] [int] NOT NULL,
	[idMon] [int] NOT NULL,
	[idBill] [int] NOT NULL,
	[count] [int] NOT NULL,
	[dathanhtoan] [int] NULL,
	[ghichu] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThongTinBill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 10/17/2023 10:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[userID] [nchar](10) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (1, N'BÀN 1', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (2, N'BÀN 2', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (3, N'BÀN 3', N'Đang sử dụng')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (4, N'BÀN 4', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (5, N'BÀN 5', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (6, N'BÀN 6', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (7, N'BÀN 7', N'Đang sử dụng')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (8, N'BÀN 8', N'Đang sử dụng')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (9, N'BÀN 9', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (10, N'BÀN 10', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (11, N'BÀN 11', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (12, N'BÀN 12', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (13, N'BÀN 13', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (14, N'BÀN 14', N'Đang sử dụng')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (15, N'BÀN 15', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (16, N'BÀN 16', N'Trống')
INSERT [dbo].[BAN] ([id], [name], [status]) VALUES (17, N'BÀN 17', N'Trống')
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (1, N'Cà phê đen', N'capheden.jpg', 15000, 20000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (2, N'Cà phê sữa', N'caphesua.jpg', 22000, 27000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (3, N'Nước cam', N'nuoccam.jpg', NULL, 15000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (4, N'Yaourt đá', N'yaourtda.jpg', 20000, 22000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (5, N'Chocolate đá xay', N'chocolatedaxay.jpg', 21000, 23000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (6, N'Matcha đá xay', N'matchadaxay.jpg', 22000, NULL)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (7, N'Trà vải', N'travai.jpg', 23000, 24000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (8, N'Trà đào', N'tradao.jpg', 25000, 26000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (9, N'Trà mãng cầu', N'tramangcau.jpg', 27000, 28000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (10, N'Sinh tố bơ', N'sinhtobo.jpg', 29000, 30000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (11, N'Sinh tố xoài', N'sinhtoxoai.jpg', 31000, 32000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (12, N'Sinh tố mãng cầu', N'sinhtomangcau.jpg', 33000, 34000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (13, N'Sinh tố sapoche', N'sinhtosapoche.jpg', 35000, 36000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (14, N'Soda bạc hà', N'sodabacha.jpg', 37000, 38000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (15, N'Soda việt quất', N'sodavietquat.jpg', 39000, 40000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (16, N'Soda dâu', N'sodadau.jpg', 41000, 42000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (17, N'Soda xoài', N'sodaxoai.jpg', 43000, 44000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (18, N'Chanh dây', N'chanhday.jpg', 45000, 46000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (19, N'Sinh tố dừa', N'sinhtodua.jpg', 47000, 48000)
INSERT [dbo].[MENU] ([id], [name], [image], [pricem], [pricel]) VALUES (20, N'Thơm ép', N'thomep.jpg', 12000, 14000)
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
INSERT [dbo].[UserLogin] ([userID], [userName], [password]) VALUES (N'1         ', N'admin', N'admin')
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF__MENU__name__4D94879B]  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF__MENU__price__4E88ABD4]  DEFAULT ((0)) FOR [pricem]
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
GO
