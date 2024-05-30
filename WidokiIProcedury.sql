CREATE VIEW vw_WyswietlWszystkieArtykuly AS
SELECT 
    a.ID_Artykulu,
    a.Tytul,
    a.Tresc,
    a.Zrodlo,
    a.Data_publikacji,
    pk.Nazwa AS Podkategoria,
    k.Nazwa AS Kategoria,
    r.Imie + ' ' + r.Nazwisko AS RedaktorA
FROM 
    Artykuly a
JOIN 
    Podkategorie pk ON a.Podkategoria = pk.ID_Podkategorii
JOIN 
    Kategorie k ON pk.Kategoria = k.ID_Kategorii
JOIN 
    Redaktorzy r ON a.Redaktor = r.ID_Redaktora;
GO

CREATE PROCEDURE sp_PokazWyswietleniaDanegoArtykulu
    @ArtykulID INT
AS
BEGIN
    SELECT IP, Data
    FROM Wyswietlenia
    WHERE Artykul = @ArtykulID;
END
GO


CREATE VIEW vw_KategoriePodkategorieArtykulu AS
SELECT 
    a.ID_Artykulu,
    a.Tytul,
    pk.Nazwa AS Podkategoria,
    k.Nazwa AS Kategoria
FROM 
    Artykuly a
JOIN 
    Podkategorie pk ON a.Podkategoria = pk.ID_Podkategorii
JOIN 
    Kategorie k ON pk.Kategoria = k.ID_Kategorii;
GO

CREATE VIEW vw_WyswietleniaArtykulow AS
SELECT 
    a.ID_Artykulu,
    a.Tytul,
    COUNT(w.ID_Wyswietlenia) AS LiczbaWyswietlen
FROM 
    Artykuly a
LEFT JOIN 
    Wyswietlenia w ON a.ID_Artykulu = w.Artykul
GROUP BY 
    a.ID_Artykulu, a.Tytul
GO

CREATE PROCEDURE sp_AddRedaktor
    @Imie NVARCHAR(50),
    @Nazwisko NVARCHAR(50),
    @Email NVARCHAR(100),
    @Zdjecie NVARCHAR(100)
AS
BEGIN
    INSERT INTO Redaktorzy (Imie, Nazwisko, Email, Zdjecie)
    VALUES (@Imie, @Nazwisko, @Email, @Zdjecie);
END
GO

CREATE PROCEDURE sp_AddKategoria
    @Nazwa NVARCHAR(100)
AS
BEGIN
    INSERT INTO Kategorie (Nazwa)
    VALUES (@Nazwa);
END
GO
CREATE PROCEDURE sp_AddPodkategoria
    @Nazwa NVARCHAR(100),
    @KategoriaID INT
AS
BEGIN
    INSERT INTO Podkategorie (Nazwa, Kategoria)
    VALUES (@Nazwa, @KategoriaID);
END
GO
CREATE PROCEDURE sp_UpdateArtykulTresc
    @ArtykulID INT,
    @NowaTresc NVARCHAR(MAX)
AS
BEGIN
    UPDATE Artykuly
    SET Tresc = @NowaTresc
    WHERE ID_Artykulu = @ArtykulID;
END
GO

CREATE PROCEDURE sp_UpdateZdjecieOpis
@zdjecieID INT,
@NowyOpis NVARCHAR(200)
AS
BEGIN
UPDATE Zdjecia
SET Opis = @NowyOpis
WHERE ID_Zdjecia = @zdjecieID;
END
GO
CREATE VIEW vw_LiczbaArtykulowRedaktorow AS
SELECT 
    r.ID_Redaktora,
    r.Imie,
    r.Nazwisko,
    COUNT(a.ID_Artykulu) AS LiczbaArtykulow
FROM 
    Redaktorzy r
LEFT JOIN 
    Artykuly a ON r.ID_Redaktora = a.Redaktor
GROUP BY 
    r.ID_Redaktora, r.Imie, r.Nazwisko;
GO
CREATE VIEW vw_ArtykulyZeZdjeciem AS
SELECT 
    a.ID_Artykulu,
    a.Tytul,
    z.Sciezka AS SciezkaZdjecia,
    z.Opis AS OpisZdjecia
FROM 
    Artykuly a
LEFT JOIN 
    Zdjecia z ON a.ID_Artykulu = z.Artykul;
GO
CREATE PROCEDURE sp_DeleteArtykul
    @ArtykulID INT
AS
BEGIN
    -- Usuñ powi¹zane wyœwietlenia
    DELETE FROM Wyswietlenia WHERE Artykul = @ArtykulID;
    
    -- Usuñ powi¹zane zdjêcia
    DELETE FROM Zdjecia WHERE Artykul = @ArtykulID;
    
    -- Usuñ artyku³
    DELETE FROM Artykuly WHERE ID_Artykulu = @ArtykulID;
END
GO
CREATE PROCEDURE sp_UpdateRedaktorEmail
    @RedaktorID INT,
    @NowyEmail NVARCHAR(100)
AS
BEGIN
    UPDATE Redaktorzy
    SET Email = @NowyEmail
    WHERE ID_Redaktora = @RedaktorID;
END
GO

CREATE PROCEDURE sp_AddArtykul
    @Tytul NVARCHAR(200),
    @Tresc NVARCHAR(MAX),
    @Zrodlo NVARCHAR(100) = NULL,
    @PodkategoriaID INT,
    @RedaktorID INT
AS
BEGIN
    INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Data_publikacji, Podkategoria, Redaktor)
    VALUES (@Tytul, @Tresc, @Zrodlo, GETDATE(), @PodkategoriaID, @RedaktorID);
END
GO
