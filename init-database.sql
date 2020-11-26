USE [TestData]
GO
/****** Object:  Table [dbo].[Buy]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Date] [datetime] NOT NULL DEFAULT (getdate()),
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fio] [nvarchar](max) NOT NULL,
	[Rank] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](256) NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Cost] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles_Pages]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles_Pages](
	[RoleId] [uniqueidentifier] NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Roles_Pages] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Buy] ON 

GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (1, 8, 4, CAST(N'2010-02-22 12:26:04.000' AS DateTime), 2)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (2, 38, 2, CAST(N'2012-01-15 15:51:40.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (3, 3, 4, CAST(N'2010-02-15 08:07:13.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (4, 2, 10, CAST(N'2013-06-11 13:11:11.000' AS DateTime), 2)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (5, 6, 3, CAST(N'2015-09-15 14:39:36.000' AS DateTime), 12)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (6, 22, 4, CAST(N'2012-04-15 13:15:46.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (7, 6, 2, CAST(N'2011-01-13 11:39:20.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (8, 4, 3, CAST(N'2011-04-28 05:05:50.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (9, 4, 7, CAST(N'2011-10-29 17:01:10.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (10, 10, 4, CAST(N'2015-07-15 06:17:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (11, 9, 7, CAST(N'2015-11-18 02:39:12.000' AS DateTime), 2)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (12, 5, 2, CAST(N'2012-05-15 07:49:16.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (13, 9, 5, CAST(N'2016-12-08 21:10:13.000' AS DateTime), 7)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (14, 5, 4, CAST(N'2014-07-22 21:00:15.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (15, 10, 3, CAST(N'2013-01-27 05:53:14.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (16, 9, 5, CAST(N'2013-02-13 07:58:58.000' AS DateTime), 2)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (17, 16, 9, CAST(N'2016-09-16 03:37:16.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (18, 15, 10, CAST(N'2012-11-14 02:40:23.000' AS DateTime), 12)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (19, 36, 2, CAST(N'2010-05-25 19:31:12.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (20, 17, 8, CAST(N'2011-12-26 12:01:44.000' AS DateTime), 6)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (21, 35, 5, CAST(N'2011-09-27 19:03:08.000' AS DateTime), 120)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (22, 11, 10, CAST(N'2010-02-27 08:56:14.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (23, 25, 6, CAST(N'2015-02-11 11:49:48.000' AS DateTime), 2)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (24, 12, 7, CAST(N'2012-05-19 01:12:22.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (25, 38, 9, CAST(N'2011-11-26 10:58:57.000' AS DateTime), 8)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (26, 10, 8, CAST(N'2012-08-22 02:55:46.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (27, 30, 5, CAST(N'2014-12-01 00:54:51.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (28, 16, 11, CAST(N'2010-11-25 15:16:10.000' AS DateTime), 30)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (29, 9, 5, CAST(N'2014-08-03 01:19:51.000' AS DateTime), 10)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (30, 12, 7, CAST(N'2010-05-06 06:05:43.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (31, 30, 4, CAST(N'2017-10-05 13:27:21.000' AS DateTime), 20)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (32, 10, 9, CAST(N'2017-09-11 07:06:25.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (33, 13, 4, CAST(N'2010-07-02 16:48:40.000' AS DateTime), 5)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (34, 23, 5, CAST(N'2017-10-15 14:26:21.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (35, 11, 4, CAST(N'2013-04-08 06:51:09.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (36, 12, 7, CAST(N'2017-06-24 20:32:42.000' AS DateTime), 22)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (37, 27, 11, CAST(N'2015-11-12 20:52:16.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (38, 12, 10, CAST(N'2010-10-20 07:40:52.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (39, 26, 4, CAST(N'2016-10-01 07:31:45.000' AS DateTime), 5)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (40, 18, 4, CAST(N'2010-12-18 11:11:53.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (41, 38, 9, CAST(N'2014-05-13 12:45:34.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (42, 20, 4, CAST(N'2010-12-17 14:54:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (43, 14, 4, CAST(N'2016-01-06 15:20:00.000' AS DateTime), 3)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (44, 28, 10, CAST(N'2017-08-15 04:39:34.000' AS DateTime), 200)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (45, 38, 9, CAST(N'2010-09-14 08:05:21.000' AS DateTime), 5)
GO
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (46, 33, 4, CAST(N'2017-04-28 04:17:54.000' AS DateTime), 122)
GO
SET IDENTITY_INSERT [dbo].[Buy] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (1, N'Иванов Иван Иванович', 2)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (2, N'Валеев Геннадий Наумович', 50)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (3, N'Рубцова Христина Трофимовна', 6)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (4, N'Князев Фома Вадимович', 1)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (5, N'Злобин Виталий Валерьянович', 3)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (6, N'Яковкин Марк Титович', 12)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (8, N'Тычкина Римма Василиевна', 30)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (9, N'Кашарина Дина Леонидовна', 20)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (10, N'Столярова Дарья Семеновна', 11)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (11, N'Казакевича Агния Владленовна', 1)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (12, N'Чичерина Наталья Михеевна', 34)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (13, N'Сунгатулин Семен Кириллович', 78)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (14, N'Корзоватых Петр Модестович', 1)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (15, N'Танков Феофан Гордеевич', 4)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (16, N'Вавилова Евгения Алексеевна', 3)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (17, N'Широнин Николай Ипатович', 15)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (18, N'Тимиряев Зиновий Иннокентиевич', 54)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (19, N'Шелыгин Эрнст Ерофеевич', 12)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (20, N'Яскина Виктория Василиевна', 10)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (21, N'Алексеева Эмилия Андрияновна', 1)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (22, N'Зуева Мария Ильевна', 22)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (23, N'Зинченко Авдей Адамович', 2)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (24, N'Поветникова Раиса Феликсовна', 34)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (25, N'Грибков Прохор Измаилович', 11)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (26, N'Чекудаев Мир Захарович', 20)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (27, N'Аронов Артем Феликсович', 11)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (28, N'Сукачёв Андриян Несторович', 5)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (29, N'Прибыльнов Вячеслав Леонидович', 2)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (30, N'Новикова Раиса Тимуровна', 1)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (31, N'Зворыгин Авдей Герасимович', 2)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (32, N'Коваль Варвара Мефодиевна', 1)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (33, N'Сияносов Семён Казимирович', 9)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (34, N'Соловьёв Зиновий Иванович', 2)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (35, N'Халипов Никанор Никифорович', 7)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (36, N'Горемыкина Ангелина Александровна', 4)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (37, N'Буланов Юрий Миронович', 6)
GO
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (38, N'Бабышев Вадим Игоревич', 12)
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Pages] ([Id], [Text], [Url]) VALUES (N'e2635bd6-3ea0-41a5-be6f-2b01a42753de', N'Top 5', N'#top')
GO
INSERT [dbo].[Pages] ([Id], [Text], [Url]) VALUES (N'31597c90-0977-405d-b282-678e38183122', N'Relevant', N'#relevant')
GO
INSERT [dbo].[Pages] ([Id], [Text], [Url]) VALUES (N'06b8b9ae-b147-484f-927e-e57b5f562de9', N'Popular', N'#popular')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (2, N'Товар 1', 255.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (3, N'Товар 2', 10.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (4, N'Товар 3', 60.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (5, N'Товар 4', 500.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (6, N'Товар 5', 1000.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (7, N'Товар 6', 12.5000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (8, N'Товар 7', 33.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (9, N'Товар 8', 1.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (10, N'Товар 9', 5000.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (11, N'Товар 10', 1200.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'e17e984d-4760-4f77-a8b1-05183c818dbe', N'Analyst')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'49ebe8ab-9565-4355-9a2c-830be645df63', N'Manager')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'767ef7c6-d71d-4134-ac71-f867be3a99ab', N'Director')
GO
INSERT [dbo].[Roles_Pages] ([RoleId], [PageId]) VALUES (N'e17e984d-4760-4f77-a8b1-05183c818dbe', N'06b8b9ae-b147-484f-927e-e57b5f562de9')
GO
INSERT [dbo].[Roles_Pages] ([RoleId], [PageId]) VALUES (N'49ebe8ab-9565-4355-9a2c-830be645df63', N'31597c90-0977-405d-b282-678e38183122')
GO
INSERT [dbo].[Roles_Pages] ([RoleId], [PageId]) VALUES (N'767ef7c6-d71d-4134-ac71-f867be3a99ab', N'e2635bd6-3ea0-41a5-be6f-2b01a42753de')
GO
INSERT [dbo].[Roles_Pages] ([RoleId], [PageId]) VALUES (N'767ef7c6-d71d-4134-ac71-f867be3a99ab', N'31597c90-0977-405d-b282-678e38183122')
GO
INSERT [dbo].[Roles_Pages] ([RoleId], [PageId]) VALUES (N'767ef7c6-d71d-4134-ac71-f867be3a99ab', N'06b8b9ae-b147-484f-927e-e57b5f562de9')
GO
/****** Object:  Index [IX_Roles]    Script Date: 2020-11-26 10:09:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles] ON [dbo].[Roles]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Buy]  WITH CHECK ADD  CONSTRAINT [FK_Buy_ClientId_Client_Id] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Buy] CHECK CONSTRAINT [FK_Buy_ClientId_Client_Id]
GO
ALTER TABLE [dbo].[Buy]  WITH CHECK ADD  CONSTRAINT [FK_Buy_ProductId_Product_Id] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Buy] CHECK CONSTRAINT [FK_Buy_ProductId_Product_Id]
GO
ALTER TABLE [dbo].[Roles_Pages]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Pages_Pages] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Roles_Pages] CHECK CONSTRAINT [FK_Roles_Pages_Pages]
GO
ALTER TABLE [dbo].[Roles_Pages]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Pages_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Roles_Pages] CHECK CONSTRAINT [FK_Roles_Pages_Roles]
GO
/****** Object:  StoredProcedure [dbo].[GET_PAGES_BY_ROLE_NAME]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_PAGES_BY_ROLE_NAME]
	@roleNames nvarchar(510)
AS
BEGIN
	SET NOCOUNT ON;	
	DECLARE @returnList table(Id uniqueidentifier, [Text] nvarchar(50), Url nvarchar(256))
	DECLARE @name NVARCHAR(255)
	DECLARE @pos INT

	WHILE CHARINDEX(',', @roleNames) > 0
	BEGIN
		SELECT @pos  = CHARINDEX(',', @roleNames)  
		SELECT @name = SUBSTRING(@roleNames, 1, @pos-1)


		insert into @returnList (Id, [Text], Url)
			select p.Id, p.[Text], p.Url from Pages p
			join Roles_Pages rp on p.Id = rp.PageId
			where rp.RoleId = (select r.Id from Roles r where r.Name = @name)

		SELECT @roleNames = SUBSTRING(@roleNames, @pos+1, LEN(@roleNames)-@pos)
	END
	
	insert into @returnList (Id, [Text], Url)
		select p.Id, p.[Text], p.Url from Pages p
		join Roles_Pages rp on p.Id = rp.PageId
		where rp.RoleId = (select r.Id from Roles r where r.Name = @roleNames)

	select distinct Id, [Text], Url from @returnList
END

GO
/****** Object:  StoredProcedure [dbo].[QUERY_PRODUCTS]    Script Date: 2020-11-26 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[QUERY_PRODUCTS] 	
	@type nvarchar(50)

AS
BEGIN
	SET NOCOUNT ON;

	IF(@type = 'popular')
		select 
			p.Id as 'Id', 
			p.Name as 'Name',
			p.Cost as 'Price',
			(select count(*) from Buy b where b.ProductId = p.Id) as 'Purchases'	
		from Product p
		where p.Id in (
			select 
				ProductId 
			from Buy b 
			where b.ClientId in (select c.Id from Client c where c.Rank > 5)
		)

	ELSE IF(@type = 'relevant')
		select 
			p.Id as 'Id', 
			p.Name as 'Name',
			p.Cost as 'Price',
			(select count(*) from Buy b where b.ProductId = p.Id) as 'Purchases'	
		from Product p
		where p.Id in (
			select 
				ProductId
			from Buy b
			group by b.ClientId, b.ProductId
			having COUNT(b.ClientId) > 1
		)

	ELSE IF(@type = 'top')
		select 
			p.Id as 'Id', 
			p.Name as 'Name',
			p.Cost as 'Price',
			(select count(*) from Buy b where b.ProductId = p.Id) as 'Purchases'	
		from Product p
		where p.Id in (
			select top 5
				b.ProductId 
			from Buy b
			join Product p on b.ProductId = p.Id
			group by b.ProductId
			order by sum(b.[Count] * p.Cost) desc
		)

END

GO
