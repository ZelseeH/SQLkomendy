USE master
GO
IF EXISTS
( SELECT name FROM master.dbo.sysdatabases
WHERE name = N'MiejskiInformatorKulturalny')
BEGIN
	DROP DATABASE MiejskiInformatorKulturalny
END
GO
CREATE DATABASE MiejskiInformatorKulturalny
ON
PRIMARY
( NAME = MiejskiInformatorKulturalny,
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MIKA\MiejskiInformatorKulturalny_01.mdf',
  SIZE = 10, MAXSIZE = 50, FILEGROWTH = 5)
LOG ON
( NAME = MiejskiInformatorKulturalny_log,
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MIKB\MiejskiInformatorKulturalny_log01.ldf',
  SIZE = 5MB, MAXSIZE = 25MB, FILEGROWTH = 5MB);
GO

USE [MiejskiInformatorKulturalny]
GO
IF OBJECT_ID(N'Wyswietlenia', N'U') IS NOT NULL
	DROP TABLE Wyswietlenia;
GO
CREATE TABLE Wyswietlenia
(
	[ID_Wyswietlenia] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IP] nvarchar(15) NOT NULL,
	[Data] Datetime NOT NULL DEFAULT GETDATE(),
	[Artykul] INT NOT NULL
);
GO
USE [MiejskiInformatorKulturalny]
GO
IF OBJECT_ID(N'Redaktorzy', N'U') IS NOT NULL
	DROP TABLE Redaktorzy;
GO
CREATE TABLE Redaktorzy
(
	[ID_Redaktora] INT NOT NULL PRIMARY KEY,
	[Imie] nvarchar(50) NOT NULL,
	[Nazwisko] nvarchar(50) NOT NULL,
	[Email] nvarchar(100)NULL CHECK (Email LIKE '%@%'),
	[Zdjecie] Nvarchar(100)NULL

);
GO
USE [MiejskiInformatorKulturalny]
GO
IF OBJECT_ID(N'Kategorie', N'U') IS NOT NULL
	DROP TABLE Kategorie;
GO
CREATE TABLE Kategorie
(
	[ID_Kategorii] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nazwa] nvarchar(100) NOT NULL
);
GO
USE [MiejskiInformatorKulturalny]
GO
IF OBJECT_ID(N'Podkategorie', N'U') IS NOT NULL
	DROP TABLE Podkategorie;
GO
CREATE TABLE Podkategorie
(
	[ID_Podkategorii] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nazwa] nvarchar(100) NOT NULL,
	[Kategoria] INT NOT NULL
);
GO
USE [MiejskiInformatorKulturalny]
GO
IF OBJECT_ID(N'Zdjecia', N'U') IS NOT NULL
	DROP TABLE Zdjecia;
GO
CREATE TABLE Zdjecia
(
	[ID_Zdjecia] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Opis] nvarchar(200)NULL,
	[Sciezka] nvarchar(100) NOT NULL,
	[Artykul] INT NOT NULL
);
GO
USE [MiejskiInformatorKulturalny]
GO
IF OBJECT_ID(N'Artykuly', N'U') IS NOT NULL
	DROP TABLE Artykuly;
GO
CREATE TABLE Artykuly
(
	[ID_Artykulu] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Tytul] nvarchar(200) NOT NULL,
	[Tresc] nvarchar(max) NOT NULL ,
	[Zrodlo] nvarchar(100)NULL,
	[Data_publikacji] Datetime NOT NULL DEFAULT GETDATE(),
	[Podkategoria] INT NOT NULL,
	[Redaktor] INT NOT NULL,
	 CONSTRAINT UC_Tytul UNIQUE ([Tytul])
);
GO

IF 'ID_Wyswietlenia' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Wyswietlenia')
BEGIN
	ALTER TABLE Wyswietlenia ADD ID_Wyswietlenia INT IDENTITY(1,1) NOT NULL PRIMARY KEY;
END
IF 'Artykul' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Wyswietlenia')
BEGIN
	ALTER TABLE Wyswietlenia ADD Artykul int NOT NULL;
END
IF 'ID_Redaktora' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Redaktorzy')
BEGIN
	ALTER TABLE Redaktorzy ADD ID_Redaktora INT NOT NULL PRIMARY KEY;
END
IF 'ID_Kategorii' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Kategorie')
BEGIN
	ALTER TABLE Kategorie ADD ID_Kategorii INT IDENTITY(1,1) NOT NULL PRIMARY KEY;
END
IF 'ID_Podkategorii' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Podkategorie')
BEGIN
	ALTER TABLE Podkategorie ADD ID_Podkategorii INT IDENTITY(1,1) NOT NULL PRIMARY KEY;
END
IF 'Kategoria' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Podkategorie')
BEGIN
	ALTER TABLE Podkategorie ADD Kategoria int NOT NULL;
END
IF 'ID_Zdjecia' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Zdjecia')
BEGIN
	ALTER TABLE Zdjecia ADD ID_Zdjecia INT IDENTITY(1,1) NOT NULL PRIMARY KEY;
END
IF 'Artykul' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Zdjecia')
BEGIN
	ALTER TABLE Zdjecia ADD Artykul int NOT NULL;
END
IF 'ID_Artykulu' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Artykuly')
BEGIN
	ALTER TABLE Artykuly ADD ID_Artykulu INT IDENTITY(1,1) NOT NULL PRIMARY KEY;
END
IF 'Podkategoria' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Artykuly')
BEGIN
	ALTER TABLE Artykuly ADD Podkategoria int NOT NULL;
END
IF 'Redaktor' NOT IN (SELECT c.name 
					   FROM sys.tables t JOIN sys.columns c ON t.object_id = c.object_id 
					   WHERE t.name = 'Artykuly')
BEGIN
	ALTER TABLE Artykuly ADD Redaktor int NOT NULL;
END

USE [MiejskiInformatorKulturalny]
GO
IF EXISTS ( SELECT *
			FROM sys.foreign_keys
			WHERE object_id = OBJECT_ID(N'dbo.FK_Wyswietlenia_artykul')
				AND parent_object_id = OBJECT_ID(N'dbo.Wyswietlenia'))
		ALTER TABLE Wyswietlenia
			DROP CONSTRAINT FK_Wyswietlenia_artykul;
GO
ALTER TABLE Wyswietlenia
	ADD CONSTRAINT FK_Wyswietlenia_artykul
		FOREIGN KEY(Artykul) REFERENCES Artykuly(ID_Artykulu);
GO
IF EXISTS ( SELECT *
			FROM sys.foreign_keys
			WHERE object_id = OBJECT_ID(N'dbo.FK_Podkategoria_Kategoria')
				AND parent_object_id = OBJECT_ID(N'dbo.Podkategorie'))
		ALTER TABLE Podkategorie
			DROP CONSTRAINT FK_Podkategoria_Kategoria;
GO
ALTER TABLE Podkategorie
	ADD CONSTRAINT FK_Podkategoria_Kategoria
		FOREIGN KEY(Kategoria) REFERENCES Kategorie(ID_Kategorii);
GO
IF EXISTS ( SELECT *
			FROM sys.foreign_keys
			WHERE object_id = OBJECT_ID(N'dbo.FK_Zdjecia_Artykul')
				AND parent_object_id = OBJECT_ID(N'dbo.Zdjecia'))
		ALTER TABLE Zdjecia
			DROP CONSTRAINT FK_Zdjecia_Artykul;
GO
ALTER TABLE Zdjecia
	ADD CONSTRAINT FK_Zdjecia_Artykul
		FOREIGN KEY(Artykul) REFERENCES Artykuly(ID_Artykulu);
GO
IF EXISTS ( SELECT *
			FROM sys.foreign_keys
			WHERE object_id = OBJECT_ID(N'dbo.FK_Artykuly_Podkategoria')
				AND parent_object_id = OBJECT_ID(N'dbo.Artykuly'))
		ALTER TABLE Artykuly
			DROP CONSTRAINT FK_Artykuly_Podkategoria;
GO
ALTER TABLE Artykuly
	ADD CONSTRAINT FK_Artykuly_Podkategoria
		FOREIGN KEY(Podkategoria) REFERENCES Podkategorie(ID_Podkategorii);
GO
IF EXISTS ( SELECT *
			FROM sys.foreign_keys
			WHERE object_id = OBJECT_ID(N'dbo.FK_Artykuly_Redaktor')
				AND parent_object_id = OBJECT_ID(N'dbo.Artykuly'))
		ALTER TABLE Artykuly
			DROP CONSTRAINT FK_Artykuly_Redaktor;
GO
ALTER TABLE Artykuly
	ADD CONSTRAINT FK_Artykuly_Redaktor
		FOREIGN KEY(Redaktor) REFERENCES Redaktorzy(ID_Redaktora);
GO