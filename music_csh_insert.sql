

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


-- 7. Треки (длительность в секундах)


-- Альбом 1: Evolve (Imagine Dragons, 2017)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('I Don''t Know Why', 192, 1),   -- 3 мин 12 сек
    ('Whatever It Takes', 210, 1),   -- 3 мин 30 сек
    ('Believer', 204, 1),            -- 3 мин 24 сек
    ('Walking the Wire', 228, 1),    -- 3 мин 48 сек
    ('Rise Up', 234, 1);             -- 3 мин 54 сек

-- Альбом 2: Origins (Imagine Dragons, 2018)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Natural', 186, 2),             -- 3 мин 06 сек
    ('Boomerang', 192, 2),           -- 3 мин 12 сек
    ('Machine', 198, 2),             -- 3 мин 18 сек
    ('Cool Out', 216, 2),            -- 3 мин 36 сек
    ('Bad Liar', 240, 2);            -- 4 мин 00 сек

-- Альбом 3: Mercury – Act 1 (Imagine Dragons, 2021)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('My Life', 216, 3),             -- 3 мин 36 сек (слово "my")
    ('Lonely', 156, 3),              -- 2 мин 36 сек
    ('Wrecked', 228, 3),             -- 3 мин 48 сек
    ('Follow You', 174, 3),          -- 2 мин 54 сек
    ('Cutthroat', 168, 3);           -- 2 мин 48 сек

-- Альбом 4: Reputation (Taylor Swift, 2017)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Ready for It', 204, 4),        -- 3 мин 24 сек
    ('End Game', 252, 4),            -- 4 мин 12 сек
    ('Delicate', 228, 4),            -- 3 мин 48 сек
    ('Look What You Made Me Do', 210, 4), -- 3 мин 30 сек
    ('Getaway Car', 234, 4);         -- 3 мин 54 сек

-- Альбом 5: Lover (Taylor Swift, 2019)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Lover', 222, 5),               -- 3 мин 42 сек
    ('The Man', 192, 5),             -- 3 мин 12 сек
    ('Cruel Summer', 174, 5),        -- 2 мин 54 сек
    ('You Need to Calm Down', 168, 5), -- 2 мин 48 сек
    ('Daylight', 294, 5);            -- 4 мин 54 сек

-- Альбом 6: Folklore (Taylor Swift, 2020)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Cardigan', 234, 6),            -- 3 мин 54 сек
    ('Exile', 264, 6),               -- 4 мин 24 сек
    ('August', 252, 6),              -- 4 мин 12 сек
    ('My Tears Ricochet', 252, 6),   -- 4 мин 12 сек (слово "my")
    ('Betty', 282, 6);               -- 4 мин 42 сек

-- Альбом 7: Evermore (Taylor Swift, 2020)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Willow', 216, 7),              -- 3 мин 36 сек
    ('Champagne Problems', 246, 7),  -- 4 мин 06 сек
    ('No Body No Crime', 222, 7),    -- 3 мин 42 сек
    ('Coney Island', 264, 7),        -- 4 мин 24 сек
    ('Evermore', 300, 7);            -- 5 мин 00 сек

-- Альбом 8: Random Access Memories (Daft Punk, 2017)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Give Life Back to Music', 264, 8),  -- 4 мин 24 сек
    ('Get Lucky', 366, 8),                -- 6 мин 06 сек
    ('Lose Yourself to Dance', 330, 8),   -- 5 мин 30 сек
    ('Instant Crush', 336, 8),            -- 5 мин 36 сек
    ('Doin'' It Right', 246, 8);          -- 4 мин 06 сек

-- Альбом 9: When We All Fall Asleep... (Billie Eilish, 2019)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Bad Guy', 186, 9),             -- 3 мин 06 сек
    ('Bury a Friend', 186, 9),       -- 3 мин 06 сек
    ('When the Party''s Over', 198, 9), -- 3 мин 18 сек
    ('My Strange Addiction', 180, 9),   -- 3 мин 00 сек (слово "my")
    ('Listen Before I Go', 246, 9);     -- 4 мин 06 сек

-- Альбом 10: Happier Than Ever (Billie Eilish, 2021)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Happier Than Ever', 288, 10),  -- 4 мин 48 сек
    ('Therefore I Am', 180, 10),     -- 3 мин 00 сек
    ('Lost Cause', 198, 10),         -- 3 мин 18 сек
    ('My Future', 204, 10),          -- 3 мин 24 сек (слово "my")
    ('Oxytocin', 204, 10);           -- 3 мин 24 сек

-- Альбом 11: Music of the Spheres (Coldplay, 2021)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Higher Power', 204, 11),       -- 3 мин 24 сек
    ('My Universe', 210, 11),        -- 3 мин 30 сек (слово "my")
    ('Let Somebody Go', 240, 11),    -- 4 мин 00 сек
    ('Human Heart', 186, 11),        -- 3 мин 06 сек
    ('Coloratura', 600, 11);         -- 10 мин 00 сек

-- Альбом 12: Perfect Symphony (Taylor Swift + Imagine Dragons, 2022)
INSERT INTO track (track_name, duration, album_id) VALUES
    ('Perfect Night', 210, 12),      -- 3 мин 30 сек
    ('Our Symphony', 240, 12),       -- 4 мин 00 сек
    ('Dream Together', 228, 12),     -- 3 мин 48 сек
    ('My Last Goodbye', 252, 12),    -- 4 мин 12 сек (слово "my")
    ('Final Chorus', 234, 12);       -- 3 мин 54 сек


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
AND duration < 240  -- 240 секунд = 4 минуты
LIMIT 12;

-- Сборник 6: Best of Imagine Dragons
INSERT INTO track_collection (track_id, collection_id)
SELECT track_id, 6 FROM track 
WHERE album_id IN (1, 2, 3) 
LIMIT 10;


