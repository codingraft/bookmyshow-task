CREATE TABLE Theatre (
    theatre_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    language VARCHAR(20) NOT NULL,
    format VARCHAR(10) NOT NULL
);

CREATE TABLE MovieShow (
    show_id INT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    show_date DATE,
    show_time TIME,
    screen_type VARCHAR(50),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id)
);


--  **Sample Data Entries**

-- Theatres
INSERT INTO Theatre VALUES (1, 'PVR: Nexus (Forum Mall)', 'Bangalore');

-- Movies
INSERT INTO Movie VALUES
(1, 'Dasara', 'Telugu', '2D'),
(2, 'Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', '2D'),
(3, 'Tu Jhoothi Main Makkaar', 'Hindi', '2D'),
(4, 'Avatar: The Way of Water', 'English', '3D');

-- Shows on 2023-04-25
INSERT INTO MovieShow VALUES
(1, 1, 1, '2023-04-25', '12:10:00', '4K Dolby 7.1'),
(2, 2, 1, '2023-04-25', '13:00:00', '4K ATMOS screen'),
(3, 2, 1, '2023-04-25', '16:10:00', '4K ATMOS screen'),
(4, 2, 1, '2023-04-25', '18:20:00', '4K Dolby 7.1'),
(5, 2, 1, '2023-04-25', '19:20:00', '4K ATMOS screen');



--  **Query: All Shows on a Given Date at a Given Theatre**

SELECT
    M.title AS movie_title,
    M.language,
    M.format,
    S.show_time,
    S.screen_type
FROM MovieShow S
JOIN Movie M ON S.movie_id = M.movie_id
JOIN Theatre T ON S.theatre_id = T.theatre_id
WHERE S.show_date = '2023-04-25'
  AND T.name = 'PVR: Nexus (Forum Mall)';

