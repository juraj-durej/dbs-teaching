SELECT
    first_name,
    last_name
FROM
    customer
WHERE
        first_name LIKE 'Jen%';

-- aky je rozdiel medzi like a ilike

SELECT
        'foo' LIKE 'foo', -- true
        'foo' LIKE 'f%', -- true
        'foo' LIKE '_o_', -- true
        'bar' LIKE 'b_'; -- false

SELECT
    first_name,
    last_name
FROM
    customer
WHERE
        first_name LIKE '%er%' -- taktiez moze byt len % na konci
ORDER BY
    first_name;


--      ~~	LIKE
--      ~~*	ILIKE
--      !~~	NOT LIKE
--      !~~*	NOT ILIKE


-- Nested queries / subqueries

select * from city
where country_id in (
    select country_id from country  -- musi sa tu pouzit country.country lebo by bol obsolete co znamena, ze existuje 2 krat country_id
    where country.country = 'Afghanistan' or country.country = 'India'
)