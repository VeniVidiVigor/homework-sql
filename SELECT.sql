-- Задание 2 
-- Название и продолжительность самого длительного трека 
SELECT track_name, duration
FROM track_list
ORDER BY duration DESC  
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name, duration 
FROM track_list
WHERE duration >= 210

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT compilation_name 
FROM compilations
WHERE releaseyear BETWEEN 2018 AND 2020

-- Исполнители, чьё имя состоит из одного слова
SELECT artist_name
FROM artists 
WHERE LENGTH(artist_name) - LENGTH(REPLACE(artist_name, ' ', '')) + 1 = 1;

-- Название треков, которые содержат слово «мой» или «my»
SELECT track_name
FROM track_list
WHERE 
    track_name ILIKE '% мой %'
    OR track_name ILIKE '% my %'
    OR track_name ILIKE 'мой %'
    OR track_name ILIKE 'my %'
    OR track_name ILIKE '% мой'
    OR track_name ILIKE '% my';

   
-- Задание 3
-- Количество исполнителей в каждом жанре
SELECT g.genre_name, COUNT(ag.ArtistID) AS artist_count 
FROM genres g
LEFT JOIN artists_genres ag ON g.genreid = ag.genreid
GROUP BY g.genreid 

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(*) AS total_tracks
FROM track_list tl
JOIN albums al ON tl.AlbumID = al.AlbumID
WHERE al.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.album_name, AVG(tl.duration) AS average_duration
FROM albums a
JOIN track_list tl ON a.AlbumID = tl.AlbumID
GROUP BY a.album_name, a.release_year;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT artist_name
FROM artists 
WHERE artistid NOT IN (
	SELECT aa.artistid
	FROM artist_albums aa
	JOIN albums al ON aa.AlbumID = al.albumid 
	WHERE al.release_year = 2020
);
	
-- Названия сборников, в которых присутствует конкретный исполнитель - GUF (без дубликатов)
SELECT DISTINCT c.Compilation_name
FROM compilations c
JOIN track_compilations tc ON c.CompilationID = tc.CompilationID
JOIN track_list tl ON tc.TrackID = tl.TrackID
JOIN artist_albums aa ON tl.AlbumID = aa.AlbumID
JOIN artists ar ON aa.ArtistID = ar.ArtistID
WHERE ar.artist_name = 'GUF';





