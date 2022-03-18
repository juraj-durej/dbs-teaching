SELECT first_name,
    last_name
FROM customer
WHERE first_name LIKE 'Jen%';
--
-- aky je rozdiel medzi like a ilike
SELECT 'foo' LIKE 'foo',
    -- true
    'foo' LIKE 'f%',
    -- true
    'foo' LIKE '_o_',
    -- true
    'bar' LIKE 'b_';
-- false
--
SELECT first_name,
    last_name
FROM customer
WHERE first_name LIKE '%er%' -- taktiez moze byt len % na konci
ORDER BY first_name;
--
-- v tabulke je ulozena hodnota RyTmus
SELECT name LIKE '%ytmu%',
    -- true
    name ILIKE '%ytmu%',
    -- true;
    --      ~~	    LIKE
    --      ~~*	    ILIKE
    --      !~~	    NOT LIKE
    --      !~~*	NOT ILIKE
    --
    -- Nested queries / subqueries
select city.id
from city
where country_id in (
        select country.id -- musi sa tu pouzit country.country lebo by bol obsolete co znamena, ze existuje 2 krat country_id
        where country.country = 'Afghanistan'
            or country.country = 'India'
    )