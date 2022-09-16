-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 05 Oca 2022, 14:12:43
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kdsprojem`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinsiyet`
--

DROP TABLE IF EXISTS `cinsiyet`;
CREATE TABLE IF NOT EXISTS `cinsiyet` (
  `cinsiyetID` int(11) NOT NULL,
  `cinsiyetAd` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`cinsiyetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cinsiyet`
--

INSERT INTO `cinsiyet` (`cinsiyetID`, `cinsiyetAd`) VALUES
(1, 'Kadın'),
(2, 'Erkek');

--
-- Tetikleyiciler `cinsiyet`
--
DROP TRIGGER IF EXISTS `urunsay`;
DELIMITER $$
CREATE TRIGGER `urunsay` AFTER DELETE ON `cinsiyet` FOR EACH ROW INSERT INTO guncelUrunSayisi VALUES ((SELECT COUNT(*) FROM urun),now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelir`
--

DROP TABLE IF EXISTS `gelir`;
CREATE TABLE IF NOT EXISTS `gelir` (
  `y2018` int(11) NOT NULL,
  `y2019` int(11) NOT NULL,
  `y2020` int(11) NOT NULL,
  `y2021` int(50) NOT NULL,
  `gelirID` int(11) NOT NULL,
  `subeID` int(11) NOT NULL,
  PRIMARY KEY (`gelirID`),
  KEY `subeID` (`subeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `gelir`
--

INSERT INTO `gelir` (`y2018`, `y2019`, `y2020`, `y2021`, `gelirID`, `subeID`) VALUES
(1000000, 2500000, 1980000, 2650000, 1, 5),
(1673000, 1378600, 1724922, 1030000, 2, 6),
(706220, 826266, 667426, 867426, 3, 3),
(2616266, 2566262, 2979546, 3675495, 4, 1),
(1676623, 1597633, 1967404, 2064276, 5, 2),
(900065, 806400, 678222, 962400, 6, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gider`
--

DROP TABLE IF EXISTS `gider`;
CREATE TABLE IF NOT EXISTS `gider` (
  `y2018` int(11) NOT NULL,
  `y2019` int(11) NOT NULL,
  `y2020` int(11) NOT NULL,
  `y2021` int(50) NOT NULL,
  `giderID` int(11) NOT NULL,
  `subeID` int(11) NOT NULL,
  PRIMARY KEY (`giderID`),
  KEY `subeID` (`subeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `gider`
--

INSERT INTO `gider` (`y2018`, `y2019`, `y2020`, `y2021`, `giderID`, `subeID`) VALUES
(870000, 900000, 950430, 760562, 1, 5),
(500000, 645000, 556000, 874000, 2, 6),
(1076427, 1006979, 1007976, 1989729, 3, 1),
(200000, 300000, 250000, 420000, 4, 3),
(670000, 567000, 980000, 866000, 5, 4),
(900570, 920000, 867000, 976000, 6, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `guncelmusterisayisi`
--

DROP TABLE IF EXISTS `guncelmusterisayisi`;
CREATE TABLE IF NOT EXISTS `guncelmusterisayisi` (
  `sayi` int(11) NOT NULL,
  `tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `guncelmusterisayisi`
--

INSERT INTO `guncelmusterisayisi` (`sayi`, `tarih`) VALUES
(41, '2022-01-05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `guncelsubesayisi`
--

DROP TABLE IF EXISTS `guncelsubesayisi`;
CREATE TABLE IF NOT EXISTS `guncelsubesayisi` (
  `sayi` int(11) NOT NULL,
  `tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `guncelsubesayisi`
--

INSERT INTO `guncelsubesayisi` (`sayi`, `tarih`) VALUES
(8, '2022-01-05'),
(7, '2022-01-05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `guncelurunsayisi`
--

DROP TABLE IF EXISTS `guncelurunsayisi`;
CREATE TABLE IF NOT EXISTS `guncelurunsayisi` (
  `sayi` int(11) NOT NULL,
  `tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `guncelurunsayisi`
--

INSERT INTO `guncelurunsayisi` (`sayi`, `tarih`) VALUES
(21, '2022-01-05'),
(22, '2022-01-05'),
(23, '2022-01-05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `il`
--

DROP TABLE IF EXISTS `il`;
CREATE TABLE IF NOT EXISTS `il` (
  `ilID` int(3) NOT NULL,
  `ilAd` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ilID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `il`
--

INSERT INTO `il` (`ilID`, `ilAd`) VALUES
(1, 'Adana'),
(2, 'Adıyaman'),
(3, 'Afyonkarahisar'),
(4, 'Ağrı'),
(5, 'Amasya'),
(6, 'Ankara'),
(7, 'Antalya'),
(8, 'Artvin'),
(9, 'Aydın'),
(10, 'Balıkesir'),
(11, 'Bilecik'),
(12, 'Bingöl'),
(13, 'Bitlis'),
(14, 'Bolu'),
(15, 'Burdur'),
(16, 'Bursa'),
(17, 'Çanakkale'),
(18, 'Çankırı'),
(19, 'Çorum'),
(20, 'Denizli'),
(21, 'Diyarbakır'),
(22, 'Edirne'),
(23, 'Elazığ'),
(24, 'Erzincan'),
(25, 'Erzurum'),
(26, 'Eskişehir'),
(27, 'Gaziantep'),
(28, 'Giresun'),
(29, 'Gümüşhane'),
(30, 'Hakkari'),
(31, 'Hatay'),
(32, 'Isparta'),
(33, 'Mersin(İçel)'),
(34, 'İstanbul'),
(35, 'İzmir'),
(36, 'Kars'),
(37, 'Kastamonu'),
(38, 'Kayseri'),
(39, 'Kırklareli'),
(40, 'Kırşehir'),
(41, 'Kocaeli'),
(42, 'Konya'),
(43, 'Kütahya'),
(44, 'Malatya'),
(45, 'Manisa'),
(46, 'Kahramanmaraş'),
(47, 'Mardin'),
(48, 'Muğla'),
(49, 'Muş'),
(50, 'Nevşehir'),
(51, 'Niğde'),
(52, 'Ordu'),
(53, 'Rize'),
(54, 'Sakarya'),
(55, 'Samsun'),
(56, 'Siirt'),
(57, 'Sinop'),
(58, 'Sivas'),
(59, 'Tekirdağ'),
(60, 'Tokat'),
(61, 'Trabzon'),
(62, 'Tunceli'),
(63, 'Şanlıurfa'),
(64, 'Uşak'),
(65, 'Van'),
(66, 'Yozgat'),
(67, 'Zonguldak'),
(68, 'Aksaray'),
(69, 'Bayburt'),
(70, 'Karaman'),
(71, 'Kırıkkale'),
(72, 'Batman'),
(73, 'Şırnak'),
(74, 'Bartın'),
(75, 'Ardahan'),
(76, 'Iğdır'),
(77, 'Yalova'),
(78, 'Karabük'),
(79, 'Kilis'),
(80, 'Osmaniye'),
(81, 'Düzce');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilce`
--

DROP TABLE IF EXISTS `ilce`;
CREATE TABLE IF NOT EXISTS `ilce` (
  `ilceID` int(11) NOT NULL AUTO_INCREMENT,
  `ilceAd` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ilID` int(11) NOT NULL,
  PRIMARY KEY (`ilceID`),
  KEY `ilceKisit` (`ilID`)
) ENGINE=InnoDB AUTO_INCREMENT=971 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilce`
--

INSERT INTO `ilce` (`ilceID`, `ilceAd`, `ilID`) VALUES
(1, 'ADALAR', 34),
(2, 'ARNAVUTKÖY', 34),
(3, 'ATAŞEHİR', 34),
(4, 'AVCILAR', 34),
(5, 'BAĞCILAR', 34),
(6, 'BAHÇELİEVLER', 34),
(7, 'BAKIRKÖY', 34),
(8, 'BAŞAKŞEHİR', 34),
(9, 'BAYRAMPAŞA', 34),
(10, 'BEŞİKTAŞ', 34),
(11, 'BEYKOZ', 34),
(12, 'BEYLİKDÜZÜ', 34),
(13, 'BEYOĞLU', 34),
(14, 'BÜYÜKÇEKMECE', 34),
(15, 'ÇATALCA', 34),
(16, 'ÇEKMEKÖY', 34),
(17, 'ESENLER', 34),
(18, 'ESENYURT', 34),
(19, 'EYÜP', 34),
(20, 'FATİH', 34),
(21, 'GAZİOSMANPAŞA', 34),
(22, 'GÜNGÖREN', 34),
(23, 'KADIKÖY', 34),
(24, 'KAĞITHANE', 34),
(25, 'KARTAL', 34),
(26, 'KÜÇÜKÇEKMECE', 34),
(27, 'MALTEPE', 34),
(28, 'PENDİK', 34),
(29, 'SANCAKTEPE', 34),
(30, 'SARIYER', 34),
(31, 'SİLİVRİ', 34),
(32, 'SULTANBEYLİ', 34),
(33, 'SULTANGAZİ', 34),
(34, 'ŞİLE', 34),
(35, 'ŞİŞLİ', 34),
(36, 'TUZLA', 34),
(37, 'ÜMRANİYE', 34),
(38, 'ÜSKÜDAR', 34),
(39, 'ZEYTİNBURNU', 34),
(40, 'AKYURT', 6),
(41, 'ALTINDAĞ', 6),
(42, 'AYAŞ', 6),
(43, 'BALA', 6),
(44, 'BEYPAZARI', 6),
(45, 'ÇAMLIDERE', 6),
(46, 'ÇANKAYA', 6),
(47, 'ÇUBUK', 6),
(48, 'ELMADAĞ', 6),
(49, 'ETİMESGUT', 6),
(50, 'EVREN', 6),
(51, 'GÖLBAŞI', 6),
(52, 'GÜDÜL', 6),
(53, 'HAYMANA', 6),
(54, 'KAHRAMANKAZAN', 6),
(55, 'KALECİK', 6),
(56, 'KEÇİÖREN', 6),
(57, 'KIZILCAHAMAM', 6),
(58, 'MAMAK', 6),
(59, 'NALLIHAN', 6),
(60, 'POLATLI', 6),
(61, 'PURSAKLAR', 6),
(62, 'SİNCAN', 6),
(63, 'ŞEREFLİKOÇHİSAR', 6),
(64, 'YENİMAHALLE', 6),
(65, 'ALİAĞA', 35),
(66, 'BALÇOVA', 35),
(67, 'BAYINDIR', 35),
(68, 'BAYRAKLI', 35),
(69, 'BERGAMA', 35),
(70, 'BEYDAĞ', 35),
(71, 'BORNOVA', 35),
(72, 'BUCA', 35),
(73, 'ÇEŞME', 35),
(74, 'ÇİĞLİ', 35),
(75, 'DİKİLİ', 35),
(76, 'FOÇA', 35),
(77, 'GAZİEMİR', 35),
(78, 'GÜZELBAHÇE', 35),
(79, 'KARABAĞLAR', 35),
(80, 'KARABURUN', 35),
(81, 'KARŞIYAKA', 35),
(82, 'KEMALPAŞA', 35),
(83, 'KINIK', 35),
(84, 'KİRAZ', 35),
(85, 'KONAK', 35),
(86, 'MENDERES', 35),
(87, 'MENEMEN', 35),
(88, 'NARLIDERE', 35),
(89, 'ÖDEMİŞ', 35),
(90, 'SEFERİHİSAR', 35),
(91, 'SELÇUK', 35),
(92, 'TİRE', 35),
(93, 'TORBALI', 35),
(94, 'URLA', 35),
(95, 'BÜYÜKORHAN', 16),
(96, 'GEMLİK', 16),
(97, 'GÜRSU', 16),
(98, 'HARMANCIK', 16),
(99, 'İNEGÖL', 16),
(100, 'İZNİK', 16),
(101, 'KARACABEY', 16),
(102, 'KELES', 16),
(103, 'KESTEL', 16),
(104, 'MUDANYA', 16),
(105, 'MUSTAFAKEMALPAŞA', 16),
(106, 'NİLÜFER', 16),
(107, 'ORHANELİ', 16),
(108, 'ORHANGAZİ', 16),
(109, 'OSMANGAZİ', 16),
(110, 'YENİŞEHİR', 16),
(111, 'YILDIRIM', 16),
(112, 'ALADAĞ', 1),
(113, 'CEYHAN', 1),
(114, 'ÇUKUROVA', 1),
(115, 'FEKE', 1),
(116, 'İMAMOĞLU', 1),
(117, 'KARAİSALI', 1),
(118, 'KARATAŞ', 1),
(119, 'KOZAN', 1),
(120, 'POZANTI', 1),
(121, 'SAİMBEYLİ', 1),
(122, 'SARIÇAM', 1),
(123, 'SEYHAN', 1),
(124, 'TUFANBEYLİ', 1),
(125, 'YUMURTALIK', 1),
(126, 'YÜREĞİR', 1),
(127, 'BESNİ', 2),
(128, 'ÇELİKHAN', 2),
(129, 'GERGER', 2),
(130, 'GÖLBAŞI', 2),
(131, 'KAHTA', 2),
(132, 'MERKEZ', 2),
(133, 'SAMSAT', 2),
(134, 'SİNCİK', 2),
(135, 'TUT', 2),
(136, 'BAŞMAKÇI', 3),
(137, 'BAYAT', 3),
(138, 'BOLVADİN', 3),
(139, 'ÇAY', 3),
(140, 'ÇOBANLAR', 3),
(141, 'DAZKIRI', 3),
(142, 'DİNAR', 3),
(143, 'EMİRDAĞ', 3),
(144, 'EVCİLER', 3),
(145, 'HOCALAR', 3),
(146, 'İHSANİYE', 3),
(147, 'İSCEHİSAR', 3),
(148, 'KIZILÖREN', 3),
(149, 'MERKEZ', 3),
(150, 'SANDIKLI', 3),
(151, 'SİNANPAŞA', 3),
(152, 'SULTANDAĞI', 3),
(153, 'ŞUHUT', 3),
(154, 'DİYADİN', 4),
(155, 'DOĞUBAYAZIT', 4),
(156, 'ELEŞKİRT', 4),
(157, 'HAMUR', 4),
(158, 'MERKEZ', 4),
(159, 'PATNOS', 4),
(160, 'TAŞLIÇAY', 4),
(161, 'TUTAK', 4),
(162, 'AĞAÇÖREN', 68),
(163, 'ESKİL', 68),
(164, 'GÜLAĞAÇ', 68),
(165, 'GÜZELYURT', 68),
(166, 'MERKEZ', 68),
(167, 'ORTAKÖY', 68),
(168, 'SARIYAHŞİ', 68),
(169, 'GÖYNÜCEK', 5),
(170, 'GÜMÜŞHACIKÖY', 5),
(171, 'HAMAMÖZÜ', 5),
(172, 'MERKEZ', 5),
(173, 'MERZİFON', 5),
(174, 'SULUOVA', 5),
(175, 'TAŞOVA', 5),
(176, 'AKSEKİ', 7),
(177, 'AKSU', 7),
(178, 'ALANYA', 7),
(179, 'DEMRE', 7),
(180, 'DÖŞEMEALTI', 7),
(181, 'ELMALI', 7),
(182, 'FİNİKE', 7),
(183, 'GAZİPAŞA', 7),
(184, 'GÜNDOĞMUŞ', 7),
(185, 'İBRADI', 7),
(186, 'KAŞ', 7),
(187, 'KEMER', 7),
(188, 'KEPEZ', 7),
(189, 'KONYAALTI', 7),
(190, 'KORKUTELİ', 7),
(191, 'KUMLUCA', 7),
(192, 'MANAVGAT', 7),
(193, 'MURATPAŞA', 7),
(194, 'SERİK', 7),
(195, 'ÇILDIR', 75),
(196, 'DAMAL', 75),
(197, 'GÖLE', 75),
(198, 'HANAK', 75),
(199, 'MERKEZ', 75),
(200, 'POSOF', 75),
(201, 'ARDANUÇ', 8),
(202, 'ARHAVİ', 8),
(203, 'BORÇKA', 8),
(204, 'HOPA', 8),
(205, 'MERKEZ', 8),
(206, 'MURGUL', 8),
(207, 'ŞAVŞAT', 8),
(208, 'YUSUFELİ', 8),
(209, 'BOZDOĞAN', 9),
(210, 'BUHARKENT', 9),
(211, 'ÇİNE', 9),
(212, 'DİDİM', 9),
(213, 'EFELER', 9),
(214, 'GERMENCİK', 9),
(215, 'İNCİRLİOVA', 9),
(216, 'KARACASU', 9),
(217, 'KARPUZLU', 9),
(218, 'KOÇARLI', 9),
(219, 'KÖŞK', 9),
(220, 'KUŞADASI', 9),
(221, 'KUYUCAK', 9),
(222, 'NAZİLLİ', 9),
(223, 'SÖKE', 9),
(224, 'SULTANHİSAR', 9),
(225, 'YENİPAZAR', 9),
(226, 'ALTIEYLÜL', 10),
(227, 'AYVALIK', 10),
(228, 'BALYA', 10),
(229, 'BANDIRMA', 10),
(230, 'BİGADİÇ', 10),
(231, 'BURHANİYE', 10),
(232, 'DURSUNBEY', 10),
(233, 'EDREMİT', 10),
(234, 'ERDEK', 10),
(235, 'GÖMEÇ', 10),
(236, 'GÖNEN', 10),
(237, 'HAVRAN', 10),
(238, 'İVRİNDİ', 10),
(239, 'KARESİ', 10),
(240, 'KEPSUT', 10),
(241, 'MANYAS', 10),
(242, 'MARMARA', 10),
(243, 'SAVAŞTEPE', 10),
(244, 'SINDIRGI', 10),
(245, 'SUSURLUK', 10),
(246, 'AMASRA', 74),
(247, 'KURUCAŞİLE', 74),
(248, 'MERKEZ', 74),
(249, 'ULUS', 74),
(250, 'BEŞİRİ', 72),
(251, 'GERCÜŞ', 72),
(252, 'HASANKEYF', 72),
(253, 'KOZLUK', 72),
(254, 'MERKEZ', 72),
(255, 'SASON', 72),
(256, 'AYDINTEPE', 69),
(257, 'DEMİRÖZÜ', 69),
(258, 'MERKEZ', 69),
(259, 'BOZÜYÜK', 11),
(260, 'GÖLPAZARI', 11),
(261, 'İNHİSAR', 11),
(262, 'MERKEZ', 11),
(263, 'OSMANELİ', 11),
(264, 'PAZARYERİ', 11),
(265, 'SÖĞÜT', 11),
(266, 'YENİPAZAR', 11),
(267, 'ADAKLI', 12),
(268, 'GENÇ', 12),
(269, 'KARLIOVA', 12),
(270, 'KİĞI', 12),
(271, 'MERKEZ', 12),
(272, 'SOLHAN', 12),
(273, 'YAYLADERE', 12),
(274, 'YEDİSU', 12),
(275, 'ADİLCEVAZ', 13),
(276, 'AHLAT', 13),
(277, 'GÜROYMAK', 13),
(278, 'HİZAN', 13),
(279, 'MERKEZ', 13),
(280, 'MUTKİ', 13),
(281, 'TATVAN', 13),
(282, 'DÖRTDİVAN', 14),
(283, 'GEREDE', 14),
(284, 'GÖYNÜK', 14),
(285, 'KIBRISCIK', 14),
(286, 'MENGEN', 14),
(287, 'MERKEZ', 14),
(288, 'MUDURNU', 14),
(289, 'SEBEN', 14),
(290, 'YENİÇAĞA', 14),
(291, 'AĞLASUN', 15),
(292, 'ALTINYAYLA', 15),
(293, 'BUCAK', 15),
(294, 'ÇAVDIR', 15),
(295, 'ÇELTİKÇİ', 15),
(296, 'GÖLHİSAR', 15),
(297, 'KARAMANLI', 15),
(298, 'KEMER', 15),
(299, 'MERKEZ', 15),
(300, 'TEFENNİ', 15),
(301, 'YEŞİLOVA', 15),
(302, 'AYVACIK', 17),
(303, 'BAYRAMİÇ', 17),
(304, 'BİGA', 17),
(305, 'BOZCAADA', 17),
(306, 'ÇAN', 17),
(307, 'ECEABAT', 17),
(308, 'EZİNE', 17),
(309, 'GELİBOLU', 17),
(310, 'GÖKÇEADA', 17),
(311, 'LAPSEKİ', 17),
(312, 'MERKEZ', 17),
(313, 'YENİCE', 17),
(314, 'ATKARACALAR', 18),
(315, 'BAYRAMÖREN', 18),
(316, 'ÇERKEŞ', 18),
(317, 'ELDİVAN', 18),
(318, 'ILGAZ', 18),
(319, 'KIZILIRMAK', 18),
(320, 'KORGUN', 18),
(321, 'KURŞUNLU', 18),
(322, 'MERKEZ', 18),
(323, 'ORTA', 18),
(324, 'ŞABANÖZÜ', 18),
(325, 'YAPRAKLI', 18),
(326, 'ALACA', 19),
(327, 'BAYAT', 19),
(328, 'BOĞAZKALE', 19),
(329, 'DODURGA', 19),
(330, 'İSKİLİP', 19),
(331, 'KARGI', 19),
(332, 'LAÇİN', 19),
(333, 'MECİTÖZÜ', 19),
(334, 'MERKEZ', 19),
(335, 'OĞUZLAR', 19),
(336, 'ORTAKÖY', 19),
(337, 'OSMANCIK', 19),
(338, 'SUNGURLU', 19),
(339, 'UĞURLUDAĞ', 19),
(340, 'ACIPAYAM', 20),
(341, 'BABADAĞ', 20),
(342, 'BAKLAN', 20),
(343, 'BEKİLLİ', 20),
(344, 'BEYAĞAÇ', 20),
(345, 'BOZKURT', 20),
(346, 'BULDAN', 20),
(347, 'ÇAL', 20),
(348, 'ÇAMELİ', 20),
(349, 'ÇARDAK', 20),
(350, 'ÇİVRİL', 20),
(351, 'GÜNEY', 20),
(352, 'HONAZ', 20),
(353, 'KALE', 20),
(354, 'MERKEZEFENDİ', 20),
(355, 'PAMUKKALE', 20),
(356, 'SARAYKÖY', 20),
(357, 'SERİNHİSAR', 20),
(358, 'TAVAS', 20),
(359, 'BAĞLAR', 21),
(360, 'BİSMİL', 21),
(361, 'ÇERMİK', 21),
(362, 'ÇINAR', 21),
(363, 'ÇÜNGÜŞ', 21),
(364, 'DİCLE', 21),
(365, 'EĞİL', 21),
(366, 'ERGANİ', 21),
(367, 'HANİ', 21),
(368, 'HAZRO', 21),
(369, 'KAYAPINAR', 21),
(370, 'KOCAKÖY', 21),
(371, 'KULP', 21),
(372, 'LİCE', 21),
(373, 'SİLVAN', 21),
(374, 'SUR', 21),
(375, 'YENİŞEHİR', 21),
(376, 'BAŞİSKELE', 41),
(377, 'ÇAYIROVA', 41),
(378, 'DARICA', 41),
(379, 'DERİNCE', 41),
(380, 'DİLOVASI', 41),
(381, 'GEBZE', 41),
(382, 'GÖLCÜK', 41),
(383, 'İZMİT', 41),
(384, 'KANDIRA', 41),
(385, 'KARAMÜRSEL', 41),
(386, 'KARTEPE', 41),
(387, 'KÖRFEZ', 41),
(388, 'AHIRLI', 42),
(389, 'AKÖREN', 42),
(390, 'AKŞEHİR', 42),
(391, 'ALTINEKİN', 42),
(392, 'BEYŞEHİR', 42),
(393, 'BOZKIR', 42),
(394, 'CİHANBEYLİ', 42),
(395, 'ÇELTİK', 42),
(396, 'ÇUMRA', 42),
(397, 'DERBENT', 42),
(398, 'DEREBUCAK', 42),
(399, 'DOĞANHİSAR', 42),
(400, 'EMİRGAZİ', 42),
(401, 'EREĞLİ', 42),
(402, 'GÜNEYSINIR', 42),
(403, 'HADİM', 42),
(404, 'HALKAPINAR', 42),
(405, 'HÜYÜK', 42),
(406, 'ILGIN', 42),
(407, 'KADINHANI', 42),
(408, 'KARAPINAR', 42),
(409, 'KARATAY', 42),
(410, 'KULU', 42),
(411, 'MERAM', 42),
(412, 'SARAYÖNÜ', 42),
(413, 'SELÇUKLU', 42),
(414, 'SEYDİŞEHİR', 42),
(415, 'TAŞKENT', 42),
(416, 'TUZLUKÇU', 42),
(417, 'YALIHÜYÜK', 42),
(418, 'YUNAK', 42),
(419, 'ALTINTAŞ', 43),
(420, 'ASLANAPA', 43),
(421, 'ÇAVDARHİSAR', 43),
(422, 'DOMANİÇ', 43),
(423, 'DUMLUPINAR', 43),
(424, 'EMET', 43),
(425, 'GEDİZ', 43),
(426, 'HİSARCIK', 43),
(427, 'MERKEZ', 43),
(428, 'PAZARLAR', 43),
(429, 'SİMAV', 43),
(430, 'ŞAPHANE', 43),
(431, 'TAVŞANLI', 43),
(432, 'AKÇADAĞ', 44),
(433, 'ARAPGİR', 44),
(434, 'ARGUVAN', 44),
(435, 'BATTALGAZİ', 44),
(436, 'DARENDE', 44),
(437, 'DOĞANŞEHİR', 44),
(438, 'DOĞANYOL', 44),
(439, 'HEKİMHAN', 44),
(440, 'KALE', 44),
(441, 'KULUNCAK', 44),
(442, 'PÜTÜRGE', 44),
(443, 'YAZIHAN', 44),
(444, 'YEŞİLYURT', 44),
(445, 'AHMETLİ', 45),
(446, 'AKHİSAR', 45),
(447, 'ALAŞEHİR', 45),
(448, 'DEMİRCİ', 45),
(449, 'GÖLMARMARA', 45),
(450, 'GÖRDES', 45),
(451, 'KIRKAĞAÇ', 45),
(452, 'KÖPRÜBAŞI', 45),
(453, 'KULA', 45),
(454, 'SALİHLİ', 45),
(455, 'SARIGÖL', 45),
(456, 'SARUHANLI', 45),
(457, 'SELENDİ', 45),
(458, 'SOMA', 45),
(459, 'ŞEHZADELER', 45),
(460, 'TURGUTLU', 45),
(461, 'YUNUSEMRE', 45),
(462, 'ARTUKLU', 47),
(463, 'DARGEÇİT', 47),
(464, 'DERİK', 47),
(465, 'KIZILTEPE', 47),
(466, 'MAZIDAĞI', 47),
(467, 'MİDYAT', 47),
(468, 'NUSAYBİN', 47),
(469, 'ÖMERLİ', 47),
(470, 'SAVUR', 47),
(471, 'YEŞİLLİ', 47),
(472, 'AKDENİZ', 33),
(473, 'ANAMUR', 33),
(474, 'AYDINCIK', 33),
(475, 'BOZYAZI', 33),
(476, 'ÇAMLIYAYLA', 33),
(477, 'ERDEMLİ', 33),
(478, 'GÜLNAR', 33),
(479, 'MEZİTLİ', 33),
(480, 'MUT', 33),
(481, 'SİLİFKE', 33),
(482, 'TARSUS', 33),
(483, 'TOROSLAR', 33),
(484, 'YENİŞEHİR', 33),
(485, 'BODRUM', 48),
(486, 'DALAMAN', 48),
(487, 'DATÇA', 48),
(488, 'FETHİYE', 48),
(489, 'KAVAKLIDERE', 48),
(490, 'KÖYCEĞİZ', 48),
(491, 'MARMARİS', 48),
(492, 'MENTEŞE', 48),
(493, 'MİLAS', 48),
(494, 'ORTACA', 48),
(495, 'SEYDİKEMER', 48),
(496, 'ULA', 48),
(497, 'YATAĞAN', 48),
(498, 'BULANIK', 49),
(499, 'HASKÖY', 49),
(500, 'KORKUT', 49),
(501, 'MALAZGİRT', 49),
(502, 'MERKEZ', 49),
(503, 'VARTO', 49),
(504, 'ACIGÖL', 50),
(505, 'AVANOS', 50),
(506, 'DERİNKUYU', 50),
(507, 'GÜLŞEHİR', 50),
(508, 'HACIBEKTAŞ', 50),
(509, 'KOZAKLI', 50),
(510, 'MERKEZ', 50),
(511, 'ÜRGÜP', 50),
(512, 'ALTUNHİSAR', 51),
(513, 'BOR', 51),
(514, 'ÇAMARDI', 51),
(515, 'ÇİFTLİK', 51),
(516, 'MERKEZ', 51),
(517, 'ULUKIŞLA', 51),
(518, 'AKKUŞ', 52),
(519, 'ALTINORDU', 52),
(520, 'AYBASTI', 52),
(521, 'ÇAMAŞ', 52),
(522, 'ÇATALPINAR', 52),
(523, 'ÇAYBAŞI', 52),
(524, 'FATSA', 52),
(525, 'GÖLKÖY', 52),
(526, 'GÜLYALI', 52),
(527, 'GÜRGENTEPE', 52),
(528, 'İKİZCE', 52),
(529, 'KABADÜZ', 52),
(530, 'KABATAŞ', 52),
(531, 'KORGAN', 52),
(532, 'KUMRU', 52),
(533, 'MESUDİYE', 52),
(534, 'PERŞEMBE', 52),
(535, 'ULUBEY', 52),
(536, 'ÜNYE', 52),
(537, 'BAHÇE', 80),
(538, 'DÜZİÇİ', 80),
(539, 'HASANBEYLİ', 80),
(540, 'KADİRLİ', 80),
(541, 'MERKEZ', 80),
(542, 'SUMBAS', 80),
(543, 'TOPRAKKALE', 80),
(544, 'ARDEŞEN', 53),
(545, 'ÇAMLIHEMŞİN', 53),
(546, 'ÇAYELİ', 53),
(547, 'DEREPAZARI', 53),
(548, 'FINDIKLI', 53),
(549, 'GÜNEYSU', 53),
(550, 'HEMŞİN', 53),
(551, 'İKİZDERE', 53),
(552, 'İYİDERE', 53),
(553, 'KALKANDERE', 53),
(554, 'MERKEZ', 53),
(555, 'PAZAR', 53),
(556, 'ADAPAZARI', 54),
(557, 'AKYAZI', 54),
(558, 'ARİFİYE', 54),
(559, 'ERENLER', 54),
(560, 'FERİZLİ', 54),
(561, 'GEYVE', 54),
(562, 'HENDEK', 54),
(563, 'KARAPÜRÇEK', 54),
(564, 'KARASU', 54),
(565, 'KAYNARCA', 54),
(566, 'KOCAALİ', 54),
(567, 'PAMUKOVA', 54),
(568, 'SAPANCA', 54),
(569, 'SERDİVAN', 54),
(570, 'SÖĞÜTLÜ', 54),
(571, 'TARAKLI', 54),
(572, 'ALAÇAM', 55),
(573, 'ASARCIK', 55),
(574, 'ATAKUM', 55),
(575, 'AYVACIK', 55),
(576, 'BAFRA', 55),
(577, 'CANİK', 55),
(578, 'ÇARŞAMBA', 55),
(579, 'HAVZA', 55),
(580, 'İLKADIM', 55),
(581, 'KAVAK', 55),
(582, 'LADİK', 55),
(583, 'SALIPAZARI', 55),
(584, 'TEKKEKÖY', 55),
(585, 'TERME', 55),
(586, 'VEZİRKÖPRÜ', 55),
(587, 'YAKAKENT', 55),
(588, '19 MAYIS', 55),
(589, 'BAYKAN', 56),
(590, 'ERUH', 56),
(591, 'KURTALAN', 56),
(592, 'MERKEZ', 56),
(593, 'PERVARİ', 56),
(594, 'ŞİRVAN', 56),
(595, 'TİLLO', 56),
(596, 'AYANCIK', 57),
(597, 'BOYABAT', 57),
(598, 'DİKMEN', 57),
(599, 'DURAĞAN', 57),
(600, 'ERFELEK', 57),
(601, 'GERZE', 57),
(602, 'MERKEZ', 57),
(603, 'SARAYDÜZÜ', 57),
(604, 'TÜRKELİ', 57),
(605, 'BEYTÜŞŞEBAP', 73),
(606, 'CİZRE', 73),
(607, 'GÜÇLÜKONAK', 73),
(608, 'İDİL', 73),
(609, 'MERKEZ', 73),
(610, 'SİLOPİ', 73),
(611, 'ULUDERE', 73),
(612, 'AKINCILAR', 58),
(613, 'ALTINYAYLA', 58),
(614, 'DİVRİĞİ', 58),
(615, 'DOĞANŞAR', 58),
(616, 'GEMEREK', 58),
(617, 'GÖLOVA', 58),
(618, 'GÜRÜN', 58),
(619, 'HAFİK', 58),
(620, 'İMRANLI', 58),
(621, 'KANGAL', 58),
(622, 'KOYULHİSAR', 58),
(623, 'MERKEZ', 58),
(624, 'SUŞEHRİ', 58),
(625, 'ŞARKIŞLA', 58),
(626, 'ULAŞ', 58),
(627, 'YILDIZELİ', 58),
(628, 'ZARA', 58),
(629, 'ÇERKEZKÖY', 59),
(630, 'ÇORLU', 59),
(631, 'ERGENE', 59),
(632, 'HAYRABOLU', 59),
(633, 'KAPAKLI', 59),
(634, 'MALKARA', 59),
(635, 'MARMARAEREĞLİSİ', 59),
(636, 'MURATLI', 59),
(637, 'SARAY', 59),
(638, 'SÜLEYMANPAŞA', 59),
(639, 'ŞARKÖY', 59),
(640, 'ALMUS', 60),
(641, 'ARTOVA', 60),
(642, 'BAŞÇİFTLİK', 60),
(643, 'ERBAA', 60),
(644, 'MERKEZ', 60),
(645, 'NİKSAR', 60),
(646, 'PAZAR', 60),
(647, 'REŞADİYE', 60),
(648, 'SULUSARAY', 60),
(649, 'TURHAL', 60),
(650, 'YEŞİLYURT', 60),
(651, 'ZİLE', 60),
(652, 'AKÇAABAT', 61),
(653, 'ARAKLI', 61),
(654, 'ARSİN', 61),
(655, 'BEŞİKDÜZÜ', 61),
(656, 'ÇARŞIBAŞI', 61),
(657, 'ÇAYKARA', 61),
(658, 'DERNEKPAZARI', 61),
(659, 'DÜZKÖY', 61),
(660, 'HAYRAT', 61),
(661, 'KÖPRÜBAŞI', 61),
(662, 'MAÇKA', 61),
(663, 'OF', 61),
(664, 'ORTAHİSAR', 61),
(665, 'SÜRMENE', 61),
(666, 'ŞALPAZARI', 61),
(667, 'TONYA', 61),
(668, 'VAKFIKEBİR', 61),
(669, 'YOMRA', 61),
(670, 'ÇEMİŞGEZEK', 62),
(671, 'HOZAT', 62),
(672, 'MAZGİRT', 62),
(673, 'MERKEZ', 62),
(674, 'NAZIMİYE', 62),
(675, 'OVACIK', 62),
(676, 'PERTEK', 62),
(677, 'PÜLÜMÜR', 62),
(678, 'AKÇAKALE', 63),
(679, 'BİRECİK', 63),
(680, 'BOZOVA', 63),
(681, 'CEYLANPINAR', 63),
(682, 'EYYÜBİYE', 63),
(683, 'HALFETİ', 63),
(684, 'HALİLİYE', 63),
(685, 'HARRAN', 63),
(686, 'HİLVAN', 63),
(687, 'KARAKÖPRÜ', 63),
(688, 'SİVEREK', 63),
(689, 'SURUÇ', 63),
(690, 'VİRANŞEHİR', 63),
(691, 'BANAZ', 64),
(692, 'EŞME', 64),
(693, 'KARAHALLI', 64),
(694, 'MERKEZ', 64),
(695, 'SİVASLI', 64),
(696, 'ULUBEY', 64),
(697, 'BAHÇESARAY', 65),
(698, 'BAŞKALE', 65),
(699, 'ÇALDIRAN', 65),
(700, 'ÇATAK', 65),
(701, 'EDREMİT', 65),
(702, 'ERCİŞ', 65),
(703, 'GEVAŞ', 65),
(704, 'GÜRPINAR', 65),
(705, 'İPEKYOLU', 65),
(706, 'MURADİYE', 65),
(707, 'ÖZALP', 65),
(708, 'SARAY', 65),
(709, 'TUŞBA', 65),
(710, 'ALTINOVA', 77),
(711, 'ARMUTLU', 77),
(712, 'ÇINARCIK', 77),
(713, 'ÇİFTLİKKÖY', 77),
(714, 'MERKEZ', 77),
(715, 'TERMAL', 77),
(716, 'AKDAĞMADENİ', 66),
(717, 'AYDINCIK', 66),
(718, 'BOĞAZLIYAN', 66),
(719, 'ÇANDIR', 66),
(720, 'ÇAYIRALAN', 66),
(721, 'ÇEKEREK', 66),
(722, 'KADIŞEHRİ', 66),
(723, 'MERKEZ', 66),
(724, 'SARAYKENT', 66),
(725, 'SARIKAYA', 66),
(726, 'SORGUN', 66),
(727, 'ŞEFAATLİ', 66),
(728, 'YENİFAKILI', 66),
(729, 'YERKÖY', 66),
(730, 'ALAPLI', 67),
(731, 'ÇAYCUMA', 67),
(732, 'DEVREK', 67),
(733, 'EREĞLİ', 67),
(734, 'GÖKÇEBEY', 67),
(735, 'KİLİMLİ', 67),
(736, 'KOZLU', 67),
(737, 'MERKEZ', 67),
(738, 'AKÇAKOCA', 81),
(739, 'CUMAYERİ', 81),
(740, 'ÇİLİMLİ', 81),
(741, 'GÖLYAKA', 81),
(742, 'GÜMÜŞOVA', 81),
(743, 'KAYNAŞLI', 81),
(744, 'MERKEZ', 81),
(745, 'YIĞILCA', 81),
(746, 'ENEZ', 22),
(747, 'HAVSA', 22),
(748, 'İPSALA', 22),
(749, 'KEŞAN', 22),
(750, 'LALAPAŞA', 22),
(751, 'MERİÇ', 22),
(752, 'MERKEZ', 22),
(753, 'SÜLOĞLU', 22),
(754, 'UZUNKÖPRÜ', 22),
(755, 'AĞIN', 23),
(756, 'ALACAKAYA', 23),
(757, 'ARICAK', 23),
(758, 'BASKİL', 23),
(759, 'KARAKOÇAN', 23),
(760, 'KEBAN', 23),
(761, 'KOVANCILAR', 23),
(762, 'MADEN', 23),
(763, 'MERKEZ', 23),
(764, 'PALU', 23),
(765, 'SİVRİCE', 23),
(766, 'ÇAYIRLI', 24),
(767, 'İLİÇ', 24),
(768, 'KEMAH', 24),
(769, 'KEMALİYE', 24),
(770, 'MERKEZ', 24),
(771, 'OTLUKBELİ', 24),
(772, 'REFAHİYE', 24),
(773, 'TERCAN', 24),
(774, 'ÜZÜMLÜ', 24),
(775, 'AŞKALE', 25),
(776, 'AZİZİYE', 25),
(777, 'ÇAT', 25),
(778, 'HINIS', 25),
(779, 'HORASAN', 25),
(780, 'İSPİR', 25),
(781, 'KARAÇOBAN', 25),
(782, 'KARAYAZI', 25),
(783, 'KÖPRÜKÖY', 25),
(784, 'NARMAN', 25),
(785, 'OLTU', 25),
(786, 'OLUR', 25),
(787, 'PALANDÖKEN', 25),
(788, 'PASİNLER', 25),
(789, 'PAZARYOLU', 25),
(790, 'ŞENKAYA', 25),
(791, 'TEKMAN', 25),
(792, 'TORTUM', 25),
(793, 'UZUNDERE', 25),
(794, 'YAKUTİYE', 25),
(795, 'ALPU', 26),
(796, 'BEYLİKOVA', 26),
(797, 'ÇİFTELER', 26),
(798, 'GÜNYÜZÜ', 26),
(799, 'HAN', 26),
(800, 'İNÖNÜ', 26),
(801, 'MAHMUDİYE', 26),
(802, 'MİHALGAZİ', 26),
(803, 'MİHALIÇÇIK', 26),
(804, 'ODUNPAZARI', 26),
(805, 'SARICAKAYA', 26),
(806, 'SEYİTGAZİ', 26),
(807, 'SİVRİHİSAR', 26),
(808, 'TEPEBAŞI', 26),
(809, 'ARABAN', 27),
(810, 'İSLAHİYE', 27),
(811, 'KARKAMIŞ', 27),
(812, 'NİZİP', 27),
(813, 'NURDAĞI', 27),
(814, 'OĞUZELİ', 27),
(815, 'ŞAHİNBEY', 27),
(816, 'ŞEHİTKAMİL', 27),
(817, 'YAVUZELİ', 27),
(818, 'ALUCRA', 28),
(819, 'BULANCAK', 28),
(820, 'ÇAMOLUK', 28),
(821, 'ÇANAKÇI', 28),
(822, 'DERELİ', 28),
(823, 'DOĞANKENT', 28),
(824, 'ESPİYE', 28),
(825, 'EYNESİL', 28),
(826, 'GÖRELE', 28),
(827, 'GÜCE', 28),
(828, 'KEŞAP', 28),
(829, 'MERKEZ', 28),
(830, 'PİRAZİZ', 28),
(831, 'ŞEBİNKARAHİSAR', 28),
(832, 'TİREBOLU', 28),
(833, 'YAĞLIDERE', 28),
(834, 'KELKİT', 29),
(835, 'KÖSE', 29),
(836, 'KÜRTÜN', 29),
(837, 'MERKEZ', 29),
(838, 'ŞİRAN', 29),
(839, 'TORUL', 29),
(840, 'ÇUKURCA', 30),
(841, 'MERKEZ', 30),
(842, 'ŞEMDİNLİ', 30),
(843, 'YÜKSEKOVA', 30),
(844, 'ALTINÖZÜ', 31),
(845, 'ANTAKYA', 31),
(846, 'ARSUZ', 31),
(847, 'BELEN', 31),
(848, 'DEFNE', 31),
(849, 'DÖRTYOL', 31),
(850, 'ERZİN', 31),
(851, 'HASSA', 31),
(852, 'İSKENDERUN', 31),
(853, 'KIRIKHAN', 31),
(854, 'KUMLU', 31),
(855, 'PAYAS', 31),
(856, 'REYHANLI', 31),
(857, 'SAMANDAĞ', 31),
(858, 'YAYLADAĞI', 31),
(859, 'ARALIK', 76),
(860, 'KARAKOYUNLU', 76),
(861, 'MERKEZ', 76),
(862, 'TUZLUCA', 76),
(863, 'AKSU', 32),
(864, 'ATABEY', 32),
(865, 'EĞİRDİR', 32),
(866, 'GELENDOST', 32),
(867, 'GÖNEN', 32),
(868, 'KEÇİBORLU', 32),
(869, 'MERKEZ', 32),
(870, 'SENİRKENT', 32),
(871, 'SÜTÇÜLER', 32),
(872, 'ŞARKİKARAAĞAÇ', 32),
(873, 'ULUBORLU', 32),
(874, 'YALVAÇ', 32),
(875, 'YENİŞARBADEMLİ', 32),
(876, 'AFŞİN', 46),
(877, 'ANDIRIN', 46),
(878, 'ÇAĞLAYANCERİT', 46),
(879, 'DULKADİROĞLU', 46),
(880, 'EKİNÖZÜ', 46),
(881, 'ELBİSTAN', 46),
(882, 'GÖKSUN', 46),
(883, 'NURHAK', 46),
(884, 'ONİKİŞUBAT', 46),
(885, 'PAZARCIK', 46),
(886, 'TÜRKOĞLU', 46),
(887, 'EFLANİ', 78),
(888, 'ESKİPAZAR', 78),
(889, 'MERKEZ', 78),
(890, 'OVACIK', 78),
(891, 'SAFRANBOLU', 78),
(892, 'YENİCE', 78),
(893, 'AYRANCI', 70),
(894, 'BAŞYAYLA', 70),
(895, 'ERMENEK', 70),
(896, 'KAZIMKARABEKİR', 70),
(897, 'MERKEZ', 70),
(898, 'SARIVELİLER', 70),
(899, 'AKYAKA', 36),
(900, 'ARPAÇAY', 36),
(901, 'DİGOR', 36),
(902, 'KAĞIZMAN', 36),
(903, 'MERKEZ', 36),
(904, 'SARIKAMIŞ', 36),
(905, 'SELİM', 36),
(906, 'SUSUZ', 36),
(907, 'ABANA', 37),
(908, 'AĞLI', 37),
(909, 'ARAÇ', 37),
(910, 'AZDAVAY', 37),
(911, 'BOZKURT', 37),
(912, 'CİDE', 37),
(913, 'ÇATALZEYTİN', 37),
(914, 'DADAY', 37),
(915, 'DEVREKANİ', 37),
(916, 'DOĞANYURT', 37),
(917, 'HANÖNÜ', 37),
(918, 'İHSANGAZİ', 37),
(919, 'İNEBOLU', 37),
(920, 'KÜRE', 37),
(921, 'MERKEZ', 37),
(922, 'PINARBAŞI', 37),
(923, 'SEYDİLER', 37),
(924, 'ŞENPAZAR', 37),
(925, 'TAŞKÖPRÜ', 37),
(926, 'TOSYA', 37),
(927, 'AKKIŞLA', 38),
(928, 'BÜNYAN', 38),
(929, 'DEVELİ', 38),
(930, 'FELAHİYE', 38),
(931, 'HACILAR', 38),
(932, 'İNCESU', 38),
(933, 'KOCASİNAN', 38),
(934, 'MELİKGAZİ', 38),
(935, 'ÖZVATAN', 38),
(936, 'PINARBAŞI', 38),
(937, 'SARIOĞLAN', 38),
(938, 'SARIZ', 38),
(939, 'TALAS', 38),
(940, 'TOMARZA', 38),
(941, 'YAHYALI', 38),
(942, 'YEŞİLHİSAR', 38),
(943, 'ELBEYLİ', 79),
(944, 'MERKEZ', 79),
(945, 'MUSABEYLİ', 79),
(946, 'POLATELİ', 79),
(947, 'BAHŞİLİ', 71),
(948, 'BALIŞEYH', 71),
(949, 'ÇELEBİ', 71),
(950, 'DELİCE', 71),
(951, 'KARAKEÇİLİ', 71),
(952, 'KESKİN', 71),
(953, 'MERKEZ', 71),
(954, 'SULAKYURT', 71),
(955, 'YAHŞİHAN', 71),
(956, 'BABAESKİ', 39),
(957, 'DEMİRKÖY', 39),
(958, 'KOFÇAZ', 39),
(959, 'LÜLEBURGAZ', 39),
(960, 'MERKEZ', 39),
(961, 'PEHLİVANKÖY', 39),
(962, 'PINARHİSAR', 39),
(963, 'VİZE', 39),
(964, 'AKÇAKENT', 40),
(965, 'AKPINAR', 40),
(966, 'BOZTEPE', 40),
(967, 'ÇİÇEKDAĞI', 40),
(968, 'KAMAN', 40),
(969, 'MERKEZ', 40),
(970, 'MUCUR', 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE IF NOT EXISTS `kullanici` (
  `sifre` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `id` int(11) NOT NULL,
  `kullaniciMail` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `kullaniciAd` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `kullaniciSoyad` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`sifre`, `id`, `kullaniciMail`, `kullaniciAd`, `kullaniciSoyad`) VALUES
('1234', 1, 'aybuke.kayikci35@gmail.com', 'Aybüke', 'Kayıkçı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

DROP TABLE IF EXISTS `musteri`;
CREATE TABLE IF NOT EXISTS `musteri` (
  `musteriID` int(11) NOT NULL,
  `musteriAd` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `musteriSoyad` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `cinsiyetID` int(2) NOT NULL,
  PRIMARY KEY (`musteriID`),
  KEY `cinsiyetID` (`cinsiyetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`musteriID`, `musteriAd`, `musteriSoyad`, `cinsiyetID`) VALUES
(1, 'Hazal Nur', 'Asma', 1),
(2, 'Yavuz', 'Yalçın', 2),
(3, 'Utku', 'İnan', 2),
(4, 'Emir', 'Albayrak', 2),
(5, 'Selin', 'Özyıldız', 1),
(6, 'Lara', 'Doğan', 1),
(7, 'Zehra', 'Sağlık', 1),
(8, 'Ahmet', 'Doğan', 2),
(9, 'Ahmet', 'Demir', 2),
(10, 'Ali', 'Akın\r\n', 2),
(11, 'Feyyaz', 'Antep', 2),
(12, 'Görkem', 'Su', 2),
(13, 'Halim', 'Çakır', 2),
(14, 'Ziya', 'Akar', 2),
(15, 'Alper', 'Demirbaş', 2),
(16, 'Alp', 'Alın', 2),
(17, 'Demir', 'Saksı', 2),
(18, 'Yasin', 'Uzun', 2),
(19, 'Yavuz', 'Yanar', 2),
(20, 'Erdinç', 'Sert', 2),
(21, 'Can', 'Ağaç', 2),
(22, 'Samet', 'Demiray', 2),
(23, 'Sinan', 'Eker', 2),
(24, 'Sefa', 'Koç', 2),
(25, 'Adnan', 'Koç', 2),
(26, 'Ayşe', 'Hayır', 1),
(27, 'Fatma', 'Sıla', 1),
(28, 'Ayşenur', 'Gökalp', 1),
(29, 'Betül', 'Akın', 1),
(30, 'Aybike', 'Özdemir', 1),
(31, 'Sıla', 'Yılmaz', 1),
(32, 'Aleyna', 'Su', 1),
(33, 'Şevval', 'Alper', 1),
(34, 'Esma', 'Akın', 1),
(35, 'Nazlı', 'Serdivan', 1),
(36, 'Derin', 'Kale', 1),
(37, 'Hale', 'Kalın', 1),
(38, 'Serra', 'Karşı', 1),
(39, 'Pelinsu', 'Kartop', 1),
(40, 'Yeşim', 'Kayar', 1),
(65, 'Aybüke', 'Kayıkçı', 1);

--
-- Tetikleyiciler `musteri`
--
DROP TRIGGER IF EXISTS `guncelmusSay`;
DELIMITER $$
CREATE TRIGGER `guncelmusSay` AFTER DELETE ON `musteri` FOR EACH ROW INSERT INTO guncelmusterisayisi VALUES ((SELECT COUNT(*) FROM musteri),now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `guncelmusSayisi`;
DELIMITER $$
CREATE TRIGGER `guncelmusSayisi` AFTER INSERT ON `musteri` FOR EACH ROW INSERT INTO guncelmusterisayisi VALUES ((SELECT COUNT(*) FROM musteri),now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satis`
--

DROP TABLE IF EXISTS `satis`;
CREATE TABLE IF NOT EXISTS `satis` (
  `satisID` int(11) NOT NULL,
  `urunID` int(11) NOT NULL,
  `musteriID` int(11) NOT NULL,
  `subeID` int(11) NOT NULL,
  PRIMARY KEY (`satisID`),
  KEY `musteriID` (`musteriID`),
  KEY `subeID` (`subeID`),
  KEY `urunID` (`urunID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `satis`
--

INSERT INTO `satis` (`satisID`, `urunID`, `musteriID`, `subeID`) VALUES
(1, 4, 10, 1),
(3, 20, 10, 1),
(4, 9, 20, 2),
(5, 19, 27, 6),
(6, 4, 12, 4),
(7, 8, 16, 6),
(8, 21, 40, 5),
(9, 3, 28, 3),
(10, 6, 34, 3),
(11, 4, 30, 4),
(12, 8, 25, 6),
(13, 4, 29, 4),
(14, 12, 29, 6),
(15, 15, 21, 3),
(16, 3, 4, 2),
(17, 2, 30, 1),
(18, 3, 15, 1),
(19, 3, 15, 2),
(20, 16, 26, 2),
(21, 18, 21, 4),
(65, 12, 17, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sube`
--

DROP TABLE IF EXISTS `sube`;
CREATE TABLE IF NOT EXISTS `sube` (
  `subeAd` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `subeAdres` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `subeMail` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `subeNo` int(11) NOT NULL,
  `subeYonetici` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `yoneticiCep` int(11) NOT NULL,
  `subeID` int(10) NOT NULL,
  `ilID` int(11) NOT NULL,
  `ilceID` int(11) NOT NULL,
  PRIMARY KEY (`subeID`),
  KEY `ilceID` (`ilceID`),
  KEY `ilKisit` (`ilID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sube`
--

INSERT INTO `sube` (`subeAd`, `subeAdres`, `subeMail`, `subeNo`, `subeYonetici`, `yoneticiCep`, `subeID`, `ilID`, `ilceID`) VALUES
('Kadıköy Şubesi', 'Osmanağa Mah, General Asım Gündüz Cd. No:26, 34714 Kadıköy/İstanbul', 'freshkadikoy@gmail.com', 216349657, 'Ahmet Uzun', 536642566, 1, 34, 23),
('Şirinyer Şubesi Fresh Decor', 'Efeler, Menderes Cd. No:201, 35380 Buca Osb/Buca/İzmir', 'sirinyerfreshdecor@gmail.com', 216349693, 'Berra Yılmaz', 533456399, 2, 35, 72),
('Karabük Şubesi', '100. Yıl, Kastamonu Yolu, 78050 Karabük Merkez/Karabük', 'karabukfreshdecor@gmail.com', 216349694, 'Derya Sıla', 536642564, 3, 78, 889),
('Çankaya Şubesi Fresh Decor', 'Meşrutiyet, Karanfil Sk. No:20, 06420 Çankaya/Ankara', 'cankayafreshdecor@gmail.com', 216349694, 'Ahmet Kara', 533241026, 4, 6, 46),
('Alsancak Fresh Decor', 'Alsancak Mah, Kıbrıs Şehitleri Cd. No:179/B D:C, 35220 Konak/İzmir', 'alsfreshdecor@gmail.com', 214349694, 'Hazal Güney', 526425664, 5, 35, 85),
('Balçova Şubesi Fresh Decor', 'İnciraltı Mah. Mithat Paşa Cad. No:1462 K:Zemin Kipa Alışveriş Merkezi, 35330 Balçova/İzmir', 'balcovafreshdecor@gmail.com', 212349694, 'Emir Albayrak', 538118752, 6, 35, 66),
('Bornova Şubesi Fresh Decor', 'Kazımdirik Mah. 372. Sok. No:10 K:Zemin Forum Bornova, D:B Blok, 35100 Bornova/İzmir', 'bornovafreshdecor@gmail.com', 216349697, 'Aydın Aker', 537642569, 7, 35, 71);

--
-- Tetikleyiciler `sube`
--
DROP TRIGGER IF EXISTS `guncelsubeSayisi`;
DELIMITER $$
CREATE TRIGGER `guncelsubeSayisi` AFTER DELETE ON `sube` FOR EACH ROW INSERT INTO guncelsubesayisi VALUES ((SELECT COUNT(*) FROM sube),now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `guncelsubeSayisii`;
DELIMITER $$
CREATE TRIGGER `guncelsubeSayisii` AFTER INSERT ON `sube` FOR EACH ROW INSERT INTO guncelsubesayisi VALUES ((SELECT COUNT(*) FROM sube),now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `toplamgelir`
-- (Asıl görünüm için aşağıya bakın)
--
DROP VIEW IF EXISTS `toplamgelir`;
CREATE TABLE IF NOT EXISTS `toplamgelir` (
`gelir-gider` bigint(51)
,`subeAd` varchar(250)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

DROP TABLE IF EXISTS `urun`;
CREATE TABLE IF NOT EXISTS `urun` (
  `urunID` int(11) NOT NULL,
  `urunAdi` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `urunFiyat` int(10) NOT NULL,
  `urunMaliyet` int(10) NOT NULL,
  PRIMARY KEY (`urunID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`urunID`, `urunAdi`, `urunFiyat`, `urunMaliyet`) VALUES
(2, 'Cupcake Kar Küresi 5x5x8 Cm Gri', 90, 65),
(3, 'Margot Duvar Aksesuarı 26x26x1.5cm Lacivert', 90, 60),
(4, 'Maura Duvar Aksesuarı 26x26x1.5 Cm Lacivert', 85, 60),
(5, 'Bouquet Buhurdanlık 11x11x14 Cm Beyaz', 90, 65),
(6, 'Floret Buhurdanlık 11x11x14 Cm Beyaz', 74, 36),
(7, 'Royal Şamdan 8.5x19.8 Cm Krem', 119, 69),
(8, 'Palm Trees Polyresin Şamdan 15x15x25 Cm Kahve - Yesil', 54, 40),
(9, 'Q-Art Metal Siyah-Altın Dekoratif Duvar Saati - 40 cm', 299, 100),
(10, 'Galaxy Bombe CamIı Duvar Saati - 35 cm', 79, 56),
(11, 'Lumiyard Çerçeveli Tablo - 30x40 cm', 55, 25),
(12, 'Lumiyard 4\'lü Çerçeveli Poster Tablo - 20x30 cm', 129, 90),
(13, 'Q-Art Model-261 6 Parça Çerçeveli Ahşap Tablo Seti', 189, 145),
(14, 'Q-Art Model-754 Kanvas Tablo - 50x70 cm', 89, 62),
(15, 'Mondecor Şakura Mermer Saksı Çiçeği - Asorti', 49, 20),
(16, 'Objevi Beton Saksıda Doğal Görünümlü Bitki - 10x18 cm', 39, 25),
(17, 'Urban Mood Ledli Dekoratif Fener', 85, 45),
(18, 'Q-Art Led Ev Şeklinde Fener - Asorti', 49, 20),
(19, 'Q-Art Camda Kokulu Mum - Asorti', 70, 50),
(20, 'Q-Art Gold Metal Tealight Tutucu - 27 cm', 99, 70),
(21, 'Q-Art Metal Tealight Tutucu Gold Mumluk', 40, 30),
(22, 'La Deco Pramid Mumluk - Altın', 69, 41),
(65, 'Dekoratif Gül Kokulu Mum', 65, 15),
(98, 'KURU KAFA BİBLO 27x20x23 CM', 98, 70);

--
-- Tetikleyiciler `urun`
--
DROP TRIGGER IF EXISTS `guncelUrunSayi`;
DELIMITER $$
CREATE TRIGGER `guncelUrunSayi` AFTER INSERT ON `urun` FOR EACH ROW INSERT INTO guncelurunsayisi VALUES ((SELECT COUNT(*) FROM urun),now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `guncelUrunSayisi`;
DELIMITER $$
CREATE TRIGGER `guncelUrunSayisi` AFTER DELETE ON `urun` FOR EACH ROW INSERT INTO guncelurunsayisi VALUES ((SELECT COUNT(*) FROM urun),now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `yıllıkkar`
-- (Asıl görünüm için aşağıya bakın)
--
DROP VIEW IF EXISTS `yıllıkkar`;
CREATE TABLE IF NOT EXISTS `yıllıkkar` (
`y2018` bigint(12)
,`y2019` bigint(12)
,`y2020` bigint(12)
,`y2021` bigint(51)
,`subeAd` varchar(250)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `toplamgelir`
--
DROP TABLE IF EXISTS `toplamgelir`;

DROP VIEW IF EXISTS `toplamgelir`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `toplamgelir`  AS  select (`gelir`.`y2021` - `gider`.`y2021`) AS `gelir-gider`,`sube`.`subeAd` AS `subeAd` from ((`sube` join `gelir`) join `gider`) where ((`sube`.`subeID` = `gelir`.`subeID`) and (`sube`.`subeID` = `gider`.`subeID`)) ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `yıllıkkar`
--
DROP TABLE IF EXISTS `yıllıkkar`;

DROP VIEW IF EXISTS `yıllıkkar`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yıllıkkar`  AS  select (`gelir`.`y2018` - `gider`.`y2018`) AS `y2018`,(`gelir`.`y2019` - `gider`.`y2019`) AS `y2019`,(`gelir`.`y2020` - `gider`.`y2020`) AS `y2020`,(`gelir`.`y2021` - `gider`.`y2021`) AS `y2021`,`sube`.`subeAd` AS `subeAd` from ((`gelir` join `gider`) join `sube`) where ((`gelir`.`subeID` = `sube`.`subeID`) and (`gider`.`subeID` = `sube`.`subeID`)) group by `sube`.`subeID` ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `gelir`
--
ALTER TABLE `gelir`
  ADD CONSTRAINT `gelir_sube` FOREIGN KEY (`subeID`) REFERENCES `sube` (`subeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `gider`
--
ALTER TABLE `gider`
  ADD CONSTRAINT `gider_sube` FOREIGN KEY (`subeID`) REFERENCES `sube` (`subeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `ilce`
--
ALTER TABLE `ilce`
  ADD CONSTRAINT `ilceKisit` FOREIGN KEY (`ilID`) REFERENCES `il` (`ilID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `musteri`
--
ALTER TABLE `musteri`
  ADD CONSTRAINT `cinsiyetKisiti` FOREIGN KEY (`cinsiyetID`) REFERENCES `cinsiyet` (`cinsiyetID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `satis`
--
ALTER TABLE `satis`
  ADD CONSTRAINT `satis_musteri` FOREIGN KEY (`musteriID`) REFERENCES `musteri` (`musteriID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `satis_sube` FOREIGN KEY (`subeID`) REFERENCES `sube` (`subeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `satis_urun` FOREIGN KEY (`urunID`) REFERENCES `urun` (`urunID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `sube`
--
ALTER TABLE `sube`
  ADD CONSTRAINT `ilKisit` FOREIGN KEY (`ilID`) REFERENCES `il` (`ilID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
