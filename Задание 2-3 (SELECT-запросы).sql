--Название и продолжительность самого длительного трека:
SELECT title, duration 
FROM tracks 
ORDER BY duration DESC 
LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут:
SELECT title 
FROM tracks 
WHERE (EXTRACT(MINUTE FROM duration) * 60 + EXTRACT(SECOND FROM duration)) >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно:
SELECT title 
FROM collections 
WHERE release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова:
SELECT name 
FROM artists 
WHERE name NOT LIKE '% %'; -- Имя без пробелов

--Название треков, которые содержат слово «мой» или «my»:
SELECT title 
FROM tracks 
WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';

--Количество исполнителей в каждом жанре:
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов:
SELECT COUNT(t.track_id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому:
SELECT a.title AS album_title, AVG(EXTRACT(MINUTE FROM t.duration) * 60 + EXTRACT(SECOND FROM t.duration)) AS avg_duration_seconds
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.title;

--Все исполнители, которые не выпустили альбомы в 2020 году:
SELECT ar.name AS artist_name
FROM artists ar
LEFT JOIN album_artists aa ON ar.artist_id = aa.artist_id
LEFT JOIN albums al ON aa.album_id = al.album_id AND al.release_year = 2020
WHERE al.album_id IS NULL;

--Названия сборников, в которых присутствует конкретный исполнитель (например, 'Queen'):
SELECT DISTINCT c.title AS collection_title
FROM collections c
JOIN collection_tracks ct ON c.collection_id = ct.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Queen';
