-- 316180
-- najprv ide 4 x enter a potom 0000
-- heslo do DB je 0000
-- \c movie_db - prepne vas na nasu databazu do ktorej ideme pisat dopyty
--
-- \c movie_db
DROP TABLE IF EXISTS links;
CREATE TABLE links (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR (255),
    last_update DATE
);
select *
from links;
--
INSERT INTO links (url, name, last_update)
VALUES(
        'https://www.cornhub.com',
        'More Corn',
        '2013-06-01'
    )
RETURNING id;
--
INSERT INTO links (url, name)
VALUES ('https://www.google.com', 'Google'),
    ('https://www.tiktok.com', 'CrapTok'),
    ('https://www.bing.com', 'Bing')
RETURNING *;
--
UPDATE links
SET description = 'Spending 10 hours per day here'
WHERE id = 3
RETURNING *;
-- durejjuraj@gmail.com
nazvy tabuliek piseme vzdy so snake casom a v mnoznom cisle uloha: Vytvorte tabulku presidents,
ktora bude mat atributy: id - unikatny autoinkrementovaci primarny kluc name - meno prezidenta birth_number - rodne cislo prezidenta (je nepovinny) has_children - ano / nie hodnota,
ktora urcuje ci ma prezident deti alebo nema age - vek prezidenta money_amount - suma penazi,
ktore ma prezident na ucte (je nepovinny) created_at - tento field urcuje kedy bol zaznam vytvoreny updated_at - tento field urcuje kedy bol zaznam naposledy updatnuty
DELETE FROM links
WHERE name = 'Bing';
--                                              061850
-- Kardinality a ERD diagram ( Entity relationship diagram)
-- diagram databazy, ktoru pouzivame
-- https://www.postgresqltutorial.com/postgresql-sample-database/
-- https://raw.githubusercontent.com/lgadzhev/MagBuy/master/Database%20Schema.png
-- aky vztah dame medzi tabulky:
auta - SPZ soferi - pokuty auta - paliva --
--