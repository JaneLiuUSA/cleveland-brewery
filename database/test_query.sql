SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS rating FROM reviews GROUP BY beer_id)AS rating ON rating.beer_id = beers.beer_id  GROUP BY beers.beer_id, rating.beer_id, rating.rating ORDER BY name;

SELECT beer_id, AVG(rating) FROM reviews GROUP BY beer_id;

SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS avg_rating FROM reviews GROUP BY beer_id)AS rating ON rating.beer_id = beers.beer_id WHERE is_active = true GROUP BY beers.beer_id, rating.beer_id, avg_rating ORDER BY name;