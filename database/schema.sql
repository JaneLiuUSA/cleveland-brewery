-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

CREATE TABLE roles (
    role_id serial,
    role_name varchar(30),
    CONSTRAINT pk_role_role_id PRIMARY KEY (role_id)
);

CREATE TABLE users (
    user_id serial,
    username varchar(30) NOT NULL,
    password varchar(100) NOT NULL,
    salt varchar(255),
    email varchar(50),
    role_id integer,
    is_active boolean NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_user_user_id PRIMARY KEY (user_id),
    CONSTRAINT fk_role_role_id FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE breweries (
    brewery_id serial,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    city varchar(50) NOT NULL,
    zipcode varchar(15) NOT NULL,
    phone_number varchar(15),
    description text NOT NULL,
    brewery_logo_url varchar(255),
    img_url varchar(255),
    website_url varchar(255),
    business_hours varchar(255),
    user_id bigint,
    CONSTRAINT pk_brewery_brewery_id PRIMARY KEY (brewery_id),
    CONSTRAINT fk_user_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE beers (
    beer_id serial,
    name varchar(255) NOT NULL,
    abv decimal,
    ibu integer,
    type varchar(255) NOT NULL,
    info text NOT NULL,
    img_url varchar(255),
    brewery_id integer,
    CONSTRAINT pk_beer_beer_id PRIMARY KEY (beer_id),
    CONSTRAINT fk_brewery_brewery_id FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id)
);

CREATE TABLE reviews (
    review_id serial,
    subject varchar(100) NOT NULL,
    description text NOT NULL,
    rating int NOT NULL,
    create_date timestamp NOT NULL DEFAULT NOW(),
    beer_id integer,
    user_id integer,
    CONSTRAINT pk_review_review_id PRIMARY KEY (review_id),
    CONSTRAINT fk_beer_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id),
    CONSTRAINT fk_user_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

COMMIT;