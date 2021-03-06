USE [master]
GO
/****** Object:  Database [OtelQr]    Script Date: 16.04.2020 14:16:25 ******/
CREATE DATABASE [OtelQr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtelQr', FILENAME = N'C:\Users\ohati\OtelQr.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OtelQr_log', FILENAME = N'C:\Users\ohati\OtelQr_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OtelQr] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OtelQr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OtelQr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OtelQr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OtelQr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OtelQr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OtelQr] SET ARITHABORT OFF 
GO
ALTER DATABASE [OtelQr] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OtelQr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OtelQr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OtelQr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OtelQr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OtelQr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OtelQr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OtelQr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OtelQr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OtelQr] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OtelQr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OtelQr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OtelQr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OtelQr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OtelQr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OtelQr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OtelQr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OtelQr] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OtelQr] SET  MULTI_USER 
GO
ALTER DATABASE [OtelQr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OtelQr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OtelQr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OtelQr] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OtelQr] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OtelQr] SET QUERY_STORE = OFF
GO
USE [OtelQr]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [OtelQr]
GO
/****** Object:  Table [dbo].[Activite]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activite](
	[activiteID] [int] IDENTITY(1,1) NOT NULL,
	[activiteResim] [nvarchar](max) NULL,
	[activiteAciklama] [nvarchar](max) NULL,
	[active] [bit] NULL,
	[activiteFiyat] [money] NULL,
	[createDate] [date] NULL,
	[kontenjan] [int] NULL,
	[activiteAdi] [nvarchar](50) NULL,
	[Restoran] [bit] NULL,
	[Konaklama] [bit] NULL,
	[activiteYer] [nvarchar](50) NULL,
	[activiteSure] [nvarchar](50) NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[startTime] [nvarchar](50) NULL,
	[endTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Activite] PRIMARY KEY CLUSTERED 
(
	[activiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ariza]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ariza](
	[arizaID] [int] IDENTITY(1,1) NOT NULL,
	[arizaAd] [nvarchar](max) NULL,
	[arizaMesaj] [nvarchar](max) NULL,
	[odaID] [int] NULL,
	[arizaDurum] [bit] NULL,
	[active] [bit] NULL,
	[isSelected] [bit] NULL,
 CONSTRAINT [PK_Ariza] PRIMARY KEY CLUSTERED 
(
	[arizaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bildirim]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bildirim](
	[bildirimID] [int] IDENTITY(1,1) NOT NULL,
	[bildirimTur] [nvarchar](50) NULL,
	[bildirimİcerik] [nvarchar](50) NULL,
	[bildirimDurum] [bit] NULL,
	[odaID] [int] NULL,
	[bildirimDate] [datetime] NULL,
	[isChecked] [bit] NULL,
 CONSTRAINT [PK_Bildirim] PRIMARY KEY CLUSTERED 
(
	[bildirimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Duyuru]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duyuru](
	[duyuruID] [int] IDENTITY(1,1) NOT NULL,
	[duyuruZaman] [datetime] NULL,
	[duyuruTitle] [nvarchar](50) NULL,
	[duyuruIcerik] [nvarchar](max) NULL,
	[duyuruSira] [int] NULL,
	[duyuruDurum] [bit] NULL,
 CONSTRAINT [PK_Duyuru] PRIMARY KEY CLUSTERED 
(
	[duyuruID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraUrun]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraUrun](
	[extraUrunID] [int] IDENTITY(1,1) NOT NULL,
	[extraUrunAdi] [nvarchar](50) NULL,
	[extraUrunFiyat] [money] NULL,
	[urunID] [int] NULL,
	[active] [bit] NULL,
	[isSelected] [bit] NULL,
	[extraUrunAdet] [int] NULL,
 CONSTRAINT [PK_ExtraUrun] PRIMARY KEY CLUSTERED 
(
	[extraUrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[kategoriID] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAd] [nvarchar](50) NULL,
	[isDeleted] [bit] NULL,
	[kategoriSira] [int] NULL,
	[kategoriResim] [nvarchar](max) NULL,
	[isSelected] [bit] NULL,
	[kategoriDurum] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[kategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keep]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keep](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[keepID] [int] NOT NULL,
	[odaID] [int] NULL,
	[keepAd] [nvarchar](max) NULL,
	[keepMesaj] [nvarchar](max) NULL,
	[keepDurum] [bit] NULL,
	[active] [bit] NULL,
	[isSelected] [bit] NULL,
 CONSTRAINT [PK_Keep_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masor]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masor](
	[masorID] [int] IDENTITY(1,1) NOT NULL,
	[masorAdSoyad] [nvarchar](50) NULL,
	[masorTC] [nvarchar](50) NULL,
	[masorCinsiyet] [bit] NULL,
	[masorDogTar] [date] NULL,
	[spaID] [int] NULL,
	[masorTel] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[masorDurum] [bit] NULL,
 CONSTRAINT [PK_Masor] PRIMARY KEY CLUSTERED 
(
	[masorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[musteriID] [int] IDENTITY(1,1) NOT NULL,
	[odaID] [int] NULL,
	[musteriAdi] [nvarchar](50) NULL,
	[musteriSoyadi] [nvarchar](50) NULL,
	[musteriTC] [nvarchar](50) NULL,
	[musteriTelefon] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[isDeleted] [bit] NULL,
	[musteriDurum] [bit] NULL,
	[active] [bit] NULL,
	[musteriTip] [bit] NULL,
	[musteriDogTar] [date] NULL,
	[musteriCinsiyet] [bit] NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[musteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oda]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oda](
	[odaID] [int] IDENTITY(1,1) NOT NULL,
	[odaNo] [nvarchar](10) NULL,
	[odaKat] [int] NULL,
	[odaKatgorevli] [nvarchar](50) NULL,
	[qrHash] [nchar](16) NULL,
	[qrUrl] [nvarchar](max) NULL,
	[qrFoto] [nvarchar](max) NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK_Oda] PRIMARY KEY CLUSTERED 
(
	[odaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OdemeTip]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OdemeTip](
	[odemeID] [int] IDENTITY(1,1) NOT NULL,
	[odemeTipi] [nvarchar](50) NULL,
	[IsSelected] [bit] NULL,
 CONSTRAINT [PK_OdemeTip] PRIMARY KEY CLUSTERED 
(
	[odemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reception]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reception](
	[receptionID] [int] IDENTITY(1,1) NOT NULL,
	[receptionNumara] [nvarchar](50) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_Reception] PRIMARY KEY CLUSTERED 
(
	[receptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RezervasyonActivite]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezervasyonActivite](
	[rezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[activiteID] [int] NULL,
	[musteriID] [int] NULL,
	[active] [bit] NULL,
	[kisiSayisi] [int] NULL,
	[createAt] [date] NULL,
	[updateAt] [date] NULL,
	[rezervasyonİcerik] [nvarchar](50) NULL,
 CONSTRAINT [PK_RezervasyonActivite] PRIMARY KEY CLUSTERED 
(
	[rezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RezervasyonSpa]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezervasyonSpa](
	[rezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[masorID] [int] NULL,
	[musteriID] [int] NULL,
	[tarih] [date] NULL,
	[saat] [time](7) NULL,
	[musterigeldimi] [bit] NULL,
	[masorgeldimi] [bit] NULL,
	[active] [bit] NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_RezervasyonSpa] PRIMARY KEY CLUSTERED 
(
	[rezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[sepetID] [int] IDENTITY(1,1) NOT NULL,
	[urunID] [int] NOT NULL,
	[urunMiktar] [int] NULL,
	[odaID] [int] NULL,
	[urunToplamFiyat] [float] NULL,
	[SepetDurum] [bit] NULL,
	[SepetZaman] [datetime] NULL,
	[isSelected] [nvarchar](10) NULL,
	[odemeID] [int] NULL,
 CONSTRAINT [PK_Sepet] PRIMARY KEY CLUSTERED 
(
	[sepetID] ASC,
	[urunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sepet] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[siparisID] [int] IDENTITY(1,1) NOT NULL,
	[odaID] [int] NULL,
	[siparisZaman] [datetime] NULL,
	[siparisToplam] [float] NULL,
	[siparisNo] [int] NULL,
	[isSelected] [bit] NULL,
	[odemeTip] [bit] NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[siparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[siparisDetayID] [int] IDENTITY(1,1) NOT NULL,
	[siparisID] [int] NULL,
	[urunID] [int] NULL,
	[urunFiyat] [float] NULL,
	[urunMiktar] [int] NULL,
	[isSelected] [bit] NULL,
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[siparisDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spa]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spa](
	[spaID] [int] IDENTITY(1,1) NOT NULL,
	[spaAd] [nvarchar](50) NULL,
	[spaAciklama] [nvarchar](max) NULL,
	[spaResim] [nvarchar](max) NULL,
	[active] [bit] NULL,
	[spaFiyat] [money] NULL,
	[spaSuresi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Spa] PRIMARY KEY CLUSTERED 
(
	[spaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taksi]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taksi](
	[taksiID] [int] IDENTITY(1,1) NOT NULL,
	[taksiDurakAd] [nvarchar](50) NULL,
	[taksiAd] [nvarchar](50) NULL,
	[taksiTelefon] [nvarchar](50) NULL,
	[taksiAdres] [nvarchar](max) NULL,
 CONSTRAINT [PK_Taksi] PRIMARY KEY CLUSTERED 
(
	[taksiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[urunID] [int] IDENTITY(1,1) NOT NULL,
	[urunAd] [nvarchar](max) NULL,
	[urunFiyat] [money] NULL,
	[urunResim] [nvarchar](max) NULL,
	[kategoriID] [int] NULL,
	[odaID] [int] NULL,
	[isDeleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[urunStok] [int] NULL,
	[urunDurum] [bit] NULL,
	[userID] [int] NULL,
	[urun] [nchar](10) NULL,
	[isSelected] [bit] NULL,
	[urunAciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[urunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunMesaj]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunMesaj](
	[urunMesajID] [int] IDENTITY(1,1) NOT NULL,
	[urunMesajText] [nvarchar](max) NULL,
	[urunID] [int] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UrunMesaj] PRIMARY KEY CLUSTERED 
(
	[urunMesajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[logo] [nvarchar](max) NULL,
	[active] [bit] NULL,
	[yetkiID] [int] NULL,
	[userZaman] [datetime] NULL,
	[userDurum] [bit] NULL,
	[userAdSoyad] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vale]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vale](
	[valeID] [int] IDENTITY(1,1) NOT NULL,
	[valeMesaj] [nvarchar](50) NULL,
	[odaID] [int] NULL,
	[active] [bit] NULL,
	[valeDurum] [bit] NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_Vale] PRIMARY KEY CLUSTERED 
(
	[valeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wifi]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wifi](
	[wifiID] [int] IDENTITY(1,1) NOT NULL,
	[wifiAdi] [nvarchar](50) NULL,
	[wifiPassword] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[odaID] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Wifi] PRIMARY KEY CLUSTERED 
(
	[wifiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WifiMesaj]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifiMesaj](
	[wifiMesajID] [int] IDENTITY(1,1) NOT NULL,
	[wifiID] [int] NULL,
	[wifiText] [nvarchar](max) NULL,
	[wifiBildirimSayi] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_WifiMesaj] PRIMARY KEY CLUSTERED 
(
	[wifiMesajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 16.04.2020 14:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetki](
	[yetkiID] [int] IDENTITY(1,1) NOT NULL,
	[yetkiAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[yetkiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activite] ON 

INSERT [dbo].[Activite] ([activiteID], [activiteResim], [activiteAciklama], [active], [activiteFiyat], [createDate], [kontenjan], [activiteAdi], [Restoran], [Konaklama], [activiteYer], [activiteSure], [startDate], [endDate], [startTime], [endTime]) VALUES (2003, N'/Uploads/abf1db8a-d179-4ec6-beb5-f76cdf0ad087.jpg', N'Siz hiç metrelerce yüksekte uçarken pencere olmadan aşağıya veya gökyüzüne baktınız mı ? ', 1, 120.0000, NULL, 20, N'Balon Turu', 1, 1, N'Göreme/Kapadokya', N'2 saat', CAST(N'2020-02-20' AS Date), CAST(N'2020-02-20' AS Date), NULL, NULL)
INSERT [dbo].[Activite] ([activiteID], [activiteResim], [activiteAciklama], [active], [activiteFiyat], [createDate], [kontenjan], [activiteAdi], [Restoran], [Konaklama], [activiteYer], [activiteSure], [startDate], [endDate], [startTime], [endTime]) VALUES (4004, N'/Uploads/72d4662c-2b0c-4b88-9023-b71fc2de7e46.jpg', N'Dart içiçe ve farklı renklerde halkalardan oluşan bir hedefe, belirlenmiş bir uzaklıktan ufak okların atılarak, en yüksek puanı almak amaçlı bir oyundur.', 1, 20.0000, NULL, 20, N'Dart Turnuvası', 1, 1, N'AC YAPI', N'1 saat', CAST(N'2020-02-09' AS Date), CAST(N'2020-02-10' AS Date), N'12:00 AM', N'1:30 AM')
INSERT [dbo].[Activite] ([activiteID], [activiteResim], [activiteAciklama], [active], [activiteFiyat], [createDate], [kontenjan], [activiteAdi], [Restoran], [Konaklama], [activiteYer], [activiteSure], [startDate], [endDate], [startTime], [endTime]) VALUES (4005, N'/Uploads/ded0e591-bc3a-4d72-83b4-83ae891ec9df.jpg', N'Tenis turnuvası', 1, 0.0000, NULL, 25, N'Işıklandırılmış Tenis Kortu', 0, 0, N'Tenis Kortu 2', NULL, NULL, NULL, N'9:30 AM', N'11:30 PM')
SET IDENTITY_INSERT [dbo].[Activite] OFF
SET IDENTITY_INSERT [dbo].[Ariza] ON 

INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (1, N'Lamba arızalı', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (2, N'Klima bozuk', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (3, N'Musluk bozuk/akmıyor', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (4, N'Kapı arızalı', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (5, N'Televizyon çalışmıyor', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (6, N'Sıcak su akmıyor', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (7, N'Kumanda bozuk', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (8, N'Mini bar boş', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (9, N'Yatak kırık', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (10, N'Lamba arızalı', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (12, N'Lamba arızalıIII', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Ariza] ([arizaID], [arizaAd], [arizaMesaj], [odaID], [arizaDurum], [active], [isSelected]) VALUES (1011, N'Su musluğu yok', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ariza] OFF
SET IDENTITY_INSERT [dbo].[Bildirim] ON 

INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (5124, N'2', N'Klima bozuk', 0, NULL, CAST(N'2020-01-28T13:25:17.540' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (5125, N'2', N'Mini bar boş', 0, NULL, CAST(N'2020-01-28T13:25:17.540' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (5126, N'1', N'Örtüler kirli/değişmesini istiyorum.', 1, NULL, CAST(N'2020-01-28T14:42:59.863' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (5128, N'2', N'Kapı arızalı', 1, NULL, CAST(N'2020-01-28T17:37:45.300' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (6128, N'1', N'Ek yastık istiyorum.', 0, NULL, CAST(N'2020-01-30T10:19:32.717' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (7129, N'2', N'Lamba arızalı', 0, NULL, CAST(N'2020-01-31T09:53:38.210' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (8128, N'3', N'Aracımın hazırlanmasını istiyorum.', 0, NULL, CAST(N'2020-02-04T11:35:23.350' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (8129, N'2', N'Klima bozuk', 0, NULL, CAST(N'2020-02-04T11:35:54.543' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (9128, N'2', N'Musluk bozuk/akmıyor', 1, NULL, CAST(N'2020-02-12T10:10:39.097' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (9129, N'2', N'Kapı arızalı', 1, NULL, CAST(N'2020-02-12T10:10:39.097' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (9130, N'2', N'Musluk bozuk/akmıyor', 0, NULL, CAST(N'2020-02-12T14:24:32.870' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (9131, N'2', N'Klima bozuk', 0, NULL, CAST(N'2020-02-12T14:24:32.887' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (9132, N'2', N'Kapı arızalı', 0, NULL, CAST(N'2020-02-12T14:24:32.887' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (10130, N'1', N'Örtüler kirli/değişmesini istiyorum.', 0, NULL, CAST(N'2020-03-07T12:58:04.203' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (10131, N'1', N'Ek örtü istiyorum.', 0, NULL, CAST(N'2020-03-07T12:58:04.483' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (10132, N'2', N'Lamba arızalı', 0, NULL, CAST(N'2020-03-07T12:58:22.393' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (10133, N'2', N'Klima bozuk', 0, NULL, CAST(N'2020-03-07T12:58:22.393' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (10134, N'2', N'Televizyon çalışmıyor', 0, NULL, CAST(N'2020-03-07T12:58:22.393' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (11130, N'3', N'Aracımın hazırlanmasını istiyorum.', 0, NULL, CAST(N'2020-03-07T14:14:36.240' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (11131, N'3', N'Aracımın hazırlanmasını istiyorum.', 0, NULL, CAST(N'2020-03-07T14:14:57.600' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (12130, N'2', N'Lamba arızalı', 0, NULL, CAST(N'2020-03-18T17:08:32.497' AS DateTime), NULL)
INSERT [dbo].[Bildirim] ([bildirimID], [bildirimTur], [bildirimİcerik], [bildirimDurum], [odaID], [bildirimDate], [isChecked]) VALUES (12131, N'2', N'Klima bozuk', 1, NULL, CAST(N'2020-03-18T17:08:32.520' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Bildirim] OFF
SET IDENTITY_INSERT [dbo].[ExtraUrun] ON 

INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (1, N'Extra bol sucuk ', 5.0000, 5007, 1, NULL, 1)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (2, N'Cheddar Peynir', 3.5000, 6006, 1, NULL, 10)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (3, N'Extra bol belçika çikolatası', 3.5000, 5013, 1, NULL, 1)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (4, N'Barbekü sos', 0.0000, 6006, 1, NULL, 10)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (7, N'Ranch sos', 0.0000, 6006, 1, NULL, 10)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (8, N'Dana bacon', 5.5000, 6006, 1, NULL, 10)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (9, N'+100 gr extra et', 7.0000, 6006, 1, NULL, NULL)
INSERT [dbo].[ExtraUrun] ([extraUrunID], [extraUrunAdi], [extraUrunFiyat], [urunID], [active], [isSelected], [extraUrunAdet]) VALUES (10, N'+200 gr extra et', 9.5000, 6006, 1, NULL, 10)
SET IDENTITY_INSERT [dbo].[ExtraUrun] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([kategoriID], [kategoriAd], [isDeleted], [kategoriSira], [kategoriResim], [isSelected], [kategoriDurum]) VALUES (3007, N'Yiyecekler', 0, 1, N'/Uploads/KategoriPhoto/9ebefb6e-fd6a-4e57-b49b-4d764c6070e9.jpg', NULL, NULL)
INSERT [dbo].[Kategori] ([kategoriID], [kategoriAd], [isDeleted], [kategoriSira], [kategoriResim], [isSelected], [kategoriDurum]) VALUES (3009, N'Tatlilar', 0, 3, N'/Uploads/KategoriPhoto/cd770ba3-d6c5-429f-a5e1-f14e56c9ba3a.jpg', NULL, NULL)
INSERT [dbo].[Kategori] ([kategoriID], [kategoriAd], [isDeleted], [kategoriSira], [kategoriResim], [isSelected], [kategoriDurum]) VALUES (3010, N'Alkollu', 0, 2, N'/Uploads/KategoriPhoto/d61e1358-47d6-4bef-bf2d-fbd3ae407950.jpg', NULL, NULL)
INSERT [dbo].[Kategori] ([kategoriID], [kategoriAd], [isDeleted], [kategoriSira], [kategoriResim], [isSelected], [kategoriDurum]) VALUES (3011, N'Alkolsuz', 0, 4, N'/Uploads/KategoriPhoto/7d10647e-8d11-435e-a838-02f60fb0fb42.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Keep] ON 

INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (1, 5, NULL, N'Yeni havlu istiyorum/Havlu kirli', NULL, 1, 0, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (2, 6, NULL, N'Örtüler kirli/değişmesini istiyorum.', NULL, 1, 1, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (3, 7, NULL, N'Oda temizliği istiyorum.', NULL, 1, 0, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (4, 8, NULL, N'Çocuk için yatak istiyorum..', NULL, 1, 0, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (5, 9, NULL, N'Ek örtü istiyorum.', NULL, 1, 1, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (6, 10, NULL, N'Ek yastık istiyorum.', NULL, 1, 1, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (7, 11, NULL, N'Fatih555', NULL, 1, 0, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (8, 12, NULL, N'Yeni masa istiyorum.', NULL, 1, 1, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (9, 999, NULL, N'Diğer', NULL, 1, 0, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (1009, 0, NULL, N'temizlik', NULL, NULL, 0, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (1010, 0, NULL, N'temiz', NULL, NULL, NULL, NULL)
INSERT [dbo].[Keep] ([id], [keepID], [odaID], [keepAd], [keepMesaj], [keepDurum], [active], [isSelected]) VALUES (1011, 0, NULL, N'ccccccccccc', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Keep] OFF
SET IDENTITY_INSERT [dbo].[Masor] ON 

INSERT [dbo].[Masor] ([masorID], [masorAdSoyad], [masorTC], [masorCinsiyet], [masorDogTar], [spaID], [masorTel], [active], [masorDurum]) VALUES (4, N'Bahad bahad', N'1234567891', 1, CAST(N'1996-07-20' AS Date), 4, N'5355559663', 1, 1)
INSERT [dbo].[Masor] ([masorID], [masorAdSoyad], [masorTC], [masorCinsiyet], [masorDogTar], [spaID], [masorTel], [active], [masorDurum]) VALUES (5, N'Selin Er', N'1234567891', 0, CAST(N'1996-07-20' AS Date), 4, N'0511514115', 1, 1)
SET IDENTITY_INSERT [dbo].[Masor] OFF
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (1002, NULL, N'Güneşşş', N'Baygül', N'12345678912', N'544662145', NULL, NULL, NULL, 0, NULL, CAST(N'1994-01-13' AS Date), NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (1008, NULL, N'Cansu', N'Şener', N'12345678912', N'53660667560', NULL, NULL, NULL, 0, NULL, CAST(N'1996-07-20' AS Date), NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (1009, NULL, N'Güneşşş', N'Baygül', N'12345678912', N'5443566522', NULL, NULL, NULL, 0, NULL, CAST(N'1994-01-13' AS Date), NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (2017, NULL, N'Güneş ', N'Baygül', N'12345678911', N'5443566522', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-07' AS Date), NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (3005, NULL, N'Güneş ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (4005, NULL, N'bahad', N'Baygül', N'1234567891', N'5443566522', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (4006, NULL, N'Bahadır', N'Yıldız', N'98765432132', N'5322625665', NULL, NULL, NULL, 0, NULL, CAST(N'2020-02-19' AS Date), NULL)
INSERT [dbo].[Musteri] ([musteriID], [odaID], [musteriAdi], [musteriSoyadi], [musteriTC], [musteriTelefon], [createDate], [isDeleted], [musteriDurum], [active], [musteriTip], [musteriDogTar], [musteriCinsiyet]) VALUES (5005, NULL, N'gunes', N'baygul', N'111111111111', N'5446601458', NULL, NULL, NULL, 0, NULL, CAST(N'2020-02-12' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Musteri] OFF
SET IDENTITY_INSERT [dbo].[Oda] ON 

INSERT [dbo].[Oda] ([odaID], [odaNo], [odaKat], [odaKatgorevli], [qrHash], [qrUrl], [qrFoto], [userID]) VALUES (1, N'Oda11', 11, NULL, N'zQBLesOcU7HuMlc0', NULL, N'~/Uploads/QrImage/Oda11.jpeg', 3)
SET IDENTITY_INSERT [dbo].[Oda] OFF
SET IDENTITY_INSERT [dbo].[OdemeTip] ON 

INSERT [dbo].[OdemeTip] ([odemeID], [odemeTipi], [IsSelected]) VALUES (1, N'Nakit', 0)
INSERT [dbo].[OdemeTip] ([odemeID], [odemeTipi], [IsSelected]) VALUES (2, N'Checkout', 0)
SET IDENTITY_INSERT [dbo].[OdemeTip] OFF
SET IDENTITY_INSERT [dbo].[Reception] ON 

INSERT [dbo].[Reception] ([receptionID], [receptionNumara], [active]) VALUES (3, N'0563 030 22 21', NULL)
SET IDENTITY_INSERT [dbo].[Reception] OFF
SET IDENTITY_INSERT [dbo].[RezervasyonActivite] ON 

INSERT [dbo].[RezervasyonActivite] ([rezervasyonID], [activiteID], [musteriID], [active], [kisiSayisi], [createAt], [updateAt], [rezervasyonİcerik]) VALUES (2018, 2003, NULL, 1, 45, CAST(N'2020-01-28' AS Date), NULL, NULL)
INSERT [dbo].[RezervasyonActivite] ([rezervasyonID], [activiteID], [musteriID], [active], [kisiSayisi], [createAt], [updateAt], [rezervasyonİcerik]) VALUES (2019, 2003, NULL, 0, 25, CAST(N'2020-01-28' AS Date), NULL, NULL)
INSERT [dbo].[RezervasyonActivite] ([rezervasyonID], [activiteID], [musteriID], [active], [kisiSayisi], [createAt], [updateAt], [rezervasyonİcerik]) VALUES (3019, 4004, NULL, 0, 5, CAST(N'2020-02-04' AS Date), NULL, NULL)
INSERT [dbo].[RezervasyonActivite] ([rezervasyonID], [activiteID], [musteriID], [active], [kisiSayisi], [createAt], [updateAt], [rezervasyonİcerik]) VALUES (4019, 2003, NULL, 0, 4, CAST(N'2020-02-13' AS Date), NULL, NULL)
INSERT [dbo].[RezervasyonActivite] ([rezervasyonID], [activiteID], [musteriID], [active], [kisiSayisi], [createAt], [updateAt], [rezervasyonİcerik]) VALUES (5019, 2003, NULL, 0, 2, CAST(N'2020-03-07' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RezervasyonActivite] OFF
SET IDENTITY_INSERT [dbo].[RezervasyonSpa] ON 

INSERT [dbo].[RezervasyonSpa] ([rezervasyonID], [masorID], [musteriID], [tarih], [saat], [musterigeldimi], [masorgeldimi], [active], [createDate]) VALUES (13, 5, NULL, CAST(N'2020-01-20' AS Date), CAST(N'11:00:00' AS Time), NULL, NULL, 0, CAST(N'2020-02-04T11:41:01.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[RezervasyonSpa] OFF
SET IDENTITY_INSERT [dbo].[Sepet] ON 

INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (3036, 5006, 1, 1, 25, 0, CAST(N'2020-02-17T19:33:31.570' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (3037, 5007, 1, 1, 18, 0, CAST(N'2020-02-17T19:33:31.573' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (4020, 5006, 1, 1, 25, 0, CAST(N'2020-02-18T09:54:20.857' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (4021, 5007, 1, 1, 18, 0, CAST(N'2020-02-18T09:54:20.857' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (5020, 5006, 1, 1, 25, 0, CAST(N'2020-02-18T19:31:34.667' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (5021, 5007, 1, 1, 18, 0, CAST(N'2020-02-18T19:31:34.667' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (5022, 5009, 1, 1, 35, 0, CAST(N'2020-02-18T19:31:34.667' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (6020, 5006, 1, 1, 25, 0, CAST(N'2020-03-18T17:09:54.053' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (6021, 5007, 1, 1, 18, 0, CAST(N'2020-03-18T17:09:54.053' AS DateTime), NULL, NULL)
INSERT [dbo].[Sepet] ([sepetID], [urunID], [urunMiktar], [odaID], [urunToplamFiyat], [SepetDurum], [SepetZaman], [isSelected], [odemeID]) VALUES (6022, 6006, 1, 1, 32, 0, CAST(N'2020-03-18T17:09:54.053' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sepet] OFF
SET IDENTITY_INSERT [dbo].[Spa] ON 

INSERT [dbo].[Spa] ([spaID], [spaAd], [spaAciklama], [spaResim], [active], [spaFiyat], [spaSuresi]) VALUES (4, N'Hint Masajı', N'Hint masajının tarihçesine baktığımız zaman çok eski bir masaj türü olduğunu anlıyoruz, yaklaşık 2000 bin yıldır uygulanan bu ayurveda masajı, yaşam bilimi içinde ortaya çıkmıştır. Bu yaşam bilimine göre sağlıklı bir vücuda sahip olmak için hücre ve dokularımızı beslemeli onlara ihtiyacı olan şeyi sunmalıyız bunun yanı sıra da ihtiyacı olmayan kurtulmak istediği şeylerden de vücudumuzu arındırmalıyız yani toksinlerden.', N'/Uploads/aaf5caa4-700f-407e-b5a2-46749e0c427f.jpg', 1, 100.0000, N'30 dk')
INSERT [dbo].[Spa] ([spaID], [spaAd], [spaAciklama], [spaResim], [active], [spaFiyat], [spaSuresi]) VALUES (5, N'Refleksoloji Masajı ', N'Refleksoloji yaklaşık 5000 yıldır uygulanan kadim bir yöntemdir. Genellikle ayak masajı ile karıştırılsa da aslında bir akupunktur yöntemine benzer. Ayak altındaki sinir uçlarına baskı yapılarak vücuda “kendini iyileştir” sinyali gönderilir.', N'/Uploads/db993b3e-a70f-4717-881a-e91c897b91f1.jpg', 1, 150.0000, N'2 saat')
SET IDENTITY_INSERT [dbo].[Spa] OFF
SET IDENTITY_INSERT [dbo].[Taksi] ON 

INSERT [dbo].[Taksi] ([taksiID], [taksiDurakAd], [taksiAd], [taksiTelefon], [taksiAdres]) VALUES (1012, N'Demet Durak', N'Taksi 1', N'0212 385 46 11', N'Soğanlık Yeni, AC Yapı Moment İstanbul, Baltacı Mehmet Paşa Sk. B-163, 34880 Kartal/İstanbul')
INSERT [dbo].[Taksi] ([taksiID], [taksiDurakAd], [taksiAd], [taksiTelefon], [taksiAdres]) VALUES (1013, N'Güldemet Durak', N'Taksi 2', N'0212 385 46 11', N'Güldemet Sokak Adıvar Apt altı  34522 Aydınlı/İstanbuş')
INSERT [dbo].[Taksi] ([taksiID], [taksiDurakAd], [taksiAd], [taksiTelefon], [taksiAdres]) VALUES (1014, N'Güldemet Durak', N'Taksi 3', N'0324 300 20 11', N'AC Yapı Moment İstanbul, Baltacı Mehmet Paşa Sk. B-163, 34880 Kartal/İstanbul')
SET IDENTITY_INSERT [dbo].[Taksi] OFF
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5006, N'Mantı', 25.0000, N'/Uploads/dd366c59-62e8-49f7-9a12-c41ffa35e698.jpg', 3007, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, N'yogurt, sarımsak, tuz')
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5007, N'Karışık Pizza', 18.0000, N'/Uploads/7866ffc8-7f0b-4cf0-8200-c32bd34ed2f1.jpg', 3007, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, N'Domates sosu, sucuk, sosis, mısır ve yeşil biber')
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5008, N'Meyveli Kokteyl', 38.0000, N'/Uploads/63dc82e5-28a7-4040-9ed0-27e3d93dc503.jpg', 3011, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5009, N'Chicken', 35.0000, N'/Uploads/68d1a59a-1eab-497a-b65f-d96a3f68382f.jpg', 3007, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5011, N'Meyve Suyu', 5.0000, N'/Uploads/2304d25a-a3f3-4ec2-a929-a3cdd5d8a655.jpg', 3010, NULL, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5012, N'Spagetti Balognese', 20.0000, N'/Uploads/4b64ea17-8e28-4745-b4d4-950b0ea9d926.jpg', 3007, NULL, 1, CAST(N'2020-01-21T16:18:45.877' AS DateTime), NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5013, N'Üç çikolatalı pasta', 15.0000, N'/Uploads/e62fa127-6eb5-4af8-8428-da2515cafe28.jpg', 3009, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, N'Sütlü, beyaz ve bitter çikolata soslu')
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (5014, N'Bira', 18.0000, N'/Uploads/be60d2af-aca6-40e0-ac62-d1bda7d057ef.jpg', 3010, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, N'Soğuk alkollü içecek')
INSERT [dbo].[Urun] ([urunID], [urunAd], [urunFiyat], [urunResim], [kategoriID], [odaID], [isDeleted], [CreateDate], [urunStok], [urunDurum], [userID], [urun], [isSelected], [urunAciklama]) VALUES (6006, N'Mexican Burger', 32.0000, N'/Uploads/65998529-9933-43dc-b5bc-722b7d2ec4fd.jpg', 3007, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, N'Marul, domates, turşu ve baharatlı patates eşliğinde')
SET IDENTITY_INSERT [dbo].[Urun] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [username], [password], [logo], [active], [yetkiID], [userZaman], [userDurum], [userAdSoyad]) VALUES (3, N'cansus', N'123456', NULL, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [username], [password], [logo], [active], [yetkiID], [userZaman], [userDurum], [userAdSoyad]) VALUES (1002, N'gunesbaygul', N'123456', NULL, 0, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Vale] ON 

INSERT [dbo].[Vale] ([valeID], [valeMesaj], [odaID], [active], [valeDurum], [createDate]) VALUES (1, N'Aracımın hazırlanmasını istiyorum.', NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Vale] OFF
SET IDENTITY_INSERT [dbo].[Wifi] ON 

INSERT [dbo].[Wifi] ([wifiID], [wifiAdi], [wifiPassword], [active], [odaID], [Date]) VALUES (1, NULL, N'123456', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Wifi] OFF
SET IDENTITY_INSERT [dbo].[WifiMesaj] ON 

INSERT [dbo].[WifiMesaj] ([wifiMesajID], [wifiID], [wifiText], [wifiBildirimSayi], [Date]) VALUES (3, NULL, N'Merhabalar, kat 8 de wifiye baglanamıyorum.', NULL, NULL)
INSERT [dbo].[WifiMesaj] ([wifiMesajID], [wifiID], [wifiText], [wifiBildirimSayi], [Date]) VALUES (4, NULL, N'Baglanırken hata alıyorum', NULL, NULL)
INSERT [dbo].[WifiMesaj] ([wifiMesajID], [wifiID], [wifiText], [wifiBildirimSayi], [Date]) VALUES (5, NULL, N'Şifreniz yanlıs diyor', NULL, NULL)
INSERT [dbo].[WifiMesaj] ([wifiMesajID], [wifiID], [wifiText], [wifiBildirimSayi], [Date]) VALUES (6, NULL, N'Baglanırken hata alıyorum', NULL, NULL)
INSERT [dbo].[WifiMesaj] ([wifiMesajID], [wifiID], [wifiText], [wifiBildirimSayi], [Date]) VALUES (1006, NULL, NULL, NULL, NULL)
INSERT [dbo].[WifiMesaj] ([wifiMesajID], [wifiID], [wifiText], [wifiBildirimSayi], [Date]) VALUES (1007, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WifiMesaj] OFF
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([yetkiID], [yetkiAd]) VALUES (1, N'SuperAdmin')
INSERT [dbo].[Yetki] ([yetkiID], [yetkiAd]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Yetki] OFF
ALTER TABLE [dbo].[Activite] ADD  CONSTRAINT [DF_Activite_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Ariza] ADD  CONSTRAINT [DF_Ariza_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Bildirim] ADD  CONSTRAINT [DF_Bildirim_bildirimDate]  DEFAULT (getdate()) FOR [bildirimDate]
GO
ALTER TABLE [dbo].[RezervasyonSpa] ADD  CONSTRAINT [DF_RezervasyonSpa_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Spa] ADD  CONSTRAINT [DF_Spa_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Urun] ADD  CONSTRAINT [DF_Urun_createDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Vale] ADD  CONSTRAINT [DF_Vale_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Wifi] ADD  CONSTRAINT [DF_Wifi_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[WifiMesaj] ADD  CONSTRAINT [DF_WifiMesaj_BildirimDate]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Ariza]  WITH CHECK ADD  CONSTRAINT [FK_Ariza_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
GO
ALTER TABLE [dbo].[Ariza] CHECK CONSTRAINT [FK_Ariza_Oda]
GO
ALTER TABLE [dbo].[Bildirim]  WITH CHECK ADD  CONSTRAINT [FK_Bildirim_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bildirim] CHECK CONSTRAINT [FK_Bildirim_Oda]
GO
ALTER TABLE [dbo].[ExtraUrun]  WITH CHECK ADD  CONSTRAINT [FK_ExtraUrun_Urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[Urun] ([urunID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExtraUrun] CHECK CONSTRAINT [FK_ExtraUrun_Urun]
GO
ALTER TABLE [dbo].[Keep]  WITH CHECK ADD  CONSTRAINT [FK_Keep_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
GO
ALTER TABLE [dbo].[Keep] CHECK CONSTRAINT [FK_Keep_Oda]
GO
ALTER TABLE [dbo].[Masor]  WITH CHECK ADD  CONSTRAINT [FK_Masor_Spa] FOREIGN KEY([spaID])
REFERENCES [dbo].[Spa] ([spaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Masor] CHECK CONSTRAINT [FK_Masor_Spa]
GO
ALTER TABLE [dbo].[Musteri]  WITH CHECK ADD  CONSTRAINT [FK_Musteri_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
GO
ALTER TABLE [dbo].[Musteri] CHECK CONSTRAINT [FK_Musteri_Oda]
GO
ALTER TABLE [dbo].[Oda]  WITH CHECK ADD  CONSTRAINT [FK_Oda_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Oda] CHECK CONSTRAINT [FK_Oda_User]
GO
ALTER TABLE [dbo].[RezervasyonActivite]  WITH CHECK ADD  CONSTRAINT [FK_RezervasyonActivite_Activite] FOREIGN KEY([activiteID])
REFERENCES [dbo].[Activite] ([activiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RezervasyonActivite] CHECK CONSTRAINT [FK_RezervasyonActivite_Activite]
GO
ALTER TABLE [dbo].[RezervasyonActivite]  WITH CHECK ADD  CONSTRAINT [FK_RezervasyonActivite_Musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[Musteri] ([musteriID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RezervasyonActivite] CHECK CONSTRAINT [FK_RezervasyonActivite_Musteri]
GO
ALTER TABLE [dbo].[RezervasyonSpa]  WITH CHECK ADD  CONSTRAINT [FK_RezervasyonSpa_Masor] FOREIGN KEY([masorID])
REFERENCES [dbo].[Masor] ([masorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RezervasyonSpa] CHECK CONSTRAINT [FK_RezervasyonSpa_Masor]
GO
ALTER TABLE [dbo].[RezervasyonSpa]  WITH CHECK ADD  CONSTRAINT [FK_RezervasyonSpa_Musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[Musteri] ([musteriID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RezervasyonSpa] CHECK CONSTRAINT [FK_RezervasyonSpa_Musteri]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Oda]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_OdemeTip] FOREIGN KEY([odemeID])
REFERENCES [dbo].[OdemeTip] ([odemeID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_OdemeTip]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[Urun] ([urunID])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Urun]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Oda]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Siparis] FOREIGN KEY([siparisID])
REFERENCES [dbo].[Siparis] ([siparisID])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Siparis]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[Urun] ([urunID])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Urun]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Kategori] FOREIGN KEY([kategoriID])
REFERENCES [dbo].[Kategori] ([kategoriID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Kategori]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_User] FOREIGN KEY([odaID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_User]
GO
ALTER TABLE [dbo].[UrunMesaj]  WITH CHECK ADD  CONSTRAINT [FK_UrunMesaj_Urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[Urun] ([urunID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrunMesaj] CHECK CONSTRAINT [FK_UrunMesaj_Urun]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Yetki] FOREIGN KEY([yetkiID])
REFERENCES [dbo].[Yetki] ([yetkiID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Yetki]
GO
ALTER TABLE [dbo].[Vale]  WITH CHECK ADD  CONSTRAINT [FK_Vale_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vale] CHECK CONSTRAINT [FK_Vale_Oda]
GO
ALTER TABLE [dbo].[Wifi]  WITH CHECK ADD  CONSTRAINT [FK_Wifi_Oda] FOREIGN KEY([odaID])
REFERENCES [dbo].[Oda] ([odaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wifi] CHECK CONSTRAINT [FK_Wifi_Oda]
GO
ALTER TABLE [dbo].[WifiMesaj]  WITH CHECK ADD  CONSTRAINT [FK_WifiMesaj_Wifi] FOREIGN KEY([wifiID])
REFERENCES [dbo].[Wifi] ([wifiID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WifiMesaj] CHECK CONSTRAINT [FK_WifiMesaj_Wifi]
GO
USE [master]
GO
ALTER DATABASE [OtelQr] SET  READ_WRITE 
GO
