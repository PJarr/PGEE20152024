USE PortfolioProject
GO

CREATE TABLE DimPGEEClub
(
	ClubID INT IDENTITY(1,1) PRIMARY KEY,
	CoreClubName NVARCHAR(100) NOT NULL UNIQUE
)

INSERT INTO DimPGEEClub
VALUES ('SPARTA WROC£AW'),
	   ('UNIA LESZNO'),
	   ('GKM GRUDZI¥DZ'),
	   ('APATOR TORUÑ'),
	   ('MOTOR LUBLIN'),
	   ('STAL GORZÓW'),
	   ('W£ÓKNIARZ CZÊSTOCHOWA'),
	   ('UNIA TARNÓW'),
	   ('ROW RYBNIK'),
	   ('FALUBAZ ZIELONA GÓRA'),
	   ('STAL RZESZÓW'),
	   ('T¯ OSTROVIA OSTRÓW'),
	   ('WILKI KROSNO')

SELECT * FROM DimPGEEClub

CREATE TABLE ClubNameMapping
(
	ClubNameWithSponsor NVARCHAR(100) NOT NULL UNIQUE,
	ClubID INT FOREIGN KEY REFERENCES DimPGEEClub(ClubID)
)

INSERT INTO ClubNameMapping
VALUES ('BETARD SPARTA WROC£AW',1),
('FOGO UNIA LESZNO',2),
('EBUT.PL STAL GORZÓW',6),
('KRONO-PLAST W£ÓKNIARZ CZÊSTOCHOWA',7),
('NOVYHOTEL FALUBAZ ZIELONA GÓRA',10),
('KS APATOR TORUÑ',4),
('ZOOLESZCZ GKM GRUDZI¥DZ',3),
('ORLEN OIL MOTOR LUBLIN',5),
('CELLFAST WILKI KROSNO',13),
('TAURON W£ÓKNIARZ CZÊSTOCHOWA',7),
('FOR NATURE SOLUTIONS KS APATOR TORUÑ',4),
('PLATINUM MOTOR LUBLIN',5),
('MOTOR LUBLIN',5),
('ZIELONA-ENERGIA.COM W£ÓKNIARZ CZÊSTOCHOWA',7),
('ARGED MALESA OSTRÓW',12),
('MOJE BERMUDY STAL GORZÓW',6),
('FOR NATURE SOLUTIONS APATOR TORUÑ',4),
('ELTROX W£ÓKNIARZ CZÊSTOCHOWA',7),
('EWINNER APATOR TORUÑ',4),
('ZOOLESZCZ DPV LOGISTIC GKM GRUDZI¥DZ',3),
('MARWIS.PL FALUBAZ ZIELONA GÓRA',10),
('MRGARDEN GKM GRUDZI¥DZ',3),
('PGG ROW RYBNIK',9),
('RM SOLAR FALUBAZ ZIELONA GÓRA',10),
('TRULY.WORK STAL GORZÓW',6),
('GET WELL TORUÑ',4),
('FORBET W£ÓKNIARZ CZÊSTOCHOWA',7),
('STELMET FALUBAZ ZIELONA GÓRA',10),
('SPEED CAR MOTOR LUBLIN',5),
('CASH BROKER STAL GORZÓW',6),
('GRUPA AZOTY UNIA TARNÓW',8),
('FALUBAZ ZIELONA GÓRA',10),
('EKANTOR.PL FALUBAZ ZIELONA GÓRA',10),
('W£ÓKNIARZ VITROSZLIF CROSSFIT CZÊSTOCHOWA',7),
('ROW RYBNIK',9),
('UNIA TARNÓW',8),
('STAL GORZÓW',6),
('KS TORUÑ',4),
('PGE STAL RZESZÓW',11),
('MONEYMAKESMONEY.PL STAL GORZÓW',6),
('SPAR FALUBAZ ZIELONA GÓRA',10)

SELECT * FROM ClubNameMapping

CREATE TABLE fctPGEEResults
(
	Sezon INT,
	KLUB NVARCHAR(100),
	PKTTABELA INT,
	BONTABELA INT,
	PKTZDOBYTE INT,
	PKTSTRACONE INT,
	PLUSMINUS INT,
	Z INT,
	R INT,
	P INT,
	PKTPER15 DECIMAL(5,3),
	PKTDOMPER15 DECIMAL(5,3),
	PKTWYJAZDPER15 DECIMAL(5,3),
	WIEK DECIMAL(5,3),
	TRIUMFY DECIMAL(5,3),
	BONUSY DECIMAL(5,3),
	WYNIK51 INT,
	WYNIK42 INT,
	WYNIK33 INT,
	WYNIK24 INT,
	WYNIK15 INT,
	WYNIK3321 INT,
	WYNIK3330 INT,
	PKTJUNIORZY DECIMAL(5,3),
	PKTPOL DECIMAL(5,3),
	PKTOBCO DECIMAL(5,3),
	PROCPKTPOL DECIMAL(5,3),
	PROCPKTOBCO DECIMAL(5,3),
	MSCTABELA INT
)

drop table fctPGEEResults
select 
	sezon,
	KLUB,
	c.CoreClubName
from fctPGEEResults p
left join ClubNameMapping m on p.KLUB = m.ClubNameWithSponsor
left join DimPGEEClub c on c.ClubID = m.ClubID


CREATE TABLE ClubLogo
(
	ClubID INT FOREIGN KEY REFERENCES DimPGEEClub(ClubID),
	Logo_url NVARCHAR(MAX)
	
)

select * from ClubLogo

INSERT INTO ClubLogo
VALUES (4,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F1_2024_alt_128x128.png%3F27&w=128&q=75'),
	   (10,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F5_2024_alt_128x128.png%3F27&w=256&q=75'),
	   (3,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F2_2024_alt_128x128.png%3F27&w=128&q=75'),
	   (5,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F14_2024_alt_128x128.png%3F27&w=128&q=75'),
	   (9,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F7_2020_alt_128x128.png%3F27&w=128&q=75'),
	   (1,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F3_2020_alt_128x128.png%3F27&w=128&q=75'),
	   (6,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F8_2020_alt_128x128.png%3F27&w=128&q=75'),
	   (11,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F10_2015_alt_128x128.png%3F27&w=128&q=75'),
	   (12,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F15_2022_alt_128x128.png%3F27&w=128&q=75'),
	   (2,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F6_2022_alt_128x128.png%3F27&w=128&q=75'),
	   (8,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F4_2018_alt_128x128.png%3F27&w=128&q=75'),
	   (13,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F21_2023_alt_128x128.png%3F27&w=128&q=75'),
	   (7,'https://ekstraliga.pl/_next/image?url=https%3A%2F%2Fmedia.speedwayekstraliga.pl%2Fteams%2F9_2023_alt_128x128.png%3F27&w=128&q=75')

