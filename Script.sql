USE [master]
GO
/****** Object:  Database [WaiTaiBD]    Script Date: 05.05.2023 23:50:08 ******/
CREATE DATABASE [WaiTaiBD]

GO
USE [WaiTaiBD]
GO
/****** Object:  Table [dbo].[Buy]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyDate] [datetime] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[LeftTotal] [float] NULL,
 CONSTRAINT [PK_Abonement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Info] [nvarchar](1000) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PriceListId] [int] NOT NULL,
	[VisitDate] [datetime] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[MasterId] [int] NOT NULL,
	[Visited] [bit] NOT NULL,
	[Payed] [bit] NOT NULL,
	[BuyId] [int] NULL,
	[BuyPrice] [float] NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceList]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PriceTypeId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_PriceList_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceType]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](10) NOT NULL,
	[Minutes] [int] NOT NULL,
 CONSTRAINT [PK_PriceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 05.05.2023 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buy] ON 

INSERT [dbo].[Buy] ([Id], [BuyDate], [Phone], [Email], [Title], [Price], [LeftTotal]) VALUES (1, CAST(N'2023-05-04T19:18:18.300' AS DateTime), N'+7 (960) 177-45-40', N'LiyaBulgakova998@mail.ru', N'Булгакова Лия Анатольевна', 4000, 300)
INSERT [dbo].[Buy] ([Id], [BuyDate], [Phone], [Email], [Title], [Price], [LeftTotal]) VALUES (2, CAST(N'2023-05-04T21:20:30.530' AS DateTime), N'+7 (920) 113-35-80', N'ElizaBalandina929@mail.ru', N'Баландина Элиза Федоровна', 8000, 0)
INSERT [dbo].[Buy] ([Id], [BuyDate], [Phone], [Email], [Title], [Price], [LeftTotal]) VALUES (3, CAST(N'2023-05-05T22:59:21.563' AS DateTime), N'+7 (911) 144-78-55', N'AnzhelaLeonova622@mail.ru', N'Леонова Анжела Михайловна', 8000, 0)
INSERT [dbo].[Buy] ([Id], [BuyDate], [Phone], [Email], [Title], [Price], [LeftTotal]) VALUES (4, CAST(N'2023-05-05T23:12:55.360' AS DateTime), N'+7 (978) 951-31-73', N'MokeyOblomov959@mail.ru', N'Обломов Мокей Денисович', 5000, 5000)
INSERT [dbo].[Buy] ([Id], [BuyDate], [Phone], [Email], [Title], [Price], [LeftTotal]) VALUES (5, CAST(N'2023-05-05T23:13:57.483' AS DateTime), N'+7 (902) 660-45-46', N'LyubomilaSharypova215@mail.ru', N'Шарыпова Любомила Федоровна', 6000, 6000)
INSERT [dbo].[Buy] ([Id], [BuyDate], [Phone], [Email], [Title], [Price], [LeftTotal]) VALUES (6, CAST(N'2023-05-05T23:14:39.883' AS DateTime), N'+7 (966) 849-09-91', N'KiraBystrova848@mail.ru', N'Быстрова Кира Виталиевна', 9000, 9000)
SET IDENTITY_INSERT [dbo].[Buy] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Тайский массаж')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Расслабляющий массаж')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Спа программы')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Коррекция фигуры')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'СПА для двоих')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Массажи категории СПА')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Master] ON 

INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (1, N'Пао', N'У Пао отличная школа и огромный опыт работы в лучших спа салонах мира. Все программы в ее исполнении проходят на очень высоком уровне и это привлекает к ней постоянных гостей.', N'Pao.jpg')
INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (2, N'Саян', N'Мастер из Тайланда, владеющая всеми видами массажа, обладает чутьем и пониманием как легко можно устранить проблемы. Саян-обладает аккуратной, деликатной и вместе с этим сильной техникой массажа.
', N'sayan.jpg')
INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (3, N'Насита', N'Тайский мастер с сильными руками и душевной теплотой. Натаван чувствует проблемные места в теле и эффективно прорабатывает зоны, а ее забота и внимание будут приятными бонусом в сочетании с высокой техникой массажа.', N'Nasita.jpg')
INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (4, N'Пу', N'Тайский мастер с сильными руками и душевной теплотой. Натаван чувствует проблемные места в теле и эффективно прорабатывает зоны, а ее забота и внимание будут приятными бонусом в сочетании с высокой техникой массажа.', N'poo.jpeg')
INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (5, N'Биа', N'Биа - мастер с необычайно светлой энергетикой. Она покорит Вас высоким профессионализмом, выработанным за годы практики, и своими, погружающими в мир наслаждения и спокойствия, руками. Душевная гармония и великолепно отдохнувшее тело станут Вашими спутниками еще на долгое время.', N'bia.jpg')
INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (6, N'Минки', N'Минки - молодая и невероятно позитивная наша сотрудница. Несмотря на свой возраст, она даст фору любому мастеру с огромным опытом работы. У нее сильные, но при этом нежные руки. Деликатный массаж с проработкой всех проблемных зон - это ее "конек".', N'1Ninki-foto.jpeg')
INSERT [dbo].[Master] ([Id], [Title], [Info], [Photo]) VALUES (7, N'Лат', N'Мастер Лат с огромным опытом работы! Она владеет техниками тайского, проникновенного массажа. Массаж в исполнении мастера Лат подарит незабываемые впечатления и наполнит Вас жизненной энергией! Ждем Вас!', N'1Lat-foto.jpeg')
SET IDENTITY_INSERT [dbo].[Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Phone], [Email], [OrderDate], [PriceListId], [VisitDate], [Title], [MasterId], [Visited], [Payed], [BuyId], [BuyPrice]) VALUES (6, N'+7 (955) 127-98-51', N'VladilenaMatvienko810@yandex.ru', CAST(N'2023-05-05T23:08:34.507' AS DateTime), 76, CAST(N'2023-05-06T16:20:00.000' AS DateTime), N'Матвиенко Владилена Петровна', 5, 1, 1, 2, 3700)
INSERT [dbo].[Order] ([Id], [Phone], [Email], [OrderDate], [PriceListId], [VisitDate], [Title], [MasterId], [Visited], [Payed], [BuyId], [BuyPrice]) VALUES (7, N'+7 (900) 620-80-33', N'ZinaidaPimenova218@mail.ru', CAST(N'2023-05-05T23:08:52.333' AS DateTime), 58, CAST(N'2023-05-09T14:29:00.000' AS DateTime), N'Пименова Зинаида Владимировна', 5, 1, 1, 1, 3700)
INSERT [dbo].[Order] ([Id], [Phone], [Email], [OrderDate], [PriceListId], [VisitDate], [Title], [MasterId], [Visited], [Payed], [BuyId], [BuyPrice]) VALUES (8, N'+7 (967) 572-48-51', N'YaroslavaTarasova749@mail.ru', CAST(N'2023-05-05T23:09:06.490' AS DateTime), 76, CAST(N'2023-05-10T16:19:00.000' AS DateTime), N'Тарасова Ярослава Константиновна', 5, 1, 1, 2, 3700)
INSERT [dbo].[Order] ([Id], [Phone], [Email], [OrderDate], [PriceListId], [VisitDate], [Title], [MasterId], [Visited], [Payed], [BuyId], [BuyPrice]) VALUES (9, N'+7 (976) 423-67-48', N'GlafiraZelenova721@mail.ru', CAST(N'2023-05-05T23:10:45.983' AS DateTime), 53, CAST(N'2023-05-07T14:10:00.000' AS DateTime), N'Зеленова Глафира Викторовна', 5, 1, 1, 2, 600)
INSERT [dbo].[Order] ([Id], [Phone], [Email], [OrderDate], [PriceListId], [VisitDate], [Title], [MasterId], [Visited], [Payed], [BuyId], [BuyPrice]) VALUES (10, N'+7 (906) 725-32-08', N'ZhannaSergeeva46@mail.ru', CAST(N'2023-05-05T23:11:43.097' AS DateTime), 45, CAST(N'2023-05-09T14:30:00.000' AS DateTime), N'Сергеева Жанна Кирилловна', 2, 0, 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [Phone], [Email], [OrderDate], [PriceListId], [VisitDate], [Title], [MasterId], [Visited], [Payed], [BuyId], [BuyPrice]) VALUES (11, N'+7 (920) 113-35-80', N'ElizaBalandina929@mail.ru', CAST(N'2023-05-05T23:21:47.323' AS DateTime), 8, CAST(N'2023-05-09T09:20:00.000' AS DateTime), N'Баландина Элиза Федоровна', 5, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[PriceList] ON 

INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (3, 2, 2, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (4, 3, 2, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (6, 4, 2, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (7, 2, 3, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (8, 3, 3, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (9, 4, 3, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (10, 2, 4, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (11, 3, 4, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (12, 4, 4, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (13, 2, 5, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (14, 3, 5, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (15, 4, 5, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (16, 2, 6, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (17, 3, 6, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (18, 4, 6, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (19, 2, 8, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (20, 3, 8, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (21, 4, 8, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (22, 2, 9, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (23, 3, 9, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (24, 4, 9, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (25, 2, 10, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (26, 3, 10, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (27, 4, 10, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (28, 2, 11, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (29, 3, 11, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (30, 4, 11, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (31, 2, 12, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (32, 3, 12, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (33, 4, 12, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (34, 2, 13, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (35, 3, 13, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (36, 4, 13, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (37, 2, 14, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (38, 3, 14, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (39, 4, 14, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (40, 2, 15, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (41, 3, 15, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (42, 4, 15, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (43, 2, 17, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (44, 3, 17, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (45, 4, 17, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (46, 2, 18, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (47, 3, 18, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (48, 4, 18, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (49, 2, 19, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (50, 3, 19, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (51, 4, 19, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (52, 2, 20, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (53, 3, 20, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (54, 4, 20, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (55, 2, 21, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (56, 3, 21, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (57, 4, 21, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (58, 2, 22, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (59, 3, 22, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (60, 4, 22, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (61, 2, 23, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (62, 3, 23, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (63, 4, 23, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (64, 2, 24, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (65, 3, 24, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (66, 4, 24, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (67, 2, 25, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (68, 3, 25, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (69, 4, 25, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (70, 2, 26, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (71, 3, 26, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (72, 4, 26, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (73, 2, 27, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (74, 3, 27, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (75, 4, 27, 7000)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (76, 2, 28, 3700)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (77, 3, 28, 5400)
INSERT [dbo].[PriceList] ([Id], [PriceTypeId], [ServiceId], [Price]) VALUES (78, 4, 28, 7000)
SET IDENTITY_INSERT [dbo].[PriceList] OFF
GO
SET IDENTITY_INSERT [dbo].[PriceType] ON 

INSERT [dbo].[PriceType] ([Id], [Title], [Minutes]) VALUES (1, N'30 минут  ', 30)
INSERT [dbo].[PriceType] ([Id], [Title], [Minutes]) VALUES (2, N'60 минут  ', 60)
INSERT [dbo].[PriceType] ([Id], [Title], [Minutes]) VALUES (3, N'90 минут  ', 90)
INSERT [dbo].[PriceType] ([Id], [Title], [Minutes]) VALUES (4, N'120 минут ', 120)
SET IDENTITY_INSERT [dbo].[PriceType] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (2, N'Традиционный тайский массаж', N'Традиционный тайский массаж известен под несколькими названиями: тайский массаж, тайская йога, «нуат пэн боран» (Nuat phaen boran), пассивная йога и другие. По своей сути этот массаж состоит из двух составляющих, умело объединенных в одно целое. Это акупрессура – воздействие на проблемные места', N'1.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (3, N'Тайский массаж спины', N'Спина является важной частью нашего тела, а здоровая спина — залогом красивой осанки и привлекательности. Сеансы тайского массажа дают возможность не только полного расслабления и разрядки, но и поддержания физического здоровья, благополучия и красоты.', N'2.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (4, N'Тайский традиционный массаж в 4 руки', N'Два одновременных сеанса тайского массажа — это работа для двух мастеров. Массажисты мягко разминают и растягивают все группы мышц. Процедура в четыре руки эффективно избавляет от напряжения, усталость и стрессы сменяются бодростью и отличным настроением.', N'3.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (5, N'Массаж шейно-воротниковой зоны', N'Массаж шейно-воротниковой зоны часто называют антистресс-массажем. Дело в том, что в случае возникновения стресса человек инстинктивно напрягает мышцы плечевого пояса, этому способствует стремление «спрятаться» от неприятных психологических переживаний. Массаж шеи и плеч, а также области верхнего', N'4.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (6, N'Тайский массаж ног', N'В Таиланде считают массаж ног одним из основных в системе оздоровления организма. На ступнях находятся рефлексогенные зоны (около 70 тысяч нервных окончаний), непосредственно связанные со всеми внутренними органами. Это в некотором роде карта, на которую спроецированы все основные внутренние органы и системы жизнедеятельности.

  Стимулируя эти зоны, можно влиять на весь организм и в частности на отдельные системы, поэтому эффект от тайского массажа ног многогранен: начиная от улучшения циркуляции крови и снятия отечности ног, стимуляции иммунной, пищеварительной и мочеполовой систем, и заканчивая снятием нервного напряжения, расслаблением, устранением бессонницы. Поэтому Тайский массаж ног великолепное средство для снятия стресса, релаксации, а также активизации защитных функций и мобилизации резервных сил организма.

  Кроме того, Foot массаж это очень приятная процедура, приносящая массу удовольствия. Этот массаж проводят с использованием тайского бальзама или крема.', N'5.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (8, N'«Удар по усталости»', N'Тайский массаж с усиленным воздействием на ноги и шейно-воротниковую зону. Усиленное воздействие на ноги и шейно-воротниковую зону позволит даже самому уставшему труженику быстро избавиться от напряжения и стрессов. Воздействуя на зоны концентрации усталости, ноги и шейно-воротниковую зону, сеанс такого', N'6.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (9, N'«Энергия жизни»', N'Энергия жизни — это тайский массаж всего тела в сочетании с массажем ног. Тайский массаж подарит вашему телу чувство расслабленности и легкости, а отдельная работа с ногами доставит массу удовольствия и усилит расслабляющий эффект — поможет максимально быстро и на длительное время избавиться от физического и эмоционального напряжения.', N'7.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (10, N'Тайский арома-oil массаж', N'Арома-oil массаж - это очаровательное смешение мышечного, точечного массажей, мягкой мануальной терапии и необыкновенной нежности рук с применением ароматических масел. Тайский oil-массаж - это объединение двух лечебных функций: расслабляющего массажа и ароматерапии, что делает данную процедуру очень приятной.', N'8.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (11, N'Арома-oil массаж в 4 руки', N'Поистине сказочное удовольствие доставляет массаж горячим маслом, в исполнении двух мастеров. Процедура позволяет телу максимально быстро избавиться от усталости, теплые масла расслабляют мышцы и смягчают кожу, а их удивительные ароматы не оставят и следа от стрессов и тревог. Благодаря интенсивному', N'9.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (12, N'Арома-массаж с кремом', N'Массаж с ароматным кремом увлажняет и питает уставшую кожу. Расслабляясь в руках мастера, ваше тело прекрасно впитывает полезные элементы кремов. Арома-массаж повышает защитные функции и оказывает омолаживающее воздействие на весь организм.', N'10.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (13, N'Арома-массаж с горячим маслом', N'Арома-oil массаж с горячим маслом – это 100% релакс и очень приятная процедура. Разогретое масло в чутких руках мастера наполнит Ваше тело энергией тепла. Также как и традиционный арома-oil массаж, он выполняется с натуральными ароматными тайскими маслами, плавными движениями, с мягкими надавливаниями и', N'11.jpeg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (14, N'Тайский массаж горячими травяными мешочками', N'Активные зоны тела массируются нагретыми травяными сборами, благодаря чему улучшается циркуляция крови, повышается мышечный тонус. Тайские травы обладают хорошим проникающим действием. Массаж оказывает глубокое расслабляющее, прогревающее и оздоравливающее воздействие, быстро', N'12.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (15, N'«Секрет спортсмена» — массаж от боли в мышцах', N'Традиционный тайский массаж в сочетании с массажем горячими травяными мешочками избавляет от боли в мышцах и оказывает расслабляющее воздействие. Процесс восстановления происходит быстро и безболезненно, а тело становится более гибким и выносливым.', N'13.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (17, N'«Тайское счастье»', N'Сочетание традиционного тайского и арома-oil массажа. Эта программа позволит вам с первого раза понять всю прелесть тайского массажа. Принципиально разные по технике и воздействию, эти массажи прекрасно дополняют друг друга. Полученное удовольствие вы захотите испытать снова и снова.

', N'14.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (18, N'Массаж лица и головы', N'Особый вид массажа, так как голова считается у тайцев священной. Эта процедура поможет снять мышечное напряжение, усталость и раздражение, избавит Вас от головной боли, активизирует рост волос и улучшит их текстуру. Принесет облегчение при простуде и насморке. Мастер прорабатывает подбородок и щеки, глаза и уши,', N'15.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (19, N'Король Манго', N'Программа для глубокого очищения и увлажнения кожи. Сочный и яркий аромат манго, сопровождающий вас на протяжении всей программы, подарит непередаваемое блаженство. Профессиональная линейка косметики «Манго» от Marakott cделает кожу невероятно бархатной и нежной. Программа завершается сеансом массажа с удивительным маслом «Манго». Этот уход идеально подходит тем, кто любит ароматы экзотических фруктов и скучает по солнечному Таиланду.', N'16.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (20, N'Сила камней', N'Комплексная программа сочетающая как очищение кожи так и стоун-терапию с использованием ароматных масел. Стоун-терапия — процедура древняя, а сама терапия камнями основана на температурном воздействии на сосуды, смене режимов тепла и холода. Считается, что при этом камни информируют организм о том, чего ему не хватает питают микроэлементами, забирают плохую энергию.

Пожалуйста, уточняйте стоимость и наличие данной процедуры по контактным телефонам интересующего Вас салона.', N'17.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (21, N'SPA-уход «Йогурт и овсяная пудра»', N'SPA-уход «Йогурт и овсяная пудра»  создан для тех, кто любит уход, основанный на самых натуральных компонентах, подаренных самой природой. Косметика на основе овсяной пудры и йогурте в сочетании с заботой тайских мастеров подарят Вашему телу легкость и обновление…', N'18.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (22, N'SPA-уход «Морской бриз»', N'SPA-уход «Морской бриз» для мужчин из серии Organic Thai создан для тех, кто любит уход, основанный на самых натуральных компонентах, подаренных самой природой….', N'19.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (23, N'SPA-уход «Кофе со сливками»', N'SPA-уход «Кофе со сливками» из серии Organic Thai создан для тех, кто любит уход, основанный на самых натуральных компонентах, подаренных самой природой. Свежий кофе и сливки в сочетании с заботой тайских мастеров подарят Вашему телу легкость и обновление…', N'20.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (24, N'«Рай на двоих»', N'Позвольте себе роскошь побыть вместе и насладиться целебными и волнующими СПА-процедурами. А может, это чудесная возможность признаться в своих нежных чувствах и побаловать любимого человека? Яркие переживания останутся с вами надолго!', N'21.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (25, N'Тайский slim-массаж с разогревающим эффектом', N'Основная цель данного вида массажа – коррекция фигуры. Тайский slim-массаж выполняется по особой технике с использованием специального моделирующего крема для получения более выраженного результата. В процессе массажа мастер сделает акцент на наиболее проблемных областях (талия, живот, бедра), с каждой и', N'22.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (26, N'SPA-уход "Магия моря" с белой глиной и ламинарией', N'SPA-уход с Белой глиной и морской водорослью Ламинарией от Marakott   – превосходный выбор для тех, кто желает эффективно очистить кожу и добиться максимального моделирующего эффекта! Это обертывание отличается нежным освежающим ароматом моря и приятными тактильными ощущениями, что делает', N'23.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (27, N'Альгинатное обертывание с Ламинарией. Курс Талассотерапии', N'Это прекрасное сочетание лимфодренажного массажа и обертывания морской водорослью Ламинарией убирает лишние сантиметры, избавляет от целлюлита  и растяжек. Водоросли способствуют глубокому увлажнению и интенсивному лифтингу кожи. Кроме того, во время обертывания происходит минерализация и детоксикация', N'24.jpg')
INSERT [dbo].[Service] ([Id], [Title], [Description], [Photo]) VALUES (28, N'«Инь — Ян»', N'Программа для пары поможет погрузиться в чувственную, расслабляющую атмосферу и пережить счастливые моменты безмятежности и радости вдвоем. Оригинальный подарок к памятной дате знакомства, годовщине или просто возможность порадовать свою половинку.', N'25.JPG')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCategory] ON 

INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (1, 2, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (2, 3, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (3, 4, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (4, 5, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (5, 6, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (6, 8, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (7, 9, 1)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (8, 4, 2)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (9, 11, 2)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (10, 10, 2)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (11, 12, 2)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (12, 14, 2)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (13, 19, 3)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (14, 20, 3)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (15, 21, 3)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (16, 22, 3)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (17, 23, 3)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (18, 25, 4)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (19, 26, 4)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (20, 27, 4)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (21, 24, 5)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (22, 25, 5)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (24, 13, 6)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (25, 14, 6)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (26, 15, 6)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (27, 17, 6)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (28, 18, 6)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (29, 28, 5)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (30, 28, 2)
INSERT [dbo].[ServiceCategory] ([Id], [ServiceId], [CategoryId]) VALUES (31, 28, 3)
SET IDENTITY_INSERT [dbo].[ServiceCategory] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Buy] FOREIGN KEY([BuyId])
REFERENCES [dbo].[Buy] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Buy]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Master] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Master] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Master]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PriceList] FOREIGN KEY([PriceListId])
REFERENCES [dbo].[PriceList] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PriceList]
GO
ALTER TABLE [dbo].[PriceList]  WITH CHECK ADD  CONSTRAINT [FK_PriceList_PriceType] FOREIGN KEY([PriceTypeId])
REFERENCES [dbo].[PriceType] ([Id])
GO
ALTER TABLE [dbo].[PriceList] CHECK CONSTRAINT [FK_PriceList_PriceType]
GO
ALTER TABLE [dbo].[PriceList]  WITH CHECK ADD  CONSTRAINT [FK_PriceList_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[PriceList] CHECK CONSTRAINT [FK_PriceList_Service]
GO
ALTER TABLE [dbo].[ServiceCategory]  WITH CHECK ADD  CONSTRAINT [FK_ServiceType_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceCategory] CHECK CONSTRAINT [FK_ServiceType_Service]
GO
ALTER TABLE [dbo].[ServiceCategory]  WITH CHECK ADD  CONSTRAINT [FK_ServiceType_Type] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ServiceCategory] CHECK CONSTRAINT [FK_ServiceType_Type]
GO
USE [master]
GO
ALTER DATABASE [WaiTaiBD] SET  READ_WRITE 
GO
