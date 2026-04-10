-- Создание базы данных
CREATE DATABASE music_shc;


-- Создание базы данных music_shc (версия v1.2)

-- Создаём таблицы 
CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE singer (
    singer_id SERIAL PRIMARY KEY,
    singer_name VARCHAR(255) NOT NULL
);

CREATE TABLE genre_list (
    genre_id INTEGER REFERENCES genre(genre_id) ON DELETE CASCADE,
    singer_id INTEGER REFERENCES singer(singer_id) ON DELETE CASCADE,
    PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE album (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    year INTEGER CHECK (year >= 1900 AND year <= EXTRACT(YEAR FROM CURRENT_DATE) + 5)
);

CREATE TABLE album_list (
    album_id INTEGER REFERENCES album(album_id) ON DELETE CASCADE,
    singer_id INTEGER REFERENCES singer(singer_id) ON DELETE CASCADE,
    PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE track (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    duration NUMERIC(4,1) CHECK (duration > 0),
    album_id INTEGER NOT NULL REFERENCES album(album_id) ON DELETE CASCADE
);

CREATE TABLE collection (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    year INTEGER CHECK (year >= 1900 AND year <= EXTRACT(YEAR FROM CURRENT_DATE) + 5)
);

CREATE TABLE track_collection (
    track_id INTEGER REFERENCES track(track_id) ON DELETE CASCADE,
    collection_id INTEGER REFERENCES collection(collection_id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, collection_id)
);
