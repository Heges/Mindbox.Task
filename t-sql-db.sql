USE [master]
GO
/****** Object:  Database [mindboxTestDb]    Script Date: 18.12.2022 18:37:05 ******/
CREATE DATABASE [mindboxTestDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mindboxTestDb', FILENAME = N'C:\Users\ikunk\mindboxTestDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mindboxTestDb_log', FILENAME = N'C:\Users\ikunk\mindboxTestDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mindboxTestDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mindboxTestDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mindboxTestDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mindboxTestDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mindboxTestDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mindboxTestDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mindboxTestDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [mindboxTestDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [mindboxTestDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mindboxTestDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mindboxTestDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mindboxTestDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mindboxTestDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mindboxTestDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mindboxTestDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mindboxTestDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mindboxTestDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mindboxTestDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mindboxTestDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mindboxTestDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mindboxTestDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mindboxTestDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mindboxTestDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [mindboxTestDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mindboxTestDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mindboxTestDb] SET  MULTI_USER 
GO
ALTER DATABASE [mindboxTestDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mindboxTestDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mindboxTestDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mindboxTestDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mindboxTestDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mindboxTestDb] SET QUERY_STORE = OFF
GO
USE [mindboxTestDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [mindboxTestDb]
GO
/****** Object:  Table [dbo].[CategoriesProducts]    Script Date: 18.12.2022 18:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesProducts](
	[CategoryId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_CategoriesProducts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18.12.2022 18:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.12.2022 18:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CategoriesProducts] ([CategoryId], [ProductId]) VALUES (1, 1)
INSERT [dbo].[CategoriesProducts] ([CategoryId], [ProductId]) VALUES (1, 2)
INSERT [dbo].[CategoriesProducts] ([CategoryId], [ProductId]) VALUES (2, 3)
INSERT [dbo].[CategoriesProducts] ([CategoryId], [ProductId]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'First Category')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Second Category')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Third Category')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name]) VALUES (1, N'First product')
INSERT [dbo].[Products] ([ProductId], [Name]) VALUES (2, N'Second Product')
INSERT [dbo].[Products] ([ProductId], [Name]) VALUES (3, N'Third product')
INSERT [dbo].[Products] ([ProductId], [Name]) VALUES (4, N'Quad Product')
INSERT [dbo].[Products] ([ProductId], [Name]) VALUES (5, N'5th Product')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CategoriesProducts_CategoryId]    Script Date: 18.12.2022 18:37:05 ******/
CREATE NONCLUSTERED INDEX [IX_CategoriesProducts_CategoryId] ON [dbo].[CategoriesProducts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoriesProducts]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesProducts_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoriesProducts] CHECK CONSTRAINT [FK_CategoriesProducts_Category_CategoryId]
GO
ALTER TABLE [dbo].[CategoriesProducts]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoriesProducts] CHECK CONSTRAINT [FK_CategoriesProducts_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [mindboxTestDb] SET  READ_WRITE 
GO
