
-- Задание №1 (Наполнение базы данных)

-- 1. Жанры 

INSERT INTO genre (genre_name) VALUES
    ('Rock'),
    ('Pop'),
    ('Electronic'),
    ('Jazz'),
    ('Alternative'),
    ('Indie');  

-- 2. Исполнители 

INSERT INTO singer (singer_name) VALUES
    ('Imagine Dragons'),
    ('Taylor Swift'),
    ('Daft Punk'),
    ('Billie Eilish'),
    ('Coldplay');  -- 5 исполнителей

-- 3. Связь исполнителей с жанрами (genre_list)

-- Imagine Dragons: Rock + Alternative
INSERT INTO genre_list (genre_id, singer_id) VALUES
    (1, 1), (5, 1);

-- Taylor Swift: Pop + Alternative
INSERT INTO genre_list (genre_id, singer_id) VALUES
    (2, 2), (5, 2);

-- Daft Punk: Electronic + Pop
INSERT INTO genre_list (genre_id, singer_id) VALUES
    (3, 3), (2, 3);

-- Billie Eilish: Pop + Alternative
INSERT INTO genre_list (genre_id, singer_id) VALUES
    (2, 4), (5, 4);

-- Coldplay: Rock + Pop + Alternative
INSERT INTO genre_list (genre_id, singer_id) VALUES
    (1, 5), (2, 5), (5, 5);

-- 4. Альбомы 

INSERT INTO album (album_name, year) VALUES
    ('Evolve', 2017),                    -- Imagine Dragons
    ('Origins', 2018),                   -- Imagine Dragons
    ('Mercury – Act 1', 2021),           -- Imagine Dragons
    ('Reputation', 2017),                -- Taylor Swift
    ('Lover', 2019),                     -- Taylor Swift
    ('Folklore', 2020),                  -- Taylor Swift
    ('Evermore', 2020),                  -- Taylor Swift
    ('Random Access Memories', 2017),    -- Daft Punk
    ('When We All Fall Asleep...', 2019),-- Billie Eilish
    ('Happier Than Ever', 2021),         -- Billie Eilish
    ('Music of the Spheres', 2021);      -- Coldplay


-- 5. Совместный альбом (два исполнителя в разных жанрах)

INSERT INTO album (album_name, year) VALUES
    ('Perfect Symphony', 2022);

-- Связь совместного альбома с исполнителями
INSERT INTO album_list (album_id, singer_id) VALUES
    (12, 1),  -- Imagine Dragons
    (12, 2);  -- Taylor Swift


-- 6. Связь альбомов с исполнителями (album_list) для остальных альбомов

-- Imagine Dragons (singer_id = 1): альбомы 1, 2, 3
INSERT INTO album_list (album_id, singer_id) VALUES
    (1, 1), (2, 1), (3, 1);

-- Taylor Swift (singer_id = 2): альбомы 4, 5, 6, 7
INSERT INTO album_list (album_id, singer_id) VALUES
    (4, 2), (5, 2), (6, 2), (7, 2);

-- Daft Punk (singer_id = 3): альбом 8
INSERT INTO album_list (album_id, singer_id) VALUES
    (8, 3);

-- Billie Eilish (singer_id = 4): альбомы 9, 10
INSERT INTO album_list (album_id, singer_id) VALUES
    (9, 4), (10, 4);

-- Coldplay (singer_id = 5): альбом 11
INSERT INTO album_list (album_id, singer_id) VALUES
    (11, 5);

-- 7. Треки 

-- Альбом 1: Evolve (Imagine Dragons, 2017)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('I Don''t Know Why', 3.2, 1),
    ('Whatever It Takes', 3.5, 1),
    ('Believer', 3.4, 1),
    ('Walking the Wire', 3.8, 1),
    ('Rise Up', 3.9, 1);

-- Альбом 2: Origins (Imagine Dragons, 2018)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Natural', 3.1, 2),
    ('Boomerang', 3.2, 2),
    ('Machine', 3.3, 2),
    ('Cool Out', 3.6, 2),
    ('Bad Liar', 4.0, 2);

-- Альбом 3: Mercury – Act 1 (Imagine Dragons, 2021)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('My Life', 3.6, 3),     -- слово "my"
    ('Lonely', 2.6, 3),
    ('Wrecked', 3.8, 3),
    ('Follow You', 2.9, 3),
    ('Cutthroat', 2.8, 3);

-- Альбом 4: Reputation (Taylor Swift, 2017)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Ready for It', 3.4, 4),
    ('End Game', 4.2, 4),
    ('Delicate', 3.8, 4),
    ('Look What You Made Me Do', 3.5, 4),
    ('Getaway Car', 3.9, 4);

-- Альбом 5: Lover (Taylor Swift, 2019)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Lover', 3.7, 5),
    ('The Man', 3.2, 5),
    ('Cruel Summer', 2.9, 5),
    ('You Need to Calm Down', 2.8, 5),
    ('Daylight', 4.9, 5);

-- Альбом 6: Folklore (Taylor Swift, 2020)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Cardigan', 3.9, 6),
    ('Exile', 4.4, 6),
    ('August', 4.2, 6),
    ('My Tears Ricochet', 4.2, 6),   -- слово "my"
    ('Betty', 4.7, 6);

-- Альбом 7: Evermore (Taylor Swift, 2020)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Willow', 3.6, 7),
    ('Champagne Problems', 4.1, 7),
    ('No Body No Crime', 3.7, 7),
    ('Coney Island', 4.4, 7),
    ('Evermore', 5.0, 7);

-- Альбом 8: Random Access Memories (Daft Punk, 2017)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Give Life Back to Music', 4.4, 8),
    ('Get Lucky', 6.1, 8),
    ('Lose Yourself to Dance', 5.5, 8),
    ('Instant Crush', 5.6, 8),
    ('Doin'' It Right', 4.1, 8);

-- Альбом 9: When We All Fall Asleep... (Billie Eilish, 2019)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Bad Guy', 3.1, 9),
    ('Bury a Friend', 3.1, 9),
    ('When the Party''s Over', 3.3, 9),
    ('My Strange Addiction', 3.0, 9),   -- слово "my"
    ('Listen Before I Go', 4.1, 9);

-- Альбом 10: Happier Than Ever (Billie Eilish, 2021)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Happier Than Ever', 4.8, 10),
    ('Therefore I Am', 3.0, 10),
    ('Lost Cause', 3.3, 10),
    ('My Future', 3.4, 10),             -- слово "my"
    ('Oxytocin', 3.4, 10);

-- Альбом 11: Music of the Spheres (Coldplay, 2021)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Higher Power', 3.4, 11),
    ('My Universe', 3.5, 11),           -- слово "my"
    ('Let Somebody Go', 4.0, 11),
    ('Human Heart', 3.1, 11),
    ('Coloratura', 10.0, 11);

-- Альбом 12: Perfect Symphony (Taylor Swift + Imagine Dragons, 2022)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Perfect Night', 3.5, 12),
    ('Our Symphony', 4.0, 12),
    ('Dream Together', 3.8, 12),
    ('My Last Goodbye', 4.2, 12),       -- слово "my"
    ('Final Chorus', 3.9, 12);


-- 8. Сборники (включая сборник в период 2018-2020)

INSERT INTO collection (collection_name, year) VALUES
    ('Best of 2018', 2018),              -- Сборник в период 2018-2020
    ('Rock Hits 2017-2023', 2023),
    ('Pop Superstars', 2023),
    ('Electronic Dreams', 2022),
    ('Alternative Vibes', 2022),
    ('Best of Imagine Dragons', 2023);   -- 6 сборников

-- 9. Связь треков со сборниками

-- Сборник 1: Best of 2018 (треки из альбомов 2018 года)
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 1 FROM track 
WHERE album_id IN (2)  -- альбом "Origins" (2018 год)
LIMIT 10;

-- Сборник 2: Rock Hits 2017-2023
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 2 FROM track 
WHERE album_id IN (1, 2, 3, 8) 
AND track_name NOT LIKE '%My%' 
LIMIT 15;

-- Сборник 3: Pop Superstars
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 3 FROM track 
WHERE album_id IN (4, 5, 9, 10) 
AND track_name NOT LIKE '%Universe%'
LIMIT 15;

-- Сборник 4: Electronic Dreams
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 4 FROM track 
WHERE album_id = 8 
LIMIT 8;

-- Сборник 5: Alternative Vibes
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 5 FROM track 
WHERE album_id IN (3, 6, 7, 11) 
AND duration < 4.0
LIMIT 12;

-- Сборник 6: Best of Imagine Dragons
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 6 FROM track 
WHERE album_id IN (1, 2, 3) 
LIMIT 10;
