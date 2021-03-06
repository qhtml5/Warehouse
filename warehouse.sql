SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OutW]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OutW](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Batch] [varchar](50) NULL,
	[Agent] [varchar](50) NULL,
	[Barcode] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[User]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Level]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](50) NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelName] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LevelPrice]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LevelPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](50) NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[Price] [money] NULL,
	[Operator] [varchar](50) NULL,
	[OperatorTime] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Agent]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Contact] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[LevelName] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Fox] [varchar](50) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Supply]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Supply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplyID] [varchar](50) NOT NULL,
	[AgentName] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[SumPrice] [money] NOT NULL,
	[Operator] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Supply_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Supply] PRIMARY KEY CLUSTERED 
(
	[SupplyID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[InW]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[InW](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Batch] [varchar](50) NOT NULL,
	[NormName] [varchar](50) NULL,
	[Barcode] [varchar](100) NULL,
	[CreateTime] [datetime] NULL CONSTRAINT [DF_InW_CreateTime]  DEFAULT (getdate()),
	[Operator] [varchar](50) NULL,
	[Cnt] [int] NULL,
	[InTime] [datetime] NULL CONSTRAINT [DF_InW_InTime]  DEFAULT (getdate()),
	[BigCnt] [int] NULL,
	[Machine] [int] NULL,
	[Length] [int] NULL,
 CONSTRAINT [PK_InW] PRIMARY KEY CLUSTERED 
(
	[Batch] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SupplyDetail]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SupplyDetail](
	[SupplyID] [varchar](50) NOT NULL,
	[Barcode] [varchar](50) NULL,
	[NormName] [varchar](50) NULL,
	[Price] [money] NULL,
	[SumMoney] [money] NULL,
	[Cnt] [int] NULL CONSTRAINT [DF_SupplyDetail_Cnt]  DEFAULT ((1)),
	[CreateTime] [datetime] NULL CONSTRAINT [DF_SupplyDetail_CreateTime]  DEFAULT (getdate()),
	[Length] [int] NULL CONSTRAINT [DF_SupplyDetail_Length]  DEFAULT ((100))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[InWDetail]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[InWDetail](
	[BatchID] [varchar](50) NULL,
	[Barcode] [varchar](50) NULL,
	[NormName] [varchar](50) NULL,
	[Cnt] [int] NULL CONSTRAINT [DF_InwDetail_Cnt]  DEFAULT ((1)),
	[CreateTime] [datetime] NULL CONSTRAINT [DF_InwDetail_CreateTime]  DEFAULT (getdate()),
	[Length] [int] NULL,
	[PrintCnt] [int] NULL CONSTRAINT [DF_InWDetail_PrintCnt]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Argument]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Argument](
	[ArgName] [varchar](50) NOT NULL,
	[ArgValue] [varchar](1000) NULL,
 CONSTRAINT [PK_Argument] PRIMARY KEY CLUSTERED 
(
	[ArgName] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Norm]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Norm](
	[NormID] [int] IDENTITY(1,1) NOT NULL,
	[NormName] [varchar](50) NULL,
 CONSTRAINT [PK_Norm] PRIMARY KEY CLUSTERED 
(
	[NormID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END



---初始化数据
INSERT INTO Argument(ArgName) VALUES('Address')
INSERT INTO Argument(ArgName) VALUES('Name')
INSERT INTO Argument(ArgName) VALUES('Phone')
INSERT INTO Argument(ArgName) VALUES('GoodsName')

INSERT INTO [USER](UserName,UserPwd,Position) VALUES('admin','123456','系统管理员')