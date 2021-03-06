USE [master]
GO
/****** Object:  Database [TinyLibraryDB]    Script Date: 2/16/2019 10:53:17 PM ******/
CREATE DATABASE [TinyLibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TinyLibraryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TinyLibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TinyLibraryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TinyLibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TinyLibraryDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TinyLibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TinyLibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TinyLibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TinyLibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TinyLibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TinyLibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TinyLibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [TinyLibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TinyLibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TinyLibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TinyLibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TinyLibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TinyLibraryDB] SET QUERY_STORE = OFF
GO
USE [TinyLibraryDB]
GO
/****** Object:  Table [dbo].[author_book]    Script Date: 2/16/2019 10:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author_book](
	[author_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
 CONSTRAINT [PK_author_book] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 2/16/2019 10:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[about_the_author] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 2/16/2019 10:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[copyright_year] [int] NOT NULL,
	[isbn] [char](13) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[copies] [int] NOT NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borrowers]    Script Date: 2/16/2019 10:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borrowers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nchar](20) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_borrowers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkout]    Script Date: 2/16/2019 10:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout](
	[borrower_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_checkout] PRIMARY KEY CLUSTERED 
(
	[borrower_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkout_history]    Script Date: 2/16/2019 10:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[borrower_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[type] [nchar](20) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_checkout_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_author_book]    Script Date: 2/16/2019 10:53:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_author_book] ON [dbo].[author_book]
(
	[author_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[author_book]  WITH CHECK ADD  CONSTRAINT [FK_author_book_authors] FOREIGN KEY([author_id])
REFERENCES [dbo].[authors] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[author_book] CHECK CONSTRAINT [FK_author_book_authors]
GO
ALTER TABLE [dbo].[author_book]  WITH CHECK ADD  CONSTRAINT [FK_author_book_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
GO
ALTER TABLE [dbo].[author_book] CHECK CONSTRAINT [FK_author_book_books]
GO
ALTER TABLE [dbo].[checkout]  WITH CHECK ADD  CONSTRAINT [FK_checkout_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[checkout] CHECK CONSTRAINT [FK_checkout_books]
GO
ALTER TABLE [dbo].[checkout]  WITH CHECK ADD  CONSTRAINT [FK_checkout_borrowers] FOREIGN KEY([borrower_id])
REFERENCES [dbo].[borrowers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[checkout] CHECK CONSTRAINT [FK_checkout_borrowers]
GO
ALTER TABLE [dbo].[checkout_history]  WITH CHECK ADD  CONSTRAINT [FK_checkout_history_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
GO
ALTER TABLE [dbo].[checkout_history] CHECK CONSTRAINT [FK_checkout_history_books]
GO
ALTER TABLE [dbo].[checkout_history]  WITH CHECK ADD  CONSTRAINT [FK_checkout_history_borrowers] FOREIGN KEY([borrower_id])
REFERENCES [dbo].[borrowers] ([id])
GO
ALTER TABLE [dbo].[checkout_history] CHECK CONSTRAINT [FK_checkout_history_borrowers]
GO
USE [master]
GO
ALTER DATABASE [TinyLibraryDB] SET  READ_WRITE 
GO
