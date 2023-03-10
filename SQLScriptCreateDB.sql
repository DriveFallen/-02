USE [master]
GO
/****** Object:  Database [Издательский_центр]    Script Date: 02.02.2023 19:48:17 ******/
CREATE DATABASE [Издательский_центр]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Издательский_центр', FILENAME = N'G:\Programms\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Издательский_центр.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Издательский_центр_log', FILENAME = N'G:\Programms\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Издательский_центр_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Издательский_центр] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Издательский_центр].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Издательский_центр] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Издательский_центр] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Издательский_центр] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Издательский_центр] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Издательский_центр] SET ARITHABORT OFF 
GO
ALTER DATABASE [Издательский_центр] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Издательский_центр] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Издательский_центр] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Издательский_центр] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Издательский_центр] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Издательский_центр] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Издательский_центр] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Издательский_центр] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Издательский_центр] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Издательский_центр] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Издательский_центр] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Издательский_центр] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Издательский_центр] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Издательский_центр] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Издательский_центр] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Издательский_центр] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Издательский_центр] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Издательский_центр] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Издательский_центр] SET  MULTI_USER 
GO
ALTER DATABASE [Издательский_центр] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Издательский_центр] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Издательский_центр] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Издательский_центр] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Издательский_центр] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Издательский_центр] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Издательский_центр] SET QUERY_STORE = OFF
GO
USE [Издательский_центр]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ID_Book] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Copys] [int] NOT NULL,
	[Date_output] [date] NOT NULL,
	[Price_cost] [money] NOT NULL,
	[Price_sale] [money] NOT NULL,
	[Honorarium] [money] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ID_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Company_name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Contact_fullname] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Company_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ID_Contract] [int] NOT NULL,
	[Date_start] [date] NOT NULL,
	[Contract_term] [int] NOT NULL,
	[Contract_closed] [bit] NOT NULL,
	[Date_stop] [date] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ID_Contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID_Order] [int] IDENTITY(1,1) NOT NULL,
	[Client_name] [nvarchar](50) NOT NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NULL,
	[Book] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[ID_Writer] [int] IDENTITY(1,1) NOT NULL,
	[Passport_number] [nvarchar](11) NOT NULL,
	[Fullname] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Writers] PRIMARY KEY CLUSTERED 
(
	[ID_Writer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uc_Passport] UNIQUE NONCLUSTERED 
(
	[Passport_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers_Books]    Script Date: 02.02.2023 19:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers_Books](
	[ID_Writer] [int] NOT NULL,
	[ID_Book] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Writers] FOREIGN KEY([ID_Contract])
REFERENCES [dbo].[Writers] ([ID_Writer])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Writers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Books] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([ID_Book])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Books]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([Client_name])
REFERENCES [dbo].[Clients] ([Company_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Writers_Books]  WITH CHECK ADD  CONSTRAINT [FK_Writers_Books_Books] FOREIGN KEY([ID_Book])
REFERENCES [dbo].[Books] ([ID_Book])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Writers_Books] CHECK CONSTRAINT [FK_Writers_Books_Books]
GO
ALTER TABLE [dbo].[Writers_Books]  WITH CHECK ADD  CONSTRAINT [FK_Writers_Books_Writers] FOREIGN KEY([ID_Writer])
REFERENCES [dbo].[Writers] ([ID_Writer])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Writers_Books] CHECK CONSTRAINT [FK_Writers_Books_Writers]
GO
USE [master]
GO
ALTER DATABASE [Издательский_центр] SET  READ_WRITE 
GO
