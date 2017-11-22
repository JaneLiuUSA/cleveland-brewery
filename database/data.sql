-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO roles (role_name) VALUES ('Administrator');
INSERT INTO roles (role_name) VALUES ('Brewery');
INSERT INTO roles (role_name) VALUES ('User');

INSERT INTO users (username, password, salt, email, role_id, is_active) VALUES ('GreatLakes', 'JNsgQNfCCRx64tmiZ/HhLw==',
'PVdax8VEkIH+HFetpanMHibgaMAo/f1tHfWWjRwW5HfJcI0GVv13Uar9tEN33XAD/PHZ5xshZI6dLfqrmW8xsAmKIwptYOrdfsTG0OCYmnL6a0HpoScweR5i7f3RQZ2GubZg2MHvldKDEG8NZ5kqopuDNitsFHMTeRyP9O2Ts3o=', 'greatLakes@greatlakes.com', 2, true);

INSERT INTO users (username, password, salt, email, role_id, is_active) VALUES ('Admin', 'hZXjqaGhL0grm4MiB4hhAQ==',
'5b3wt/HW0UxbuIYY1gtRLA1jgytVdOntincQdB6OZRyfvPPDyrqLW0U4TbxY2KMAAj8G4jT14W8N5g8Z1W/KVLTLupoPlp0IFeb9ubo0AbfqDe60Z0FxQRo8+d88wlBNUo006L95PVlI4bLYjTtQK1njqQ5RIhySqEfoajBGjYU=', 'test_admin@TE.com', 1, true);

INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url, website_url, img_url, business_hours, user_id)
VALUES ('Great Lakes Brewery', '2516 Market Ave.', 'Cleveland', 44113, '(216) 771-4404', 'Cleveland`s premier brewery','http://res.cloudinary.com/teclebrew/image/upload/v1510954447/GLBC_logo-centered-710x412_tmjldt.png','https://www.greatlakesbrewing.com','http://res.cloudinary.com/teclebrew/image/upload/v1510956260/greatlakes_ps4e7h.jpg',
'Monday - Thursday: 10:00 AM - 10:00 PM Friday and Saturday: 10:00 AM - 11:00 PM Closed on Sundays', 1);
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url, img_url, business_hours)
VALUES ('Goldhorn Brewery', '1361 E 55th St.', 'Cleveland', 44103,'(216) 465-1352','Cool taproom offering seasonal, housemade beer in a vast space with a long bar & tables outside.','http://res.cloudinary.com/teclebrew/image/upload/v1510954471/goldhorn_izgvac.jpg','http://res.cloudinary.com/teclebrew/image/upload/v1510956260/goldhorn_yzoif0.jpg',
'Tuesday - Friday: 11:00 AM - 09:00 PM  Saturday: 12:00 PM - 10:00 PM Sunday: 12:00 PM - 06:00 PM Closed on Mondays');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url, img_url, business_hours)
VALUES ('Masthead Brewing Co.', '1261 Superior Ave.', 'Cleveland', 44144,'(216) 206-6176','Located in a historic building with 300 seats, a 100’ long bar, and an additional 50 seat dog friendly patio with a view of downtown Cleveland. Masthead includes a full bar and kitchen focusing on American and Belgian style beers, Neapolitan wood-fired pizza, and a barrel aged beer program',
'http://res.cloudinary.com/teclebrew/image/upload/v1511363501/brewery_images/oorzznvts0irqao76zqb.jpg','http://res.cloudinary.com/teclebrew/image/upload/v1511362923/brewery_images/qmgwn5ao3vy0uygmndic.jpg',
'Tuesday - Friday: 11:00 AM - 10:00 PM  Saturday: 11:00 PM - 01:00 AM Sunday: 11:00 PM - 05:00 PM Closed on Mondays');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url, img_url, business_hours)
VALUES ('Platform Beer Co.', '4125 Lorain Ave.', 'Cleveland', 44113,'(216) 202-1386','Opened in 2014, 100+ seat tasting room and patio offers 20+ house beers and food options. 10BBL brewhouse creates constantly changing selection of styles. Head R&D brewer Danny Monnot leads the way at our flagship location.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511302719/brewery_images/pnozkgiqhblcydhtllru.jpg','http://res.cloudinary.com/teclebrew/image/upload/v1511302705/brewery_images/pjemnqe07uerrx3rwzs2.jpg',
'Monday - Thursday: 03:00 PM - 12:00 AM Friday:03:00 AM - 02:00 AM Saturday: 10:00 PM - 02:00 AM Sunday: 10:00 PM - 10:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url, img_url, business_hours)
VALUES ('Butcher and the Brewer', '2043 E 4th St.', 'Cleveland', 44115,'(216) 331-0805','Opened in 2014, 100+ seat tasting room and patio offers 20+ house beers and food options. 10BBL brewhouse creates constantly changing selection of styles. Head R&D brewer Danny Monnot leads the way at our flagship location.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511302719/brewery_images/pnozkgiqhblcydhtllru.jpg','http://res.cloudinary.com/teclebrew/image/upload/v1511302705/brewery_images/pjemnqe07uerrx3rwzs2.jpg',
'Monday - Friday: 11:00 AM - 12:00 AM Saturday: 101:00 PM - 02:00 AM Sunday: 04:00 PM - 09:00 PM');

INSERT INTO beers (name, abv, ibu, type, info, brewery_id) VALUES ('Christmas Ale', 7.5, 30, 
'Ale with spices and honey', 'A Yuletide`s worth of holiday spices and sweet honey
to keep you a-wassailing all season long', 1);



COMMIT;