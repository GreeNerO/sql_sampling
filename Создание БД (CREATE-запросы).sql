CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Artist_Genres (
    artist_id INT REFERENCES Artists(artist_id),
    genre_id INT REFERENCES Genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);

CREATE TABLE Album_Artists (
    album_id INT REFERENCES Albums(album_id),
    artist_id INT REFERENCES Artists(artist_id),
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT REFERENCES Albums(album_id)
);

CREATE TABLE Collections (
    collection_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);

CREATE TABLE Collection_Tracks (
    collection_id INT REFERENCES Collections(collection_id),
    track_id INT REFERENCES Tracks(track_id),
    PRIMARY KEY (collection_id, track_id)
);
