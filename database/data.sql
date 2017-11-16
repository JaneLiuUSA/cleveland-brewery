-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO roles (role_name) VALUES ('Administrator');
INSERT INTO roles (role_name) VALUES ('Brewery');
INSERT INTO roles (role_name) VALUES ('User');

INSERT INTO users (username, password, salt, role_id) VALUES ('GreatLakes', 'JNsgQNfCCRx64tmiZ/HhLw==',
'PVdax8VEkIH+HFetpanMHibgaMAo/f1tHfWWjRwW5HfJcI0GVv13Uar9tEN33XAD/PHZ5xshZI6dLfqrmW8xsAmKIwptYOrdfsTG0OCYmnL6a0HpoScweR5i7f3RQZ2GubZg2MHvldKDEG8NZ5kqopuDNitsFHMTeRyP9O2Ts3o=',2);

INSERT INTO breweries (name, location, description, website_url, business_hours, user_id)
VALUES ('Great Lakes Brewery', '2516 Market Ave. Cleveland Ohio 44113', 'Cleveland`s premier brewery', 'https://www.greatlakesbrewing.com',
'Monday - Thursday: 10:00 AM - 10:00 PM Friday and Saturday: 10:00 AM - 11:00 PM Closed on Sundays', 1);

INSERT INTO beers (name, abv, ibu, type, info, brewery_id) VALUES ('Christmas Ale', 7.5, 30, 
'Ale with spices and honey', 'A Yuletide`s worth of holiday spices and sweet honey
to keep you a-wassailing all season long', 1);



COMMIT;