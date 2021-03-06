USE [Sinema]
GO
/****** Object:  Table [dbo].[Bilet]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilet](
	[biletID] [int] IDENTITY(1,1) NOT NULL,
	[koltukno] [nvarchar](50) NULL,
	[tutar] [money] NULL,
	[hediyebilet] [int] NULL,
	[filmID] [int] NULL,
	[kullaniciID] [int] NULL,
 CONSTRAINT [PK_Bilet] PRIMARY KEY CLUSTERED 
(
	[biletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Film]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[filmID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
	[aciklama] [nvarchar](max) NULL,
	[vizyontarih] [date] NULL,
	[seans] [nvarchar](50) NULL,
	[salon] [nvarchar](50) NULL,
	[resim] [nvarchar](max) NULL,
	[yasgrupID] [int] NULL,
	[turID] [int] NULL,
	[fragman] [nvarchar](max) NULL,
	[yonetmen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[filmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Iletisim]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iletisim](
	[ıletisimID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](100) NULL,
	[soyad] [nvarchar](100) NULL,
	[eposta] [nvarchar](50) NULL,
	[telefon] [nvarchar](50) NULL,
	[konu] [nvarchar](100) NULL,
	[mesaj] [nvarchar](max) NULL,
	[tarih] [smalldatetime] NULL,
 CONSTRAINT [PK_Iletisim] PRIMARY KEY CLUSTERED 
(
	[ıletisimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[kullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
	[soyad] [nvarchar](50) NULL,
	[mail] [nvarchar](50) NULL,
	[sifre] [nvarchar](50) NULL,
	[resim] [nvarchar](max) NULL,
	[telefon] [nvarchar](50) NULL,
	[yetkiID] [int] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[kullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oynar]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oynar](
	[oynarID] [int] IDENTITY(1,1) NOT NULL,
	[filmID] [int] NULL,
	[oyuncuID] [int] NULL,
 CONSTRAINT [PK_Oynar] PRIMARY KEY CLUSTERED 
(
	[oynarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oyuncu]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncu](
	[oyuncuID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
	[soyad] [nvarchar](50) NULL,
	[resim] [nvarchar](max) NULL,
 CONSTRAINT [PK_Oyuncu] PRIMARY KEY CLUSTERED 
(
	[oyuncuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sifre]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sifre](
	[sifreID] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciID] [int] NULL,
	[tarih] [smalldatetime] NULL,
	[kod] [uniqueidentifier] NULL,
	[gencellemeTarihi] [smalldatetime] NULL,
	[eskiSifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sifre] PRIMARY KEY CLUSTERED 
(
	[sifreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tur]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tur](
	[turID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tur] PRIMARY KEY CLUSTERED 
(
	[turID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YasGrup]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YasGrup](
	[yasgrupID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
 CONSTRAINT [PK_YasGrup] PRIMARY KEY CLUSTERED 
(
	[yasgrupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 9.01.2019 22:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetki](
	[yetkiID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[yetkiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bilet] ON 

INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (5, NULL, NULL, 11, NULL, 1)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (6, NULL, NULL, 0, NULL, 2)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (7, NULL, NULL, 0, NULL, 3)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (8, NULL, NULL, 0, NULL, 4)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (9, NULL, NULL, 0, NULL, 29)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (10, NULL, NULL, 0, NULL, 31)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (11, NULL, NULL, 0, NULL, 33)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (12, NULL, NULL, 1, NULL, 35)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (19, NULL, NULL, 0, NULL, 44)
INSERT [dbo].[Bilet] ([biletID], [koltukno], [tutar], [hediyebilet], [filmID], [kullaniciID]) VALUES (21, NULL, NULL, 0, NULL, 46)
SET IDENTITY_INSERT [dbo].[Bilet] OFF
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (1, N'Fantastik Canavarlar: Grindelwald''ın Suçları', N'Grindelwald''ın Suçları, 2018''de vizyona girecek olan fantezi drama türündeki ABD-Birleşik Krallık filmi. J. K. Rowling''in aynı adlı kitabından esinlenilerek çekilen 2016 yapımı Fantastik Canavarlar Nelerdir, Nerede Bulunurlar? filminin devamıdır.', CAST(N'2018-11-16' AS Date), N'14.00', N'5', N'854fca39-dc05-40ca-9bba-b02ab1d94e9b.jpg', 3, 2, N'TiblmGnet2Q', N'David Yates')
INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (2, N'Müslüm', N'Müslüm, arabesk müziğinin efsane ismi Müslüm Gürses''in hayat hikayesini beyaz perdeye taşıyor. Unutulmaz ses sanatçısının iniş ve çıkışlarla dolu yaşamının anlatıldığı filmde, Müslüm Gürses’in milyonları etkileyen müziğine, çocukluğundan ölümüne kadar geçen zamanda yaşamına etki eden kişilere, çok sevdiğini her fırsatta dile getirdiği eşi Muhterem Nur’a odaklanılıyor. Timuçin Esen’in Müslüm Gürses’i canlandırdığı filmde, Muhterem Nur''a Zerrin Tekindor, Müslüm Gürses''in babasına ise Turgut Tunçalp hayat veriyor. Yönetmenliğini, Türkiye''nin geçen yılki Oscar yarışı için aday adayı olarak gönderdiği Ayla''nın yönetmeni Can Ulkay ve "Romantik Komedi" filminden 8 yıl sonra tekrar yönetmen koltuğuna oturan Ketche’nin (Hakan Kırvavaç) üstlendiği filmin senaryosunu Hakan Günday ve Gürhan Özçiftçi kaleme alıyor.', CAST(N'2018-10-26' AS Date), N'08:00', N'3', N'ac427646-e9de-44f1-92f3-4af27b0f46cf.jpg', 1, 5, N'uFi6MlJojyI', N'Ketche, Can Ulkay')
INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (7, N'test', N'wafvasfvbaf', CAST(N'2018-10-08' AS Date), N'08:00', N'5', N'0be37b12-7768-4c25-b8cc-80c3da88ae13.jpg', 4, 12, N'sfvadbsfdseawdfv', N'asbsdaf')
INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (9, N'Börü', N'Börü, Polis Özel Harekat''ının en seçkin, sıcak savaş timidir. 34-50 telsiz kodlu ekip, elit askerlerin bir araya gelmesi ile oluşur ve altından kalkamayacağı görev yoktur. Vatan aşkı ile tutuşmuş yalnız kahramanlar, kumpasların ve düşmanın kim olduğunun belli olmadığı gölge savaşında vatanlarını korumak için canlarını ortaya koymaya hazırdır. Film de bu tarihin yazılışını değiştiren kahramanların hikayelerini konu ediniyor. Ekip, Türkiye Cumhuriyeti yakın tarihinin en büyük tehditleriyle karşı karşıya kalıyor. 15 Temmuz gecesi yuvaları olan Özel Harekat Daire Başkanlığı bombalanınca ekip korkusuzca savaşmak için hazırlanıyor. Bir yandan terör örgütleri ile ülke savunması için durmaksızın mücadele edilirken, bir yandan da ülke ve Börü yönetime sızan örgütlerce tehdit ediliyor.', CAST(N'2018-12-28' AS Date), N'21.00', N'5', N'1921da79-95a5-442d-9e69-dee510f94dea.jpg', 4, 1, N'oet8FMQ_4tc', N'Can Emre, Cem Özüduru')
INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (10, N'Aquaman', N'Arthur Curry kendiyle ilgili büyük bir gerçeği keşfetmiştir. Kendisi okyanuslar altında inşa edilen Atlantis krallığının tahtının varisidir. Ancak Aquaman''in sinsi yarı-kardeşi Orm, Atlantis tahtını istemektedir. Arthur Curry, nam-ı diğer Aquaman, kendisine kalan mirasa sahip çıkmalı ve halkının başına geçmelidir. Yoksa kendi hayatının yanı sıra sevdiği kişiler de büyük bir tehlikeyle yüz yüze gelmek zorunda kalacaktır. Bu yolculukta Arthur kendiyle yüzleşmenin yanı sıra, bir kral olmaya layık olup olmadığını da keşfetmek zorundadır...', CAST(N'2018-12-28' AS Date), N'22.00', N'9', N'e6c4c8bb-70f0-411e-b75f-39a9b73ac0fa.jpg', 3, 2, N'WDkg3h8PCVU', N'James Wan')
INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (11, N'Deliler', N'Fatih Sultan Mehmet’in gönderdiği Osmanlı elçisi Romanya Prensi Vlad tarafından infaz edilmiştir. Yaşanan olay karşısında Fatih Sultan Mehmet, Vlad’ı öldürmesi için Baba Sultan’a ferman verir. Baba Sultan görev için Gökkurt, Çebi, Suskun, Adsız, Mübariz, Kongar ve Aşgar’dan oluşan Deliler Birliği’ni Kuman’la birlikte Edirne’den Targoviçte’ye gönderir. Deliler, Alaca köyü yakınlarından geçerken Vlad’ın çetesinin köye saldırdığını öğrenir. Deliler’in amacı önce köyü kurtarıp ardından Vlad’ı infaz etmektir. Osman Kaya yönetmen koltuğunda oturduğu filmde, Kazıklı Voyvoda Vlad Tepeş’i Erkan Petekkaya, Gökkurt''u Cem Uçan, Aşgar''ı İsmail Filiz, Alaca''yı Nur Fettahoğlu, Baba Sultan''ı Yetkin Dikinciler, Fatih Sultan Mehmet’i de Rüzgar Aksoy canlandırıyor. Kadrosunda Demet Tuncer, Mehmet Ali Karakuş, Gökçe Özyol, Mehmet Pala, Batın Uçan gibi isimlerin de yer aldığı filmin görüntü yönetmenliğini Sami Saydan üstlenirken, senaryo ise Mustafa Burak Doğu ve İbrahim Ethem Arslan''ın imzasını taşıyor.', CAST(N'2018-11-22' AS Date), N'12.00', N'4', N'588dfef4-7bac-4729-b150-e3bb5b2e3b94.jpg', 6, 13, N'VhaOgRR2CUk', N'Osman Kaya')
INSERT [dbo].[Film] ([filmID], [ad], [aciklama], [vizyontarih], [seans], [salon], [resim], [yasgrupID], [turID], [fragman], [yonetmen]) VALUES (13, N'Test11', N'1231qwdaqd', CAST(N'2019-01-17' AS Date), N'21:00', N'2', N'512ddaf9-c08d-4e65-84c2-5d985a536f19.jpg', 5, 6, N'1213', N'1')
SET IDENTITY_INSERT [dbo].[Film] OFF
SET IDENTITY_INSERT [dbo].[Iletisim] ON 

INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (1, N'Haluk Can', NULL, NULL, NULL, NULL, N'Deneme mesajı.', CAST(N'2019-01-03T03:51:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (2, N'Haluk Can', NULL, NULL, NULL, NULL, N'Deneme mesajı.', CAST(N'2019-01-03T03:51:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (3, N'Yaygın inancın', N'tersine', NULL, NULL, NULL, N'Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet''teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200''den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.', CAST(N'2019-01-03T04:04:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (4, N'Yaygın inancın', N'tersine', NULL, NULL, NULL, N'Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet''teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200''den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.', CAST(N'2019-01-03T04:06:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (5, N'test12', N'test21', NULL, NULL, NULL, N'Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet''teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200''den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.', CAST(N'2019-01-03T04:07:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (6, N'test12', N'test21', NULL, NULL, NULL, N'Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet''teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200''den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.', CAST(N'2019-01-03T04:10:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (7, N'Deneme', N'Deneme', N'deneme@gmail.com', NULL, N'Deneme ', N'Deneme', CAST(N'2019-01-03T04:15:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (8, N'Haluk Can', N'Balbay', N'halukcan44@gmail.com', N'05345126207', N'Nereden Bulabilirim?', N'Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet''teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200''den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.', CAST(N'2019-01-03T04:21:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (9, N'mufche', N'mufche', N'mufche@yandex.com', N'55555555555', N'Selam', N'Limon ister misin çocuk adamın kardeşi', CAST(N'2019-01-03T17:24:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (10, N'Ziya Kerim', N'İnceer', N'keriminceer@gmail.com', N'54613541654', N'Deneme Kerim', N'Deneme mesajı
', CAST(N'2019-01-03T20:39:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (11, N'Test', N'Test', N'anajfdaf@gmail.com', N'12312124124', N'Konu ', N'konu açıklama', CAST(N'2019-01-09T22:42:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (12, N'Test', N'Test', N'anajfdaf@gmail.com', N'51564561321', N'Konu ', N'123121', CAST(N'2019-01-09T22:45:00' AS SmallDateTime))
INSERT [dbo].[Iletisim] ([ıletisimID], [ad], [soyad], [eposta], [telefon], [konu], [mesaj], [tarih]) VALUES (13, N'Test', N'Test', N'anajfdaf@gmail.com', N'51564561321', N'Konu ', N'23132
', CAST(N'2019-01-09T22:52:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Iletisim] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (1, N'Haluk Can', N'Balbay', N'halukcanbalbay@hotmail.com', N'44', N'pikachu.png', N'05345126207', 1)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (2, N'Gani', N'Balbay', N'gani@gmail.com', N'1', N'kullanici.png', N'11111111111', 1)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (3, N'Fadime', N'Balbay', N'fadime@gmail.com', N'2', N'kullanici.png', N'12345', 2)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (4, N'Gamze', N'Balbay', N'gamze@gmail.com', N'3', N'0406b197-01c8-4cbd-bf93-381d20fc38f2.jpg', N'12345612312', 2)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (29, N'test12', N'test21', N'testtt@gmail.com', N'3', N'a8ab09e0-5537-471a-87f3-30ae41f535b4.jpg', N'33333333334', 2)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (31, N'test12', N'test21', N'testttt@gmail.com', N'3', N'kullanici.png', N'33333333333', 2)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (33, N'mufche', N'mufche', N'mufche@yandex.com', N'1', N'kullanici.png', N'55555555555', 1)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (35, N'Ziya Kerim', N'İnceer', N'keriminceer@gmail.com', N'1', N'kullanici.png', N'05641564545', 2)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (44, N'Test', N'Test', N'teas@gmail.com', N'1', N'kullanici.png', N'51564561321', 2)
INSERT [dbo].[Kullanici] ([kullaniciID], [ad], [soyad], [mail], [sifre], [resim], [telefon], [yetkiID]) VALUES (46, N'Test', N'Test', N'taaeas@gmail.coma', N'1', N'kullanici.png', N'51564561321', 1)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Oyuncu] ON 

INSERT [dbo].[Oyuncu] ([oyuncuID], [ad], [soyad], [resim]) VALUES (1, N'Johnny Depp', N'Jude Law', N'oyuncu.png')
INSERT [dbo].[Oyuncu] ([oyuncuID], [ad], [soyad], [resim]) VALUES (6, N'Jude', N'Law', N'77c70651-af51-4f27-8ca1-c5a41eca7182.jpg')
SET IDENTITY_INSERT [dbo].[Oyuncu] OFF
SET IDENTITY_INSERT [dbo].[Sifre] ON 

INSERT [dbo].[Sifre] ([sifreID], [kullaniciID], [tarih], [kod], [gencellemeTarihi], [eskiSifre]) VALUES (1, 1, CAST(N'2019-01-03T01:01:00' AS SmallDateTime), N'630497c9-211c-42df-9b79-7fe7df448a42', NULL, NULL)
INSERT [dbo].[Sifre] ([sifreID], [kullaniciID], [tarih], [kod], [gencellemeTarihi], [eskiSifre]) VALUES (2, 44, CAST(N'2019-01-09T20:37:00' AS SmallDateTime), N'82ff6487-4da1-41c9-baf0-d2b2afe2be65', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sifre] OFF
SET IDENTITY_INSERT [dbo].[Tur] ON 

INSERT [dbo].[Tur] ([turID], [ad]) VALUES (1, N'Aksiyon   ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (2, N'Macera    ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (3, N'Animasyon ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (4, N'Komedi    ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (5, N'Drama     ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (6, N'Aile      ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (7, N'Korku     ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (8, N'Gerilim   ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (10, N'Aşk       ')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (11, N'Bilim Kurgu')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (12, N'Suç')
INSERT [dbo].[Tur] ([turID], [ad]) VALUES (13, N'Tarih')
SET IDENTITY_INSERT [dbo].[Tur] OFF
SET IDENTITY_INSERT [dbo].[YasGrup] ON 

INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (1, N'Genel İzleyici')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (2, N'7+')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (3, N'13+')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (4, N'15+')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (5, N'18+')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (6, N'Şiddet-Korku')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (7, N'Cinsellik')
INSERT [dbo].[YasGrup] ([yasgrupID], [ad]) VALUES (8, N'Olumsuz Örnek')
SET IDENTITY_INSERT [dbo].[YasGrup] OFF
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([yetkiID], [ad]) VALUES (1, N'Yönetici')
INSERT [dbo].[Yetki] ([yetkiID], [ad]) VALUES (2, N'Kullanıcı')
SET IDENTITY_INSERT [dbo].[Yetki] OFF
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Film1] FOREIGN KEY([filmID])
REFERENCES [dbo].[Film] ([filmID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Film1]
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Kullanici] FOREIGN KEY([kullaniciID])
REFERENCES [dbo].[Kullanici] ([kullaniciID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Kullanici]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Tur] FOREIGN KEY([turID])
REFERENCES [dbo].[Tur] ([turID])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Tur]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_YasGrup] FOREIGN KEY([yasgrupID])
REFERENCES [dbo].[YasGrup] ([yasgrupID])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_YasGrup]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Yetki] FOREIGN KEY([yetkiID])
REFERENCES [dbo].[Yetki] ([yetkiID])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Yetki]
GO
ALTER TABLE [dbo].[Oynar]  WITH CHECK ADD  CONSTRAINT [FK_Oynar_Film] FOREIGN KEY([filmID])
REFERENCES [dbo].[Film] ([filmID])
GO
ALTER TABLE [dbo].[Oynar] CHECK CONSTRAINT [FK_Oynar_Film]
GO
ALTER TABLE [dbo].[Oynar]  WITH CHECK ADD  CONSTRAINT [FK_Oynar_Oyuncu] FOREIGN KEY([oyuncuID])
REFERENCES [dbo].[Oyuncu] ([oyuncuID])
GO
ALTER TABLE [dbo].[Oynar] CHECK CONSTRAINT [FK_Oynar_Oyuncu]
GO
