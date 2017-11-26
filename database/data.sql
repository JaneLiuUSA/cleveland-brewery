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
VALUES ('Great Lakes Brewery', '2516 Market Ave.', 'Cleveland', 44113, '(216) 771-4404',
'Iconic microbrewery with house suds, an updated American menu, free tours & a patio.',
'http://res.cloudinary.com/teclebrew/image/upload/v1510954447/GLBC_logo-centered-710x412_tmjldt.png',
'https://www.greatlakesbrewing.com',
'http://res.cloudinary.com/teclebrew/image/upload/v1510956260/greatlakes_ps4e7h.jpg',
'Monday - Thursday: 10:00 AM - 10:00 PM Friday and Saturday: 10:00 AM - 11:00 PM Closed on Sundays', 1);
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url, website_url, img_url, business_hours)
VALUES ('Goldhorn Brewery', '1361 E 55th St.', 'Cleveland', 44103,'(216) 465-1352',
'Cool taproom offering seasonal, housemade beer in a vast space with a long bar & tables outside.',
'https://www.facebook.com/goldhornbrewery/',
'http://res.cloudinary.com/teclebrew/image/upload/v1510954471/goldhorn_izgvac.jpg',
'http://res.cloudinary.com/teclebrew/image/upload/v1510956260/goldhorn_yzoif0.jpg',
'Tuesday - Friday: 11:00 AM - 09:00 PM  Saturday: 12:00 PM - 10:00 PM Sunday: 12:00 PM - 06:00 PM Closed on Mondays');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Masthead Brewing Co.', '1261 Superior Ave.', 'Cleveland', 44144,'(216) 206-6176',
'Located in a historic building with 300 seats, a 100’ long bar, and an additional 50 seat dog friendly patio with a view of downtown Cleveland. Masthead includes a full bar and kitchen focusing on American and Belgian style beers, Neapolitan wood-fired pizza, and a barrel aged beer program',
'http://res.cloudinary.com/teclebrew/image/upload/v1511363501/brewery_images/oorzznvts0irqao76zqb.jpg',
'http://mastheadbrewingco.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511362923/brewery_images/qmgwn5ao3vy0uygmndic.jpg',
'Tuesday - Friday: 11:00 AM - 10:00 PM  Saturday: 11:00 PM - 01:00 AM Sunday: 11:00 PM - 05:00 PM Closed on Mondays');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Platform Beer Co.', '4125 Lorain Ave.', 'Cleveland', 44113,'(216) 202-1386',
'Opened in 2014, 100+ seat tasting room and patio offers 20+ house beers and food options. 10BBL brewhouse creates constantly changing selection of styles. Head R&D brewer Danny Monnot leads the way at our flagship location.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511302719/brewery_images/pnozkgiqhblcydhtllru.jpg',
'https://platformbeer.co/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511302705/brewery_images/pjemnqe07uerrx3rwzs2.jpg',
'Monday - Thursday: 03:00 PM - 12:00 AM Friday: 03:00 AM - 02:00 AM Saturday: 10:00 PM - 02:00 AM Sunday: 10:00 PM - 10:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Butcher and the Brewer', '2043 E 4th St.', 'Cleveland', 44115,'(216) 331-0805',
'Industrial-chic brewpub serving a menu of carefully sourced American fare & housemade beers.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511637328/butcher_and_the_brewer_logo_j4jtnq.png',
'http://www.butcherandthebrewer.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511379590/butcherBrewerImg_zgx95x.jpg',
'Monday - Friday: 11:00 AM - 12:00 AM Saturday: 10:00 AM - 02:00 AM Sunday: 04:00 PM - 09:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Collision Bend Brewing Co.', '1250 Old River Rd.', 'Cleveland', 44113,'(216) 273-7879',
'Collision Bend Brewing Company is setting new standards in modern microbreweries. With an unrivaled fresh, natural menu and beers destine for national awards, the brewery is quickly becoming a Cleveland landmark on the Cuyahoga River.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511637606/collision-bend-logo-b_o1kkyj.png',
'http://www.collisionbendbrewery.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511637603/collision_bend_brewery_pstfuf.jpg',
'Monday - Thursday: 03:00 PM - 11:00 PM Friday: 03:00 PM - 12:00 AM Saturday: 01:00 PM - 11:00 PM Sunday: 01:00 PM - 08:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Hofbräuhaus Cleveland', '1550 Chester Ave.', 'Cleveland', 44144,'(216) 621-2337',
'German microbrewery with an on-site restaurant & beer garden offering traditional eats & live music.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511639007/hofbrauhaus_cle_i4ty5h.png',
'http://hofbrauhauscleveland.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511639013/Hofbrauhaus_Header2_i2zhz4.jpg',
'Monday - Thursday: 11:00 AM - 11:00 PM Friday - Saturday: 11:00 AM - 02:00 AM Sunday: 11:00 AM - 09:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Market Garden Brewery', '1947 W 25th St.', 'Cleveland', 44113,'(216) 621-4000',
'American gastropub with a patio, house beers, a distillery & a menu of creative sandwiches & tacos.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511640075/market_garden_logo_icjmot.png',
'https://www.marketgardenbrewery.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511640093/beer-market-garden-2_eshukv.jpg',
'Monday - Saturday: 11:00 AM - 02:30 AM Sunday: 10:00 AM - 02:30 AM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Brick And Barrel', '1844 Columbus Rd.', 'Cleveland', 44113,'(216) 331-3308',
'Taphouse offering house-brewed ales & wine in a cozy space with beer-centric decor.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511640626/BRICK_BARREL_LOGO_CLE_g6tbki.png',
'https://www.brickandbarrelbrewing.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511640631/brick_and_barrel_image_n6ic5b.jpg',
'Monday - Thursday: 04:00 PM - 10:00 PM Friday: 02:00 PM - 12:00 AM Saturday: 12:00 PM - 12:00 AM Sunday: 12:00 PM - 08:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Forest City Brewery', '2135 Columbus Rd.', 'Cleveland', 44113,'(216) 228-9116',
'Where old meets brew: Down a fresh cold one and a tasty bite in our vintage tasting room. Or mosey on out to our historic Biergarten and enjoy some CLE sunshine.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511641325/forest_city_logo_pfb4un.png',
'www.forestcitybrewery.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511641330/forest-city-new-sign_thqut9.jpg',
'Wednesday - Thursday: 04:00 PM - 12:00 AM Friday: 04:00 PM - 01:00 AM Saturday: 12:00 PM - 01:00 AM Sunday: 01:00 PM - 10:00 PM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Saucy Brew Works', '2885 Detroit Rd', 'Cleveland', 44113,'(216) 666-2568',
'Two-tiered brewery offering housemade European-style beer & customizable thin-crust pizzas.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511643351/saucy_brew_works_logo_cqq59i.png',
'https://www.saucybrewworks.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511643358/saucy_brew_pic_zpk9pc.jpg',
'Sunday - Wednesday: 11:00 AM - 10:00 PM Thursday -  Saturday: 11:00 AM - 12:00 AM');
INSERT INTO breweries (name, address, city, zipcode, phone_number, description, brewery_logo_url,website_url, img_url, business_hours)
VALUES ('Noble Beast Brewing Co.', '1470 Lakeside Ave E', 'Cleveland', 44114,'(216) 417-8588',
'Lively taproom for house-brewed beers & elevated bar snacks, sandwiches and salads.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511644461/noble_brewery_logo_f9yhmm.png',
'https://www.noblebeastbeer.com/',
'http://res.cloudinary.com/teclebrew/image/upload/v1511644471/noble_beast_pic_zkeocq.jpg',
'Tuesday - Thursday and Sunday: 11:00 AM - 11:00 PM Friday - Saturday: 11:00 AM - 01:00 AM Closed on Mondays');

INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES ('Christmas Ale', 7.5, 30, 
'Ale with spices and honey', 'A Yuletide`s worth of holiday spices and sweet honey
to keep you a-wassailing all season long','http://res.cloudinary.com/teclebrew/image/upload/v1511640275/christmas_ale_great_lakes_av32aw.png', 1);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('Eliot Ness', 6.1, 27, 'Amber Lager',
'Almost untouchably smooth--armed with lightly toasted malts and noble hops.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511645068/eliotness_beer_yx7iv4.png', 1);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('Burning river', 6.0, 35, 'Pale Ale',
'Crisp and bright, with refreshing flickers of citrus and pine that ignite the senses (not our local waterways).',
'http://res.cloudinary.com/teclebrew/image/upload/v1511645196/burningriver_beer_v1vzlz.png', 1);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Dead Mans Curve IPA', 8.0,'American IPA',
'A delicious and strong American IPA.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511645661/Dead_Man_s_Curve_zjb7tc.png', 2);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Agora Altbier', 5.3, 'Altbier',
'A delicious Altbier named after the iconic Cleveland landmark theater, the Agora.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511646093/agora_altbier_eedw4a.jpg', 2);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('Masthead IPA', 6.8, 70, 'IPA',
'This IPA is the culmination of hundreds of recipe iterations over the last six years. You’ll be met upfront with aromas of grapefruit and passionfruit, accompanied by a smooth mouthfeel, soft bitterness, and tropical fruit flavors.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511646520/Masthead_IPA_qjlinw.jpg', 3);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Single Origin Coffee Stout', 6.9, 'Coffee Stout',
'Our stout with a healthy dose of Six Shooter Coffee!',
'http://res.cloudinary.com/teclebrew/image/upload/v1511646683/masthead_single_origin_coffee_stout_pic_y1h07y.jpg', 3);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Sweet Heat', 7.7, 'Imperial Fruit',
'Brewed with fresh Mango puree and Habanero peppers.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511646810/masthead_sweet_heat_pic_wbnnif.jpg', 3);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('SPEED MERCHANT WHITE IPA', 6.6, 66, 'American White IPA',
'American ipa brewed with wheat, bursting with tropical fruit + citrus.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511647071/speed_merchant_white_ipa_pic_zec3wv.jpg', 4);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('NEW CLEVELAND PALESNER', 5.0, 23, 'Pilsner Pale Ale Hybrid',
'Crisp german malt body + refreshing noble hop finish.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511647242/platform-newcleveland_palesnear_pic_lmkgbh.png', 4);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Amarillo Fog', 8.1,'Imperial IPA',
'A small batch Double American Imperial IPA',
'http://res.cloudinary.com/teclebrew/image/upload/v1511655618/platform_amarillo_fog_beer_pic_eesxaz.jpg', 4);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('NITRO ALBINO STOUT', 5.4, 'White Stout',
'For all of you that drink with your eyes, full bodied white oat ale with chocolate and coffee overtones.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511647786/butcher_albino_stout_pic_ut7szr.jpg', 5);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('THE REPEATER', 5.3, 'GERMAN KÖLSCH',
'Cool, fermented with a prominent Noble hop nose. Light, crisp, and thirst-quenching.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511648029/butcher_repeater_pic_kpqhqg.jpg', 5);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('AFTER DARK', 7.5, 'Black IPA',
'Our Cleveland Beer Week collaboration beer with Noble Beast, Hofbrauhaus and Masthead.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511655513/butcher_after_dark_beer_pic_lf6kzv.jpg', 5);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('FLANDRIA FLATS', 7.6, 56, 'Belgian IPA',
'Cleveland Beer Week Collaboration Beer',
'http://res.cloudinary.com/teclebrew/image/upload/v1511648584/collision_FLANDRIA_FLATS_pic_gfqrb6.jpg', 6);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('LAKE ERIE SUNSET', 5.6, 15, 'American Wheat',
'Blood Orange American Wheat',
'http://res.cloudinary.com/teclebrew/image/upload/v1511648710/collision_blood_orange_american_wheat_pic_a0byzt.jpg', 6);
INSERT INTO beers (name, abv, ibu, type, info, img_url, brewery_id) VALUES 
('OLD RIVER KOLSCH', 5.5, 15, 'Light Ale',
'Light German-style Ale',
'http://res.cloudinary.com/teclebrew/image/upload/v1511648716/collision_pils_pic_krk7kh.jpg', 6);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Original Lager', 5.2, 'German Lager',
'A traditional full flavored German Lager with a crisp finish. The bier Hofbrauhaus has been famous for since 1589.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511649200/hofbrau_lager_puc_h8or43.jpg', 7);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Hefeweizen', 5.4, 'Hefeweizen',
'A specialty born in Munich – loved by the world. A fairly sweet old-style Wheat bier brewed to create a wonderful combination banana and clove flavor and aroma.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511649351/hofbrau_heffwiz_pic_uz7nlz.jpg', 7);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Dunkel', 5.5, 'Dunkel',
'For centuries Munich’s favorite bier. Dunkel translates to “Dark” lager. It is medium bodied, easy to drink, with simple roasted malt flavor and slight caramel undertones.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511649546/Hofbrauhaus_dunkel_pic_w5bxhw.jpg', 7);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('CITRAMAX IPA', 6.7, 'IPA',
'A West Coast style IPA dry-hopped with organic Citra hops to impart intense tropical and citrus fruit aromas. This brew has an aggressive, boldly-bright American hop character that will leave you craving another.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511650026/market_citramax_beer_pic_mh7psh.png', 8);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('PROSPERITY WHEAT', 6.0, 'Wheat',
'Formerly known as ***** Street Wheat! If you’ve ever spent time in a German Beer Garden, you know how much they love their wheat beer.  Our Bavarian style Hefeweizen is a satisfying blend of sweet wheat and pale malts, clove and banana aromatics, and the zesty tang of wheat beer yeast.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511650039/market_prosperity_ber_pic_efdril.png', 8);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('PROGRESS PILSNER', 5.5, 'Pilsner',
'Great American Beer Festival Award Winning Brew! Inspired by the Pilsners of the Rhine region, this lager is a tribute to the spicy, crisp and clean character of German noble hops and has just the right malt body to balance. Named aptly for the Cleveland slogan “Progress&Prosperity”.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511650338/market_progress_beer_pic_oe4yta.png', 8);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Bitter Chief IPA', 6.9, 'IPA',
'For our bitter Tribe fans, we almost got that series win. In the meantime, drink some local craft beer and enjoy. Light cooper color. Nice bitterness with refreshing citrus and grassy flavors and aromas. Malty finish balancing out the bitterness.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511650891/brick_bitter_cheilf_beer_pic_kd17rx.jpg', 9);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('Central Run Red', 8.9,95, 'Imperial Red IPA',
'The Central Run Imperial Red, IPA.  8.9 ABV with 95 IBU’s (1995 Division Win). A big malt and hop forward ruby-ale. Great hop aroma from the late additions and dry hopping of Citra and Simcoe. For the 2018 Central Run. Yes, next year.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511651111/brick_central_red_beer_pic_oet1rf.jpg', 9);
INSERT INTO beers (name, abv, type, info, img_url, brewery_id) VALUES 
('Cleveland Dark Ale', 6.0, 'Ale',
'Dark and roasty ale. Drinks light with caramel, dark chocolate, coffee and roasted malt flavors with a nice hop presence',
'http://res.cloudinary.com/teclebrew/image/upload/v1511651283/brick_dark_ale_beer_pic_vl8yuj.jpg', 9);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('FURBELLY IRISH STOUT', 4.5, 22, 'Stout',
'Brewed in the tradition of a true Irish Stout, this jet black beauty bounds with strong roasted malt bitterness and notes of dark chocolate. The low acid, highly aromatic English noble hops impart a medium hop intensity. Oats used in the mash create a nice, smooth creamy body and a thick tan head to round out this creation. A fantastic full bodied drinking experience. Fill up your belly with Furbelly!',
'http://res.cloudinary.com/teclebrew/image/upload/v1511652238/forst_city_irish_stout_beer_pic_lo3fxw.jpg', 10);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('OPENING DAY IPA', 7.1, 62, 'IPA',
'This flavorsome and balanced India Pale Ale is loaded with Mosaic and Citra hops offering a luscious amount of citrus and tropical fruit taste with an earthy, floral and fruity aroma.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511652358/forest_IPA_beer_pic_pzutgl.jpg', 10);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('ST. WENDELIN WHEAT', 5.8, 16, 'Wheat',
'Named after our neighbor – St. Wendelin Catholic Church, founded in 1903. This refreshing, perfectly balanced wheat beer combines German malts and hops with American wheat. ',
'http://res.cloudinary.com/teclebrew/image/upload/v1511652238/forst_city_irish_stout_beer_pic_lo3fxw.jpg', 10);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('Habituale', 5.3, 21, 'Kölsch',
'This crisp, clean Kölsch is a true German classic. It’s the perfect tribute to our fair-minded friend: sweet balanced with faint bitterness. Appeals to crossover mainstream drinkers and beer connoisseurs alike.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511653346/saucy_habituale_beer_pic_e4okwx.png', 11);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('B.F.Hefe', 5.5, 11, 'Wheat',
'This Bavarian classic offers that kind of balance. It’s not overly bitter or sweet. The original gangster of cloudy beers is thirst quenching and effervescent.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511653651/saucy_bfhefe_berr_pic_iqldv7.png', 11);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('Punchline', 5.7, 12, 'Wheat',
' Our fruit beer is a tribute to fruit punch. Tons of fruit flavors come together in a haymaker that hits you right in the red rubber nose.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511653767/saucy_punchline_beer_pic_wud65m.png', 11);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('Sweet Potato Saison', 7.8, 25, 'Saison',
'Our kitchen roasted 150 lbs. of sweet potatoes from Morningside Farm for this fall seasonal. Cinnamon, fresh ginger, and allspice complement the Belgian saison yeast and the sweet potatoes impart a glowing orange hue.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511654836/noble_sweet_potato_maete8.jpg', 12);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('S.A.F. Oatmeal Stout', 6.2, 30, 'Oatmeal Stout',
'This silky stout is brewed with copious amounts of flaked oats to create a rich and smooth character. Dark malts cap off this brew with a deep roasty finish perfect for the fall.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511655001/noble_oatmeal_stout_beer_pic_qdzqez.jpg', 12);
INSERT INTO beers (name, abv,ibu, type, info, img_url, brewery_id) VALUES 
('Evil Motives IPA', 7.0, 65, 'American IPA',
'West Coast style dry-hopped IPA, brewed to be drinkable with big additions of Citra and Simcoe hops introduced with experimental hopping techniques.',
'http://res.cloudinary.com/teclebrew/image/upload/v1511655255/noble_evil_ipa_beer_pic_lptyzw.jpg', 12);

COMMIT;