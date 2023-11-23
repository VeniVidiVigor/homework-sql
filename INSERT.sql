SELECT * FROM artists 


INSERT INTO artists (artist_name)
VALUES
	('GUF'),
	('ANNA ASTI'),
	('Король и шут'); 
	

INSERT INTO genres (genre_name)
VALUES
	('Рэп'),
	('Поп'),
	('Рок');


INSERT INTO albums (album_name, release_year)
VALUES
	('Еще', 2015),
	('Царица', 2023),
	('Акустический альбом', 1998);
	

INSERT INTO track_list (track_name, duration, albumid)
VALUES
	('До ста', 192, 1),
	('Хочу еще', 234, 1),
	('Дурак', 193 , 2),
	('Верю в тебя', 250, 2),
	('Кукла колдуна', 203, 3),
	('Прыгну со скалы', 192, 3);
	

INSERT INTO compilations (compilation_name, releaseyear)
VALUES
	('Любимая музыка', 2023),
	('Смешанная музыка', 2020),
	('Новая музыка', 2023),
	('Ностальгия', 2018);


INSERT INTO artist_albums (artistid, albumid)
VALUES
	(1, 1),
	(2, 2),
	(3, 3);
	

INSERT INTO artists_genres  (artistid, genreid)
VALUES
	(1, 1),
	(2, 2),
	(3, 3);
	

INSERT INTO track_compilations  (trackid, compilationid)
VALUES
	(1, 1),
	(1, 2),
	(1, 4),
	(2, 1),
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 4);