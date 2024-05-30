CREATE or alter TRIGGER check_ip_structure on wyswietlenia
FOR INSERT
NOT FOR REPLICATION
AS
BEGIN
    DECLARE @ip NVARCHAR(15);
    DECLARE @octet1 INT, @octet2 INT, @octet3 INT, @octet4 INT;

    SELECT @ip = IP FROM inserted;
    
    IF @ip IS NOT NULL
    BEGIN
        SELECT 
            @octet1 = TRY_CAST(PARSENAME(@ip, 4) AS INT),
            @octet2 = TRY_CAST(PARSENAME(@ip, 3) AS INT),
            @octet3 = TRY_CAST(PARSENAME(@ip, 2) AS INT),
            @octet4 = TRY_CAST(PARSENAME(@ip, 1) AS INT);
        IF @octet1 IS NULL OR @octet2 IS NULL OR @octet3 IS NULL OR @octet4 IS NULL
            OR @octet1 < 0 OR @octet1 > 255
            OR @octet2 < 0 OR @octet2 > 255
            OR @octet3 < 0 OR @octet3 > 255
            OR @octet4 < 0 OR @octet4 > 255
        BEGIN
            RAISERROR('Nieprawid³owy format adresu IP', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END
END;

go

CREATE or alter TRIGGER check_today_date
ON wyswietlenia
AFTER INSERT
AS
BEGIN
    DECLARE @today DATE;
    SET @today = CONVERT(DATE, GETDATE());
    
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE CONVERT(DATE, COALESCE(Data, GETDATE())) <> @today
    )
    BEGIN
        PRINT 'B³¹d: Data wstawiona nie jest dzisiejsza.';
        ROLLBACK TRANSACTION;
    END;
END;
go

CREATE or alter TRIGGER Check_Name_Format ON Redaktorzy
AFTER INSERT
AS
BEGIN
DECLARE @NameCheck INT;
DECLARE @InsertedName NVARCHAR(100);
SELECT @InsertedName = Imie
FROM inserted;
IF @InsertedName NOT LIKE '%[^a-zA-Z]%'
SET @NameCheck = 1;
ELSE
SET @NameCheck = 0;
IF @NameCheck = 0
BEGIN
RAISERROR('Imiê musi sk³adaæ siê tylko z liter.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
GO

CREATE or ALTER TRIGGER Check_Surname_Format
ON Redaktorzy
AFTER INSERT
AS
BEGIN
DECLARE @SurnameCheck INT;
DECLARE @InsertedSurname NVARCHAR(100);
SELECT @InsertedSurname = Nazwisko
FROM inserted;
IF @InsertedSurname NOT LIKE '%[^a-zA-Z]%'
SET @SurnameCheck = 1;
ELSE
SET @SurnameCheck = 0;
IF @SurnameCheck = 0
BEGIN
RAISERROR('Nazwisko musi sk³adaæ siê tylko z liter.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
GO


CREATE or alter TRIGGER Check_Email_Format
ON Redaktorzy
AFTER INSERT
AS
BEGIN
DECLARE @EmailCheck INT;
DECLARE @InsertedEmail NVARCHAR(255);
SELECT @InsertedEmail = Email
FROM inserted;
IF @InsertedEmail LIKE '%@%.%' AND CHARINDEX('@', @InsertedEmail) > 1 AND CHARINDEX('.', @InsertedEmail, CHARINDEX('@', @InsertedEmail)) > CHARINDEX('@', @InsertedEmail) 
SET @EmailCheck = 1;
ELSE
SET @EmailCheck = 0;
IF @EmailCheck = 0
BEGIN
RAISERROR('Niepoprawny format adresu email.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
GO


CREATE or ALTER TRIGGER Check_Photo_Path
ON Redaktorzy
AFTER INSERT
AS
BEGIN
DECLARE @PathCheck INT;
DECLARE @InsertedPath NVARCHAR(255);
SELECT @InsertedPath = zdjecie
FROM inserted;
IF @InsertedPath IS NULL
RETURN;
IF CHARINDEX(':', @InsertedPath) > 0  AND CHARINDEX('\', @InsertedPath) > 0
SET @PathCheck = 1;
ELSE
SET @PathCheck = 0;
IF @Pathcheck = 0
BEGIN
RAISERROR('Niepoprawna œcie¿ka do pliku.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
go


CREATE or ALTER TRIGGER Check_Category_Name
ON Kategorie
AFTER INSERT
AS
BEGIN
DECLARE @NameCheck INT;
DECLARE @InsertedName NVARCHAR(100);
SELECT @InsertedName = Nazwa
FROM inserted;
IF @InsertedName NOT LIKE '%[^a-zA-Z]%'
SET @NameCheck = 1;
ELSE
SET @NameCheck = 0;
IF @NameCheck = 0
BEGIN
RAISERROR('Nazwa kategorii nie mo¿e zawieraæ znaków specjalnych ani cyfr.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
GO

CREATE or ALTER TRIGGER Check_SubCategory_Name ON Podkategorie
AFTER INSERT
AS BEGIN
DECLARE @NameCheck INT;
DECLARE @InsertedName NVARCHAR(100);
SELECT @InsertedName = Nazwa
FROM inserted;
IF @InsertedName NOT LIKE '%[^a-zA-Z]%'
SET @NameCheck = 1;
ELSE
SET @NameCheck = 0;
IF @NameCheck = 0
BEGIN
RAISERROR('Nazwa podkategorii nie mo¿e zawieraæ znaków specjalnych ani cyfr.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
GO

CREATE or ALTER TRIGGER Check_Photo2_Path
ON Zdjecia
AFTER INSERT
AS
BEGIN
DECLARE @PathCheck INT;
DECLARE @InsertedPath NVARCHAR(255);
SELECT @InsertedPath = Sciezka
FROM inserted;
IF CHARINDEX(':', @InsertedPath) > 0 AND CHARINDEX('\', @InsertedPath) > 0
SET @PathCheck = 1;
ELSE
SET @PathCheck = 0;
IF @PathCheck = 0
BEGIN
RAISERROR('Niepoprawna œcie¿ka do pliku.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END; 
END;
GO


create or alter TRIGGER Check_Article_Title ON Artykuly
AFTER INSERT
AS
BEGIN
DECLARE @TitleCheck INT;
DECLARE @InsertedTitle NVARCHAR(255);
SELECT @InsertedTitle = Tytul
FROM inserted;
IF @InsertedTitle NOT LIKE '%[^a-zA-Z0-9¹æê³ñóœŸ¿¹æÊ£ÑóŒŸ¯ .,!?-]%'
SET @TitleCheck = 1;
ELSE
SET @TitleCheck = 0;
IF @TitleCheck = 0
BEGIN
RAISERROR('Tytu³ artyku³u nie mo¿e zawieraæ znaków specjalnych.', 16, 1);
ROLLBACK TRANSACTION;
RETURN;
END;
END;
go


CREATE or alter TRIGGER check_artykul_date
ON Artykuly
AFTER INSERT
AS
BEGIN
DECLARE @today DATE;
SET @today = CONVERT(DATE, GETDATE());
IF EXISTS (
SELECT 1
FROM inserted
WHERE CONVERT(DATE, COALESCE (Data_publikacji, GETDATE())) <> @today
)
BEGIN
PRINT 'B³¹d: Data wstawiona nie jest dzisiejsza.';
ROLLBACK TRANSACTION;
END;
END;