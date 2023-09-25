USE [HotelDB]
GO
/****** Object:  Schema [Hotel]    Script Date: 9/25/2023 11:49:15 AM ******/
CREATE SCHEMA [Hotel]
GO
/****** Object:  Schema [Master]    Script Date: 9/25/2023 11:49:15 AM ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Table [Hotel].[Payments]    Script Date: 9/25/2023 11:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hotel].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[PaymentTypeID] [int] NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hotel].[RoomBookings]    Script Date: 9/25/2023 11:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hotel].[RoomBookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](500) NOT NULL,
	[CustomerAddress] [nvarchar](550) NOT NULL,
	[BookingFrom] [date] NOT NULL,
	[BookingTo] [date] NOT NULL,
	[AssignRoomID] [int] NOT NULL,
	[NoOfMembers] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_RoomBookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hotel].[Rooms]    Script Date: 9/25/2023 11:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hotel].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](5) NOT NULL,
	[RoomImage] [nvarchar](550) NOT NULL,
	[RoomPrice] [decimal](18, 2) NOT NULL,
	[BookingStatusID] [int] NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[RoomCapacity] [int] NOT NULL,
	[RoomDescription] [nvarchar](550) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[BookingStatus]    Script Date: 9/25/2023 11:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[BookingStatus](
	[BookingStatusID] [int] IDENTITY(1,1) NOT NULL,
	[BookingStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BookingStatus] PRIMARY KEY CLUSTERED 
(
	[BookingStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[PaymentTypes]    Script Date: 9/25/2023 11:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[PaymentTypes](
	[PaymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[RoomTypes]    Script Date: 9/25/2023 11:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[RoomTypes](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Hotel].[Payments] ADD  CONSTRAINT [DF_Payments_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Hotel].[Rooms] ADD  CONSTRAINT [DF_Rooms_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
