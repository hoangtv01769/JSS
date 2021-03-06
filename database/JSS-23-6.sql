USE [master]
GO
/****** Object:  Database [JSS_System]    Script Date: 23/06/2015 21:48:57 ******/
CREATE DATABASE [JSS_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JSS_System', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JSS_System.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JSS_System_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JSS_System_log.ldf' , SIZE = 5056KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JSS_System] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JSS_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JSS_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JSS_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JSS_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JSS_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JSS_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [JSS_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JSS_System] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JSS_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JSS_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JSS_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JSS_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JSS_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JSS_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JSS_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JSS_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JSS_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JSS_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JSS_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JSS_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JSS_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JSS_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JSS_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JSS_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JSS_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JSS_System] SET  MULTI_USER 
GO
ALTER DATABASE [JSS_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JSS_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JSS_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JSS_System] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [JSS_System]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[AdministratorID] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertise](
	[AdvertiseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[AdvertiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlertEmail]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertEmail](
	[AlertEmail_ID] [int] IDENTITY(1,1) NOT NULL,
	[AlertEmail_content] [ntext] NOT NULL,
	[Staff_ID] [nvarchar](128) NOT NULL,
	[SendDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AlertEmail] PRIMARY KEY CLUSTERED 
(
	[AlertEmail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppliedJob]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppliedJob](
	[JobSeekerID] [nvarchar](128) NOT NULL,
	[JobID] [int] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[ApplyDate] [date] NOT NULL,
	[MatchingPercent] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AppliedJob] PRIMARY KEY CLUSTERED 
(
	[JobSeekerID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefit](
	[BenefitID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Benefit] PRIMARY KEY CLUSTERED 
(
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[RecruiterID] [nvarchar](128) NOT NULL,
	[LogoURL] [nvarchar](150) NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[District] [nvarchar](30) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Description] [ntext] NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[RecruiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyInfoCity]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfoCity](
	[RecuiterID] [nvarchar](128) NOT NULL,
	[CityID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyInfoCity] PRIMARY KEY CLUSTERED 
(
	[RecuiterID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[UserID] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[Gender] [bit] NOT NULL,
	[MaritalStatus] [bit] NOT NULL,
	[Nationality] [bit] NOT NULL,
	[Address] [nvarchar](150) NULL,
	[District] [nvarchar](20) NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactCity]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCity](
	[JobSeekerID] [nvarchar](128) NOT NULL,
	[CityID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ContactCity] PRIMARY KEY CLUSTERED 
(
	[JobSeekerID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DesiredBenefit]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesiredBenefit](
	[BenefitID] [int] NOT NULL,
	[JobSeekerID] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ResumeBenefit] PRIMARY KEY CLUSTERED 
(
	[BenefitID] ASC,
	[JobSeekerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EducationHistory]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationHistory](
	[EducationHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[School] [nvarchar](50) NOT NULL,
	[SchoolLevel_ID] [int] NOT NULL,
	[BeginMonth] [date] NULL,
	[EndMonth] [date] NULL,
	[Achievement] [ntext] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EducationHistory] PRIMARY KEY CLUSTERED 
(
	[EducationHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmploymentHistory]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentHistory](
	[EmploymentHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[BeginMonth] [date] NULL,
	[EndMonth] [date] NULL,
	[IsCurrentJob] [bit] NOT NULL,
	[Description] [ntext] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmploymentHistory] PRIMARY KEY CLUSTERED 
(
	[EmploymentHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpectedCategory]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpectedCategory](
	[ProfileID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ExpectedCategory] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpectedCity]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpectedCity](
	[ProfileID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ExpectedCity] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guest]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestEmail] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[GuestEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [nvarchar](128) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[MinSalary] [money] NULL,
	[MaxSalary] [money] NULL,
	[JobDescription] [ntext] NOT NULL,
	[JobLevel_ID] [int] NOT NULL,
	[MinSchoolLevel_ID] [int] NOT NULL,
	[StartedDate] [date] NULL,
	[EndedDate] [date] NULL,
	[IsPublic] [bit] NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobBenefit]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobBenefit](
	[BenefitID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_JobBenefit] PRIMARY KEY CLUSTERED 
(
	[BenefitID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobCategory]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCategory](
	[JobID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_JobCategory] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobCity]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCity](
	[JobID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_JobCity] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobLanguage]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobLanguage](
	[LanguageID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[Description] [ntext] NULL,
	[MinLevel_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LangueJob] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobLevel]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobLevel](
	[JobLevel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LevelNum] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PositionLevel] PRIMARY KEY CLUSTERED 
(
	[JobLevel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobPackage]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPackage](
	[JobPackageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[JobNumber] [int] NOT NULL,
	[PostDuration] [int] NOT NULL,
	[IsHighlight] [bit] NOT NULL,
	[IsCategoryPriority] [bit] NOT NULL,
	[IsHomepagePosting] [bit] NOT NULL,
	[AutoUpNumber] [int] NULL,
	[ViewMultiNumber] [int] NULL,
	[MoreDescription] [nvarchar](50) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_JobPackage] PRIMARY KEY CLUSTERED 
(
	[JobPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Jobseeker]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobseeker](
	[JobSeekerID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Jobseeker] PRIMARY KEY CLUSTERED 
(
	[JobSeekerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobSkill]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSkill](
	[Skill_ID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_JobSkill] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[Level_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[LevelNum] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[Level_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerID] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Message]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [nvarchar](128) NOT NULL,
	[Message_content] [ntext] NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[IsDeletedBySender] [bit] NOT NULL,
	[IsCanceled] [bit] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MessageReceiver]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageReceiver](
	[MessageID] [int] NOT NULL,
	[ReceiverID] [nvarchar](128) NOT NULL,
	[ReadTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MessageReceiver] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC,
	[ReceiverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OwnSkill]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnSkill](
	[Skill_ID] [int] NOT NULL,
	[JobSeekerID] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserSkill] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC,
	[JobSeekerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[YearOfExperience] [int] NOT NULL,
	[HighestSchoolLevel_ID] [int] NOT NULL,
	[MostRecentCompany] [nvarchar](50) NULL,
	[MostRecentPosition] [nvarchar](50) NULL,
	[CurrentJobLevel_ID] [int] NULL,
	[ExpectedPosition] [nvarchar](50) NOT NULL,
	[ExpectedJobLevel_ID] [int] NOT NULL,
	[ExpectedMinSalary] [money] NOT NULL,
	[ExpectedMaxSalary] [money] NULL,
	[Objectives] [ntext] NOT NULL,
	[JobSeekerID] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Resume] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfileLanguage]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileLanguage](
	[LanguageID] [int] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[Level_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LanguageResume] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC,
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseAdvertise]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseAdvertise](
	[PurchaseAdsID] [int] IDENTITY(1,1) NOT NULL,
	[AdvertiseID] [int] NOT NULL,
	[RecuiterID] [nvarchar](128) NOT NULL,
	[LogoUrl] [nvarchar](200) NOT NULL,
	[LinkUrl] [nvarchar](200) NOT NULL,
	[PurchasedDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ManagerID] [nvarchar](128) NULL,
 CONSTRAINT [PK_PurchaseAdvertise_1] PRIMARY KEY CLUSTERED 
(
	[PurchaseAdsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseJobPackage]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseJobPackage](
	[PurchaseJobPackageID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [nvarchar](128) NOT NULL,
	[JobPackageID] [int] NOT NULL,
	[PurchasedDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[StaffID] [nvarchar](128) NULL,
 CONSTRAINT [PK_PurchaseJobPackage] PRIMARY KEY CLUSTERED 
(
	[PurchaseJobPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[RecruiterID] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Recruiter] PRIMARY KEY CLUSTERED 
(
	[RecruiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReferencePerson]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferencePerson](
	[ReferencePersonID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReferencePerson] PRIMARY KEY CLUSTERED 
(
	[ReferencePersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[Report_content] [ntext] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[SenderID] [nvarchar](128) NOT NULL,
	[IsSolved] [bit] NOT NULL,
	[SolvedUserID] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolLevel]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolLevel](
	[SchoolLevel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[LevelNum] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SchoolLevel] PRIMARY KEY CLUSTERED 
(
	[SchoolLevel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[Skill_ID] [int] NOT NULL,
	[SkillTag] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[WriterID] [nvarchar](128) NOT NULL,
	[Topic_content] [ntext] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedStaffID] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ViewProfile]    Script Date: 23/06/2015 21:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewProfile](
	[RecruiterID] [nvarchar](128) NOT NULL,
	[ProfileID] [int] NOT NULL,
	[ViewedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ViewResume] PRIMARY KEY CLUSTERED 
(
	[RecruiterID] ASC,
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 23/06/2015 21:48:58 ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 23/06/2015 21:48:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 23/06/2015 21:48:58 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 23/06/2015 21:48:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF__Resume__IsRepres__2F10007B]  DEFAULT ('false') FOR [IsActive]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_AspNetUsers] FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_AspNetUsers]
GO
ALTER TABLE [dbo].[AlertEmail]  WITH CHECK ADD  CONSTRAINT [FK_AlertEmail_Staff] FOREIGN KEY([Staff_ID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[AlertEmail] CHECK CONSTRAINT [FK_AlertEmail_Staff]
GO
ALTER TABLE [dbo].[AppliedJob]  WITH CHECK ADD  CONSTRAINT [FK_AppliedJob_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[AppliedJob] CHECK CONSTRAINT [FK_AppliedJob_Job]
GO
ALTER TABLE [dbo].[AppliedJob]  WITH CHECK ADD  CONSTRAINT [FK_AppliedJob_Jobseeker] FOREIGN KEY([JobSeekerID])
REFERENCES [dbo].[Jobseeker] ([JobSeekerID])
GO
ALTER TABLE [dbo].[AppliedJob] CHECK CONSTRAINT [FK_AppliedJob_Jobseeker]
GO
ALTER TABLE [dbo].[AppliedJob]  WITH CHECK ADD  CONSTRAINT [FK_AppliedJob_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[AppliedJob] CHECK CONSTRAINT [FK_AppliedJob_Profile]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CompanyInfo]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInfo_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[CompanyInfo] CHECK CONSTRAINT [FK_CompanyInfo_Recruiter]
GO
ALTER TABLE [dbo].[CompanyInfoCity]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInfoCity_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[CompanyInfoCity] CHECK CONSTRAINT [FK_CompanyInfoCity_City]
GO
ALTER TABLE [dbo].[CompanyInfoCity]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInfoCity_CompanyInfo] FOREIGN KEY([RecuiterID])
REFERENCES [dbo].[CompanyInfo] ([RecruiterID])
GO
ALTER TABLE [dbo].[CompanyInfoCity] CHECK CONSTRAINT [FK_CompanyInfoCity_CompanyInfo]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_AspNetUsers]
GO
ALTER TABLE [dbo].[ContactCity]  WITH CHECK ADD  CONSTRAINT [FK_ContactCity_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[ContactCity] CHECK CONSTRAINT [FK_ContactCity_City]
GO
ALTER TABLE [dbo].[ContactCity]  WITH CHECK ADD  CONSTRAINT [FK_ContactCity_Contact] FOREIGN KEY([JobSeekerID])
REFERENCES [dbo].[Contact] ([UserID])
GO
ALTER TABLE [dbo].[ContactCity] CHECK CONSTRAINT [FK_ContactCity_Contact]
GO
ALTER TABLE [dbo].[DesiredBenefit]  WITH CHECK ADD  CONSTRAINT [FK_DesiredBenefit_Benefit] FOREIGN KEY([BenefitID])
REFERENCES [dbo].[Benefit] ([BenefitID])
GO
ALTER TABLE [dbo].[DesiredBenefit] CHECK CONSTRAINT [FK_DesiredBenefit_Benefit]
GO
ALTER TABLE [dbo].[DesiredBenefit]  WITH CHECK ADD  CONSTRAINT [FK_DesiredBenefit_Jobseeker] FOREIGN KEY([JobSeekerID])
REFERENCES [dbo].[Jobseeker] ([JobSeekerID])
GO
ALTER TABLE [dbo].[DesiredBenefit] CHECK CONSTRAINT [FK_DesiredBenefit_Jobseeker]
GO
ALTER TABLE [dbo].[EducationHistory]  WITH CHECK ADD  CONSTRAINT [FK_EducationHistory_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[EducationHistory] CHECK CONSTRAINT [FK_EducationHistory_Profile]
GO
ALTER TABLE [dbo].[EducationHistory]  WITH CHECK ADD  CONSTRAINT [FK_EducationHistory_SchoolLevel] FOREIGN KEY([SchoolLevel_ID])
REFERENCES [dbo].[SchoolLevel] ([SchoolLevel_ID])
GO
ALTER TABLE [dbo].[EducationHistory] CHECK CONSTRAINT [FK_EducationHistory_SchoolLevel]
GO
ALTER TABLE [dbo].[EmploymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentHistory_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[EmploymentHistory] CHECK CONSTRAINT [FK_EmploymentHistory_Profile]
GO
ALTER TABLE [dbo].[ExpectedCategory]  WITH CHECK ADD  CONSTRAINT [FK_ExpectedCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ExpectedCategory] CHECK CONSTRAINT [FK_ExpectedCategory_Category]
GO
ALTER TABLE [dbo].[ExpectedCategory]  WITH CHECK ADD  CONSTRAINT [FK_ExpectedCategory_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[ExpectedCategory] CHECK CONSTRAINT [FK_ExpectedCategory_Profile]
GO
ALTER TABLE [dbo].[ExpectedCity]  WITH CHECK ADD  CONSTRAINT [FK_ExpectedCity_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[ExpectedCity] CHECK CONSTRAINT [FK_ExpectedCity_City]
GO
ALTER TABLE [dbo].[ExpectedCity]  WITH CHECK ADD  CONSTRAINT [FK_ExpectedCity_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[ExpectedCity] CHECK CONSTRAINT [FK_ExpectedCity_Profile]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_JobLevel] FOREIGN KEY([JobLevel_ID])
REFERENCES [dbo].[JobLevel] ([JobLevel_ID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_JobLevel]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Recruiter]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_SchoolLevel] FOREIGN KEY([MinSchoolLevel_ID])
REFERENCES [dbo].[SchoolLevel] ([SchoolLevel_ID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_SchoolLevel]
GO
ALTER TABLE [dbo].[JobBenefit]  WITH CHECK ADD  CONSTRAINT [FK_JobBenefit_Benefit] FOREIGN KEY([BenefitID])
REFERENCES [dbo].[Benefit] ([BenefitID])
GO
ALTER TABLE [dbo].[JobBenefit] CHECK CONSTRAINT [FK_JobBenefit_Benefit]
GO
ALTER TABLE [dbo].[JobBenefit]  WITH CHECK ADD  CONSTRAINT [FK_JobBenefit_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobBenefit] CHECK CONSTRAINT [FK_JobBenefit_Job]
GO
ALTER TABLE [dbo].[JobCategory]  WITH CHECK ADD  CONSTRAINT [FK_JobCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[JobCategory] CHECK CONSTRAINT [FK_JobCategory_Category]
GO
ALTER TABLE [dbo].[JobCategory]  WITH CHECK ADD  CONSTRAINT [FK_JobCategory_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobCategory] CHECK CONSTRAINT [FK_JobCategory_Job]
GO
ALTER TABLE [dbo].[JobCity]  WITH CHECK ADD  CONSTRAINT [FK_JobCity_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[JobCity] CHECK CONSTRAINT [FK_JobCity_City]
GO
ALTER TABLE [dbo].[JobCity]  WITH CHECK ADD  CONSTRAINT [FK_JobCity_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobCity] CHECK CONSTRAINT [FK_JobCity_Job]
GO
ALTER TABLE [dbo].[JobLanguage]  WITH CHECK ADD  CONSTRAINT [FK_JobLanguage_Job1] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobLanguage] CHECK CONSTRAINT [FK_JobLanguage_Job1]
GO
ALTER TABLE [dbo].[JobLanguage]  WITH CHECK ADD  CONSTRAINT [FK_JobLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[JobLanguage] CHECK CONSTRAINT [FK_JobLanguage_Language]
GO
ALTER TABLE [dbo].[JobLanguage]  WITH CHECK ADD  CONSTRAINT [FK_JobLanguage_Level] FOREIGN KEY([MinLevel_ID])
REFERENCES [dbo].[Level] ([Level_ID])
GO
ALTER TABLE [dbo].[JobLanguage] CHECK CONSTRAINT [FK_JobLanguage_Level]
GO
ALTER TABLE [dbo].[Jobseeker]  WITH CHECK ADD  CONSTRAINT [FK_Jobseeker_AspNetUsers] FOREIGN KEY([JobSeekerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Jobseeker] CHECK CONSTRAINT [FK_Jobseeker_AspNetUsers]
GO
ALTER TABLE [dbo].[JobSkill]  WITH CHECK ADD  CONSTRAINT [FK_JobSkill_Job1] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobSkill] CHECK CONSTRAINT [FK_JobSkill_Job1]
GO
ALTER TABLE [dbo].[JobSkill]  WITH CHECK ADD  CONSTRAINT [FK_JobSkill_Skill] FOREIGN KEY([Skill_ID])
REFERENCES [dbo].[Skill] ([Skill_ID])
GO
ALTER TABLE [dbo].[JobSkill] CHECK CONSTRAINT [FK_JobSkill_Skill]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_AspNetUsers] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_AspNetUsers]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_AspNetUsers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_AspNetUsers]
GO
ALTER TABLE [dbo].[MessageReceiver]  WITH CHECK ADD  CONSTRAINT [FK_MessageReceiver_AspNetUsers] FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MessageReceiver] CHECK CONSTRAINT [FK_MessageReceiver_AspNetUsers]
GO
ALTER TABLE [dbo].[MessageReceiver]  WITH CHECK ADD  CONSTRAINT [FK_MessageReceiver_Message] FOREIGN KEY([MessageID])
REFERENCES [dbo].[Message] ([MessageID])
GO
ALTER TABLE [dbo].[MessageReceiver] CHECK CONSTRAINT [FK_MessageReceiver_Message]
GO
ALTER TABLE [dbo].[OwnSkill]  WITH CHECK ADD  CONSTRAINT [FK_OwnSkill_Jobseeker] FOREIGN KEY([JobSeekerID])
REFERENCES [dbo].[Jobseeker] ([JobSeekerID])
GO
ALTER TABLE [dbo].[OwnSkill] CHECK CONSTRAINT [FK_OwnSkill_Jobseeker]
GO
ALTER TABLE [dbo].[OwnSkill]  WITH CHECK ADD  CONSTRAINT [FK_OwnSkill_Skill] FOREIGN KEY([Skill_ID])
REFERENCES [dbo].[Skill] ([Skill_ID])
GO
ALTER TABLE [dbo].[OwnSkill] CHECK CONSTRAINT [FK_OwnSkill_Skill]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_JobLevel] FOREIGN KEY([CurrentJobLevel_ID])
REFERENCES [dbo].[JobLevel] ([JobLevel_ID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_JobLevel]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_JobLevel1] FOREIGN KEY([ExpectedJobLevel_ID])
REFERENCES [dbo].[JobLevel] ([JobLevel_ID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_JobLevel1]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Jobseeker] FOREIGN KEY([JobSeekerID])
REFERENCES [dbo].[Jobseeker] ([JobSeekerID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Jobseeker]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_SchoolLevel] FOREIGN KEY([HighestSchoolLevel_ID])
REFERENCES [dbo].[SchoolLevel] ([SchoolLevel_ID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_SchoolLevel]
GO
ALTER TABLE [dbo].[ProfileLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ProfileLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[ProfileLanguage] CHECK CONSTRAINT [FK_ProfileLanguage_Language]
GO
ALTER TABLE [dbo].[ProfileLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ProfileLanguage_Level] FOREIGN KEY([Level_ID])
REFERENCES [dbo].[Level] ([Level_ID])
GO
ALTER TABLE [dbo].[ProfileLanguage] CHECK CONSTRAINT [FK_ProfileLanguage_Level]
GO
ALTER TABLE [dbo].[ProfileLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ProfileLanguage_Profile] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[ProfileLanguage] CHECK CONSTRAINT [FK_ProfileLanguage_Profile]
GO
ALTER TABLE [dbo].[PurchaseAdvertise]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseAdvertise_Advertise] FOREIGN KEY([AdvertiseID])
REFERENCES [dbo].[Advertise] ([AdvertiseID])
GO
ALTER TABLE [dbo].[PurchaseAdvertise] CHECK CONSTRAINT [FK_PurchaseAdvertise_Advertise]
GO
ALTER TABLE [dbo].[PurchaseAdvertise]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseAdvertise_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
GO
ALTER TABLE [dbo].[PurchaseAdvertise] CHECK CONSTRAINT [FK_PurchaseAdvertise_Manager]
GO
ALTER TABLE [dbo].[PurchaseAdvertise]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseAdvertise_Recruiter] FOREIGN KEY([RecuiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[PurchaseAdvertise] CHECK CONSTRAINT [FK_PurchaseAdvertise_Recruiter]
GO
ALTER TABLE [dbo].[PurchaseJobPackage]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseJobPackage_JobPackage] FOREIGN KEY([JobPackageID])
REFERENCES [dbo].[JobPackage] ([JobPackageID])
GO
ALTER TABLE [dbo].[PurchaseJobPackage] CHECK CONSTRAINT [FK_PurchaseJobPackage_JobPackage]
GO
ALTER TABLE [dbo].[PurchaseJobPackage]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseJobPackage_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[PurchaseJobPackage] CHECK CONSTRAINT [FK_PurchaseJobPackage_Recruiter]
GO
ALTER TABLE [dbo].[PurchaseJobPackage]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseJobPackage_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[PurchaseJobPackage] CHECK CONSTRAINT [FK_PurchaseJobPackage_Staff]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_AspNetUsers] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_AspNetUsers]
GO
ALTER TABLE [dbo].[ReferencePerson]  WITH CHECK ADD  CONSTRAINT [FK_ReferencePerson_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[ReferencePerson] CHECK CONSTRAINT [FK_ReferencePerson_Profile]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_AspNetUsers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_AspNetUsers]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_AspNetUsers1] FOREIGN KEY([SolvedUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_AspNetUsers1]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_AspNetUsers] FOREIGN KEY([StaffID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_AspNetUsers]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_AspNetUsers] FOREIGN KEY([WriterID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_AspNetUsers]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Staff] FOREIGN KEY([UpdatedStaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Staff]
GO
ALTER TABLE [dbo].[ViewProfile]  WITH CHECK ADD  CONSTRAINT [FK_ViewProfile_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[Profile] ([ProfileID])
GO
ALTER TABLE [dbo].[ViewProfile] CHECK CONSTRAINT [FK_ViewProfile_Profile]
GO
ALTER TABLE [dbo].[ViewProfile]  WITH CHECK ADD  CONSTRAINT [FK_ViewProfile_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([RecruiterID])
GO
ALTER TABLE [dbo].[ViewProfile] CHECK CONSTRAINT [FK_ViewProfile_Recruiter]
GO
USE [master]
GO
ALTER DATABASE [JSS_System] SET  READ_WRITE 
GO
