DROP DATABASE IF EXISTS radio;
CREATE DATABASE radio;
USE radio;

CREATE TABLE authors(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  type ENUM ('band' , 'singer' , 'orchestra') ,
  name VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL
  );

CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(30) NOT NULL ,
  email VARCHAR(40) NOT NULL
);

CREATE TABLE charts(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE songs(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  genre ENUM('Rock' , 'Metal' , 'Estrada' , 'Hip-Hop' , 'Alternative' , 'Pop') ,
  year YEAR NOT NULL ,
  name VARCHAR(30) NOT NULL ,
  album VARCHAR(50) NOT NULL ,
  chart_id INT NOT NULL ,
  CONSTRAINT FOREIGN KEY (chart_id) REFERENCES charts(id) ,
  user_id INT NOT NULL ,
  CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE author_song(
  author_id INT NOT NULL ,
  song_id INT NOT NULL ,
  CONSTRAINT FOREIGN KEY (author_id) REFERENCES authors(id) ,
  CONSTRAINT FOREIGN KEY (song_id) REFERENCES songs(id) ,
  PRIMARY KEY (author_id, song_id)
);

INSERT INTO authors VALUES
  (NULL , 'band' , 'The Cure' , 'England'),
  (NULL , 'band' , 'Pulp' , 'England'),
  (NULL , 'band' , 'Stone Temple Pilots' , 'USA'),
  (NULL , 'band' , 'Alice In Chains' , 'USA'),
  (NULL , 'band' , 'Oasis' , 'England'),
  (NULL , 'band' , 'Blur' , 'England'),
  (NULL , 'singer' , 'Vasil Naidenov' , 'Bulgaria'),
  (NULL , 'singer' , 'Doni' , 'Bulgaria');
INSERT INTO users VALUES
  (NULL, 'Ognqn Iliev' , 'ogito@abv.bg'),
  (NULL, 'Traicho Traikov' , 'golemia@gmail.com'),
  (NULL, 'Pesho Peshov' , 'peshkata@mail.bg'),
  (NULL, 'Dimitur Dimitkov' , 'dimitrakis@outlook.com'),
  (NULL, 'Martin Stoychev' , 'stoion@yandex.ru');
INSERT INTO charts VALUES
  (NULL , 'Zlatnite bulgarski pesni'),
  (NULL , 'Rock zavinagi'),
  (NULL , 'Alternative hits');
INSERT INTO songs VALUES
  (NULL , 'Alternative', 1989 , 'Picture of You' , 'Disintegration' , 3, 1 ),
  (NULL , 'Alternative', 1999, 'Coffe and TV', '13', 3, 1),
  (NULL , 'Pop', 1995, 'Disco 2000', 'Different Class', 3, 2),
  (NULL , 'Pop', 1994, 'Babies', 'His n Hers', 3, 2),
  (NULL , 'Rock', 1992, 'Creep', 'Core', 2, 1 ),
  (NULL , 'Rock', 1991, 'Plush', 'Core', 2, 1),
  (NULL , 'Rock', 1994, 'Interstate Love Song', 'Purple', 2, 3),
  (NULL , 'Rock', 1994, 'Unglued', 'Purple', 2, 2),
  (NULL , 'Rock', 1990, 'Man In The Box', 'Facelift', 2, 3),
  (NULL , 'Rock', 1992, 'Down In A Hole', 'Dirt', 2, 4),
  (NULL , 'Rock', 1992, 'Would?', 'Dirt', 2, 4),
  (NULL , 'Rock', 1995, 'Dont Look Back In Anger', '(What''s The Story) Morning Glory?' , 2, 5),
  (NULL , 'Estrada' , 1976, 'Sineva', 'Single' , 1, 5 );
INSERT INTO author_song VALUES
  (1, 1),
  (6, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (3, 6),
  (3, 7),
  (3, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (5, 12),
  (7, 13);


#zadacha2
SELECT songs.name AS songName, songs.year, authors.name AS authorName
FROM songs
JOIN authors
ON songs.id IN (
    SELECT song_id FROM author_song
    WHERE author_song.author_id = authors.id
  )
ORDER BY songs.year AND authors.name;  # ko prai toq AND ne se znae, po-dobre da pisha "zapetaq"


#zadacha3
SELECT authors.name, COUNT(songs.album) as numberOfSongs
FROM songs
  JOIN authors
    ON songs.id IN (
    SELECT song_id FROM author_song
    WHERE author_song.author_id = authors.id
  )
GROUP BY authors.name;

#zadacha4
SELECT authors.name AS authorName, songs.name AS songName, songs.album
FROM songs
  INNER JOIN authors
    ON songs.id IN (
    SELECT song_id FROM author_song
    WHERE author_song.author_id = authors.id
  );

SELECT songs.name, songs.album, songs.year, songs.genre, users.name as userName
FROM songs
LEFT OUTER JOIN users
  ON songs.user_id = users.id;

#zadacha5
SELECT users.name, users.email, MIN(songs.year) AS oldestSong
FROM users
JOIN songs;


#zadacha6
DROP PROCEDURE IF EXISTS testProcedure;
DELIMITER $
CREATE PROCEDURE testProcedure()

  BEGIN

    DECLARE finished INT;
    DECLARE tempName VARCHAR(100);
    DECLARE tempYear INT;
    DECLARE broi INT;

    DECLARE testCursor CURSOR FOR
      SELECT songs.name, songs.year, count(songs.id)
        FROM songs
    WHERE songs.genre IS NOT NULL ;
   # GROUP BY songs.name;


    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    SET finished = 0;
    START TRANSACTION ;
    OPEN testCursor;                                  #OPEN
    cursor_loop: WHILE (finished = 0)
      DO
      FETCH testCursor INTO tempName, tempYear, broi;       #FETCH
      IF (finished = 1)
        THEN
        LEAVE cursor_loop;
      END IF;

      SET tempYear = tempYear + 1000*broi;
      SELECT tempName, broi, tempYear;

    END WHILE;
    CLOSE testCursor;
    SET finished = 0;
    SELECT 'Zavurshi!';

COMMIT ;
  END $
DELIMITER ;
CALL testProcedure();


