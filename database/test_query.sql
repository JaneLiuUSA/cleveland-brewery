SELECT * FROM beers JOIN (SELECT beer_id, AVG(rating) FROM reviews GROUP BY beer_id)AS rating ON rating.beer_id = beers.beer_id WHERE brewery_id = 1 GROUP BY beers.beer_id ORDER BY name;

SELECT beer_id, AVG(rating) FROM reviews GROUP BY beer_id;