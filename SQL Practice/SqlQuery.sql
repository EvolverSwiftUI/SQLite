/*
  DB Name - PracticeDB.db
  Quiries apply on above Database
*/

CREATE TABLE player(name TEXT, age INT, score INT);

PRAGMA  TABLE_INFO(player);

INSERT INTO player(name, age,score) VALUES("Rahul", 50, 200);

INSERT INTO player(name, age,score) VALUES("Jadwja", 35, 300);

SELECT * FROM player;

SELECT name, age, score FROM player;

SELECT name FROM player;

INSERT INTO player
(name, age,score)
VALUES
("Jadwja", 35, 300),
("Dhoni", 35, 300);

SELECT * FROM player WHERE name="Rahul";
SELECT * FROM player WHERE score=200;


UPDATE player SET score=0;
UPDATE player SET score=500 WHERE name="Ram"900;

DELETE FROM player WHERE score=0;
