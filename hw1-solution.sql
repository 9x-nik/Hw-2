-- This is a solution for the hw1 assignment.

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;

-- Add more tables here

-- Create new tables, according to your domain model
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released INTEGER,
  rated TEXT,
  person_id INTEGER
);

CREATE TABLE people (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  person_id INTEGER,
  character_name TEXT
);

INSERT INTO people (name) VALUES ("Christopher Nolan"); -- 1

INSERT INTO movies (title, year_released, rated, person_id)
VALUES ("Batman Begins", 2005, "PG-13", 1);

INSERT INTO movies (title, year_released, rated, person_id)
VALUES ("The Dark Knight", 2008, "PG-13", 1);

INSERT INTO movies (title, year_released, rated, person_id)
VALUES ("The Dark Knight Rises", 2012, "PG-13", 1);

-- Batman Begins
INSERT INTO people (name) VALUES ("Christian Bale"); -- 2
INSERT INTO people (name) VALUES ("Michael Caine"); -- 3
INSERT INTO people (name) VALUES ("Liam Neeson");  -- 4
INSERT INTO people (name) VALUES ("Katie Holmes");  -- 5
INSERT INTO people (name) VALUES ("Gary Oldman");  -- 6

INSERT INTO roles (movie_id, person_id, character_name) VALUES (1, 2, "Bruce Wayne");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (1, 3, "Alfred");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (1, 4, "Ra's Al Ghul");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (1, 5, "Rachel Dawes");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (1, 6, "Commissioner Gordon");

-- The Dark Knight
INSERT INTO people (name) VALUES ("Heath Ledger"); -- 7
INSERT INTO people (name) VALUES ("Aaron Eckhart"); -- 8
INSERT INTO people (name) VALUES ("Maggie Gyllenhaal"); -- 9

INSERT INTO roles (movie_id, person_id, character_name) VALUES (2, 2, "Bruce Wayne");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (2, 7, "Joker");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (2, 8, "Harvey Dent");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (2, 3, "Alfred");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (2, 9, "Rachel Dawes");

-- The Dark Knight Rises
INSERT INTO people (name) VALUES ("Tom Hardy"); -- 10
INSERT INTO people (name) VALUES ("Joseph Gordon-Levitt"); -- 11
INSERT INTO people (name) VALUES ("Anne Hathaway"); -- 12

INSERT INTO roles (movie_id, person_id, character_name) VALUES (3, 2, "Bruce Wayne");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (3, 6, "Commissioner Gordon");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (3, 10, "Bane");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (3, 11, "John Blake");
INSERT INTO roles (movie_id, person_id, character_name) VALUES (3, 12, "Selina Kyle");

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT movies.title, movies.year_released, movies.rated, people.name 
FROM movies INNER JOIN people ON people.id = movies.person_id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
SELECT movies.title, people.name, roles.character_name 
FROM roles 
  INNER JOIN movies on movies.id = roles.movie_id 
  INNER JOIN people ON people.id = roles.person_id;
