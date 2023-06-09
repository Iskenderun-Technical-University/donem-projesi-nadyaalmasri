USE [master]
GO

CREATE DATABASE [emlakDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'emlakDB', FILENAME = N'D:\emlakDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'emlakDB_log', FILENAME = N'D:\emlakDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [emlakDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [emlakDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [emlakDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [emlakDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [emlakDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [emlakDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [emlakDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [emlakDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [emlakDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [emlakDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [emlakDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [emlakDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [emlakDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [emlakDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [emlakDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [emlakDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [emlakDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [emlakDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [emlakDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [emlakDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [emlakDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [emlakDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [emlakDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [emlakDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [emlakDB] SET RECOVERY FULL 
GO
ALTER DATABASE [emlakDB] SET  MULTI_USER 
GO
ALTER DATABASE [emlakDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [emlakDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [emlakDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [emlakDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [emlakDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [emlakDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'emlakDB', N'ON'
GO
ALTER DATABASE [emlakDB] SET QUERY_STORE = OFF
GO
USE [emlakDB]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 12/26/2022 9:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userFullName] [nvarchar](15) NULL,
	[userEmail] [nvarchar](15) NULL,
	[userPassword] [nvarchar](15) NULL,
	[userPhone] [nvarchar](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 12/26/2022 9:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[houseId] [int] IDENTITY(1,1) NOT NULL,
	[houseCode] [nvarchar](10) NULL,
	[houseAddress] [nvarchar](50) NULL,
	[housePrice] [float] NULL,
	[houseBuiltDate] [int] NULL,
	[houseHeating] [nvarchar](50) NULL,
	[houseConditioning] [nvarchar](50) NULL,
	[houseGarage] [nvarchar](50) NULL,
	[houseVisitCount] [int] NULL,
	[houseMainImg] [nvarchar](max) NULL,
	[houseType] [nvarchar](4) NULL,
	[vendorId] [int] NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[houseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 12/26/2022 9:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[imageId] [int] IDENTITY(1,1) NOT NULL,
	[imagePath] [nvarchar](max) NULL,
	[houseId] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/26/2022 9:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[msgId] [int] IDENTITY(1,1) NOT NULL,
	[msgTitle] [nvarchar](50) NULL,
	[msgContent] [nvarchar](100) NULL,
	[vendorId] [int] NULL,
	[customerId] [int] NULL,
	[date] [nvarchar](10) NULL,
	[time] [nvarchar](10) NULL,
	[msgType] [nvarchar](1) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[msgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([userId], [userFullName], [userEmail], [userPassword], [userPhone]) VALUES (1, N'Osman', N'osman@gmail.com', N'ooo', N'098765432')
INSERT [dbo].[Agent] ([userId], [userFullName], [userEmail], [userPassword], [userPhone]) VALUES (2, N'Ahmad', N'ahmad@gmail.com', N'aaa', N'091234567')
INSERT [dbo].[Agent] ([userId], [userFullName], [userEmail], [userPassword], [userPhone]) VALUES (3, N'Khaled', N'kaled@gmail.com', N'kkk', N'963852741')
INSERT [dbo].[Agent] ([userId], [userFullName], [userEmail], [userPassword], [userPhone]) VALUES (7, N'Malek', N'malek@gmail.com', N'mmm', N'025258741')
INSERT [dbo].[Agent] ([userId], [userFullName], [userEmail], [userPassword], [userPhone]) VALUES (8, N'Abood', N'abod@gmail.com', N'aaa', N'963852741')
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (3, N'3Sah', N'Address for third house', 22000, 1992, N'Electric', N'Electric', N'None', 48, N'3.jpg', N'R', 2)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (60, N'5Sah', N'address', 25000, 2020, N' Central forced air, propane', N'Central air', N'1 Attached garage space', 12, N'60.jpg', N'R', 1)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (61, N'2Rah', N'Apaydin / Antakya /Hatay-Turkey', 27000, 2003, N'propane', N'Central air', N'none', 2, N'1.jfif', N'S', 1)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (62, N'1SaN', N'Ankara', 20000, 2000, N'Electric', N'central', N'1 garage', 0, N'4.jfif', N'S', 1)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (63, N'4Ran', N'Erzurum mah.', 20000, 1995, N'Electric', N'Electric', N'no garage', 4, N'6.jfif', N'R', 2)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (64, N'TR87h', N'Erzurum mah.', 1000, 1992, N'Electric', N'central', N'1 garage', 8, N'5.jfif', N'R', 3)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (65, N'ESk8', N'Ankara', 26000, 1999, N'central', N'central', N'no', 1, N'65.jpg', N'S', 3)
INSERT [dbo].[House] ([houseId], [houseCode], [houseAddress], [housePrice], [houseBuiltDate], [houseHeating], [houseConditioning], [houseGarage], [houseVisitCount], [houseMainImg], [houseType], [vendorId]) VALUES (66, N'SCode4', N'Istanbul', 30000, 2000, N'central', N'electric', N'1 converted garage', 1, N'66.jpg', N'R', 2)
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (2, N'msg                                               ', N'first message from Osman', 7, 1, N'12/17/2022', N'10:12 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (3, N'help', N'second message from Osman', 3, 1, N'12/18/2022', N'9:09 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (4, N'new', N'new message', 1, 2, N'12/19/2022', N'10:14 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (5, N'question', N'second message from Osman', 2, 1, N'12/19/2022', N'11:16 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (7, N'Reply :tttitle                                    ', N'message content from Ahmad', 1, 2, N'12/19/2022', N'11:38 PM', N'r')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (8, N'new(Reply :title)                                 ', N'message content from Ahmad to Osman', 1, 2, N'12/19/2022', N'11:41 PM', N'r')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (9, N'test                                              ', N'test content', 3, 1, N'12/20/2022', N'10:00 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (10, N'rep(Reply :new title)                             ', N'test reply', 1, 2, N'12/20/2022', N'9:03 PM', N'r')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (11, N'send reply(Reply :title)                          ', N'reply content', 2, 1, N'12/20/2022', N'9:06 PM', N'r')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (12, N'title', N'content', 2, 1, N'12/21/2022', N'8:20 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (13, N'reply to osman(Reply :title)', N'content for reply', 1, 2, N'12/21/2022', N'8:21 PM', N'r')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (14, N'to khaled', N'from ahmad to khaled', 3, 2, N'12/25/2022', N'11:04 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (15, N'help', N'message about home', 1, 8, N'12/26/2022', N'9:13 PM', N'm')
INSERT [dbo].[Message] ([msgId], [msgTitle], [msgContent], [vendorId], [customerId], [date], [time], [msgType]) VALUES (16, N'title(Reply :help)', N'ready to rent', 8, 1, N'12/26/2022', N'9:14 PM', N'r')
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_User] FOREIGN KEY([vendorId])
REFERENCES [dbo].[Agent] ([userId])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_User]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_House] FOREIGN KEY([houseId])
REFERENCES [dbo].[House] ([houseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_House]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User] FOREIGN KEY([vendorId])
REFERENCES [dbo].[Agent] ([userId])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User]
GO
USE [master]
GO
ALTER DATABASE [emlakDB] SET  READ_WRITE 
GO
