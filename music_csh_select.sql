
-- Задание №2

-- 1. Название и продолжительность самого длительного трека

SELECT 
    track_name AS "Название трека",
    duration AS "Продолжительность (мин)"
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

-- 2. Название треков, продолжительность которых не менее 3,5 минут

SELECT 
    track_name AS "Название трека",
    duration AS "Продолжительность (мин)"
FROM track
WHERE duration >= 3.5
ORDER BY duration DESC;


-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно

SELECT 
    collection_name AS "Название сборника",
    year AS "Год выпуска"
FROM collection
WHERE year BETWEEN 2018 AND 2020
ORDER BY year;


-- 4. Исполнители, чьё имя состоит из одного слова

SELECT 
    singer_name AS "Исполнитель"
FROM singer
WHERE singer_name NOT LIKE '% %'  -- Не содержит пробела
ORDER BY singer_name;


-- 5. Название треков, которые содержат слово «мой» или «my»

SELECT 
    track_name AS "Название трека",
    duration AS "Продолжительность (мин)"
FROM track
WHERE track_name ILIKE '%my%'    -- ILIKE для регистронезависимого поиска
   OR track_name ILIKE '%мой%'
ORDER BY track_name;

-- Задание №3

-- 1. Количество исполнителей в каждом жанре

SELECT 
    g.genre_name AS "Жанр",
    COUNT(DISTINCT gl.singer_id) AS "Количество исполнителей"
FROM genre g
LEFT JOIN genre_list gl ON g.genre_id = gl.genre_id
GROUP BY g.genre_id, g.genre_name
ORDER BY COUNT(DISTINCT gl.singer_id) DESC, g.genre_name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов

SELECT 
    a.year AS "Год альбома",
    COUNT(t.track_id) AS "Количество треков"
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE a.year BETWEEN 2019 AND 2020
GROUP BY a.year
ORDER BY a.year;

-- 3. Средняя продолжительность треков по каждому альбому

SELECT 
    a.album_name AS "Альбом",
    a.year AS "Год",
    ROUND(AVG(t.duration), 2) AS "Средняя продолжительность (мин)"
FROM album a
LEFT JOIN track t ON a.album_id = t.album_id
GROUP BY a.album_id, a.album_name, a.year
ORDER BY AVG(t.duration) DESC NULLS LAST;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году

SELECT 
    s.singer_name AS "Исполнитель"
FROM singer s
WHERE NOT EXISTS (
    SELECT 1 
    FROM album_list al
    JOIN album a ON al.album_id = a.album_id
    WHERE al.singer_id = s.singer_id 
    AND a.year = 2020
)
ORDER BY s.singer_name;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель

--  Для исполнителя Taylor Swift
SELECT DISTINCT 
    c.collection_name AS "Название сборника",
    c.year AS "Год выпуска сборника"
FROM collection c
JOIN track_collection tc ON c.collection_id = tc.collection_id
JOIN track t ON tc.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN album_list al ON a.album_id = al.album_id
JOIN singer s ON al.singer_id = s.singer_id
WHERE s.singer_name = 'Taylor Swift'
ORDER BY c.year, c.collection_name;