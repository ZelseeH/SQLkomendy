INSERT INTO Kategorie (Nazwa) VALUES ('Kultura');
INSERT INTO Kategorie (Nazwa) VALUES ('Sport');
INSERT INTO Kategorie (Nazwa) VALUES ('Edukacja');
INSERT INTO Kategorie (Nazwa) VALUES ('Technologia');
INSERT INTO Kategorie (Nazwa) VALUES ('Zdrowie');
INSERT INTO Kategorie (Nazwa) VALUES ('Podróże');
INSERT INTO Kategorie (Nazwa) VALUES ('Moda');
INSERT INTO Kategorie (Nazwa) VALUES ('Finanse');
INSERT INTO Kategorie (Nazwa) VALUES ('Kulinarne');
INSERT INTO Kategorie (Nazwa) VALUES ('Nauka');


-- Podkategorie
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Muzyka', 1);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Piłka nożna', 2);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Szkoła', 3);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Gadżety', 4);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Dieta', 5);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Hotele', 6);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Odzież', 7);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Inwestycje', 8);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Przepisy', 9);
INSERT INTO Podkategorie (Nazwa, Kategoria) VALUES ('Astronomia', 10);


-- Redaktorzy
INSERT INTO Redaktorzy (ID_Redaktora, Imie, Nazwisko, Email, Zdjecie) VALUES (1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', 'C:\\Zdjecia\\jan.jpg');
INSERT INTO Redaktorzy (ID_Redaktora, Imie, Nazwisko, Email, Zdjecie) VALUES (2, 'Anna', 'Nowak', 'anna.nowak@example.com', 'C:\\Zdjecia\\anna.jpg');
INSERT INTO Redaktorzy (ID_Redaktora, Imie, Nazwisko, Email, Zdjecie) VALUES (3, 'Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', 'C:\\Zdjecia\\piotr.jpg');
INSERT INTO Redaktorzy (ID_Redaktora, Imie, Nazwisko, Email, Zdjecie) VALUES (4, 'Marta', 'Wójcik', 'marta.wojcik@example.com', 'C:\\Zdjecia\\marta.jpg');
INSERT INTO Redaktorzy (ID_Redaktora, Imie, Nazwisko, Email, Zdjecie) VALUES (5, 'Krzysztof', 'Kaczmarek', 'krzysztof.kaczmarek@example.com', 'C:\\Zdjecia\\krzysztof.jpg');

-- Artykuly
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Koncert w parku', 'Opis koncertu w parku...', 'Gazeta Miejska', 1, 1);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Mecz piłki nożnej', 'Relacja z meczu...', 'Sportowy Dziennik', 2, 2);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Nowa szkoła', 'Informacje o nowej szkole...', 'Edukacyjny Portal', 3, 3);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Nowy gadżet', 'Opis nowego gadżetu...', 'Tech Blog', 4, 4);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Zdrowa dieta', 'Porady dietetyczne...', 'Zdrowie i Ty', 5, 5);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Najlepsze hotele w Europie', 'Opis najlepszych hoteli w Europie...', 'Travel Magazine', 6, 1);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Trendy w modzie 2024', 'Najnowsze trendy w modzie na 2024 rok...', 'Fashion Weekly', 7, 2);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Poradnik inwestora', 'Jak inwestować w 2024 roku...', 'Financial Times', 8, 3);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Nowe przepisy na lato', 'Przepisy na lekkie letnie dania...', 'Culinary Journal', 9, 4);
INSERT INTO Artykuly (Tytul, Tresc, Zrodlo, Podkategoria, Redaktor) VALUES ('Odkrycia w astronomii', 'Nowe odkrycia w dziedzinie astronomii...', 'Science Daily', 10, 5);


-- Zdjecia
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Koncert', 'C:\\Zdjecia\\koncert.jpg', 1);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Mecz', 'C:\\Zdjecia\\mecz.jpg', 2);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Szkoła', 'C:\\Zdjecia\\szkola.jpg', 3);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Gadżet', 'C:\\Zdjecia\\gadget.jpg', 4);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Dieta', 'C:\\Zdjecia\\dieta.jpg', 5);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Hotel w Paryżu', 'C:\\Zdjecia\\hotel_paryz.jpg', 6);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Moda 2024', 'C:\\Zdjecia\\moda_2024.jpg', 7);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Wykres inwestycji', 'C:\\Zdjecia\\inwestycje.jpg', 8);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Dania letnie', 'C:\\Zdjecia\\dania_letnie.jpg', 9);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Teleskop', 'C:\\Zdjecia\\teleskop.jpg', 10);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Widok z hotelu', 'C:\\Zdjecia\\widok_z_hotel.jpg', 6);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Stylizacja', 'C:\\Zdjecia\\stylizacja.jpg', 7);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Analiza rynku', 'C:\\Zdjecia\\analiza_rynku.jpg', 8);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Desery letnie', 'C:\\Zdjecia\\desery_letnie.jpg', 9);
INSERT INTO Zdjecia (Opis, Sciezka, Artykul) VALUES ('Kosmos', 'C:\\Zdjecia\\kosmos.jpg', 10);


-- Wyswietlenia
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.1', 1);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.2', 2);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.3', 3);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.4', 4);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.5', 5);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.1', 1);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.2', 2);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.3', 3);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.4', 4);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.5', 5);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.6', 1);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.7', 2);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.8', 3);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.9', 4);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.10', 5);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.11', 6);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.12', 7);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.13', 8);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.14', 9);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.15', 10);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.16', 6);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.17', 7);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.18', 8);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.19', 9);
INSERT INTO Wyswietlenia (IP, Artykul) VALUES ('192.168.0.20', 10);
