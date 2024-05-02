-- INSERT [dbo].[Atores] ([Id], [PrimeiroNome], [UltimoNome], [Genero]) VALUES (1, N'James', N'Stewart', N'M')
-- INSERT [dbo].[Atores] ([Id], [PrimeiroNome], [UltimoNome], [Genero]) VALUES (2, N'Deborah', N'Kerr', N'F')
-- INSERT [dbo].[Atores] ([Id], [PrimeiroNome], [UltimoNome], [Genero]) VALUES (3, N'Peter', N'OToole', N'M')
-- INSERT [dbo].[Atores] ([Id], [PrimeiroNome], [UltimoNome], [Genero]) VALUES (4, N'Robert', N'DeNiro', N'M')
-- INSERT [dbo].[Atores] ([Id], [PrimeiroNome], [UltimoNome], [Genero]) VALUES (6, N'Harrison', N'Ford', N'M')
-- o id 5 nao foi contado, por isso, existe uma diferença de Id nas resoluções das minhas e do " gabarito ". 


-- 1 Buscar o nome e ano dos filmes

SELECT 
	Nome,
    Ano 
    FROM Filmes 
    WHERE Id <= 14;  
    
-- 2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT 
	Nome,
	Ano,
	Duracao
	FROM Filmes ORDER BY Ano; 


-- 3 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

SELECT 
	Nome,
	Ano,
    Duracao 
    FROM Filmes WHERE Nome = 'De volta para o futuro';

-- 4  Buscar os filmes lançados em 1997

SELECT 
	Nome,
    Ano,
    Duracao 
    FROM Filmes
    WHERE Ano = 1997;
    
-- 5 Buscar os filmes lançados APÓS o ano 2000

SELECT 
	Nome,
    Ano,
    Duracao
    FROM Filmes
    WHERE Ano > 2000;
    
-- 6 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
 
 SELECT 
	Nome,
    Ano,
    Duracao
    FROM Filmes
    WHERE Duracao BETWEEN 101 and 149 
    ORDER BY Duracao;
    
-- 7  Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao ( quantidade nao ? ) em ordem decrescente

SELECT 
	Ano,
    COUNT(*) 
    Quantidade
    FROM Filmes
    GROUP BY Ano
    ORDER BY Quantidade desc;
    
-- 8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT 
	* 
    FROM Atores
	WHERE Genero = 'M';

-- 9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
 
SELECT 
	* 
    FROM Atores
	WHERE Genero = 'F'
    ORDER BY PrimeiroNome;
    
-- 10 Buscar o nome do filme e o gênero 
 
SELECT
	Filmes.Nome,
    Generos.Genero 
    FROM Filmes
	INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
	INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id;

-- 11 Buscar o nome do filme e o gênero do tipo "Mistério"

SELECT 	
	Filmes.Nome,
    Generos.Genero 
    FROM Filmes
	INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
	INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
	WHERE Genero = 'misterio';

-- 12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT 
	Filmes.Nome,
    Atores.PrimeiroNome,
    Atores.UltimoNome, 
    ElencoFilme.Papel 
    FROM Filmes
	INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme
	INNER JOIN Atores ON Atores.Id = ElencoFilme.IdAtor; 



CREATE TABLE Atores(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    PrimeiroNome VARCHAR(20),
    UltimoNome VARCHAR(20),
    Genero CHAR(1)
);

CREATE TABLE ElencoFilme(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdAtor INT NOT NULL, 
    IdFilme INT,
    Papel VARCHAR(30),
    
	CONSTRAINT FK_ElencoFilmes_Atores FOREIGN KEY (IdAtor)
	REFERENCES Atores(Id),
	CONSTRAINT FK_ElencoFilmes_Filmes FOREIGN KEY (IdFilme)
    REFERENCES Filmes(Id)
);

CREATE TABLE Filmes(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Ano INT,
    Duracao INT
    
);

CREATE TABLE FilmesGenero(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdGenero INT,
    IdFilme INT,
    
    CONSTRAINT FK_FilmesGenero_Generos FOREIGN KEY(IdGenero)
    REFERENCES Generos(Id),
    CONSTRAINT FK_FilmesGenero_Filmes FOREIGN KEY(IdFilme)
    REFERENCES Filmes(Id)
);

CREATE TABLE Generos(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Genero VARCHAR(20)
);

select * from Atores;
INSERT INTO Atores (PrimeiroNome, UltimoNome, Genero) VALUES 
('James', 'Stewart', 'M'),
('Deborah', 'Kerr', 'F'),
('Peter', 'OToole', 'M'),
('Robert', 'DeNiro', 'M'),
('Harrison', 'Ford', 'M'),
('Stephen', 'Baldwin', 'M'),
('Jack', 'Nicholson', 'M'),
('Mark', 'Wahlberg', 'M'),
('Woody', 'Allen', 'M'),
('Claire', 'Danes', 'F'),
('Tim', 'Robbins', 'M'),
('Kevin', 'Spacey', 'M'),
('Kate', 'Winslet', 'F'),
('Robin', 'Williams', 'M'),
('Jon', 'Voight', 'M'),
('Ewan', 'McGregor', 'M'),
('Christian', 'Bale', 'M'),
('Maggie', 'Gyllenhaal', 'F'),
('Dev', 'Patel', 'M'),
('Sigourney', 'Weaver', 'F'),
('David', 'Aston', 'M'),
('Ali', 'Astin', 'F');

select * from ElencoFilme;
INSERT INTO ElencoFilme (IdAtor, IdFilme, Papel) VALUES 
(1, 1, 'John Scottie Ferguson'),
(2, 2, 'Miss Giddens'),
(3, 3, 'T.E. Lawrence'),
(4, 4, 'Michael'),
(6, 6, 'Rick Deckard'),
(7, 8, 'McManus'),
(9, 10, 'Eddie Adams'),
(10, 11, 'Alvy Singer'),
(11, 12, 'San'),
(13, 13, 'Andy Dufresne'),
(14, 14, 'Lester Burnham'),
(15, 15, 'Rose DeWitt Bukater'),
(16, 16, 'Sean Maguire'),
(17, 17, 'Ed'),
(18, 18, 'Renton'),
(19, 20, 'Elizabeth Darko'),
(20, 21, 'Older Jamal'),
(21, 22, 'Ripley'),
(13, 23, 'Bobby Darin'),
(8, 9, 'J.J. Gittes');

INSERT INTO Filmes (Nome, Ano, Duracao) VALUES 
('Um Corpo que Cai', 1958, 128),
('Os Inocentes', 1961, 100),
('Lawrence da Arábia', 1962, 216),
('O Franco Atirador', 1978, 183),
('Amadeus', 1984, 160),
('Blade Runner', 1982, 117),
('De Olhos Bem Fechados', 1999, 159),
('Os Suspeitos', 1995, 106),
('Chinatown', 1974, 130),
('Boogie Nights - Prazer Sem Limites', 1997, 155),
('Noivo Neurótico, Noiva Nervosa', 1977, 93),
('Princesa Mononoke', 1997, 134),
('Um Sonho de Liberdade', 1994, 142),
('Beleza Americana', 1999, 122),
('Titanic', 1997, 194),
('Gênio Indomável', 1997, 126),
('Amargo pesadelo', 1972, 109),
('Trainspotting - Sem Limites', 1996, 94),
('O Grande Truque', 2006, 130),
('Donnie Darko', 2001, 113),
('Quem Quer Ser um Milionário?', 2008, 120),
('Aliens, O Resgate', 1986, 137),
('Uma Vida sem Limites', 2004, 118),
('Avatar', 2009, 162),
('Coração Valente', 1995, 178),
('Os Sete Samurais', 1954, 207),
('A Viagem de Chihiro', 2001, 125),
('De Volta para o Futuro', 1985, 116);

INSERT INTO FilmesGenero (IdGenero, IdFilme) VALUES 
(1, 22),
(2, 17),
(2, 3),
(3, 12),
(5, 11),
(6, 8),
(6, 13),
(7, 26),
(7, 28),
(7, 18),
(7, 21),
(8, 2),
(9, 23),
(10, 7),
(10, 27),
(10, 1),
(11, 14),
(12, 6),
(13, 4);
INSERT INTO Generos (Genero) VALUES 
('Ação'),
('Aventura'),
('Animação'),
('Biografia'),
('Comédia'),
('Crime'),
('Drama'),
('Horror'),
('Musical'),
('Mistério'),
('Romance'),
('Suspense'),
('Guerra');