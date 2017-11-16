-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

CREATE TABLE role {
    role_id serial,
    role_name varchar(30),
    CONSTRAINT pk_role_role_id PRIMARY KEY (role_id)
};

CREATE TABLE user{
    user_id serial,
    username varchar(30) NOT NULL,
    password varchar(100) NOT NULL,
    salt varchar(255),
    role_id int,
    CONSTRAINT pk_user_user_id PRIMARY KEY (user_id),
    CONSTRAINT fk_role_role_id FOREIGN KEY (role_id)
};

CREATE TABLE breweries {
    brewery_id serial,
    name varchar(255) NOT NULL,
    location varchar(255) NOT NULL,
    description text NOT NULL,
    img_url varchar(255),
    website_url varchar(255),
    business_hours varchar(255),
    user_id NOT NULL
    CONSTRAINT pk_brewery_brewery_id PRIMARY KEY (brewery_id),
    CONSTRAINT fk_user_user_id FOREIGN KEY (user_id)
};

CREATE TABLE beer {
    beer_id serial,
    name varchar(255) NOT NULL,
    abv decimal,
    ibu int,
    type varchar(255) NOT NULL,
    info varchar(255) NOT NULL,
    img_url varchar(255),
    brewery_id int,
    CONSTRAINT pk_beer_beer_id PRIMARY KEY (beer_id),
    CONSTRAINT fk_brewery_brewery_id FOREIGN KEY (brewery_id)
};

CREATE TABLE reviews {
    review_id serial,
    subject varchar(100) NOT NULL,
    description text NOT NULL,
    rating int NOT NULL,
    create_date timestamp NOT NULL DEFAULT NOW(),
    beer_id int,
    user_id int,
    CONSTRAINT pk_review_review_id PRIMARY KEY (review_id),
    CONSTRAINT fk_beer_beer_id FOREIGN KEY (beer_id),
    CONSTRAINT fk_user_user_id FOREIGN KEY (user_id)
};

COMMIT;