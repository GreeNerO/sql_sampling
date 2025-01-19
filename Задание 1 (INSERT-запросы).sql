-- Вставляем жанры
INSERT INTO genres (genre_id, name) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz');

-- Вставляем исполнителей
INSERT INTO artists (artist_id, name) VALUES
(1, 'The Beatles'),
(2, 'Taylor Swift'),
(3, 'Miles Davis'),
(4, 'Queen');

-- Связываем исполнителей с жанрами
INSERT INTO artist_genres (artist_id, genre_id) VALUES
(1, 1), -- The Beatles -> Rock
(2, 2), -- Taylor Swift -> Pop
(3, 3), -- Miles Davis -> Jazz
(4, 1); -- Queen -> Rock

-- Вставляем альбомы
INSERT INTO albums (album_id, title, release_year) VALUES
(1, 'Abbey Road', 1969),
(2, '1989', 2014),
(3, 'Kind of Blue', 1959),
(4, 'A Night at the Opera', 1975);

-- Связываем исполнителей с альбомами
INSERT INTO album_artists (album_id, artist_id) VALUES
(1, 1), -- Abbey Road -> The Beatles
(2, 2), -- 1989 -> Taylor Swift
(3, 3), -- Kind of Blue -> Miles Davis
(4, 4); -- A Night at the Opera -> Queen

-- Вставляем треки
INSERT INTO tracks (track_id, title, album_id, duration) VALUES
(1, 'Come Together', 1, '04:20'),
(2, 'Here Comes the Sun', 1, '03:05'),
(3, 'Shake It Off', 2, '03:39'),
(4, 'Blank Space', 2, '03:51'),
(5, 'So What', 3, '09:04'),
(6, 'Freddie Freeloader', 3, '09:46'),
(7, 'Bohemian Rhapsody', 4, '05:55'),
(8, 'Love of My Life', 4, '03:38');

-- Вставляем сборники
INSERT INTO collections (collection_id, title, release_year) VALUES
(1, 'Greatest Hits Rock', 2020),
(2, 'Pop Essentials', 2021),
(3, 'Jazz Classics', 2019),
(4, 'Timeless Tracks', 2022);

-- Связываем треки со сборниками
INSERT INTO collection_tracks (collection_id, track_id) VALUES
(1, 1), -- Come Together -> Greatest Hits Rock
(1, 7), -- Bohemian Rhapsody -> Greatest Hits Rock
(2, 3), -- Shake It Off -> Pop Essentials
(2, 4), -- Blank Space -> Pop Essentials
(3, 5), -- So What -> Jazz Classics
(3, 6), -- Freddie Freeloader -> Jazz Classics
(4, 2), -- Here Comes the Sun -> Timeless Tracks
(4, 8); -- Love of My Life -> Timeless Tracks
