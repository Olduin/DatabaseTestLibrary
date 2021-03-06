USE [master]
GO
/****** Object:  Database [Library]    Script Date: 06.03.2020 6:47:41 ******/
CREATE DATABASE [Library] ON  PRIMARY 
( NAME = N'Library', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[Nickname] [nchar](40) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Copy_Of_The_Book]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copy_Of_The_Book](
	[Number_Of_The_Book] [int] IDENTITY(1,1) NOT NULL,
	[ID_Book] [int] NOT NULL,
 CONSTRAINT [PK_Copy_Of_The_Book] PRIMARY KEY CLUSTERED 
(
	[ID_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Issue_log]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue_log](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Number_Of_The_Book] [int] NOT NULL,
	[Date_Of_Issue] [date] NOT NULL,
	[Return_Date] [date] NULL,
	[Reader] [int] NOT NULL,
	[Librarian] [int] NOT NULL,
 CONSTRAINT [PK_Issue_log] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_Of_Books]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_Of_Books](
	[ID_Book] [int] IDENTITY(1,1) NOT NULL,
	[ID_Publishing] [int] NOT NULL,
	[ID_Author] [int] NOT NULL,
	[ID_Genre] [int] NOT NULL,
	[Book_Title] [nchar](100) NOT NULL,
 CONSTRAINT [PK_List_Of_Books] PRIMARY KEY CLUSTERED 
(
	[ID_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_Of_Position]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_Of_Position](
	[IDPosition] [int] IDENTITY(1,1) NOT NULL,
	[JobTitles] [nchar](30) NULL,
 CONSTRAINT [PK_ListOfPosition] PRIMARY KEY CLUSTERED 
(
	[IDPosition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](40) NOT NULL,
	[LastName] [nchar](40) NOT NULL,
	[IdPosition] [int] NULL,
	[MiddleName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishing_House]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishing_House](
	[Id_Publishing] [int] IDENTITY(1,1) NOT NULL,
	[Name_Publishing] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Publishing_House] PRIMARY KEY CLUSTERED 
(
	[Id_Publishing] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_autorisation]    Script Date: 06.03.2020 6:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_autorisation](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](30) NOT NULL,
	[Password] [nchar](20) NOT NULL,
	[PersonID] [int] NULL,
	[dismissed] [bit] NULL,
 CONSTRAINT [PK_User_autorisation] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD  CONSTRAINT [FK_Author_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Author] CHECK CONSTRAINT [FK_Author_Person]
GO
ALTER TABLE [dbo].[Copy_Of_The_Book]  WITH CHECK ADD  CONSTRAINT [FK_Copy_Of_The_Book_List_Of_Books] FOREIGN KEY([Number_Of_The_Book])
REFERENCES [dbo].[List_Of_Books] ([ID_Book])
GO
ALTER TABLE [dbo].[Copy_Of_The_Book] CHECK CONSTRAINT [FK_Copy_Of_The_Book_List_Of_Books]
GO
ALTER TABLE [dbo].[Issue_log]  WITH CHECK ADD  CONSTRAINT [FK_Issue_log_Person] FOREIGN KEY([Librarian])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Issue_log] CHECK CONSTRAINT [FK_Issue_log_Person]
GO
ALTER TABLE [dbo].[Issue_log]  WITH CHECK ADD  CONSTRAINT [FK_Issue_log_Person1] FOREIGN KEY([Librarian])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Issue_log] CHECK CONSTRAINT [FK_Issue_log_Person1]
GO
ALTER TABLE [dbo].[List_Of_Books]  WITH CHECK ADD  CONSTRAINT [FK_List_Of_Books_Author] FOREIGN KEY([ID_Author])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[List_Of_Books] CHECK CONSTRAINT [FK_List_Of_Books_Author]
GO
ALTER TABLE [dbo].[List_Of_Books]  WITH CHECK ADD  CONSTRAINT [FK_List_Of_Books_Genre] FOREIGN KEY([ID_Genre])
REFERENCES [dbo].[Genre] ([GenreId])
GO
ALTER TABLE [dbo].[List_Of_Books] CHECK CONSTRAINT [FK_List_Of_Books_Genre]
GO
ALTER TABLE [dbo].[List_Of_Books]  WITH CHECK ADD  CONSTRAINT [FK_List_Of_Books_List_Of_Books] FOREIGN KEY([ID_Publishing])
REFERENCES [dbo].[Publishing_House] ([Id_Publishing])
GO
ALTER TABLE [dbo].[List_Of_Books] CHECK CONSTRAINT [FK_List_Of_Books_List_Of_Books]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_List_Of_Position] FOREIGN KEY([IdPosition])
REFERENCES [dbo].[List_Of_Position] ([IDPosition])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_List_Of_Position]
GO
ALTER TABLE [dbo].[User_autorisation]  WITH CHECK ADD  CONSTRAINT [FK_User_autorisation_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[User_autorisation] CHECK CONSTRAINT [FK_User_autorisation_Person]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
