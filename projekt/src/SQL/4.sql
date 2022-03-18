--

DROP TABLE IF EXISTS links;

CREATE TABLE links (
   id SERIAL PRIMARY KEY,
   url VARCHAR(255) NOT NULL,
   name VARCHAR(255) NOT NULL,
   description VARCHAR (255),
   last_update DATE
);

--

INSERT INTO links (url, name, last_update)
VALUES('https://www.cornhub.com','More Corn','2013-06-01')
RETURNING id;


--

INSERT INTO
    links (url, name)
VALUES
    ('https://www.google.com','Google'),
    ('https://www.tiktok.com','CrapTok'),
    ('https://www.bing.com','Bing')
RETURNING *;


--


UPDATE links
SET description = 'Spending 10 hours per day here'
WHERE id = 3
RETURNING *;


--


DELETE FROM links
WHERE name = 'Bing';



-- Kardinality a ERD diagram ( Entity relationship diagram)

-- diagram databazy, ktoru pouzivame
-- https://www.postgresqltutorial.com/postgresql-sample-database/

-- https://raw.githubusercontent.com/lgadzhev/MagBuy/master/Database%20Schema.png



-- aky vztah dame medzi tabulky:

-- auta - SPZ
-- soferi - pokuty
-- auta - paliva
--
--