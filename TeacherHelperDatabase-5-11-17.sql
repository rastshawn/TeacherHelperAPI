USE [master]
GO
/****** Object:  Database [TeacherHelper]    Script Date: 5/11/2017 12:44:49 AM ******/
CREATE DATABASE [TeacherHelper]
 GO
ALTER DATABASE [TeacherHelper] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeacherHelper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeacherHelper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeacherHelper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeacherHelper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeacherHelper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeacherHelper] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeacherHelper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeacherHelper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeacherHelper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeacherHelper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeacherHelper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeacherHelper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeacherHelper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeacherHelper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeacherHelper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeacherHelper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TeacherHelper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeacherHelper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeacherHelper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeacherHelper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeacherHelper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeacherHelper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeacherHelper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeacherHelper] SET RECOVERY FULL 
GO
ALTER DATABASE [TeacherHelper] SET  MULTI_USER 
GO
ALTER DATABASE [TeacherHelper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeacherHelper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeacherHelper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeacherHelper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeacherHelper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeacherHelper] SET QUERY_STORE = OFF
GO
USE [TeacherHelper]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TeacherHelper]
GO
/****** Object:  User [rastsc]    Script Date: 5/11/2017 12:44:52 AM ******/

/****** Object:  Table [dbo].[Assignments]    Script Date: 5/11/2017 12:44:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[AssignDate] [datetime] NOT NULL,
	[AssignmentName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Day] [datetime] NOT NULL,
	[isPresent] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClasses]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClasses](
	[StudentClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClassHatDraw]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClassHatDraw](
	[HatDrawID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Drawn] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HatDrawID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](30) NOT NULL,
	[lName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](30) NOT NULL,
	[lName] [varchar](30) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[passwordHash] [varbinary](32) NOT NULL,
	[passwordSalt] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherStudentNotes]    Script Date: 5/11/2017 12:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherStudentNotes](
	[StudentTeacherNoteID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[isTalkative] [bit] NOT NULL,
	[isNearsighted] [bit] NOT NULL,
	[notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentTeacherNoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([AssignmentID], [ClassID], [AssignDate], [AssignmentName]) VALUES (5, 112, CAST(N'2017-05-01T04:00:00.000' AS DateTime), N'TeacherA May 1')
INSERT [dbo].[Assignments] ([AssignmentID], [ClassID], [AssignDate], [AssignmentName]) VALUES (6, 44, CAST(N'2017-05-01T04:00:00.000' AS DateTime), N'Teacher B')
INSERT [dbo].[Assignments] ([AssignmentID], [ClassID], [AssignDate], [AssignmentName]) VALUES (7, 44, CAST(N'2017-05-09T04:00:00.000' AS DateTime), N'May 9')
SET IDENTITY_INSERT [dbo].[Assignments] OFF
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (1, 51, 203, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (2, 51, 689, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (3, 51, 152, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (4, 51, 693, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (5, 51, 579, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (6, 51, 261, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (7, 51, 734, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (8, 51, 63, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (9, 51, 555, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (10, 51, 48, CAST(N'2017-05-09T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (11, 51, 203, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (12, 51, 693, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (13, 51, 152, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (14, 51, 689, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (15, 51, 261, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (16, 51, 734, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (17, 51, 579, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (18, 51, 63, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (19, 51, 48, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (20, 51, 555, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (21, 51, 203, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (22, 51, 152, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (23, 51, 693, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (24, 51, 689, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (25, 51, 579, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (26, 51, 261, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (27, 51, 734, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (28, 51, 63, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (29, 51, 555, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (30, 51, 48, CAST(N'2017-04-20T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (31, 71, 477, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (32, 71, 803, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (33, 71, 454, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (34, 71, 304, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (35, 71, 283, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (36, 71, 200, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (37, 71, 500, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (38, 71, 614, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (39, 71, 981, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (40, 71, 849, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (41, 71, 662, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (42, 71, 627, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (43, 71, 824, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (44, 71, 625, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (45, 51, 203, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (46, 51, 693, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (47, 51, 152, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (48, 51, 579, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (49, 51, 261, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (50, 51, 734, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (51, 51, 63, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (52, 51, 555, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (53, 51, 48, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (54, 51, 689, CAST(N'2017-04-12T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (55, 51, 203, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (56, 51, 689, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (57, 51, 579, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (58, 51, 693, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (59, 51, 734, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (60, 51, 261, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (61, 51, 63, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (62, 51, 555, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (63, 51, 48, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (64, 51, 152, CAST(N'2017-04-14T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (65, 51, 689, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (66, 51, 203, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (67, 51, 693, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (68, 51, 152, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (69, 51, 579, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (70, 51, 734, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (71, 51, 63, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (72, 51, 555, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (73, 51, 48, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (74, 51, 261, CAST(N'2017-04-27T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (75, 51, 689, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (76, 51, 152, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (77, 51, 203, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (78, 51, 693, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (79, 51, 579, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (80, 51, 63, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (81, 51, 261, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (82, 51, 555, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (83, 51, 48, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (84, 51, 734, CAST(N'2017-04-22T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (85, 51, 689, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (86, 51, 152, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (87, 51, 693, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (88, 51, 203, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (89, 51, 579, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (90, 51, 261, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (91, 51, 734, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (92, 51, 63, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (93, 51, 555, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (94, 51, 48, CAST(N'2017-01-17T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (95, 51, 203, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (96, 51, 689, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (97, 51, 579, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (98, 51, 152, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (99, 51, 693, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (100, 51, 261, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (101, 51, 734, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (102, 51, 63, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (103, 51, 555, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (104, 51, 48, CAST(N'2017-01-23T05:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (105, 103, 203, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (106, 103, 48, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (107, 109, 56, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (108, 109, 234, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (109, 109, 11, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (110, 109, 85, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (111, 109, 123, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (112, 109, 234, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (113, 109, 85, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (114, 109, 56, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (115, 109, 11, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (116, 109, 123, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (117, 44, 286, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (118, 44, 154, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (119, 44, 211, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (120, 44, 4, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (121, 44, 222, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (122, 44, 69, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (123, 44, 795, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (124, 44, 888, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (125, 44, 502, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (126, 44, 125, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (127, 44, 48, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (128, 44, 85, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (129, 112, 85, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (130, 112, 45, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (131, 112, 789, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (132, 112, 6, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (133, 112, 88, CAST(N'2017-05-01T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (134, 112, 85, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (135, 112, 88, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (136, 112, 45, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (137, 112, 789, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([AttendanceID], [ClassID], [StudentID], [Day], [isPresent]) VALUES (138, 112, 6, CAST(N'2017-05-02T04:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (1, 27, N'Bulgarian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (2, 28, N'Hebrew')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (3, 18, N'Malay')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (4, 25, N'Finnish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (5, 7, N'Oriya')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (6, 26, N'Northern Sotho')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (7, 25, N'Gujarati')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (8, 19, N'Persian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (9, 5, N'Icelandic')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (10, 30, N'Portuguese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (11, 24, N'Khmer')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (12, 26, N'Tsonga')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (13, 10, N'Hindi')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (14, 12, N'Papiamento')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (15, 3, N'Bulgarian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (16, 6, N'Hebrew')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (17, 19, N'Dzongkha')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (18, 4, N'Danish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (19, 21, N'Guaraní')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (20, 6, N'Hebrew')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (21, 28, N'Hindi')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (22, 24, N'Tok Pisin')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (23, 2, N'Portuguese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (24, 6, N'Arabic')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (25, 27, N'Gagauz')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (26, 1, N'Lao')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (27, 10, N'Oriya')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (28, 9, N'Luxembourgish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (29, 5, N'Greek')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (30, 24, N'Sotho')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (31, 28, N'Nepali')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (32, 17, N'Montenegrin')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (33, 13, N'Tamil')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (34, 21, N'Kashmiri')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (35, 20, N'Chinese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (36, 1, N'Hungarian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (37, 21, N'Luxembourgish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (38, 15, N'Moldovan')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (39, 22, N'Bislama')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (40, 4, N'Chinese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (41, 21, N'Afrikaans')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (42, 24, N'Bulgarian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (43, 12, N'Zulu')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (44, 14, N'Bosnian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (45, 12, N'Afrikaans')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (46, 6, N'Haitian Creole')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (47, 20, N'Sotho')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (48, 21, N'Czech')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (49, 1, N'Catalan')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (50, 26, N'Chinese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (51, 11, N'Tswana')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (52, 7, N'Arabic')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (53, 26, N'Kannada')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (54, 23, N'Norwegian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (55, 14, N'Tswana')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (56, 24, N'Portuguese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (57, 14, N'Marathi')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (58, 3, N'Bulgarian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (59, 14, N'Pashto')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (60, 23, N'Tsonga')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (61, 14, N'Tetum')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (62, 12, N'Tajik')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (63, 26, N'Maltese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (64, 15, N'Albanian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (65, 8, N'Dzongkha')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (66, 7, N'Finnish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (67, 10, N'Swahili')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (68, 17, N'Bislama')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (69, 19, N'Croatian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (70, 3, N'Pashto')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (71, 11, N'Tsonga')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (72, 20, N'Kashmiri')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (73, 1, N'Persian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (74, 20, N'New Zealand Sign Language')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (75, 21, N'Dutch')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (76, 16, N'Dzongkha')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (77, 23, N'Catalan')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (78, 6, N'Nepali')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (79, 20, N'Swedish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (80, 19, N'Swati')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (81, 14, N'Indonesian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (82, 2, N'Armenian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (83, 29, N'Mongolian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (84, 28, N'Kurdish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (85, 23, N'Japanese')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (86, 6, N'Armenian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (87, 26, N'German')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (88, 5, N'Indonesian')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (89, 5, N'Kazakh')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (90, 12, N'Arabic')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (91, 4, N'Kyrgyz')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (92, 3, N'Danish')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (93, 7, N'Aymara')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (94, 4, N'Icelandic')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (95, 20, N'Oriya')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (96, 30, N'Moldovan')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (97, 27, N'Moldovan')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (98, 18, N'Aymara')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (99, 17, N'Amharic')
GO
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (100, 19, N'Papiamento')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (103, 14, N'CSE385')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (104, 31, N'Placeholder Class')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (109, 39, N'CSE 385')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (110, 14, N'asdf')
INSERT [dbo].[Classes] ([ClassID], [TeacherID], [Name]) VALUES (112, 40, N'CSE 385')
SET IDENTITY_INSERT [dbo].[Classes] OFF
SET IDENTITY_INSERT [dbo].[StudentClasses] ON 

INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1, 22, 544)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (2, 77, 782)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (3, 6, 754)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (4, 39, 346)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (5, 54, 957)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (6, 27, 300)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (7, 96, 697)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (8, 2, 656)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (9, 74, 400)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (10, 24, 889)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (11, 43, 125)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (12, 5, 369)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (13, 25, 900)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (14, 8, 602)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (15, 74, 923)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (16, 15, 619)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (17, 88, 105)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (18, 39, 306)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (19, 18, 190)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (20, 87, 56)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (21, 45, 333)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (22, 85, 289)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (23, 17, 855)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (24, 17, 740)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (25, 92, 435)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (26, 71, 477)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (27, 40, 737)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (28, 34, 509)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (29, 4, 987)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (30, 79, 614)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (31, 85, 470)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (32, 13, 850)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (33, 74, 516)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (34, 30, 654)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (35, 74, 163)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (36, 43, 213)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (37, 15, 172)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (38, 29, 436)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (39, 5, 823)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (40, 1, 687)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (41, 75, 969)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (42, 17, 183)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (43, 24, 915)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (44, 49, 307)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (45, 7, 326)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (46, 52, 228)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (47, 89, 314)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (48, 8, 930)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (49, 4, 304)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (50, 98, 888)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (51, 87, 405)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (52, 81, 215)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (53, 41, 489)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (54, 13, 534)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (55, 59, 198)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (56, 12, 890)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (57, 54, 188)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (58, 6, 955)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (59, 9, 399)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (60, 58, 26)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (61, 37, 566)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (62, 36, 703)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (63, 18, 257)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (64, 80, 740)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (65, 30, 859)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (66, 17, 256)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (67, 51, 203)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (68, 84, 441)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (69, 99, 166)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (70, 71, 454)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (71, 44, 286)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (72, 83, 705)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (73, 100, 68)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (74, 29, 479)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (75, 39, 996)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (76, 77, 325)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (77, 11, 968)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (78, 48, 629)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (80, 85, 579)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (81, 47, 182)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (82, 49, 962)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (83, 54, 470)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (84, 58, 360)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (85, 33, 521)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (86, 6, 895)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (87, 87, 57)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (88, 32, 461)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (89, 2, 704)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (90, 20, 820)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (91, 68, 389)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (92, 66, 837)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (93, 91, 238)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (94, 38, 44)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (95, 12, 777)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (96, 66, 681)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (97, 40, 118)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (98, 85, 425)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (99, 47, 979)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (100, 26, 321)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (101, 81, 838)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (102, 16, 764)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (103, 63, 510)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (104, 21, 755)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (105, 9, 862)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (106, 18, 344)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (107, 49, 990)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (108, 100, 64)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (109, 54, 411)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (110, 84, 174)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (111, 42, 912)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (112, 15, 620)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (113, 71, 500)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (114, 55, 120)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (115, 12, 392)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (116, 25, 89)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (117, 34, 994)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (118, 20, 772)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (119, 1, 103)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (120, 51, 689)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (121, 51, 693)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (122, 65, 86)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (123, 25, 892)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (124, 83, 973)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (125, 58, 273)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (126, 54, 960)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (127, 48, 430)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (128, 92, 632)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (129, 17, 446)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (130, 23, 13)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (131, 65, 732)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (132, 2, 7)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (133, 13, 958)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (134, 94, 976)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (135, 40, 274)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (136, 36, 905)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (137, 4, 469)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (138, 76, 64)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (139, 57, 760)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (140, 36, 662)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (141, 20, 354)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (142, 70, 490)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (143, 23, 496)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (144, 97, 985)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (145, 25, 250)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (146, 78, 375)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (147, 90, 680)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (148, 77, 343)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (149, 97, 231)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (150, 83, 598)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (151, 31, 79)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (152, 3, 935)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (153, 47, 633)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (154, 46, 1)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (155, 100, 821)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (156, 70, 663)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (157, 80, 249)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (158, 16, 708)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (159, 75, 690)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (160, 6, 641)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (161, 18, 6)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (162, 86, 711)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (163, 84, 334)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (164, 86, 60)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (165, 89, 959)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (166, 70, 307)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (167, 76, 452)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (168, 5, 362)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (169, 31, 979)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (170, 13, 598)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (171, 19, 942)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (172, 8, 423)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (173, 42, 299)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (174, 59, 360)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (175, 67, 904)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (176, 60, 786)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (177, 60, 746)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (178, 38, 279)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (179, 68, 246)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (180, 19, 674)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (181, 80, 48)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (182, 80, 143)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (183, 89, 512)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (184, 86, 294)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (185, 36, 965)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (186, 78, 814)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (187, 35, 646)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (188, 87, 210)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (189, 32, 30)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (190, 80, 15)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (191, 1, 268)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (192, 88, 585)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (193, 25, 939)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (194, 94, 720)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (195, 37, 19)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (196, 46, 882)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (197, 76, 9)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (198, 6, 436)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (199, 98, 489)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (200, 61, 323)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (201, 60, 533)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (202, 53, 311)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (203, 63, 225)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (204, 75, 354)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (205, 7, 438)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (206, 26, 252)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (207, 88, 76)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (208, 60, 200)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (209, 98, 248)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (210, 21, 528)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (211, 32, 553)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (212, 36, 952)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (213, 7, 589)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (214, 11, 490)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (215, 20, 778)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (216, 71, 200)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (217, 72, 594)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (219, 40, 225)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (220, 75, 704)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (221, 99, 573)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (222, 86, 866)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (223, 5, 341)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (224, 15, 995)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (225, 87, 135)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (226, 7, 94)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (227, 25, 870)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (228, 79, 803)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (229, 80, 340)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (230, 58, 501)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (231, 20, 858)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (232, 98, 642)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (233, 40, 981)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (234, 53, 229)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (235, 88, 445)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (236, 33, 320)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (237, 86, 411)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (238, 2, 220)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (239, 13, 878)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (240, 27, 801)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (241, 17, 382)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (242, 85, 322)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (243, 58, 664)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (244, 7, 285)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (245, 42, 214)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (246, 94, 8)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (247, 49, 840)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (248, 96, 822)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (249, 74, 482)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (250, 89, 658)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (251, 65, 786)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (252, 18, 201)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (253, 55, 837)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (254, 81, 485)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (255, 57, 800)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (256, 47, 841)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (257, 55, 98)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (258, 48, 19)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (259, 41, 970)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (260, 51, 152)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (261, 1, 849)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (262, 33, 873)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (263, 71, 803)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (264, 45, 725)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (265, 29, 554)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (266, 29, 868)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (267, 18, 922)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (268, 73, 639)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (269, 34, 713)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (270, 23, 459)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (271, 34, 26)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (272, 39, 687)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (273, 84, 885)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (274, 74, 721)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (275, 85, 485)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (276, 67, 818)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (277, 7, 206)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (278, 32, 279)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (279, 25, 938)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (280, 64, 770)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (281, 2, 287)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (282, 96, 87)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (283, 56, 436)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (284, 30, 738)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (285, 36, 358)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (286, 15, 4)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (287, 77, 809)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (288, 81, 202)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (289, 87, 524)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (290, 7, 674)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (291, 49, 715)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (292, 99, 415)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (293, 80, 138)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (294, 95, 188)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (295, 55, 784)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (296, 77, 61)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (297, 40, 336)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (298, 16, 985)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (299, 53, 694)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (300, 9, 317)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (301, 69, 995)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (302, 9, 985)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (303, 43, 950)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (304, 39, 842)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (305, 29, 250)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (306, 67, 247)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (307, 24, 824)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (308, 16, 180)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (309, 24, 964)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (310, 31, 484)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (311, 51, 579)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (312, 43, 60)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (313, 44, 4)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (314, 100, 797)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (315, 84, 658)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (316, 25, 405)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (317, 72, 583)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (318, 4, 143)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (319, 9, 1000)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (320, 20, 687)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (321, 64, 56)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (322, 75, 536)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (323, 75, 869)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (324, 3, 510)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (325, 72, 741)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (326, 61, 368)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (327, 37, 881)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (328, 80, 996)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (329, 94, 716)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (330, 21, 787)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (331, 71, 283)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (332, 50, 94)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (333, 93, 202)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (334, 82, 173)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (335, 89, 221)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (336, 20, 576)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (337, 100, 222)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (338, 65, 905)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (339, 36, 863)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (340, 52, 192)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (341, 61, 48)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (342, 24, 952)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (343, 75, 905)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (344, 19, 534)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (345, 33, 387)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (346, 97, 732)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (347, 73, 957)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (348, 69, 248)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (349, 59, 724)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (350, 86, 352)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (351, 38, 184)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (352, 52, 858)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (353, 80, 887)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (354, 13, 452)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (355, 23, 198)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (356, 56, 434)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (357, 85, 629)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (358, 81, 593)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (359, 26, 339)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (360, 3, 368)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (361, 86, 796)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (362, 31, 997)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (363, 38, 175)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (364, 43, 870)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (365, 94, 515)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (366, 79, 769)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (367, 69, 732)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (368, 52, 498)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (369, 45, 517)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (370, 65, 245)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (371, 27, 348)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (372, 74, 689)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (373, 4, 845)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (374, 97, 429)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (375, 27, 248)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (376, 57, 179)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (377, 87, 79)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (378, 7, 841)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (379, 77, 371)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (380, 49, 975)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (381, 36, 843)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (382, 73, 42)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (383, 84, 558)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (384, 89, 284)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (385, 38, 875)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (386, 45, 987)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (387, 43, 622)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (388, 65, 125)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (389, 21, 553)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (390, 24, 710)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (391, 76, 966)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (392, 32, 438)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (393, 66, 368)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (394, 16, 90)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (395, 28, 292)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (396, 54, 145)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (397, 45, 941)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (398, 3, 508)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (399, 12, 375)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (400, 63, 201)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (401, 11, 778)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (402, 27, 454)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (403, 61, 970)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (404, 82, 699)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (405, 50, 545)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (406, 74, 435)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (407, 88, 745)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (408, 91, 443)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (409, 14, 224)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (410, 72, 459)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (411, 80, 928)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (412, 95, 794)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (413, 52, 783)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (414, 67, 826)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (415, 14, 67)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (416, 44, 69)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (417, 14, 604)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (418, 100, 847)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (419, 52, 763)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (420, 47, 895)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (421, 100, 475)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (422, 1, 539)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (423, 28, 539)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (424, 54, 230)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (425, 77, 420)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (426, 59, 296)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (427, 74, 762)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (428, 78, 930)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (429, 26, 563)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (430, 37, 243)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (431, 57, 213)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (432, 39, 786)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (433, 32, 235)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (434, 4, 434)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (435, 80, 286)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (436, 15, 404)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (437, 60, 906)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (438, 95, 259)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (439, 54, 57)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (440, 50, 413)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (441, 66, 644)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (442, 41, 527)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (443, 65, 644)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (444, 71, 304)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (445, 6, 776)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (446, 16, 786)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (447, 74, 796)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (448, 58, 949)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (449, 9, 894)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (450, 83, 999)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (451, 35, 512)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (452, 49, 672)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (453, 57, 970)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (454, 75, 531)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (455, 42, 74)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (456, 72, 195)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (457, 35, 433)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (458, 14, 383)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (459, 12, 93)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (460, 1, 132)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (461, 13, 156)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (462, 74, 517)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (463, 28, 312)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (464, 57, 512)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (465, 11, 735)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (466, 93, 800)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (467, 44, 154)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (468, 32, 293)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (469, 7, 590)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (470, 64, 552)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (471, 33, 57)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (472, 21, 731)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (473, 81, 102)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (474, 3, 939)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (475, 8, 965)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (476, 24, 795)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (477, 6, 149)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (478, 21, 112)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (479, 32, 967)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (480, 46, 351)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (481, 54, 394)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (482, 26, 493)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (483, 38, 103)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (484, 58, 64)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (485, 70, 899)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (486, 39, 363)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (487, 41, 932)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (488, 24, 420)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (489, 29, 863)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (490, 48, 472)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (491, 49, 889)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (492, 67, 128)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (493, 8, 740)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (494, 18, 557)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (495, 51, 261)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (496, 93, 91)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (497, 78, 956)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (498, 53, 345)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (499, 1, 795)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (500, 8, 750)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (501, 9, 783)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (502, 81, 740)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (503, 64, 866)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (504, 79, 278)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (505, 5, 380)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (506, 61, 955)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (507, 38, 778)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (508, 79, 52)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (509, 14, 355)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (510, 50, 28)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (511, 90, 805)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (512, 45, 808)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (513, 95, 743)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (514, 28, 796)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (515, 49, 545)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (516, 30, 454)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (517, 28, 99)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (518, 55, 250)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (519, 4, 98)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (520, 74, 302)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (521, 70, 614)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (522, 14, 589)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (523, 12, 950)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (524, 59, 798)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (525, 2, 620)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (526, 80, 501)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (527, 100, 972)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (528, 73, 873)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (529, 89, 399)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (530, 73, 584)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (531, 84, 426)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (532, 68, 378)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (533, 74, 35)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (534, 17, 19)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (535, 72, 361)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (536, 73, 221)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (537, 82, 247)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (538, 32, 514)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (539, 69, 131)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (540, 15, 459)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (541, 65, 509)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (542, 85, 490)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (543, 40, 228)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (544, 57, 918)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (545, 73, 772)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (546, 70, 152)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (547, 72, 637)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (548, 68, 403)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (549, 77, 352)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (550, 85, 168)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (551, 3, 808)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (552, 95, 704)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (553, 26, 540)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (554, 38, 887)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (555, 96, 680)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (556, 13, 195)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (557, 69, 195)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (558, 35, 182)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (559, 59, 59)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (560, 99, 433)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (561, 35, 101)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (562, 19, 669)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (563, 76, 663)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (564, 15, 364)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (565, 69, 700)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (566, 29, 964)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (567, 20, 786)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (568, 100, 554)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (569, 30, 582)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (570, 99, 314)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (571, 11, 816)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (572, 50, 85)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (573, 98, 254)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (574, 72, 826)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (575, 38, 868)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (576, 70, 217)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (577, 40, 563)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (578, 75, 930)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (579, 69, 947)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (580, 78, 237)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (581, 71, 981)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (582, 85, 380)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (583, 85, 821)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (584, 77, 309)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (585, 55, 901)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (586, 33, 628)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (587, 67, 129)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (588, 94, 429)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (589, 46, 579)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (590, 93, 636)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (591, 34, 557)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (592, 65, 256)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (593, 67, 473)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (594, 35, 32)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (595, 64, 823)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (596, 52, 462)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (597, 88, 534)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (598, 1, 890)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (599, 33, 895)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (600, 14, 811)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (601, 35, 640)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (602, 31, 778)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (603, 90, 235)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (604, 17, 280)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (605, 14, 876)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (606, 53, 48)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (607, 40, 348)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (608, 82, 826)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (609, 93, 763)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (610, 24, 994)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (611, 54, 874)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (612, 71, 614)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (613, 100, 93)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (614, 4, 637)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (615, 88, 442)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (616, 57, 744)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (617, 16, 247)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (618, 14, 979)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (619, 86, 327)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (620, 17, 904)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (621, 4, 101)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (622, 97, 613)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (623, 78, 876)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (624, 37, 654)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (625, 28, 14)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (626, 50, 244)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (627, 9, 871)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (628, 76, 110)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (629, 72, 693)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (630, 18, 279)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (631, 94, 647)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (632, 50, 643)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (633, 82, 235)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (634, 23, 974)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (635, 63, 694)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (636, 89, 734)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (637, 48, 773)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (638, 87, 614)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (639, 23, 744)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (640, 36, 414)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (641, 37, 161)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (642, 42, 867)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (643, 26, 785)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (644, 52, 195)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (645, 18, 737)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (646, 96, 54)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (647, 27, 517)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (648, 94, 122)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (649, 19, 161)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (650, 48, 442)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (651, 76, 698)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (652, 84, 443)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (653, 63, 151)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (654, 26, 466)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (655, 31, 560)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (656, 19, 788)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (657, 5, 585)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (658, 65, 624)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (659, 79, 455)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (660, 24, 340)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (661, 28, 890)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (662, 64, 728)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (663, 67, 22)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (664, 70, 855)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (665, 41, 346)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (666, 80, 230)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (667, 84, 685)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (668, 98, 815)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (669, 84, 831)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (670, 14, 282)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (671, 9, 857)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (672, 11, 681)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (673, 26, 879)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (674, 52, 325)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (675, 79, 348)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (676, 74, 461)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (677, 64, 787)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (678, 34, 838)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (679, 19, 185)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (680, 34, 119)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (681, 46, 584)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (682, 12, 900)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (683, 40, 69)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (684, 79, 490)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (685, 20, 104)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (686, 92, 239)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (687, 88, 661)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (688, 90, 538)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (689, 15, 570)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (690, 61, 1000)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (691, 10, 43)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (692, 70, 413)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (693, 71, 849)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (694, 10, 980)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (695, 29, 786)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (696, 73, 711)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (697, 52, 246)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (698, 55, 274)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (699, 32, 14)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (700, 16, 619)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (701, 66, 767)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (702, 52, 399)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (703, 31, 195)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (704, 68, 849)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (705, 30, 41)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (706, 5, 675)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (707, 88, 108)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (708, 34, 868)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (709, 89, 735)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (710, 80, 969)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (711, 17, 903)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (712, 88, 439)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (713, 55, 443)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (714, 1, 376)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (715, 43, 123)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (716, 63, 842)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (717, 27, 774)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (718, 43, 118)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (719, 7, 364)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (720, 75, 282)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (721, 89, 271)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (722, 33, 695)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (723, 7, 566)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (724, 60, 470)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (725, 5, 471)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (726, 74, 486)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (727, 95, 37)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (728, 36, 342)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (729, 92, 206)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (730, 61, 733)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (731, 53, 819)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (732, 22, 761)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (733, 67, 772)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (734, 11, 858)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (735, 7, 183)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (736, 16, 519)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (737, 6, 56)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (738, 15, 84)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (739, 95, 712)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (740, 78, 770)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (741, 3, 455)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (742, 33, 499)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (743, 28, 707)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (744, 57, 971)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (745, 9, 606)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (746, 55, 970)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (747, 82, 108)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (748, 85, 428)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (749, 32, 379)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (750, 3, 648)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (751, 30, 159)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (752, 49, 281)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (753, 49, 680)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (754, 56, 759)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (755, 42, 280)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (756, 76, 270)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (757, 46, 480)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (758, 70, 678)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (759, 40, 423)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (760, 15, 256)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (761, 21, 577)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (762, 23, 368)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (763, 20, 696)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (764, 98, 337)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (765, 100, 454)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (766, 40, 367)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (767, 97, 350)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (768, 62, 482)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (769, 75, 463)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (770, 70, 718)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (771, 44, 211)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (772, 4, 570)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (773, 46, 21)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (774, 32, 631)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (775, 71, 662)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (776, 14, 570)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (777, 58, 910)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (778, 12, 310)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (779, 92, 205)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (780, 21, 689)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (781, 48, 435)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (782, 97, 455)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (783, 84, 124)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (784, 88, 691)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (785, 94, 385)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (786, 90, 496)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (787, 89, 976)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (788, 36, 303)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (789, 59, 310)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (790, 65, 36)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (791, 78, 272)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (792, 60, 186)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (793, 68, 189)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (794, 81, 874)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (795, 25, 722)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (796, 18, 891)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (797, 53, 813)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (798, 56, 296)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (799, 51, 734)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (800, 60, 323)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (801, 52, 32)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (802, 31, 769)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (803, 24, 225)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (804, 71, 627)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (805, 56, 378)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (806, 94, 670)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (807, 26, 389)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (808, 42, 834)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (809, 1, 257)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (810, 92, 33)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (811, 42, 505)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (812, 26, 499)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (813, 8, 160)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (814, 57, 597)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (815, 89, 287)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (816, 96, 563)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (817, 40, 905)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (818, 46, 706)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (819, 66, 807)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (820, 58, 43)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (821, 86, 538)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (822, 74, 828)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (823, 27, 852)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (824, 13, 899)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (825, 95, 368)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (826, 3, 42)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (827, 51, 63)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (828, 5, 174)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (829, 66, 599)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (830, 57, 428)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (831, 91, 328)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (832, 86, 700)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (833, 68, 875)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (834, 63, 411)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (835, 58, 469)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (836, 33, 980)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (837, 18, 402)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (838, 89, 17)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (839, 90, 748)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (840, 61, 218)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (841, 72, 20)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (842, 60, 606)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (843, 61, 222)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (844, 56, 25)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (845, 10, 169)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (846, 70, 122)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (847, 74, 217)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (848, 25, 335)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (849, 42, 147)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (850, 22, 417)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (851, 49, 597)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (852, 45, 980)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (853, 6, 598)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (854, 67, 901)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (855, 40, 391)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (856, 36, 348)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (857, 80, 692)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (858, 8, 763)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (859, 67, 420)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (860, 93, 809)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (861, 37, 37)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (862, 69, 448)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (863, 81, 487)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (864, 87, 724)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (865, 76, 830)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (866, 19, 541)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (867, 75, 514)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (868, 8, 258)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (869, 85, 519)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (870, 77, 988)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (871, 26, 273)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (872, 90, 379)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (873, 83, 712)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (874, 86, 598)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (875, 50, 745)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (876, 22, 78)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (877, 47, 101)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (878, 90, 858)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (879, 38, 784)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (880, 92, 586)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (881, 8, 863)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (882, 17, 755)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (883, 21, 778)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (884, 46, 537)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (885, 56, 162)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (886, 48, 993)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (887, 73, 265)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (888, 23, 76)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (889, 81, 352)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (890, 25, 164)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (891, 69, 594)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (892, 63, 762)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (893, 81, 44)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (894, 27, 270)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (895, 92, 679)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (896, 32, 339)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (897, 17, 40)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (898, 46, 58)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (899, 44, 222)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (900, 76, 521)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (901, 68, 423)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (902, 54, 467)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (903, 61, 830)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (904, 14, 125)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (905, 22, 198)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (906, 23, 305)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (907, 50, 883)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (908, 23, 760)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (909, 91, 432)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (910, 62, 534)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (911, 60, 329)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (912, 57, 764)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (913, 59, 174)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (914, 35, 845)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (915, 79, 618)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (916, 25, 540)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (917, 66, 855)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (918, 47, 931)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (919, 17, 429)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (920, 94, 681)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (921, 12, 330)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (922, 38, 425)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (923, 97, 334)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (924, 53, 976)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (925, 53, 920)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (926, 72, 939)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (927, 45, 635)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (928, 49, 258)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (929, 91, 112)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (930, 7, 622)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (931, 38, 112)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (932, 88, 162)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (933, 11, 204)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (934, 70, 177)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (935, 94, 852)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (936, 88, 466)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (937, 91, 517)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (938, 51, 555)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (939, 47, 604)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (940, 90, 659)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (941, 48, 108)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (942, 2, 653)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (943, 36, 626)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (944, 100, 938)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (945, 47, 628)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (946, 90, 446)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (947, 47, 489)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (948, 69, 935)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (949, 45, 54)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (950, 71, 824)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (951, 42, 857)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (952, 98, 773)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (953, 23, 250)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (954, 30, 971)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (955, 85, 5)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (956, 44, 888)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (957, 55, 235)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (958, 63, 169)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (959, 71, 625)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (960, 14, 259)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (961, 31, 12)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (962, 82, 863)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (963, 18, 491)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (964, 82, 665)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (965, 44, 795)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (966, 41, 83)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (967, 43, 211)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (968, 80, 351)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (969, 92, 411)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (970, 20, 23)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (971, 20, 879)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (972, 25, 632)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (973, 32, 396)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (974, 94, 392)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (975, 18, 574)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (976, 99, 293)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (977, 42, 537)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (978, 31, 166)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (979, 73, 37)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (980, 62, 549)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (981, 36, 794)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (982, 48, 120)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (983, 63, 98)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (984, 83, 512)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (985, 32, 903)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (986, 6, 552)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (987, 84, 568)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (988, 54, 813)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (989, 60, 671)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (990, 90, 5)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (991, 50, 54)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (992, 63, 342)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (993, 23, 820)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (994, 31, 454)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (995, 44, 502)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (996, 44, 125)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1001, 104, 48)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1003, 104, 127)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1005, 44, 48)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1006, 103, 48)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1008, 51, 48)
GO
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1009, 103, 203)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1022, 44, 85)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1029, 112, 85)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1030, 112, 45)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1031, 112, 789)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1032, 112, 6)
INSERT [dbo].[StudentClasses] ([StudentClassID], [ClassID], [StudentID]) VALUES (1033, 112, 88)
SET IDENTITY_INSERT [dbo].[StudentClasses] OFF
SET IDENTITY_INSERT [dbo].[StudentClassHatDraw] ON 

INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1, 22, 544, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (2, 77, 782, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (3, 6, 754, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (4, 39, 346, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (5, 54, 957, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (6, 27, 300, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (7, 96, 697, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (8, 2, 656, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (9, 74, 400, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (10, 24, 889, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (11, 43, 125, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (12, 5, 369, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (13, 25, 900, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (14, 8, 602, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (15, 74, 923, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (16, 15, 619, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (17, 88, 105, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (18, 39, 306, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (19, 18, 190, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (20, 87, 56, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (21, 45, 333, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (22, 85, 289, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (23, 17, 855, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (24, 17, 740, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (25, 92, 435, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (26, 71, 477, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (27, 40, 737, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (28, 34, 509, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (29, 4, 987, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (30, 79, 614, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (31, 85, 470, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (32, 13, 850, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (33, 74, 516, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (34, 30, 654, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (35, 74, 163, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (36, 43, 213, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (37, 15, 172, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (38, 29, 436, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (39, 5, 823, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (40, 1, 687, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (41, 75, 969, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (42, 17, 183, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (43, 24, 915, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (44, 49, 307, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (45, 7, 326, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (46, 52, 228, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (47, 89, 314, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (48, 8, 930, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (49, 4, 304, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (50, 98, 888, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (51, 87, 405, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (52, 81, 215, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (53, 41, 489, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (54, 13, 534, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (55, 59, 198, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (56, 12, 890, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (57, 54, 188, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (58, 6, 955, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (59, 9, 399, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (60, 58, 26, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (61, 37, 566, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (62, 36, 703, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (63, 18, 257, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (64, 80, 740, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (65, 30, 859, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (66, 17, 256, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (67, 51, 203, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (68, 84, 441, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (69, 99, 166, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (70, 71, 454, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (71, 44, 286, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (72, 83, 705, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (73, 100, 68, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (74, 29, 479, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (75, 39, 996, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (76, 77, 325, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (77, 11, 968, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (78, 48, 629, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (80, 85, 579, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (81, 47, 182, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (82, 49, 962, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (83, 54, 470, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (84, 58, 360, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (85, 33, 521, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (86, 6, 895, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (87, 87, 57, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (88, 32, 461, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (89, 2, 704, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (90, 20, 820, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (91, 68, 389, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (92, 66, 837, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (93, 91, 238, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (94, 38, 44, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (95, 12, 777, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (96, 66, 681, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (97, 40, 118, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (98, 85, 425, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (99, 47, 979, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (100, 26, 321, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (101, 81, 838, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (102, 16, 764, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (103, 63, 510, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (104, 21, 755, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (105, 9, 862, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (106, 18, 344, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (107, 49, 990, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (108, 100, 64, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (109, 54, 411, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (110, 84, 174, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (111, 42, 912, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (112, 15, 620, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (113, 71, 500, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (114, 55, 120, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (115, 12, 392, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (116, 25, 89, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (117, 34, 994, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (118, 20, 772, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (119, 1, 103, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (120, 51, 689, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (121, 51, 693, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (122, 65, 86, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (123, 25, 892, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (124, 83, 973, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (125, 58, 273, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (126, 54, 960, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (127, 48, 430, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (128, 92, 632, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (129, 17, 446, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (130, 23, 13, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (131, 65, 732, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (132, 2, 7, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (133, 13, 958, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (134, 94, 976, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (135, 40, 274, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (136, 36, 905, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (137, 4, 469, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (138, 76, 64, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (139, 57, 760, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (140, 36, 662, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (141, 20, 354, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (142, 70, 490, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (143, 23, 496, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (144, 97, 985, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (145, 25, 250, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (146, 78, 375, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (147, 90, 680, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (148, 77, 343, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (149, 97, 231, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (150, 83, 598, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (151, 31, 79, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (152, 3, 935, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (153, 47, 633, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (154, 46, 1, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (155, 100, 821, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (156, 70, 663, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (157, 80, 249, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (158, 16, 708, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (159, 75, 690, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (160, 6, 641, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (161, 18, 6, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (162, 86, 711, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (163, 84, 334, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (164, 86, 60, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (165, 89, 959, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (166, 70, 307, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (167, 76, 452, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (168, 5, 362, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (169, 31, 979, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (170, 13, 598, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (171, 19, 942, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (172, 8, 423, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (173, 42, 299, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (174, 59, 360, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (175, 67, 904, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (176, 60, 786, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (177, 60, 746, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (178, 38, 279, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (179, 68, 246, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (180, 19, 674, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (181, 80, 48, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (182, 80, 143, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (183, 89, 512, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (184, 86, 294, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (185, 36, 965, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (186, 78, 814, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (187, 35, 646, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (188, 87, 210, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (189, 32, 30, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (190, 80, 15, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (191, 1, 268, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (192, 88, 585, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (193, 25, 939, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (194, 94, 720, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (195, 37, 19, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (196, 46, 882, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (197, 76, 9, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (198, 6, 436, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (199, 98, 489, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (200, 61, 323, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (201, 60, 533, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (202, 53, 311, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (203, 63, 225, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (204, 75, 354, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (205, 7, 438, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (206, 26, 252, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (207, 88, 76, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (208, 60, 200, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (209, 98, 248, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (210, 21, 528, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (211, 32, 553, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (212, 36, 952, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (213, 7, 589, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (214, 11, 490, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (215, 20, 778, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (216, 71, 200, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (217, 72, 594, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (219, 40, 225, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (220, 75, 704, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (221, 99, 573, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (222, 86, 866, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (223, 5, 341, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (224, 15, 995, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (225, 87, 135, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (226, 7, 94, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (227, 25, 870, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (228, 79, 803, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (229, 80, 340, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (230, 58, 501, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (231, 20, 858, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (232, 98, 642, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (233, 40, 981, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (234, 53, 229, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (235, 88, 445, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (236, 33, 320, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (237, 86, 411, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (238, 2, 220, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (239, 13, 878, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (240, 27, 801, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (241, 17, 382, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (242, 85, 322, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (243, 58, 664, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (244, 7, 285, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (245, 42, 214, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (246, 94, 8, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (247, 49, 840, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (248, 96, 822, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (249, 74, 482, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (250, 89, 658, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (251, 65, 786, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (252, 18, 201, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (253, 55, 837, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (254, 81, 485, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (255, 57, 800, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (256, 47, 841, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (257, 55, 98, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (258, 48, 19, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (259, 41, 970, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (260, 51, 152, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (261, 1, 849, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (262, 33, 873, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (263, 71, 803, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (264, 45, 725, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (265, 29, 554, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (266, 29, 868, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (267, 18, 922, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (268, 73, 639, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (269, 34, 713, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (270, 23, 459, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (271, 34, 26, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (272, 39, 687, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (273, 84, 885, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (274, 74, 721, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (275, 85, 485, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (276, 67, 818, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (277, 7, 206, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (278, 32, 279, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (279, 25, 938, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (280, 64, 770, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (281, 2, 287, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (282, 96, 87, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (283, 56, 436, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (284, 30, 738, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (285, 36, 358, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (286, 15, 4, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (287, 77, 809, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (288, 81, 202, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (289, 87, 524, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (290, 7, 674, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (291, 49, 715, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (292, 99, 415, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (293, 80, 138, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (294, 95, 188, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (295, 55, 784, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (296, 77, 61, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (297, 40, 336, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (298, 16, 985, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (299, 53, 694, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (300, 9, 317, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (301, 69, 995, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (302, 9, 985, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (303, 43, 950, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (304, 39, 842, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (305, 29, 250, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (306, 67, 247, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (307, 24, 824, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (308, 16, 180, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (309, 24, 964, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (310, 31, 484, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (311, 51, 579, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (312, 43, 60, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (313, 44, 4, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (314, 100, 797, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (315, 84, 658, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (316, 25, 405, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (317, 72, 583, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (318, 4, 143, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (319, 9, 1000, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (320, 20, 687, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (321, 64, 56, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (322, 75, 536, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (323, 75, 869, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (324, 3, 510, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (325, 72, 741, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (326, 61, 368, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (327, 37, 881, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (328, 80, 996, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (329, 94, 716, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (330, 21, 787, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (331, 71, 283, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (332, 50, 94, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (333, 93, 202, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (334, 82, 173, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (335, 89, 221, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (336, 20, 576, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (337, 100, 222, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (338, 65, 905, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (339, 36, 863, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (340, 52, 192, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (341, 61, 48, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (342, 24, 952, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (343, 75, 905, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (344, 19, 534, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (345, 33, 387, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (346, 97, 732, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (347, 73, 957, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (348, 69, 248, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (349, 59, 724, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (350, 86, 352, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (351, 38, 184, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (352, 52, 858, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (353, 80, 887, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (354, 13, 452, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (355, 23, 198, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (356, 56, 434, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (357, 85, 629, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (358, 81, 593, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (359, 26, 339, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (360, 3, 368, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (361, 86, 796, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (362, 31, 997, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (363, 38, 175, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (364, 43, 870, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (365, 94, 515, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (366, 79, 769, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (367, 69, 732, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (368, 52, 498, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (369, 45, 517, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (370, 65, 245, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (371, 27, 348, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (372, 74, 689, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (373, 4, 845, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (374, 97, 429, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (375, 27, 248, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (376, 57, 179, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (377, 87, 79, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (378, 7, 841, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (379, 77, 371, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (380, 49, 975, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (381, 36, 843, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (382, 73, 42, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (383, 84, 558, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (384, 89, 284, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (385, 38, 875, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (386, 45, 987, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (387, 43, 622, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (388, 65, 125, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (389, 21, 553, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (390, 24, 710, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (391, 76, 966, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (392, 32, 438, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (393, 66, 368, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (394, 16, 90, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (395, 28, 292, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (396, 54, 145, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (397, 45, 941, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (398, 3, 508, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (399, 12, 375, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (400, 63, 201, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (401, 11, 778, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (402, 27, 454, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (403, 61, 970, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (404, 82, 699, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (405, 50, 545, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (406, 74, 435, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (407, 88, 745, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (408, 91, 443, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (409, 14, 224, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (410, 72, 459, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (411, 80, 928, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (412, 95, 794, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (413, 52, 783, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (414, 67, 826, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (415, 14, 67, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (416, 44, 69, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (417, 14, 604, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (418, 100, 847, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (419, 52, 763, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (420, 47, 895, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (421, 100, 475, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (422, 1, 539, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (423, 28, 539, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (424, 54, 230, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (425, 77, 420, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (426, 59, 296, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (427, 74, 762, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (428, 78, 930, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (429, 26, 563, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (430, 37, 243, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (431, 57, 213, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (432, 39, 786, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (433, 32, 235, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (434, 4, 434, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (435, 80, 286, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (436, 15, 404, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (437, 60, 906, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (438, 95, 259, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (439, 54, 57, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (440, 50, 413, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (441, 66, 644, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (442, 41, 527, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (443, 65, 644, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (444, 71, 304, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (445, 6, 776, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (446, 16, 786, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (447, 74, 796, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (448, 58, 949, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (449, 9, 894, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (450, 83, 999, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (451, 35, 512, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (452, 49, 672, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (453, 57, 970, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (454, 75, 531, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (455, 42, 74, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (456, 72, 195, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (457, 35, 433, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (458, 14, 383, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (459, 12, 93, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (460, 1, 132, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (461, 13, 156, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (462, 74, 517, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (463, 28, 312, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (464, 57, 512, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (465, 11, 735, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (466, 93, 800, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (467, 44, 154, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (468, 32, 293, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (469, 7, 590, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (470, 64, 552, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (471, 33, 57, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (472, 21, 731, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (473, 81, 102, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (474, 3, 939, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (475, 8, 965, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (476, 24, 795, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (477, 6, 149, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (478, 21, 112, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (479, 32, 967, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (480, 46, 351, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (481, 54, 394, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (482, 26, 493, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (483, 38, 103, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (484, 58, 64, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (485, 70, 899, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (486, 39, 363, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (487, 41, 932, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (488, 24, 420, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (489, 29, 863, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (490, 48, 472, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (491, 49, 889, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (492, 67, 128, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (493, 8, 740, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (494, 18, 557, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (495, 51, 261, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (496, 93, 91, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (497, 78, 956, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (498, 53, 345, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (499, 1, 795, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (500, 8, 750, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (501, 9, 783, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (502, 81, 740, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (503, 64, 866, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (504, 79, 278, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (505, 5, 380, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (506, 61, 955, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (507, 38, 778, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (508, 79, 52, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (509, 14, 355, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (510, 50, 28, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (511, 90, 805, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (512, 45, 808, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (513, 95, 743, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (514, 28, 796, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (515, 49, 545, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (516, 30, 454, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (517, 28, 99, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (518, 55, 250, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (519, 4, 98, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (520, 74, 302, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (521, 70, 614, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (522, 14, 589, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (523, 12, 950, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (524, 59, 798, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (525, 2, 620, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (526, 80, 501, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (527, 100, 972, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (528, 73, 873, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (529, 89, 399, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (530, 73, 584, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (531, 84, 426, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (532, 68, 378, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (533, 74, 35, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (534, 17, 19, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (535, 72, 361, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (536, 73, 221, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (537, 82, 247, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (538, 32, 514, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (539, 69, 131, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (540, 15, 459, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (541, 65, 509, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (542, 85, 490, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (543, 40, 228, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (544, 57, 918, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (545, 73, 772, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (546, 70, 152, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (547, 72, 637, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (548, 68, 403, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (549, 77, 352, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (550, 85, 168, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (551, 3, 808, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (552, 95, 704, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (553, 26, 540, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (554, 38, 887, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (555, 96, 680, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (556, 13, 195, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (557, 69, 195, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (558, 35, 182, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (559, 59, 59, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (560, 99, 433, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (561, 35, 101, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (562, 19, 669, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (563, 76, 663, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (564, 15, 364, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (565, 69, 700, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (566, 29, 964, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (567, 20, 786, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (568, 100, 554, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (569, 30, 582, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (570, 99, 314, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (571, 11, 816, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (572, 50, 85, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (573, 98, 254, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (574, 72, 826, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (575, 38, 868, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (576, 70, 217, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (577, 40, 563, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (578, 75, 930, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (579, 69, 947, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (580, 78, 237, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (581, 71, 981, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (582, 85, 380, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (583, 85, 821, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (584, 77, 309, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (585, 55, 901, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (586, 33, 628, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (587, 67, 129, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (588, 94, 429, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (589, 46, 579, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (590, 93, 636, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (591, 34, 557, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (592, 65, 256, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (593, 67, 473, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (594, 35, 32, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (595, 64, 823, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (596, 52, 462, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (597, 88, 534, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (598, 1, 890, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (599, 33, 895, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (600, 14, 811, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (601, 35, 640, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (602, 31, 778, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (603, 90, 235, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (604, 17, 280, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (605, 14, 876, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (606, 53, 48, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (607, 40, 348, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (608, 82, 826, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (609, 93, 763, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (610, 24, 994, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (611, 54, 874, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (612, 71, 614, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (613, 100, 93, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (614, 4, 637, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (615, 88, 442, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (616, 57, 744, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (617, 16, 247, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (618, 14, 979, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (619, 86, 327, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (620, 17, 904, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (621, 4, 101, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (622, 97, 613, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (623, 78, 876, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (624, 37, 654, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (625, 28, 14, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (626, 50, 244, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (627, 9, 871, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (628, 76, 110, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (629, 72, 693, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (630, 18, 279, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (631, 94, 647, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (632, 50, 643, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (633, 82, 235, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (634, 23, 974, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (635, 63, 694, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (636, 89, 734, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (637, 48, 773, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (638, 87, 614, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (639, 23, 744, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (640, 36, 414, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (641, 37, 161, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (642, 42, 867, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (643, 26, 785, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (644, 52, 195, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (645, 18, 737, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (646, 96, 54, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (647, 27, 517, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (648, 94, 122, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (649, 19, 161, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (650, 48, 442, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (651, 76, 698, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (652, 84, 443, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (653, 63, 151, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (654, 26, 466, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (655, 31, 560, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (656, 19, 788, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (657, 5, 585, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (658, 65, 624, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (659, 79, 455, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (660, 24, 340, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (661, 28, 890, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (662, 64, 728, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (663, 67, 22, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (664, 70, 855, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (665, 41, 346, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (666, 80, 230, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (667, 84, 685, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (668, 98, 815, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (669, 84, 831, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (670, 14, 282, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (671, 9, 857, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (672, 11, 681, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (673, 26, 879, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (674, 52, 325, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (675, 79, 348, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (676, 74, 461, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (677, 64, 787, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (678, 34, 838, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (679, 19, 185, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (680, 34, 119, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (681, 46, 584, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (682, 12, 900, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (683, 40, 69, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (684, 79, 490, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (685, 20, 104, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (686, 92, 239, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (687, 88, 661, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (688, 90, 538, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (689, 15, 570, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (690, 61, 1000, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (691, 10, 43, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (692, 70, 413, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (693, 71, 849, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (694, 10, 980, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (695, 29, 786, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (696, 73, 711, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (697, 52, 246, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (698, 55, 274, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (699, 32, 14, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (700, 16, 619, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (701, 66, 767, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (702, 52, 399, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (703, 31, 195, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (704, 68, 849, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (705, 30, 41, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (706, 5, 675, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (707, 88, 108, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (708, 34, 868, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (709, 89, 735, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (710, 80, 969, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (711, 17, 903, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (712, 88, 439, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (713, 55, 443, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (714, 1, 376, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (715, 43, 123, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (716, 63, 842, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (717, 27, 774, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (718, 43, 118, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (719, 7, 364, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (720, 75, 282, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (721, 89, 271, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (722, 33, 695, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (723, 7, 566, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (724, 60, 470, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (725, 5, 471, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (726, 74, 486, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (727, 95, 37, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (728, 36, 342, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (729, 92, 206, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (730, 61, 733, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (731, 53, 819, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (732, 22, 761, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (733, 67, 772, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (734, 11, 858, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (735, 7, 183, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (736, 16, 519, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (737, 6, 56, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (738, 15, 84, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (739, 95, 712, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (740, 78, 770, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (741, 3, 455, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (742, 33, 499, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (743, 28, 707, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (744, 57, 971, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (745, 9, 606, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (746, 55, 970, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (747, 82, 108, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (748, 85, 428, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (749, 32, 379, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (750, 3, 648, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (751, 30, 159, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (752, 49, 281, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (753, 49, 680, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (754, 56, 759, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (755, 42, 280, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (756, 76, 270, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (757, 46, 480, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (758, 70, 678, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (759, 40, 423, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (760, 15, 256, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (761, 21, 577, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (762, 23, 368, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (763, 20, 696, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (764, 98, 337, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (765, 100, 454, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (766, 40, 367, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (767, 97, 350, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (768, 62, 482, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (769, 75, 463, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (770, 70, 718, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (771, 44, 211, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (772, 4, 570, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (773, 46, 21, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (774, 32, 631, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (775, 71, 662, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (776, 14, 570, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (777, 58, 910, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (778, 12, 310, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (779, 92, 205, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (780, 21, 689, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (781, 48, 435, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (782, 97, 455, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (783, 84, 124, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (784, 88, 691, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (785, 94, 385, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (786, 90, 496, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (787, 89, 976, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (788, 36, 303, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (789, 59, 310, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (790, 65, 36, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (791, 78, 272, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (792, 60, 186, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (793, 68, 189, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (794, 81, 874, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (795, 25, 722, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (796, 18, 891, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (797, 53, 813, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (798, 56, 296, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (799, 51, 734, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (800, 60, 323, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (801, 52, 32, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (802, 31, 769, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (803, 24, 225, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (804, 71, 627, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (805, 56, 378, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (806, 94, 670, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (807, 26, 389, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (808, 42, 834, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (809, 1, 257, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (810, 92, 33, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (811, 42, 505, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (812, 26, 499, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (813, 8, 160, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (814, 57, 597, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (815, 89, 287, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (816, 96, 563, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (817, 40, 905, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (818, 46, 706, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (819, 66, 807, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (820, 58, 43, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (821, 86, 538, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (822, 74, 828, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (823, 27, 852, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (824, 13, 899, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (825, 95, 368, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (826, 3, 42, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (827, 51, 63, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (828, 5, 174, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (829, 66, 599, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (830, 57, 428, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (831, 91, 328, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (832, 86, 700, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (833, 68, 875, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (834, 63, 411, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (835, 58, 469, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (836, 33, 980, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (837, 18, 402, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (838, 89, 17, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (839, 90, 748, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (840, 61, 218, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (841, 72, 20, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (842, 60, 606, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (843, 61, 222, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (844, 56, 25, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (845, 10, 169, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (846, 70, 122, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (847, 74, 217, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (848, 25, 335, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (849, 42, 147, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (850, 22, 417, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (851, 49, 597, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (852, 45, 980, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (853, 6, 598, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (854, 67, 901, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (855, 40, 391, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (856, 36, 348, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (857, 80, 692, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (858, 8, 763, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (859, 67, 420, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (860, 93, 809, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (861, 37, 37, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (862, 69, 448, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (863, 81, 487, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (864, 87, 724, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (865, 76, 830, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (866, 19, 541, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (867, 75, 514, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (868, 8, 258, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (869, 85, 519, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (870, 77, 988, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (871, 26, 273, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (872, 90, 379, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (873, 83, 712, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (874, 86, 598, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (875, 50, 745, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (876, 22, 78, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (877, 47, 101, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (878, 90, 858, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (879, 38, 784, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (880, 92, 586, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (881, 8, 863, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (882, 17, 755, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (883, 21, 778, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (884, 46, 537, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (885, 56, 162, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (886, 48, 993, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (887, 73, 265, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (888, 23, 76, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (889, 81, 352, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (890, 25, 164, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (891, 69, 594, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (892, 63, 762, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (893, 81, 44, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (894, 27, 270, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (895, 92, 679, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (896, 32, 339, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (897, 17, 40, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (898, 46, 58, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (899, 44, 222, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (900, 76, 521, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (901, 68, 423, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (902, 54, 467, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (903, 61, 830, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (904, 14, 125, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (905, 22, 198, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (906, 23, 305, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (907, 50, 883, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (908, 23, 760, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (909, 91, 432, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (910, 62, 534, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (911, 60, 329, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (912, 57, 764, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (913, 59, 174, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (914, 35, 845, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (915, 79, 618, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (916, 25, 540, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (917, 66, 855, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (918, 47, 931, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (919, 17, 429, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (920, 94, 681, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (921, 12, 330, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (922, 38, 425, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (923, 97, 334, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (924, 53, 976, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (925, 53, 920, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (926, 72, 939, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (927, 45, 635, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (928, 49, 258, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (929, 91, 112, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (930, 7, 622, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (931, 38, 112, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (932, 88, 162, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (933, 11, 204, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (934, 70, 177, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (935, 94, 852, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (936, 88, 466, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (937, 91, 517, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (938, 51, 555, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (939, 47, 604, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (940, 90, 659, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (941, 48, 108, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (942, 2, 653, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (943, 36, 626, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (944, 100, 938, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (945, 47, 628, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (946, 90, 446, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (947, 47, 489, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (948, 69, 935, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (949, 45, 54, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (950, 71, 824, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (951, 42, 857, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (952, 98, 773, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (953, 23, 250, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (954, 30, 971, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (955, 85, 5, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (956, 44, 888, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (957, 55, 235, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (958, 63, 169, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (959, 71, 625, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (960, 14, 259, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (961, 31, 12, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (962, 82, 863, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (963, 18, 491, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (964, 82, 665, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (965, 44, 795, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (966, 41, 83, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (967, 43, 211, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (968, 80, 351, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (969, 92, 411, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (970, 20, 23, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (971, 20, 879, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (972, 25, 632, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (973, 32, 396, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (974, 94, 392, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (975, 18, 574, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (976, 99, 293, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (977, 42, 537, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (978, 31, 166, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (979, 73, 37, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (980, 62, 549, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (981, 36, 794, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (982, 48, 120, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (983, 63, 98, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (984, 83, 512, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (985, 32, 903, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (986, 6, 552, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (987, 84, 568, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (988, 54, 813, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (989, 60, 671, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (990, 90, 5, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (991, 50, 54, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (992, 63, 342, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (993, 23, 820, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (994, 31, 454, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (995, 44, 502, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (996, 44, 125, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1001, 104, 48, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1003, 104, 127, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1005, 44, 48, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1006, 103, 48, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1008, 51, 48, 0)
GO
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1009, 103, 203, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1022, 44, 85, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1029, 112, 85, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1030, 112, 45, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1031, 112, 789, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1032, 112, 6, 0)
INSERT [dbo].[StudentClassHatDraw] ([HatDrawID], [ClassID], [StudentID], [Drawn]) VALUES (1033, 112, 88, 0)
SET IDENTITY_INSERT [dbo].[StudentClassHatDraw] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (1, N'Norris', N'Skoughman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (2, N'Consolata', N'Pennaman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (3, N'Garret', N'Schubbert')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (4, N'Maryellen', N'Harnor')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (5, N'Ashton', N'Steckings')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (6, N'Britney', N'Creech')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (7, N'Woodie', N'Lorrain')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (8, N'Ruprecht', N'Habens')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (9, N'Gustavo', N'Pellew')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (10, N'Camala', N'Rumney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (11, N'Kellby', N'De la Barre')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (12, N'Maurise', N'Mander')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (13, N'Amaleta', N'Bubbear')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (14, N'Gretel', N'Echelle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (15, N'Keeley', N'Loveland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (16, N'Brocky', N'Redholls')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (17, N'Adda', N'Brunelli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (18, N'Dorolice', N'Scemp')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (19, N'Eugene', N'Walker')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (20, N'Ketty', N'Whye')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (21, N'Mohandis', N'Oulner')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (22, N'Silvio', N'Middlemist')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (23, N'Lilian', N'Jindrak')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (24, N'Marleah', N'Dumphry')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (25, N'Phaidra', N'Duferie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (26, N'Glennie', N'Daybell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (27, N'Kandy', N'MacCart')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (28, N'Stepha', N'Fishbourne')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (29, N'Ally', N'Partlett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (30, N'Tallie', N'Brims')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (31, N'Cully', N'Elfes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (32, N'Darice', N'Maskall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (33, N'Stevy', N'Pressman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (34, N'Jim', N'Agiolfinger')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (35, N'Tiertza', N'Caldairou')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (36, N'Padriac', N'Powles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (37, N'Nata', N'Denys')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (38, N'Urbanus', N'Storks')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (39, N'Gerek', N'Rosgen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (40, N'Ronna', N'Gandley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (41, N'Merle', N'Henrie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (42, N'Beverlie', N'Speed')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (43, N'Taddeusz', N'Balchin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (44, N'Goldia', N'Welfare')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (45, N'Kincaid', N'Sorrel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (46, N'Bernetta', N'Comrie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (47, N'Bridget', N'Brizell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (48, N'Rici', N'Gehrts')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (49, N'Melisenda', N'Ruck')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (50, N'Kimberley', N'Lemmer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (51, N'Lenora', N'Gerlts')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (52, N'Karon', N'Kleisle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (53, N'Kim', N'Skillanders')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (54, N'Reeba', N'Jerdein')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (55, N'Delmor', N'Clingoe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (56, N'Rayna', N'Swiffin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (57, N'Renae', N'O''Loughlin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (58, N'Cherilynn', N'Happs')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (59, N'Belinda', N'Paterson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (60, N'Josie', N'Fuller')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (61, N'Annadiane', N'Capelle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (62, N'Shurlocke', N'Winfield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (63, N'Olivette', N'Yaxley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (64, N'Malissa', N'Bunford')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (65, N'Sosanna', N'Laffling')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (66, N'Orelie', N'Dooney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (67, N'Filberto', N'Paraman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (68, N'Ilise', N'Marten')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (69, N'Jordanna', N'Battersby')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (70, N'Rosanna', N'Redrup')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (71, N'Jervis', N'Longstreeth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (72, N'Odilia', N'Clowney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (73, N'Misti', N'Cossell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (74, N'Rockwell', N'Cordelette')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (75, N'Ulric', N'Faldo')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (76, N'Jeth', N'Wybron')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (77, N'Shawna', N'Apdell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (78, N'Candide', N'Knightsbridge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (79, N'Scotty', N'Duffan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (80, N'Guillema', N'Scandred')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (81, N'Karrie', N'Summerbell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (82, N'Tawsha', N'Godin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (83, N'Kirby', N'Crolly')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (84, N'Toddy', N'Dearness')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (85, N'Russ', N'Saile')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (86, N'Salvatore', N'Berka')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (87, N'Johnathon', N'Deelay')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (88, N'Abbe', N'Mounch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (89, N'Algernon', N'Lanchbery')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (90, N'Creight', N'Brinkley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (91, N'Abbie', N'Foystone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (92, N'Erwin', N'Sillwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (93, N'Tanney', N'Persian')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (94, N'Yolande', N'Muslim')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (95, N'Riane', N'Zukierman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (96, N'Danie', N'Ricardot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (97, N'Moselle', N'Worstall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (98, N'Ryann', N'Vaissiere')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (99, N'Lorin', N'Teasey')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (100, N'Gabby', N'Halversen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (101, N'Natka', N'Bichener')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (102, N'Garrek', N'Crumbie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (103, N'Cecil', N'MacCahey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (104, N'Erhard', N'Pallaske')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (105, N'Bambi', N'Huggin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (106, N'Laureen', N'Eilert')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (107, N'Edeline', N'Lightbowne')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (108, N'Derek', N'Cardero')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (109, N'Stanwood', N'Rany')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (110, N'Galen', N'Gossling')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (111, N'Trude', N'Smithson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (112, N'Lucretia', N'Skelbeck')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (113, N'Merrill', N'McGurk')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (114, N'Nissa', N'O''Rourke')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (115, N'Vassili', N'Philbrick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (116, N'Guglielma', N'Ibeson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (117, N'Tedra', N'Gonnard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (118, N'Leena', N'Glastonbury')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (119, N'Rae', N'Zanassi')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (120, N'Joleen', N'Grombridge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (121, N'Penrod', N'Sayce')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (122, N'Jessalin', N'Garmston')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (123, N'Stern', N'Ucceli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (124, N'Chadwick', N'Simmig')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (125, N'Rey', N'Copland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (126, N'Hort', N'Glewe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (127, N'Felicdad', N'Nasey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (128, N'Trumaine', N'Spain')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (129, N'Bronny', N'Rapier')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (130, N'Allene', N'Pettingall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (131, N'Lothario', N'Van Arsdalen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (132, N'Hammad', N'Blankhorn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (133, N'Mata', N'Ferrick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (134, N'Therese', N'Buxsey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (135, N'Sileas', N'Leggat')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (136, N'Jilli', N'Commusso')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (137, N'Shoshana', N'Covey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (138, N'Dina', N'Staunton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (139, N'Lishe', N'Greenless')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (140, N'Alethea', N'Gribbell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (141, N'Muffin', N'Luberto')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (142, N'Fabe', N'Lippett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (143, N'Ardelis', N'Eary')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (144, N'Raddie', N'Ochiltree')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (145, N'Berthe', N'Kerrich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (146, N'Alfons', N'Breckon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (147, N'Zsazsa', N'Balassi')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (148, N'Marnie', N'Lantry')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (149, N'Jasper', N'Aberdeen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (150, N'Flinn', N'Shawyer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (151, N'Jayme', N'Ianniello')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (152, N'Brady', N'Albrighton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (153, N'Yettie', N'Whittington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (154, N'Athena', N'Scholz')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (155, N'Rory', N'Cruikshanks')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (156, N'Quinlan', N'Rennick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (157, N'Fulton', N'Waggatt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (158, N'Hatty', N'Cheson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (159, N'Nester', N'Hindes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (160, N'Clarine', N'Hursey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (161, N'Chane', N'Smewings')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (162, N'Quinlan', N'Silversmidt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (163, N'Cross', N'Romushkin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (164, N'Cara', N'Reeson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (165, N'Lolly', N'Dane')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (166, N'Ailsun', N'Bromet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (167, N'Kendricks', N'Sollime')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (168, N'Juanita', N'Westrope')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (169, N'Conan', N'Enriques')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (170, N'Dixie', N'Karel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (171, N'Damien', N'Futty')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (172, N'Eunice', N'Yardy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (173, N'Lise', N'Sandys')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (174, N'Loria', N'Gowenlock')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (175, N'Nikolaos', N'Kail')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (176, N'Wheeler', N'Hovard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (177, N'Austina', N'Raymont')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (178, N'Joycelin', N'Putland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (179, N'Culley', N'Syphus')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (180, N'Ceciley', N'Hardwich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (181, N'Darlleen', N'Arnaut')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (182, N'Gris', N'McCrachen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (183, N'Elsey', N'Ausiello')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (184, N'Jackquelin', N'Buie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (185, N'Eugenio', N'Wormald')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (186, N'Alecia', N'Koomar')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (187, N'Tabatha', N'Hadenton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (188, N'Rina', N'Ianni')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (189, N'Yvor', N'Di Napoli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (190, N'Elwira', N'Sheals')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (191, N'Mallorie', N'Chagg')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (192, N'Reba', N'MacSporran')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (193, N'Johannes', N'Rassmann')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (194, N'Eba', N'Wederell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (195, N'Ferne', N'Rangle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (196, N'Milicent', N'Warwicker')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (197, N'Corilla', N'Scotchmer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (198, N'Mickie', N'Howden')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (199, N'Rosanne', N'Mockler')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (200, N'Demetrius', N'Oldacres')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (201, N'Letti', N'Berrecloth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (202, N'Sisile', N'Bicheno')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (203, N'Stanislaw', N'Matyushenko')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (204, N'Bevon', N'Kernaghan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (205, N'Rainer', N'Haycraft')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (206, N'Derick', N'Banbrigge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (207, N'Gregg', N'Geggie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (208, N'Bernhard', N'Cochet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (209, N'Tobit', N'Screase')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (210, N'Shadow', N'Bird')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (211, N'Jasen', N'Heskey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (212, N'Shelby', N'Moy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (213, N'Ines', N'Sedgwick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (214, N'Magnum', N'Robez')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (215, N'Maude', N'Laslett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (216, N'Gal', N'Gurwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (217, N'Velma', N'Ablewhite')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (218, N'Thane', N'Mathews')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (219, N'Bette', N'Salter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (220, N'Eadie', N'Childe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (221, N'Ros', N'Spurett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (222, N'Jecho', N'Clowes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (223, N'Roxy', N'Dunmore')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (224, N'Dinnie', N'Keetley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (225, N'Cammie', N'Tapsfield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (226, N'Carlene', N'Magson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (227, N'Pepita', N'Heber')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (228, N'Ambrose', N'Borrows')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (229, N'Kaspar', N'Lebang')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (230, N'Antonetta', N'Winckles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (231, N'Jasen', N'Stonbridge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (232, N'Prissie', N'Boatwright')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (233, N'Aristotle', N'Vallerine')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (234, N'Nanine', N'Skaif')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (235, N'Solly', N'Sudron')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (236, N'Leticia', N'Thursfield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (237, N'Marcelline', N'Fothergill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (238, N'Noak', N'Rutland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (239, N'Othello', N'Mylechreest')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (240, N'Dex', N'Widdicombe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (241, N'Diannne', N'Rosettini')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (242, N'Baillie', N'Baggott')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (243, N'Hedda', N'Feragh')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (244, N'Kaylee', N'Lindenbaum')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (245, N'Renard', N'Gudge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (246, N'Lek', N'Saturley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (247, N'Adelice', N'Greensmith')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (248, N'Cindie', N'Hiscocks')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (249, N'Salvatore', N'Woodnutt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (250, N'Bord', N'Pykett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (251, N'Cam', N'Kupper')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (252, N'Delila', N'Mushrow')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (253, N'Lesley', N'Loxdale')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (254, N'Urbanus', N'Cubbon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (255, N'Betty', N'Estick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (256, N'Drucill', N'Escala')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (257, N'Tobie', N'Burchnall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (258, N'Mab', N'D''Alessandro')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (259, N'Waldemar', N'Presdie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (260, N'Ki', N'Sigars')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (261, N'Baxter', N'Harden')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (262, N'Cosme', N'Lillistone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (263, N'Jessie', N'Windaybank')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (264, N'Maxwell', N'Bartoloma')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (265, N'Bridgette', N'McNuff')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (266, N'Libby', N'Huikerby')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (267, N'Bernard', N'Guerreiro')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (268, N'Nealson', N'Sussex')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (269, N'Sunny', N'Ruckhard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (270, N'Dugald', N'Sach')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (271, N'Anders', N'Gatteridge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (272, N'Harmonia', N'Ahrendsen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (273, N'Ephrem', N'Wais')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (274, N'Aili', N'Soot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (275, N'Jobie', N'Brankley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (276, N'Jacquelyn', N'Boon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (277, N'Godfry', N'Hansard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (278, N'Padget', N'Pheasant')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (279, N'Barbi', N'Magnar')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (280, N'Parsifal', N'McOwen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (281, N'Madelaine', N'Biner')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (282, N'Issiah', N'Antonchik')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (283, N'Ami', N'Yelding')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (284, N'Ekaterina', N'Ebbers')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (285, N'Jacinda', N'Hlavecek')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (286, N'Emma', N'Veregan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (287, N'Adeline', N'Woodyear')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (288, N'Barton', N'Bruun')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (289, N'Gui', N'Arnaudin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (290, N'Davita', N'McPhillimey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (291, N'Janek', N'McCue')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (292, N'Myrta', N'Wadsworth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (293, N'Martie', N'Stubbe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (294, N'Evanne', N'Hallbord')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (295, N'Alia', N'Leicester')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (296, N'Katharyn', N'Brunt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (297, N'Skipp', N'Rowaszkiewicz')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (298, N'Hyacinth', N'Celloni')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (299, N'Gasper', N'Antecki')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (300, N'Wildon', N'Rissom')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (301, N'Lilias', N'Aiston')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (302, N'Cristin', N'Gullane')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (303, N'Lia', N'Thomazet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (304, N'Ingrim', N'Matiasek')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (305, N'Amabelle', N'Stronack')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (306, N'Neils', N'Loftus')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (307, N'Valentijn', N'Benedikt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (308, N'Pincas', N'Caccavella')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (309, N'Chucho', N'Copelli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (310, N'Patin', N'Exton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (311, N'Lettie', N'Perryman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (312, N'Noam', N'Pinckney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (313, N'Brooks', N'Gorioli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (314, N'Friedrick', N'Crinage')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (315, N'Leighton', N'Andreolli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (316, N'Ambrosio', N'Bodimeade')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (317, N'Bevon', N'Bartens')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (318, N'Aurlie', N'Spilling')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (319, N'Netty', N'Keyser')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (320, N'Essa', N'Spurden')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (321, N'Ema', N'Gearing')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (322, N'Rochelle', N'Blowin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (323, N'Giorgio', N'Nibloe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (324, N'Carmine', N'Giacovazzo')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (325, N'Annette', N'Hailwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (326, N'Cariotta', N'Druce')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (327, N'Nealon', N'Prew')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (328, N'Kellby', N'Feedham')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (329, N'Filide', N'Cradock')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (330, N'Irwin', N'Savatier')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (331, N'Carolin', N'Shadwick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (332, N'Zabrina', N'Dodsworth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (333, N'Conny', N'Plunkett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (334, N'Lidia', N'Verrell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (335, N'Read', N'Semorad')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (336, N'Letizia', N'Odam')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (337, N'Stefa', N'Elton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (338, N'Vidovik', N'Spinas')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (339, N'Stephanus', N'Drains')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (340, N'Gabi', N'Goodrich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (341, N'Poul', N'Dalwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (342, N'Reamonn', N'Luckcuck')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (343, N'Lynnett', N'Thoday')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (344, N'Isa', N'Hick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (345, N'Ephrem', N'Hayth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (346, N'Annnora', N'Lunney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (347, N'Bret', N'Skegg')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (348, N'Holly', N'Fieller')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (349, N'Pat', N'Cranefield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (350, N'Jo', N'Farley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (351, N'Charil', N'Mulvaney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (352, N'Fernande', N'Hebborne')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (353, N'Cecilla', N'Wolfarth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (354, N'Cortney', N'Doerr')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (355, N'Robinett', N'McAsgill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (356, N'Joycelin', N'Ledward')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (357, N'Maje', N'Spieght')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (358, N'Lavinie', N'Llywarch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (359, N'Bettine', N'Tabbernor')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (360, N'Gwynne', N'Branno')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (361, N'Alexandros', N'Beston')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (362, N'Nancie', N'Key')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (363, N'Gib', N'Barbera')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (364, N'Brook', N'Grendon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (365, N'Jade', N'Mablestone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (366, N'Engelbert', N'McCord')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (367, N'Clarie', N'Brumbye')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (368, N'Debbie', N'Longfellow')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (369, N'Camille', N'Leimster')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (370, N'Genna', N'Reubens')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (371, N'Stanfield', N'McDiarmid')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (372, N'Scot', N'Musk')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (373, N'Chuck', N'Marquiss')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (374, N'Christal', N'Adamowitz')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (375, N'Wallas', N'Jamot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (376, N'Aveline', N'Mityushin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (377, N'Camella', N'Inold')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (378, N'Berthe', N'MacKnockiter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (379, N'Kimmie', N'Harries')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (380, N'Judith', N'Worsall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (381, N'Elana', N'Deeble')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (382, N'Dan', N'Heinrich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (383, N'Franciska', N'Geertz')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (384, N'Egan', N'Guillford')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (385, N'Evelyn', N'Deaton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (386, N'Gearalt', N'Najara')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (387, N'Breena', N'Jurasek')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (388, N'Linea', N'McEnhill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (389, N'Frederico', N'Gordon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (390, N'Aharon', N'Tremolieres')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (391, N'Carce', N'Crompton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (392, N'Mireielle', N'Groll')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (393, N'Dulciana', N'Cleveley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (394, N'Yolande', N'Backe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (395, N'Loren', N'Rosenblad')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (396, N'Rosalie', N'Deakin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (397, N'Gladys', N'Huske')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (398, N'Shell', N'Savaage')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (399, N'Romy', N'Tweedle')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (400, N'Lelia', N'Arrell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (401, N'Bell', N'Tourville')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (402, N'Nye', N'Ramsdell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (403, N'Berna', N'Mountford')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (404, N'Margot', N'Campagne')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (405, N'Sheff', N'Bossel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (406, N'Harlie', N'Marshallsay')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (407, N'Angie', N'Brugden')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (408, N'Stacey', N'Tink')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (409, N'Catharina', N'Isaak')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (410, N'Katie', N'Doerffer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (411, N'Rodger', N'Niland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (412, N'Daloris', N'Cashford')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (413, N'Sterling', N'Alliban')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (414, N'Grenville', N'Croley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (415, N'Leonid', N'Pichmann')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (416, N'Duff', N'Benedito')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (417, N'Dagmar', N'Winstanley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (418, N'Willie', N'Knowles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (419, N'Say', N'Le Blanc')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (420, N'Yolanda', N'Gallacher')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (421, N'Kylen', N'Frango')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (422, N'Leo', N'Hurran')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (423, N'Lyndell', N'Reven')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (424, N'Johannes', N'Perren')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (425, N'Sondra', N'Cordle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (426, N'Lucio', N'Gallen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (427, N'Dael', N'Scoates')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (428, N'Rita', N'Macauley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (429, N'Clayson', N'Melburg')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (430, N'Imogen', N'Lunn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (431, N'Alameda', N'Linsey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (432, N'Vita', N'Lapthorn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (433, N'Wenona', N'Dabner')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (434, N'Laurene', N'Gallamore')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (435, N'Samson', N'Clyant')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (436, N'Walker', N'Eisikowitch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (437, N'Vivianna', N'Grimsell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (438, N'Dulcea', N'Feighry')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (439, N'Jaine', N'Fishley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (440, N'Melosa', N'Chamberlain')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (441, N'Katha', N'Meneer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (442, N'Pryce', N'Ertelt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (443, N'Gregorius', N'Zoellner')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (444, N'Hebert', N'Vince')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (445, N'Stacia', N'Rodenburg')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (446, N'Danyette', N'Dundridge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (447, N'Sandy', N'Rowes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (448, N'Dyanne', N'Andrieu')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (449, N'Cassandre', N'O''Daly')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (450, N'Keith', N'Sarath')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (451, N'Fancie', N'McKeon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (452, N'Raimondo', N'Tizzard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (453, N'Simone', N'Rubke')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (454, N'Zorina', N'Luxen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (455, N'Reggi', N'Fraine')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (456, N'Leisha', N'MacCook')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (457, N'Orelle', N'Lyttle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (458, N'Blondell', N'Lorenzetti')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (459, N'Chad', N'Leathe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (460, N'Rube', N'Davoren')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (461, N'Ulric', N'Cussons')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (462, N'Hillary', N'Lanmeid')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (463, N'Karim', N'Jobes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (464, N'Howie', N'Copestick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (465, N'Lee', N'Richardt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (466, N'Clair', N'Semarke')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (467, N'Lowell', N'Hopkins')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (468, N'Pace', N'MacCarter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (469, N'Kiley', N'Tayler')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (470, N'Shirl', N'Guillon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (471, N'Bellina', N'Ormerod')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (472, N'Kippie', N'Catherick')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (473, N'Charis', N'Dominec')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (474, N'Cathy', N'Holcroft')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (475, N'Augustin', N'Casswell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (476, N'Deeann', N'Jarville')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (477, N'Kimberly', N'Merman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (478, N'Kalila', N'Heggie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (479, N'Nita', N'Arnaldo')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (480, N'Alena', N'Palatino')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (481, N'Lory', N'Staddart')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (482, N'Babara', N'Roj')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (483, N'Romonda', N'Woodroff')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (484, N'Kaylyn', N'Bear')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (485, N'Morse', N'Casari')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (486, N'Ranice', N'Kyme')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (487, N'Denise', N'Lafaye')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (488, N'Ivett', N'Facey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (489, N'Marlie', N'Larchiere')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (490, N'Mauricio', N'Kubu')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (491, N'Erminia', N'Ainslie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (492, N'Richy', N'Pingstone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (493, N'Rurik', N'Maclaine')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (494, N'Hertha', N'Scibsey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (495, N'Krystle', N'Pym')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (496, N'Silvio', N'Checci')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (497, N'Kenna', N'Rutledge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (498, N'Lem', N'Prattington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (499, N'Dolores', N'Curling')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (500, N'Lowell', N'Groves')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (501, N'Nert', N'Taleworth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (502, N'Harland', N'Gladhill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (503, N'Vikky', N'Bordessa')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (504, N'Othello', N'Rubinek')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (505, N'Elle', N'Hinkins')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (506, N'Horst', N'L''Amie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (507, N'Wright', N'Pocklington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (508, N'Lester', N'Baike')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (509, N'Mei', N'Hellard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (510, N'Fredra', N'Gartside')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (511, N'Blake', N'Stannas')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (512, N'Lock', N'Dicky')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (513, N'Wileen', N'Dudney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (514, N'Elane', N'Castagnet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (515, N'Ring', N'Macauley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (516, N'Ernaline', N'Crim')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (517, N'Tatiania', N'Ferrero')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (518, N'Mariele', N'Grigaut')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (519, N'Felicity', N'Webermann')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (520, N'Shirl', N'Daenen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (521, N'Olin', N'Tethcote')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (522, N'Minnaminnie', N'Filan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (523, N'Marylinda', N'Diem')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (524, N'Anthiathia', N'Ximenez')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (525, N'Farica', N'Davion')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (526, N'Catherine', N'Jeness')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (527, N'Guillermo', N'Skocroft')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (528, N'Alain', N'Gilbert')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (529, N'Lynda', N'Boom')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (530, N'Mar', N'Vanini')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (531, N'Tersina', N'Saberton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (532, N'Susie', N'McLorinan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (533, N'Fina', N'Robinette')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (534, N'Iorgo', N'Ouslem')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (535, N'Bearnard', N'Quan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (536, N'Sacha', N'Payler')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (537, N'Vinny', N'Mauchlen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (538, N'Vanna', N'Chezelle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (539, N'Karlen', N'Innott')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (540, N'Dru', N'Maidens')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (541, N'Koral', N'Leavesley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (542, N'Melonie', N'Drewet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (543, N'Pablo', N'Garrett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (544, N'Filide', N'Cree')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (545, N'Ronna', N'Shinefield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (546, N'Markos', N'Ridhole')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (547, N'Chickie', N'Rudderham')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (548, N'Jolie', N'Eynon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (549, N'Vicky', N'Viccary')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (550, N'Donella', N'Chessor')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (551, N'Ody', N'Merton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (552, N'Adan', N'Ellis')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (553, N'Danna', N'Piercey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (554, N'Tilda', N'Dilland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (555, N'Lynelle', N'Kington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (556, N'Shel', N'Forstall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (557, N'Moises', N'Saddleton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (558, N'Coop', N'Amps')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (559, N'Ivett', N'Govern')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (560, N'Ambrosi', N'Sheraton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (561, N'Barron', N'Evill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (562, N'Maryl', N'Mackriell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (563, N'Joanie', N'Radford')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (564, N'Karel', N'Skill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (565, N'Marthe', N'Romanetti')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (566, N'Genny', N'Dupoy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (567, N'Florie', N'Sposito')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (568, N'Niki', N'Feirn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (569, N'Almira', N'Sherrin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (570, N'Nevin', N'Kenealy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (571, N'Janey', N'Doggrell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (572, N'Joe', N'Ellyatt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (573, N'Iorgos', N'Aiskrigg')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (574, N'Jessa', N'Idel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (575, N'Noella', N'Gilardone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (576, N'Mickie', N'Tague')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (577, N'Linoel', N'Pursglove')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (578, N'Ardine', N'Burgiss')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (579, N'Mahmud', N'Prevett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (580, N'Augustina', N'Swetenham')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (581, N'Frederik', N'Kopp')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (582, N'Elisha', N'Filippo')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (583, N'Xylina', N'Beames')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (584, N'Cecily', N'Decourt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (585, N'Mommy', N'Tunkin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (586, N'Dilly', N'Cookley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (587, N'Gennifer', N'Hedman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (588, N'Terry', N'Volker')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (589, N'Kori', N'Schultes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (590, N'Kym', N'Gooder')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (591, N'Hastings', N'Enocksson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (592, N'Westleigh', N'Danelut')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (593, N'Gregoor', N'Cale')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (594, N'Malory', N'Hartright')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (595, N'Liesa', N'Jannequin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (596, N'Rutger', N'Shera')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (597, N'Kippy', N'Wrennall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (598, N'Karia', N'Beceril')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (599, N'Tamqrah', N'Bethel')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (600, N'Megen', N'Fooks')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (601, N'Eveline', N'Labbet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (602, N'Whitby', N'Conyard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (603, N'Celesta', N'Stebles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (604, N'Chelsea', N'Goering')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (605, N'Edna', N'Grzeszczak')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (606, N'Vernon', N'Branwhite')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (607, N'Wait', N'De Biaggi')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (608, N'Rickey', N'Gather')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (609, N'Fenelia', N'Diperaus')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (610, N'Darla', N'Dockree')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (611, N'Waverley', N'Parsley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (612, N'Erina', N'Kop')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (613, N'Daphne', N'Saker')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (614, N'Iggy', N'Lee')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (615, N'Donnie', N'Stannard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (616, N'Bernelle', N'Ahrendsen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (617, N'Timmy', N'Schlagh')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (618, N'Nerta', N'McWhirter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (619, N'Dynah', N'Verdy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (620, N'Dale', N'Raselles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (621, N'Kiri', N'Ellams')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (622, N'Monro', N'Keyme')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (623, N'Blaine', N'd''Arcy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (624, N'Una', N'Garter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (625, N'Ebony', N'Lindgren')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (626, N'Phillipp', N'Brechin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (627, N'Anabelle', N'Pietsma')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (628, N'Sena', N'Lyddiatt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (629, N'Malvin', N'Giovani')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (630, N'Cassandry', N'Dorwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (631, N'Cristal', N'Dalligan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (632, N'Clarke', N'Hallut')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (633, N'Way', N'Illsley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (634, N'Violette', N'Wohler')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (635, N'Tim', N'Brandi')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (636, N'Madelina', N'Aloway')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (637, N'Minette', N'Chatelot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (638, N'Rhys', N'Oxbrow')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (639, N'Cy', N'Collcutt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (640, N'Jennie', N'Speirs')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (641, N'Virgina', N'Perotti')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (642, N'Vernon', N'des Remedios')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (643, N'Reine', N'Trayhorn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (644, N'Sonnnie', N'Edards')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (645, N'Amy', N'Semiras')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (646, N'Audra', N'Presnell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (647, N'Wandie', N'Skae')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (648, N'Inglebert', N'Volage')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (649, N'Dulcie', N'Twigg')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (650, N'Hobart', N'Ward')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (651, N'Modesty', N'Dewane')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (652, N'Dom', N'L''Archer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (653, N'Lilla', N'Hardern')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (654, N'Derward', N'Tutchings')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (655, N'Lyman', N'Duhig')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (656, N'Rhodia', N'Markham')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (657, N'Janetta', N'Dami')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (658, N'Jeno', N'Blanch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (659, N'Bail', N'Vicioso')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (660, N'Flossie', N'Chene')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (661, N'Ynez', N'Bucky')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (662, N'Dex', N'Gillespey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (663, N'Vikki', N'Doward')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (664, N'Aubrey', N'Gehrels')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (665, N'Welbie', N'Shankle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (666, N'Wolfy', N'Humpatch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (667, N'Sidoney', N'Dormand')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (668, N'Evyn', N'Falshaw')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (669, N'Pierette', N'Vivers')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (670, N'Lindy', N'Tyndall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (671, N'Duncan', N'Catley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (672, N'Klarrisa', N'Sanger')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (673, N'Darnall', N'Shrive')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (674, N'Deeanne', N'Bliben')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (675, N'Stesha', N'Jimes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (676, N'Corey', N'Nockles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (677, N'John', N'Callister')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (678, N'Corney', N'Lattimore')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (679, N'Barnabe', N'Elis')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (680, N'Lynnette', N'Fannon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (681, N'Agretha', N'Rose')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (682, N'Bryant', N'Campo')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (683, N'Letisha', N'Crady')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (684, N'Katrinka', N'Allebone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (685, N'Aprilette', N'Twitching')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (686, N'Valenka', N'Wilsone')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (687, N'Gweneth', N'Maddyson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (688, N'Sandra', N'Bodycombe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (689, N'Abby', N'Heggs')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (690, N'Alecia', N'Thackeray')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (691, N'Jordain', N'Chitter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (692, N'Netti', N'Reef')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (693, N'Brinn', N'MacAskie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (694, N'Elmer', N'Cranmere')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (695, N'Anderson', N'Lackemann')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (696, N'Gery', N'Ramstead')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (697, N'Rhodie', N'Frankcombe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (698, N'Gabriela', N'Towell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (699, N'Raymund', N'Ruggen')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (700, N'Nickie', N'Coyle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (701, N'Liam', N'Waything')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (702, N'Early', N'Sturges')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (703, N'Isabel', N'Bayles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (704, N'Brod', N'Kinchlea')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (705, N'Annis', N'Tremmil')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (706, N'Buck', N'Ower')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (707, N'Abbe', N'Ebbles')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (708, N'Evangelina', N'Stickney')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (709, N'Rodger', N'Ruoss')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (710, N'Damara', N'Jarman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (711, N'Johnnie', N'McCrory')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (712, N'Blondy', N'Kerans')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (713, N'Gualterio', N'Zappel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (714, N'Lemmy', N'Frowd')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (715, N'Dorisa', N'Alway')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (716, N'Clayson', N'Restill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (717, N'Breanne', N'McDunlevy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (718, N'Edita', N'Duester')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (719, N'Augy', N'Friedank')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (720, N'Johna', N'Fitch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (721, N'Saxe', N'Varey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (722, N'Doralin', N'Stanbro')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (723, N'Odille', N'MacCaughan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (724, N'Thorvald', N'Egel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (725, N'Wilfred', N'Bell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (726, N'Ike', N'Pugh')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (727, N'Bertha', N'Farthing')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (728, N'Warner', N'Larne')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (729, N'Pammi', N'Dyball')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (730, N'Hamish', N'Osman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (731, N'Clair', N'Walton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (732, N'Francene', N'Segges')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (733, N'Saw', N'Baldry')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (734, N'Pepito', N'McIlharga')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (735, N'Caroljean', N'Ogelbe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (736, N'Cristobal', N'Gwillyam')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (737, N'Stafani', N'Janjic')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (738, N'Malvin', N'Appleyard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (739, N'Jake', N'Willoughby')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (740, N'Kirsten', N'Wibrow')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (741, N'Lezlie', N'Worthing')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (742, N'Nara', N'Jeakins')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (743, N'Adele', N'Polley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (744, N'Jourdain', N'Gwilliam')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (745, N'Lari', N'Duchasteau')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (746, N'Angelico', N'Tanzer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (747, N'Troy', N'Eliesco')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (748, N'Dar', N'Wallis')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (749, N'Kimmi', N'Drohun')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (750, N'Valida', N'Warsop')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (751, N'Adriana', N'Lujan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (752, N'Clarence', N'Chadbourne')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (753, N'Moss', N'Winsome')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (754, N'Melisandra', N'Busson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (755, N'Nickie', N'Innott')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (756, N'Othella', N'Pollicatt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (757, N'Sasha', N'Odcroft')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (758, N'Virginie', N'Fisher')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (759, N'Lorrie', N'Mathis')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (760, N'Hayden', N'Jursch')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (761, N'Sosanna', N'Bushaway')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (762, N'Jaine', N'Dessant')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (763, N'Prinz', N'Tame')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (764, N'Elaina', N'Broxis')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (765, N'Terra', N'Spurier')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (766, N'Marga', N'Shakesby')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (767, N'Taylor', N'Lindman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (768, N'Ashby', N'Tunnadine')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (769, N'Frazer', N'Mussalli')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (770, N'Lowe', N'Compston')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (771, N'Stephen', N'Tarren')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (772, N'Jeannette', N'Gerrish')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (773, N'Lay', N'Vasyukhin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (774, N'Fidela', N'Cossington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (775, N'Shir', N'Gullen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (776, N'Lek', N'Fitchell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (777, N'Marisa', N'Borrie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (778, N'Ginny', N'Momford')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (779, N'Rubi', N'Elcum')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (780, N'Ezechiel', N'Blanque')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (781, N'Joel', N'Wharin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (782, N'Danny', N'Cafferky')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (783, N'Celene', N'Vogt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (784, N'Antony', N'Rippon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (785, N'Una', N'Seymer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (786, N'Huntley', N'Lever')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (787, N'Earlie', N'Rockell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (788, N'Arabela', N'Earngy')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (789, N'Helena', N'Besque')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (790, N'Kirstyn', N'Lissett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (791, N'Ripley', N'Crosher')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (792, N'Conroy', N'Garritley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (793, N'Brook', N'Scouse')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (794, N'Carina', N'Sparwell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (795, N'Dillie', N'Sandaver')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (796, N'Bevon', N'Amphlett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (797, N'Davidson', N'Blazi')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (798, N'Jandy', N'Screaton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (799, N'Muire', N'Alldre')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (800, N'La verne', N'Clilverd')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (801, N'Devora', N'Barnewell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (802, N'Renee', N'Causton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (803, N'Dag', N'Lempenny')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (804, N'Engelbert', N'Sancho')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (805, N'Andree', N'Ibarra')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (806, N'Emogene', N'Crenshaw')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (807, N'Tony', N'Brewin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (808, N'Mahalia', N'Callery')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (809, N'Sara-ann', N'Mussolini')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (810, N'Hendrika', N'Ebertz')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (811, N'Gan', N'Nice')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (812, N'Pryce', N'Jandac')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (813, N'Willi', N'Suddock')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (814, N'Fionna', N'Axby')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (815, N'Hyatt', N'Stringfellow')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (816, N'Jerry', N'Albrooke')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (817, N'Briggs', N'Bausor')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (818, N'Oriana', N'Offer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (819, N'Herta', N'Orange')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (820, N'Darby', N'Gurwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (821, N'Isadore', N'Weall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (822, N'Rikki', N'Izat')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (823, N'Cristiano', N'Erington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (824, N'Holly', N'Fettes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (825, N'Yolanda', N'Klishin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (826, N'Drusy', N'Wardesworth')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (827, N'Nissie', N'Beahan')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (828, N'Masha', N'Casperri')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (829, N'Elden', N'Langridge')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (830, N'Marisa', N'Trunkfield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (831, N'Sheppard', N'Penticoot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (832, N'Devinne', N'Coare')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (833, N'Cynde', N'Yandle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (834, N'Christophe', N'Sergeaunt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (835, N'Rachelle', N'Winward')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (836, N'Randie', N'Laingmaid')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (837, N'Andreas', N'Phear')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (838, N'Karen', N'Divver')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (839, N'Florette', N'Densey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (840, N'Clementia', N'Lightfoot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (841, N'Tess', N'Stokey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (842, N'Melli', N'Szanto')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (843, N'Mikel', N'Kettel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (844, N'Chrystal', N'Teggart')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (845, N'Germaine', N'Karlolczak')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (846, N'Dorella', N'Gherardesci')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (847, N'Grethel', N'Cardall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (848, N'Hillary', N'Rendbaek')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (849, N'Krissy', N'Bridat')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (850, N'Dorita', N'Lethbrig')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (851, N'Karylin', N'Kesley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (852, N'Paulo', N'Boddam')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (853, N'Michaella', N'Picard')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (854, N'Judas', N'Coolson')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (855, N'Harv', N'Daniel')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (856, N'Pietra', N'Tait')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (857, N'Sergei', N'Brozek')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (858, N'Dulce', N'Lawey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (859, N'Constancia', N'Cully')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (860, N'Shelley', N'Farny')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (861, N'Ethelbert', N'Garcia')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (862, N'Cobb', N'O''Geneay')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (863, N'Ernest', N'Vallery')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (864, N'Laureen', N'Dunderdale')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (865, N'Franky', N'Anyene')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (866, N'Granger', N'Casol')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (867, N'Darelle', N'Dronsfield')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (868, N'Beth', N'Ismay')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (869, N'Cheslie', N'Gaiter')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (870, N'Grady', N'Radki')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (871, N'Angel', N'Duffus')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (872, N'Porter', N'Heinreich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (873, N'Nanci', N'Itzik')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (874, N'Nerty', N'Firsby')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (875, N'Chev', N'Langland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (876, N'Jose', N'Kettlewell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (877, N'Jammal', N'Darwood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (878, N'Sanford', N'Fenix')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (879, N'Stavros', N'Aylin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (880, N'Madlen', N'Trees')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (881, N'Kienan', N'Braunlein')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (882, N'Merrily', N'Cicconettii')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (883, N'Brittney', N'Chevins')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (884, N'Ricoriki', N'Fattorini')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (885, N'Nerita', N'Golden of Ireland')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (886, N'Caro', N'Wigfall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (887, N'Zena', N'Roback')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (888, N'Faber', N'Carver')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (889, N'Kenton', N'Symon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (890, N'Conny', N'Napper')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (891, N'Danie', N'Overall')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (892, N'Herschel', N'Sneyd')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (893, N'Fay', N'Legendre')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (894, N'Kendre', N'Alexandrou')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (895, N'Welch', N'Rathe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (896, N'Smith', N'Nast')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (897, N'Bartholomew', N'Choat')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (898, N'Allison', N'Shuttlewood')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (899, N'Kelvin', N'Paunsford')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (900, N'Evie', N'Tremelling')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (901, N'Ruprecht', N'Gellibrand')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (902, N'Wallie', N'Iuorio')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (903, N'Bernetta', N'Sexcey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (904, N'Starlene', N'Pagram')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (905, N'Christalle', N'Remnant')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (906, N'Cleve', N'Trainer')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (907, N'Dorothy', N'Evangelinos')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (908, N'Isidro', N'MacFadden')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (909, N'Francesca', N'Bilovsky')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (910, N'Madison', N'Penticoot')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (911, N'Minnie', N'Peirazzi')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (912, N'Chiquita', N'Goodwell')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (913, N'Valida', N'Straffon')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (914, N'Dena', N'Cosgry')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (915, N'Ashlee', N'Gowling')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (916, N'Marigold', N'Livzey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (917, N'Florida', N'Oxenden')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (918, N'Nadiya', N'Woodes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (919, N'Audre', N'Kildea')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (920, N'Morissa', N'Hatherill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (921, N'Margarette', N'McWilliam')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (922, N'Dwight', N'Scrogges')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (923, N'Ronda', N'O''Scannill')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (924, N'Enriqueta', N'Niesegen')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (925, N'Hally', N'Tunnacliffe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (926, N'Kathy', N'Chaman')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (927, N'Donetta', N'Cracie')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (928, N'Timmy', N'Breyt')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (929, N'Chaddy', N'Veneur')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (930, N'Sylvan', N'Gregory')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (931, N'Adelice', N'Falkinder')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (932, N'Immanuel', N'Lawler')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (933, N'Micheline', N'Budgett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (934, N'Alisha', N'Shefton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (935, N'Horten', N'Drance')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (936, N'Clovis', N'Collacombe')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (937, N'Kimberlee', N'Madgwich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (938, N'Prudy', N'Brodway')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (939, N'Giffer', N'Maymand')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (940, N'Edin', N'Ridhole')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (941, N'Giacinta', N'Sleath')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (942, N'Denny', N'Winkle')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (943, N'Rozina', N'Dumini')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (944, N'Price', N'Vido')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (945, N'Isidoro', N'Tinkler')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (946, N'Ben', N'Balwin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (947, N'Franklyn', N'Balk')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (948, N'Karine', N'Broome')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (949, N'Lay', N'Batho')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (950, N'Vinita', N'McSperrin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (951, N'Farlie', N'Temperton')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (952, N'Sari', N'Parffrey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (953, N'Diarmid', N'Friett')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (954, N'Aveline', N'Bamlet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (955, N'Scotti', N'Tetley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (956, N'Haleigh', N'Longstreet')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (957, N'Walther', N'Grave')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (958, N'Alfonso', N'Emig')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (959, N'Brand', N'Charette')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (960, N'Kerr', N'oldey')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (961, N'Annie', N'Burns')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (962, N'Garrard', N'Sherlock')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (963, N'Jenelle', N'Winchester')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (964, N'Nat', N'Grocott')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (965, N'Dorrie', N'Jedrzejkiewicz')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (966, N'Pebrook', N'Ongin')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (967, N'Mohammed', N'Perri')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (968, N'Alika', N'Pleasance')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (969, N'Alick', N'McComish')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (970, N'Langsdon', N'Ruhben')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (971, N'Torrie', N'Kabos')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (972, N'Tabb', N'Pitceathly')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (973, N'Stephenie', N'Labarre')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (974, N'Lavinie', N'Noweak')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (975, N'Laurella', N'Filpo')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (976, N'Waly', N'Hallad')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (977, N'Dallon', N'Lardier')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (978, N'Cirstoforo', N'Sincock')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (979, N'Tobe', N'Bain')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (980, N'Cyndia', N'Cuberley')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (981, N'Bryanty', N'Symmers')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (982, N'Marten', N'MacKeever')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (983, N'Fanny', N'Hannant')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (984, N'Layney', N'Casburn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (985, N'Ajay', N'Abbott')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (986, N'Kathie', N'Hearn')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (987, N'Karleen', N'Pilcher')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (988, N'Frants', N'Cloke')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (989, N'Erny', N'Doody')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (990, N'Kimble', N'Lomas')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (991, N'Eva', N'Blackborow')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (992, N'Allegra', N'Barcke')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (993, N'Brose', N'Fairnington')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (994, N'Karlene', N'Gawkes')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (995, N'Matt', N'Shireff')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (996, N'Bartolemo', N'Eich')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (997, N'Edouard', N'Asals')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (998, N'Jaquenette', N'Belly')
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (999, N'Evania', N'Neilus')
GO
INSERT [dbo].[Students] ([StudentID], [fName], [lName]) VALUES (1000, N'Malissa', N'Ioselevich')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (1, N'Rosabelle', N'Salerno', N'rsalerno0', 0x78702AAC586AF5800AF722E4B1940C59A0CD25530547C2B64DC51083FC74C824, N'H.rcRe(l9@')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (2, N'Sergeant', N'Redmore', N'sredmore1', 0x8E70359454833FE2FB1F7D63686D0A8D68257619D81988DEAFA41390442D4F00, N'HoOeoT/\>[')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (3, N'Isador', N'Ellerker', N'iellerker2', 0x9B52C3743E21D1B06A45784178F070B0EC229BD1EA8B25143D41BD4EC51A9147, N'H''pbeL(0c!')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (4, N'Raphaela', N'Broadbear', N'rbroadbear3', 0x1F97E7F4CF8F6592B597B3706ECFDD18A3A8643702568625965307A71C39241F, N'H>bo9GBD\7')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (5, N'Gian', N'Cohr', N'gcohr4', 0xC531D8D148E2E1102871679F3017CAF4EE2781F83D31B374F3B2F73BF2E7D67A, N'HVS}jC\YUM')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (6, N'Lindy', N'Meller', N'lmeller5', 0x4059E9F88051D37BE18DF1B9A8F6472E86640F11B23FC7C0A2A1B0F3B1238A14, N'IO%Z+0JH5-')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (7, N'Carter', N'Newborn', N'cnewborn6', 0x55CE38F73E9F1046F7CB1B8A7079B82AE0CC7F20816DE58BE8215464CD3C88B7, N'IOQ{}*\{!/')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (8, N'Mercedes', N'Plinck', N'mplinck7', 0x1C1F317FC63BB26547377145B3EE16141A8F6C1E97E30CB46C7FB5B9FFB40B31, N'I|8eS#^0Rh')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (9, N'Townie', N'Lancaster', N'tlancaster8', 0xE1280AD3114D49E4801F93DF27B34B86FDE2EB7D238D924117BCCD1D790DB517, N'I_rfppd X%')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (10, N'Sampson', N'Walne', N'swalne9', 0x18919B7CE2906A5CEA0E1B53F7849A4679FC07E448027FB061099AE8AE504ACC, N'JwdtDl 5Q;')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (11, N'Arie', N'Nance', N'anancea', 0x90914938D9C97E2B19946BAE48EA33AEB231AB0E3DBE55D5FEA1936E345A6AAE, N'J/''q:dxgu_')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (12, N'Clayton', N'Demongeot', N'cdemongeotb', 0x5783C767EE5A6A428F8AB08C7ABBC0B27EFDE2B22EC064F5B96A6D0952DDEEBA, N'JFw!l_4{nu')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (13, N'Ysabel', N'Churches', N'ychurchesc', 0x59B76238511FC4A45F13D0558D008B47B4DE5F8360DDC097C33FFC536281E14D, N'Jr/WdUsNm_')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (14, N'Adams', N'Capner', N'acapnerd', 0xA4672C62B65DEE02B5A53B5AA962804C8B647E006E50F9800304D69CAC96D70D, N'J*PTZMl#4&')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (15, N'Joye', N'Stanway', N'jstanwaye', 0xC6269BE8BAC24D88F6D833FFF312B6A2027F9DC28D8F58F1025B692311FED9E3, N'KBBb.H(7-;')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (16, N'Marnie', N'Laughlan', N'mlaughlanf', 0xF4B2C240B636C1DD761C92F507B900C29ED2AE0685E35B9901B10E5FC2A5F51A, N'KAn%"C:jx>')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (17, N'Coralie', N'Dudhill', N'cdudhillg', 0x14D057F963FFF2110A0BDE2F7000D6B34EBF62B321CBCFB62A7246173EDC5CA5, N'KY`2T>T!pS')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (18, N'Aviva', N'Esilmon', N'aesilmonh', 0x0DBBE36A36DF2A2F8950F341126802449881AE57127A50F5C4D94CEB9D66BA54, N'Ko#/J6MS7x')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (19, N'August', N'Kalderon', N'akalderoni', 0x03DF2B2C06D7906D2FCC6E4A079496B934F7DA3752A66526729C464694DD0162, N'Kp az4!iVk')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (20, N'Gwenny', N'Vasyukov', N'gvasyukovj', 0xF1E0682C5355AB2184235AC1E25D1E9FD902B9C20BC326EC231793866101F4A1, N'L>6:r*a<UU')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (21, N'Dietrich', N'Fotherby', N'dfotherbyk', 0xB6F9D061052EC0D4A778DD2C61A582DC5501F5FED92B4E8B93BA9809841E7D2E, N'LV(HF%zPNk')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (22, N'Rowen', N'Massot', N'rmassotl', 0xBDB5924D053F5636A51A578FDD8E83D4CD5F17A196791D6B8F78094B7408F595, N'LwA Z0NCF)')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (23, N'Malinde', N'Akers', N'makersm', 0xF5B1D4E0B6593911D729E7EBD3C7DB82F1C60A25980148C64D29D963274AB235, N'M4-,%\vZpL')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (24, N'Carmelina', N'Vannacci', N'cvannaccin', 0xC59775D54AA4D3947FF6BFC0E9CB990ABD50A1B4EDF7E6F38CEE15816925AA20, N'M''+v43&MN]')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (25, N'Devin', N'Killshaw', N'dkillshawo', 0x23DAF2EF8946899757FBB3F67D1633BF837DEBC4359911F3152DB3D17F2A4F2F, N'N?E#7R}u^B')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (26, N'Husein', N'Chambers', N'hchambersp', 0x8589F9629BB756D60125A424087A1E76B355359A779B11F3BECD345CD154F4D2, N'N%M_Vv!4Jg')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (27, N'Turner', N'Mobius', N'tmobiusq', 0xAB4D87E55F1A5D4265C54F5895490B55C18FCAD6B5AFE4EF69FECF2C1C0C2FCE, N'O]*5`yLYgK')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (28, N'Hynda', N'Eddy', N'heddyr', 0x5AF8B8EB693434FD339DD8EFBFC089E8CB5F152C6837F34DD90E3CAC343E14A8, N'O^''g2w!n(>')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (29, N'Raimundo', N'Palay', N'rpalays', 0xCCA52960396E6973E65ACE98A4A8E7749AC59B8A14839372C14CEC42F19748B1, N'O,=@*m`B''''')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (30, N'Joan', N'Jon', N'jjont', 0x5D60043C6005076994BE2212E4EC7BAF6E1211ADBD952E118AECCD8CF8F00F5E, N'Ru}|L[GG-o')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (31, N'Karen', N'Rast', N'krast', 0xB45D4A3B03B172A7326A2D4737F421BD4413A78AAB97D252CE2734BF499138B0, N'Lh4/HWXKt@')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (33, N'', N'', N'', 0x3BAB9291D1FD07FFE47CB002B12CA36810F9FF003B9EE47548163F4094D03CAB, N'r+G!0*nKAh')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (39, N'Shawn', N'Rast', N'rastsc', 0xDF6D1B223CE00BF5EB0AE26965FC0C63A066B4D54663F753A8DEBE48283024D8, N'VD?EXn(nMt')
INSERT [dbo].[Teachers] ([TeacherID], [fName], [lName], [username], [passwordHash], [passwordSalt]) VALUES (40, N'Shawn', N'Rast', N'test', 0x294E54F6C8F2F7B7BC4E0BC94A71DC854690DCC20E8152B6447A3C83E0A5E58A, N'[a/2G-=);$')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
SET IDENTITY_INSERT [dbo].[TeacherStudentNotes] ON 

INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (1, 286, 14, 1, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (2, 125, 14, 0, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (3, 48, 14, 0, 0, N'adams')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (4, 48, 31, 1, 0, N'krast')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (5, 48, 11, 0, 0, N'anancea')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (6, 123, 39, 1, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (7, 56, 39, 0, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (8, 234, 39, 0, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (9, 11, 39, 0, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (10, 123, 40, 0, 0, N'')
INSERT [dbo].[TeacherStudentNotes] ([StudentTeacherNoteID], [StudentID], [TeacherID], [isTalkative], [isNearsighted], [notes]) VALUES (11, 85, 40, 1, 0, N'This is Russ')
SET IDENTITY_INSERT [dbo].[TeacherStudentNotes] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Teachers__F3DBC57228D8B7D3]    Script Date: 5/11/2017 12:44:55 AM ******/
ALTER TABLE [dbo].[Teachers] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentClassHatDraw] ADD  DEFAULT ((1)) FOR [Drawn]
GO
ALTER TABLE [dbo].[TeacherStudentNotes] ADD  DEFAULT ((0)) FOR [isTalkative]
GO
ALTER TABLE [dbo].[TeacherStudentNotes] ADD  DEFAULT ((0)) FOR [isNearsighted]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[StudentClassHatDraw]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[StudentClassHatDraw]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[TeacherStudentNotes]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[TeacherStudentNotes]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
/****** Object:  StoredProcedure [dbo].[spAddAssignment]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddAssignment]
	@AssignmentName varchar(50),
	@ClassID int,
	@AssignDate datetime
AS
	INSERT INTO Assignments (
		[AssignmentName],
		ClassID,
		AssignDate
		) VALUES (
		@AssignmentName, 
		@ClassID, 
		@AssignDate
	)
GO
/****** Object:  StoredProcedure [dbo].[spAddStudentToClass]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddStudentToClass]

	@studentID 	INT,
	@classID	INT
	
AS 

	IF EXISTS( SELECT NULL FROM StudentClasses WHERE StudentID = @studentID AND ClassID = @classID) BEGIN
		SELECT [Error] = 'The student is already in the class!'
	END ELSE IF NOT EXISTS (SELECT NULL FROM Students WHERE StudentID = @StudentID) BEGIN
		SELECT [Error] = 'No student with that ID exists.'
	END ELSE IF NOT EXISTS (SELECT NULL FROM Classes WHERE ClassID = @ClassID) BEGIN
		SELECT [Error] = 'No class with that ID exists.'
	END ELSE BEGIN
		INSERT INTO StudentClasses(
			StudentID,
			ClassID
		) VALUES (
			@studentID,
			@classID
		)
		DECLARE @StudentClassID INT = @@IDENTITY


		IF NOT EXISTS(SELECT NULL FROM StudentClassHatDraw
						WHERE StudentID = @studentID AND
								ClassID = @classID) 
			BEGIN
			INSERT INTO StudentClassHatDraw(
				ClassID,
				StudentID,
				Drawn
			) VALUES (
				@classID,
				@studentID,
				0
			)
		END
		
		SELECT @StudentClassID, [success] = 'Student added'
	END


GO
/****** Object:  StoredProcedure [dbo].[spAddTeacher]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddTeacher]   

    @fName		VARCHAR (30), 
    @lName		VARCHAR (30), 
    @username	VARCHAR (30), 
    @password	VARCHAR (30) 

AS

-- make password salt, from mssqltips.com/sqlservertip/3293/add-a-salt-with-the-sql-server-hashbytes-function/
	DECLARE @Salt VARCHAR(10)

	DECLARE @Seed	INT
	DECLARE @LCV	TINYINT
	DECLARE @CTime	DATETIME

	SET @CTime = GETDATE();
	SET @Seed = (DATEPART(hh, @CTime) * 10000000) + (DATEPART(n, @CTime) * 100000)
		+ (DATEPART(s, @CTime) * 1000) + DATEPART(ms, @CTime)

	SET @LCV = 1;
	SET @Salt = CHAR(ROUND((RAND(@Seed) * 94.0) + 32, 3))

	WHILE (@LCV < 10)
	BEGIN
		SET @Salt = @Salt + CHAR(ROUND((RAND() * 94.0) + 32, 3))
		SET @LCV = @LCV + 1;
	END


	-- add salt to password, hash, also modified from above link

	DECLARE @PasswordWithSalt VARCHAR(40)
	SET @PasswordWithSalt = @Salt + @password
	DECLARE @HashedPassword VARBINARY(32)
	SET @HashedPassword = HASHBYTES('SHA2_256', @PasswordWithSalt)

	INSERT INTO Teachers (
	    [fName],       
	    [lName],     
	    [username] ,   
	    [passwordHash],
	    [passwordSalt]
	) VALUES (
		@fName, 
		@lName, 
		@username,
		@HashedPassword, 
		@Salt
	)

GO
/****** Object:  StoredProcedure [dbo].[spAddUpdateAttendance]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddUpdateAttendance]
	@attendanceID INT = -1,
	@studentID INT,
	@classID INT,
	@Day DATETIME,
	@isPresent BIT

AS
	
	IF (@attendanceID = -1) BEGIN

		IF NOT EXISTS(
			SELECT NULL FROM Attendance
			WHERE
				StudentID = @studentID AND
				ClassID = @classID AND
				CONVERT(date, [Day]) = CONVERT(date, @Day)
			) AND
			EXISTS(SELECT NULL FROM Students WHERE StudentID = @StudentID) AND
			EXISTS(SELECT NULL FROM Classes WHERE ClassID = @classID)

			BEGIN

				INSERT INTO Attendance(
					StudentID,
					ClassID,
					[Day],
					isPresent
				) VALUES (
					@studentID,
					@classID,
					@Day,
					@isPresent
				)
		END ELSE IF  EXISTS(
		SELECT NULL FROM Attendance
		WHERE
			StudentID = @studentID AND
			ClassID = @classID AND
			CONVERT(date, [Day]) = CONVERT(date, @Day)
		) AND
		EXISTS(SELECT NULL FROM Students WHERE StudentID = @StudentID) AND
		EXISTS(SELECT NULL FROM Classes WHERE ClassID = @classID)

		BEGIN

			UPDATE Attendance
			SET
				isPresent = @isPresent
			WHERE StudentID = @studentID AND ClassID = @classID AND CONVERT(date, [Day]) = CONVERT(date, @Day)

		END ELSE BEGIN
			SELECT [Error] = 'Either this student has already been marked for attendance or ' +
				'the studentID or classID does not exist'
		END

	END

	ELSE IF NOT EXISTS(
		SELECT NULL FROM Attendance
		WHERE
			AttendanceID != @attendanceID AND
			StudentID = @studentID AND
			ClassID = @classID AND
			CONVERT(date, [Day]) = CONVERT(date, @Day)
		) AND
		EXISTS(SELECT NULL FROM Students WHERE StudentID = @StudentID) AND
		EXISTS(SELECT NULL FROM Classes WHERE ClassID = @classID)

		BEGIN

			UPDATE Attendance
			SET
				StudentID =	@studentID,
				ClassID  =	@classID,
				[Day]	 =	@Day,
				isPresent = @isPresent
			WHERE AttendanceID = @attendanceID

	END ELSE BEGIN
		SELECT [Error] = 'Either this student has already been marked for attendance or ' +
			'the studentID or classID does not exist'
	END
GO
/****** Object:  StoredProcedure [dbo].[spAddUpdateDeleteClass]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddUpdateDeleteClass]
	@classID 	INT = 0,
	@name 		VARCHAR(30),
	@teacherID 	INT,
	@delete 	BIT = 0
	
AS

IF (@delete = 1) BEGIN
-- /////	/////	/////	/////	/////	///// DELETE	/////	/////	/////	/////	/////

	IF NOT EXISTS(SELECT NULL FROM StudentClasses WHERE ClassID = @ClassID) AND
		NOT EXISTS(SELECT NULL FROM Assignments WHERE ClassID = @ClassID) AND
		NOT EXISTS(SELECT NULL FROM Attendance WHERE ClassID = @ClassID) AND
		NOT EXISTS(SELECT NULL FROM StudentClassHatDraw WHERE ClassID = @ClassID) 
		BEGIN
			
		DELETE FROM Classes
		WHERE ClassID = @ClassID
		END ELSE BEGIN
			SELECT [Error] = 'Class is being used elsewhere in the database and cannot be deleted'

	END

END ELSE IF (@classID = 0) BEGIN
-- /////	/////	/////	/////	/////	///// Add	/////	/////	/////	/////	/////

	IF EXISTS(SELECT NULL FROM Teachers WHERE TeacherID = @TeacherID) BEGIN
		INSERT INTO Classes (
			[Name],
			teacherID
		) VALUES (
			@name,
			@teacherID
		)
		SELECT ClassID = @@IDENTITY, [Error] = ''
	END ELSE BEGIN
		SELECT [Error] = 'A teacher with that ID does not exist.'
	END

END ELSE BEGIN
-- /////	/////	/////	/////	/////	///// UPDATE	/////	/////	/////	/////	/////

	IF EXISTS(SELECT NULL FROM Teachers WHERE TeacherID = @TeacherID) AND
		NOT EXISTS(SELECT NULL FROM Classes WHERE TeacherID = @TeacherID AND Name = @name)
	BEGIN
		UPDATE Classes
		SET 
			[Name] = @name,
			TeacherID = @teacherID
		WHERE ClassID = @ClassID
		SELECT ClassID = @ClassID, [Error] = ''
	END ELSE BEGIN
		SELECT [Error] = 'A teacher with that ID does not exist, or that class already exists.'
	END	

END
GO
/****** Object:  StoredProcedure [dbo].[spAddUpdateDeleteStudent]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddUpdateDeleteStudent]

	    @StudentID		INT          ,
	    @fName			VARCHAR (30) ,
	    @lName			VARCHAR (30) ,
		@delete			BIT	 = 0	 

AS

DECLARE @Error VARCHAR(MAX)


--	/////	/////	/////	/////	/////	/////	/////	/////	DELETE	//////	//////	//////	//////	//////	//////	//////	//////
IF(@Delete = 1) BEGIN 

	IF	(	-- Checks to see if student is actively in a class (by checking StudentClasses and StudentClassHatDraw).
			-- It also checks to see if the student has any attendance records. 
			EXISTS (SELECT NULL FROM StudentClasses WHERE StudentID = @StudentID) OR
			EXISTS (SELECT NULL FROM StudentClassHatDraw WHERE StudentID = @StudentID) OR
			EXISTS (SELECT NULL FROM Attendance WHERE StudentID = @StudentID)
		) BEGIN
		
		SELECT *, [error] = 'Student has attendance records, or is ' + 
				'a part of a class and cannot be deleted' 
			FROM Students 
			WHERE StudentID = @StudentID

	END ELSE BEGIN
		
		DELETE FROM Students
			WHERE StudentID = @StudentID

		SELECT [error] = 'Student number ' + @StudentID + ' was successfully deleted'
	END

END 

--	/////	/////	/////	/////	/////	/////	/////	/////	 ADD	//////	//////	//////	//////	//////	//////	//////	//////

    ELSE IF (@StudentID = 0) BEGIN -- no studentID should be zero


	SET @Error = ''

	IF EXISTS (	SELECT NULL 
				FROM Students	
				WHERE (fName = @fName) AND (lName = @lName)
			) BEGIN 
			SET @Error = 'A student with that name already exists, but this will be inserted. Is this a mistake?'
	END


	INSERT INTO Students (
		fName,
		lName
	) VALUES (
		@fName, 
		@lName
	)

	SELECT *, @Error
		FROM Students
		WHERE StudentID = @@IDENTITY --  "@@IDENTITY contains the last identity value that is generated by the statement" (SQL Docs)

END ELSE BEGIN -- update

	-- "our logic for this whole procedure says that I'm not going to insert something if I've found that the description or the due days is already in there"
	-- "so I should make sure that I can't do that with updates, either."

	-- "If I can't add duplicate records, I shouldn't be able to change records so that they are duplicates."

	SET @Error = ''

	IF EXISTS (	SELECT NULL 
				FROM Students	
				WHERE (fName = @fName) AND (lName = @lName) AND
						(StudentID != @StudentID)
			) BEGIN 
			SET @Error = 'A student with that name already exists, but this will be updated. Is this a mistake?'
	END

	UPDATE Students
	SET
		fName = @fName, 
		lName = @lName
	WHERE StudentID = @StudentID

	SELECT *, @Error
		FROM Students
		WHERE StudentID = @@IDENTITY --  "@@IDENTITY contains the last identity value that is generated by the statement" (SQL Docs)

END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAssignment]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteAssignment]
	@AssignmentID int
AS
	DELETE FROM Assignments
	WHERE AssignmentID = @AssignmentID
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAttendance]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteAttendance]
	@attendanceID INT

AS
	DELETE FROM Attendance
	WHERE AttendanceID = @attendanceID

GO
/****** Object:  StoredProcedure [dbo].[spDrawStudentFromHat]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDrawStudentFromHat]
	@studentID INT,
	@classID INT 
AS
	UPDATE StudentClassHatDraw
	SET Drawn = 1
	WHERE StudentID = @studentID AND ClassID = @classID


GO
/****** Object:  StoredProcedure [dbo].[spGetAbsencesRank]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAbsencesRank]
AS

	SELECT s.StudentID, s.fName, s.lName, numAbsent = COUNT(*) FROM Students s
	JOIN Attendance a 
		ON s.StudentID = a.StudentID
	WHERE isPresent = 0
	
	GROUP BY s.StudentID, s.fName, s.lName
	ORDER BY numAbsent desc
GO
/****** Object:  StoredProcedure [dbo].[spGetAssignmentsByClass]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAssignmentsByClass]
	@ClassID INT
AS
	SELECT * FROM Assignments
	WHERE ClassID = @ClassID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spGetAssignmentsByStudentAndDay]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAssignmentsByStudentAndDay]
	@StudentID int,
	@Day DateTime
AS
	SELECT a.AssignmentName, a.AssignDate, c.[Name], Teacher = t.fName + ' ' + t.lName
	FROM Assignments a
		JOIN Classes c
			ON a.ClassID = c.ClassID
		JOIN Teachers t
			ON c.TeacherID = t.TeacherID
		WHERE @StudentID IN (SELECT StudentID FROM StudentClasses where ClassID = c.ClassID) AND
		CONVERT(date, a.AssignDate) = CONVERT(date, @Day)
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spGetAttendanceByClassAndDay]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAttendanceByClassAndDay]
	@ClassID int, 
	@Day datetime
AS
	SELECT * FROM Attendance 
	WHERE ClassID = @ClassID AND [Day] = @Day
GO
/****** Object:  StoredProcedure [dbo].[spGetClassAssignmentsByAssignDate]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetClassAssignmentsByAssignDate]
	@classID INT,
	@assignDate DATETIME

AS 

	SELECT * FROM Assignments
	WHERE ClassID = @classID AND CONVERT(date, @assignDate) = CONVERT(date, AssignDate) -- this ignores time, and only checks date

GO
/****** Object:  StoredProcedure [dbo].[spGetClassesByStudent]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetClassesByStudent] 
	@studentID INT

AS

	SELECT DISTINCT [Name], ClassID
	FROM Classes
	WHERE ClassID IN (SELECT ClassID FROM StudentClasses WHERE StudentID = @studentID)

GO
/****** Object:  StoredProcedure [dbo].[spGetClassesByTeacher]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetClassesByTeacher]
	
	@TeacherID INT

AS

	SELECT DISTINCT ClassID, [Name]
	FROM Classes
	WHERE TeacherID = @TeacherID


GO
/****** Object:  StoredProcedure [dbo].[spGetNamesInHat]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetNamesInHat]
	@classID INT 
AS
	Select s.StudentID, fName, lName
	FROM StudentClassHatDraw sc
		JOIN Students s
		ON s.StudentID = sc.StudentID
	WHERE ClassID = @classID AND Drawn = 0
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentAssignmentsByAssignDate]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentAssignmentsByAssignDate]
	@studentID INT,
	@assignDate DATETIME

AS 

	SELECT * FROM Assignments
	WHERE ClassID IN (Select ClassID FROM StudentClasses WHERE StudentID = @studentID)
		AND CONVERT(date, @assignDate) = CONVERT(date, AssignDate) -- this ignores time, and only checks date


GO
/****** Object:  StoredProcedure [dbo].[spGetStudents]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudents]

AS
	SELECT * FROM Students
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentsByClass]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentsByClass]
	@classID INT
AS
	SELECT *
		FROM Students s
			JOIN StudentClasses sc		
				ON s.StudentID = sc.StudentID

			
		WHERE sc.ClassID = @classID
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentsByTeacher]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetStudentsByTeacher]
	@teacherID INT
AS
	SELECT Students.fName, Students.lName, Students.StudentID
		FROM Students
			JOIN StudentClasses		
				ON Students.StudentID = StudentClasses.StudentID
		WHERE StudentClasses.ClassID IN (Select ClassID FROM Classes WHERE TeacherID = @TeacherID)

GO
/****** Object:  StoredProcedure [dbo].[spGetStudentsMarkedAbsent]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[spGetStudentsMarkedAbsent]
	@date DATETIME = GETDATE

AS 

	SELECT DISTINCT StudentID, fName, lName
	FROM Students
	WHERE StudentID IN (SELECT StudentID FROM Attendance WHERE CONVERT(date, [Day]) = CONVERT(date, @date))

GO
/****** Object:  StoredProcedure [dbo].[spGetStudentsTemporarilyAbsent]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentsTemporarilyAbsent]

AS
	SELECT DISTINCT s.StudentID, s.fName, s.lName
	FROM Students s
		JOIN Attendance a
		ON s.StudentID = a.StudentID
		WHERE s.StudentID IN (Select StudentID FROM Attendance na WHERE na.Day = a.Day AND na.isPresent != a.isPresent)
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentsWithPerfectAttendance]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentsWithPerfectAttendance]

AS
	SELECT * FROM Students s
		JOIN Attendance a
		ON s.StudentID = a.StudentID
		WHERE s.StudentID NOT IN (SELECT StudentID FROM Attendance
									WHERE isPresent = 0
								)
GO
/****** Object:  StoredProcedure [dbo].[spGetTeacherByClass]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTeacherByClass]
	
	@classID INT

AS

	SELECT Teachers.TeacherID, fName, lName
		FROM Teachers
			JOIN Classes	
				ON Classes.TeacherID = Teachers.TeacherID
		WHERE ClassID = @ClassID


GO
/****** Object:  StoredProcedure [dbo].[spGetTeacherByUsername]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTeacherByUsername]
	@username varchar(30)
AS
	SELECT TeacherID, fName, lName
	FROM Teachers
	WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[spGetTeachersByStudent]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTeachersByStudent]
	
	@studentID INT

AS

	SELECT DISTINCT Teachers.TeacherID, fName, lName
		FROM Teachers
			JOIN Classes 
				ON Teachers.TeacherID = Classes.TeacherID
			JOIN StudentClasses	
				ON StudentClasses.ClassID = Classes.ClassID
		WHERE StudentClasses.StudentID = @studentID

GO
/****** Object:  StoredProcedure [dbo].[spGetTeacherStudentNotes]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTeacherStudentNotes]
	@StudentID int,
	@TeacherID int
AS
	IF EXISTS(SELECT NULL FROM TeacherStudentNotes WHERE StudentID = @StudentID AND TeacherID = @TeacherID) BEGIN
	SELECT s.StudentID, s.fName, s.lName, n.isTalkative, n.isNearsighted, n.notes
		FROM Students s
		LEFT JOIN TeacherStudentNotes n
			ON s.StudentID = n.StudentID
	WHERE s.StudentID = @StudentID AND n.TeacherID = @TeacherID

	END
	ELSE BEGIN
	SELECT s.StudentID, s.fName, s.lName, n.isTalkative, n.isNearsighted, n.notes
		FROM Students s
		LEFT JOIN TeacherStudentNotes n
			ON s.StudentID = n.StudentID
	WHERE s.StudentID = @StudentID 
	END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLogin]
	@username varchar(30),
	@password varchar(30)
AS
	DECLARE @Salt VARCHAR(10)
	DECLARE @PasswordWithSalt VARCHAR(40)
	DECLARE @PasswordHash VARBINARY(32)

	SET @Salt = (SELECT passwordSalt
		FROM Teachers
		WHERE username = @username
	)

	SET @PasswordHash = (SELECT passwordHash
		FROM Teachers
		WHERE username = @username
	)


	SET @PasswordWithSalt = @Salt + @password

	IF (HASHBYTES('SHA2_256', @PasswordWithSalt) = @PasswordHash)
		BEGIN 
			SELECT [Status] = 'login successful', TeacherID, fName, lName, username 
			FROM Teachers
				WHERE username = @username
		END
	ELSE
		BEGIN 
			SELECT [Status] ='login unsuccessful'
		END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveStudentFromClass]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveStudentFromClass]
	@studentID INT,
	@classID INT

AS 

	DELETE FROM StudentClasses
	WHERE StudentID = @studentID
		AND ClassID = @classID

	DELETE FROM StudentClassHatDraw
	WHERE StudentID = @studentID
		AND ClassID = @classID

GO
/****** Object:  StoredProcedure [dbo].[spResetHat]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spResetHat]
	@classID INT 
AS
	UPDATE StudentClassHatDraw
	SET Drawn = 0
	WHERE ClassID = @classID

GO
/****** Object:  StoredProcedure [dbo].[spSetTeacherStudentNotes]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSetTeacherStudentNotes]
	@StudentID int,
	@TeacherID int,
	@isTalkative bit = 0,
	@isNearsighted bit = 0, 
	@notes text
AS

	IF EXISTS(SELECT NULL FROM TeacherStudentNotes
				WHERE StudentID = @StudentID
				AND TeacherID = @TeacherID) BEGIN

		UPDATE TeacherStudentNotes
		SET 
			isTalkative = @isTalkative,
			isNearsighted = @isNearsighted,
			notes = @notes
		WHERE StudentID = @StudentID AND TeacherID = @TeacherID
	END

	ELSE BEGIN
		
		IF EXISTS(Select null from Students where StudentID = @StudentID) AND
			EXISTS(SELECT NULL FROM Teachers WHERE TeacherID = @TeacherID) BEGIN
				INSERT INTO TeacherStudentNotes (
					StudentID,
					TeacherID, 
					isTalkative, 
					isNearsighted, 
					notes
				) VALUES (
					@StudentID,
					@TeacherID,
					@isTalkative, 
					@isNearsighted, 
					@notes
				)
				
			END ELSE BEGIN
				SELECT [Error] = 'Either the student or teacher specified does not exist'
			END


	END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAttendance]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateAttendance]
	@attendanceID INT,
	@studentID INT,
	@classID INT,
	@Day DATETIME = GETDATE,
	@isPresent BIT

AS
	IF NOT EXISTS(
		SELECT NULL FROM Attendance
		WHERE
			AttendanceID != @attendanceID AND
			StudentID = @studentID AND
			ClassID = @classID AND
			CONVERT(date, [Day]) = CONVERT(date, @Day)
		) AND
		EXISTS(SELECT NULL FROM Students WHERE StudentID = @StudentID) AND
		EXISTS(SELECT NULL FROM Classes WHERE ClassID = @classID)

		BEGIN

			UPDATE Attendance
			SET
				StudentID =	@studentID,
				ClassID  =	@classID,
				[Day]	 =	@Day,
				isPresent = @isPresent
			WHERE AttendanceID = @attendanceID

	END ELSE BEGIN
		SELECT [Error] = 'Either this student has already been marked for attendance or ' +
			'the studentID or classID does not exist'
	END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateDeleteTeacher]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateDeleteTeacher]   

	@teacherID	INT,
    @fName		VARCHAR (30), 
    @lName		VARCHAR (30),
    @password	VARCHAR (30),
	@delete		BIT = 0

AS

IF (@delete = 1) BEGIN
	IF NOT EXISTS (SELECT NULL FROM Classes WHERE TeacherID = @teacherID)
		BEGIN
		DELETE FROM Teachers 
		WHERE TeacherID = @TeacherID
	END
END ELSE BEGIN

	IF EXISTS (SELECT NULL FROM Teachers 
					WHERE TeacherID = @TeacherID)
		BEGIN


-- make password salt, from mssqltips.com/sqlservertip/3293/add-a-salt-with-the-sql-server-hashbytes-function/
		DECLARE @Salt VARCHAR(10)

		DECLARE @Seed	INT
		DECLARE @LCV	TINYINT
		DECLARE @CTime	DATETIME

		SET @CTime = GETDATE();
		SET @Seed = (DATEPART(hh, @CTime) * 10000000) + (DATEPART(n, @CTime) * 100000)
			+ (DATEPART(s, @CTime) * 1000) + DATEPART(ms, @CTime)

		SET @LCV = 1;
		SET @Salt = CHAR(ROUND((RAND(@Seed) * 94.0) + 32, 3))

		WHILE (@LCV < 10)
		BEGIN
			SET @Salt = @Salt + CHAR(ROUND((RAND() * 94.0) + 32, 3))
			SET @LCV = @LCV + 1;
		END


		-- add salt to password, hash, also modified from above link

		DECLARE @PasswordWithSalt VARCHAR(40)
		SET @PasswordWithSalt = @Salt + @password
		DECLARE @HashedPassword VARBINARY(32)
		SET @HashedPassword = HASHBYTES('SHA2_256', @PasswordWithSalt)


		UPDATE Teachers
		SET
		    [fName]     =   	@fName, 
		    [lName]    	=		@lName,
		    [passwordHash]	=	@HashedPassword, 
		    [passwordSalt]	=	@Salt
		WHERE TeacherID = @TeacherID

	END ELSE BEGIN
		SELECT [Error] = 'A teacher with this username already exists.'
	END
END
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 5/11/2017 12:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END

GO
ENABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [TeacherHelper] SET  READ_WRITE 
GO
