select * from film;

create table film
(
    film_id          integer default nextval('film_film_id_seq'::regclass) not null -- sekvencia generovania ID
                     constraint film_pkey primary key,
    title            varchar(255) not null,
    description      text,
    release_year     year,
    language_id      smallint not null constraint film_language_id_fkey references language -- foreign key
                     on update cascade on delete restrict, -- co je cascade
    rental_duration  smallint      default 3 not null,
    rental_rate      numeric(4, 2) default 4.99 not null,
    length           smallint,
    replacement_cost numeric(5, 2) default 19.99 not null,
    rating           mpaa_rating   default 'G'::mpaa_rating,   -- ENUM
    last_update      timestamp     default now() not null,
    special_features text[],
    fulltext         tsvector not null  -- fulltext search
);