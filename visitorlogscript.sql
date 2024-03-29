USE [master]
GO
/****** Object:  Database [Bonyan]    Script Date: 9/7/2019 11:10:43 AM ******/
CREATE DATABASE [Bonyan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bonyan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bonyan.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bonyan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bonyan_log.ldf' , SIZE = 9216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bonyan] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bonyan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bonyan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bonyan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bonyan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bonyan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bonyan] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bonyan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bonyan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bonyan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bonyan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bonyan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bonyan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bonyan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bonyan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bonyan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bonyan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bonyan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bonyan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bonyan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bonyan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bonyan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bonyan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bonyan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bonyan] SET RECOVERY FULL 
GO
ALTER DATABASE [Bonyan] SET  MULTI_USER 
GO
ALTER DATABASE [Bonyan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bonyan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bonyan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bonyan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Bonyan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bonyan] SET QUERY_STORE = OFF
GO
USE [Bonyan]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Bonyan]
GO
/****** Object:  Table [dbo].[purposeofvisit]    Script Date: 9/7/2019 11:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purposeofvisit](
	[purposeid] [int] IDENTITY(1,1) NOT NULL,
	[purpose] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_purposeofvisit] PRIMARY KEY CLUSTERED 
(
	[purpose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 9/7/2019 11:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitors]    Script Date: 9/7/2019 11:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[company] [nvarchar](150) NULL,
	[purpose] [nvarchar](100) NULL,
	[contactperson] [nvarchar](100) NULL,
	[gender] [varchar](10) NULL,
	[mobile] [varchar](15) NULL,
	[IDNumber] [varchar](20) NULL,
	[Notes] [nvarchar](350) NULL,
	[transactiondate] [datetime] NOT NULL,
	[createdby] [varchar](20) NULL,
	[status] [int] NULL,
	[void] [int] NULL,
	[lastmodified] [datetime] NULL,
	[modifiedby] [varchar](20) NULL,
	[visitorIn] [datetime] NOT NULL,
	[visitorOut] [datetime] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_visitors] PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[transactiondate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[visitors] ADD  CONSTRAINT [DF_visitors_transactiondate]  DEFAULT (getdate()) FOR [transactiondate]
GO
ALTER TABLE [dbo].[visitors] ADD  CONSTRAINT [DF_visitors_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[visitors] ADD  CONSTRAINT [DF_visitors_void]  DEFAULT ((0)) FOR [void]
GO
ALTER TABLE [dbo].[visitors] ADD  CONSTRAINT [DF_visitors_visitorIn]  DEFAULT (getdate()) FOR [visitorIn]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessVisitor]    Script Date: 9/7/2019 11:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rommel  Pineda>
-- Create date: <26.06.2019>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessVisitor]
	-- Add the parameters for the stored procedure here
	@id int = null ,
	@name nvarchar(150) = null,
	@company nvarchar(150) = null,
	@purpose nvarchar(100) = null,
	@contactperson nvarchar(100) = null,
	@gender varchar(10) = null,
	@mobile varchar(15) = null,
	@idnumber varchar(20) = null,
	@notes nvarchar(350) = null,
	@createdby varchar(20) = null,
	@status int = null, -- 0 in | 1 out |2 idk
	@void int = null, -- 0 notvoid 1 | 1 void
	@email nvarchar(100) = null,
	@transactiontype varchar(10) =NULL-- visitorout,edit,delete
	
AS
BEGIN
	if @transactiontype='delete'
		begin
			delete from dbo.visitors where id=@id
		end
	else if @transactiontype='visitorout'
		begin
			update dbo.visitors
				set status=1,visitorOut=GETDATE(),modifiedby=@createdby
			where id=@id
		end
	else 
	begin	
		update dbo.visitors
		set name=@name,company=@company,purpose=@purpose,contactperson=@contactperson,gender=@gender,
		mobile=@mobile,IDNumber=@idnumber,Notes=@notes,lastmodified=GETDATE(),modifiedby=@createdby,email=@email
		where id=@id
		
		if @@ROWCOUNT = 0 
		begin
		 insert into dbo.visitors 
		 (name,company,purpose,contactperson,gender,mobile,IDNumber,Notes,createdby,email)
		 values
		 (@name,@company,@purpose,@contactperson,@gender,@mobile,@IDNumber,@Notes,@createdby,@email)
		end
	end
END
GO
USE [master]
GO
ALTER DATABASE [Bonyan] SET  READ_WRITE 
GO
