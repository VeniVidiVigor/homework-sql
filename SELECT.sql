-- Задание 2 
-- Название и продолжительность самого длительного трека 
SELECT track_name, duration
FROM track_list
ORDER BY duration DESC  
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name, duration 
FROM track_list
WHERE duration > 210

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
WHERE track_name LIKE '%мой%' OR track_name LIKE '%my%';


-- Задание 3
-- Количество исполнителей в каждом жанре
SELECT genre_name, COUNT(*)
FROM genres
GROUP BY genre_name
ORDER BY COUNT(*) DESC 

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
SELECT ar.artist_name
FROM artists ar
LEFT JOIN artist_albums aa ON ar.ArtistID = aa.ArtistID
LEFT JOIN albums al ON aa.AlbumID = al.AlbumID AND al.release_year = 2020
WHERE al.AlbumID IS NULL;

-- Названия сборников, в которых присутствует конкретный исполнитель - GUF (без дубликатов)
SELECT DISTINCT c.Compilation_name
FROM compilations c
JOIN track_compilations tc ON c.CompilationID = tc.CompilationID
JOIN track_list tl ON tc.TrackID = tl.TrackID
JOIN artist_albums aa ON tl.AlbumID = aa.AlbumID
JOIN artists ar ON aa.ArtistID = ar.ArtistID
WHERE ar.artist_name = 'GUF';





