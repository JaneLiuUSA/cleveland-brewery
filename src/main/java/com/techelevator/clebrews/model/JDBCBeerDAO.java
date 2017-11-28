package com.techelevator.clebrews.model;

import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBeerDAO implements BeerDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBeerDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}	
		
	@Override
	public List<Beer> getAllBeer() {
		List<Beer> allBeers = new ArrayList<>();
		String sqlSelectAllBeers = "SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS avg_rating FROM reviews GROUP BY beer_id)AS rating " + 
					"ON rating.beer_id = beers.beer_id WHERE is_active = ? GROUP BY beers.beer_id, rating.beer_id, avg_rating ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBeers, true);
		
		while(results.next()) {
			allBeers.add(mapRowToBeer(results));
		}
		return allBeers;
	}

	@Override
	public Beer getBeerByName(String name) {
		Beer newBeer = new Beer();
		String sqlSelectBeerByName = "SELECT * FROM beers WHERE name = ? AND is_active = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectBeerByName, name, true);
		
		if(result.next()) {
			newBeer = mapRowToBeer(result);
		}
		return newBeer;
	}

	@Override
	public List<Beer> getBeerByBrewery(long breweryId) {
		List<Beer> breweryBeerList = new ArrayList<>();
		String sqlSelectBeerByBrewery = "SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS avg_rating FROM reviews GROUP BY beer_id)AS rating " + 
				"ON rating.beer_id = beers.beer_id WHERE brewery_id = ? AND is_active = ? GROUP BY beers.beer_id, rating.beer_id, avg_rating ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBeerByBrewery, breweryId, true);
//		String sqlSelectBeerByBrewery = "SELECT * FROM beers WHERE name = ? AND is_active = ? ORDER BY name";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBeerByBrewery, breweryName, true);
		
		while(results.next()) {
			breweryBeerList.add(mapRowToBeer(results));
		}
		return breweryBeerList;
	}

	@Override
	public List<Beer> getAllBeerByBrewery(Long breweryId) { // This is for a Brewery to update the status of its beers.
		List<Beer> breweryBeerList = new ArrayList<>();
		String sqlSelectBeerByBrewery = "SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS avg_rating FROM reviews GROUP BY beer_id)AS rating " + 
					"ON rating.beer_id = beers.beer_id WHERE brewery_id = ? GROUP BY beers.beer_id, rating.beer_id, avg_rating ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBeerByBrewery, breweryId);
		
		while(results.next()) {
			breweryBeerList.add(mapRowToBeer(results));
		}
		return breweryBeerList;
	}
	@Override
	public boolean searchForBeerByName(String name) {
		String sqlSearchForBeer = "SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS avg_rating FROM reviews GROUP BY beer_id)AS rating " + 
				"ON rating.beer_id = beers.beer_id WHERE UPPER(name) = ? GROUP BY beers.beer_id, rating.beer_id, avg_rating ORDER BY name";
									 
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForBeer, name.toUpperCase());
		if(results.next()) {
			return true;
		} else {
		return false;
		}
	}

	@Override
	public void saveBeer(Beer newBeer) {
		jdbcTemplate.update("INSERT INTO beers(name, abv, ibu, type, info, img_url, brewery_id, is_active) VALUES (?,?,?,?,?,?,?,?)",
				newBeer.getName(), newBeer.getAbv(), newBeer.getIbu(), newBeer.getType(), newBeer.getInfo(), newBeer.getImgUrl(), newBeer.getBreweryId(), newBeer.isActive());
	}
	
	private Beer mapRowToBeer(SqlRowSet row) {
		Beer newBeer = new Beer();
		
		newBeer.setId(row.getLong("beer_id"));
		newBeer.setName(row.getString("name"));
		newBeer.setAbv(row.getFloat("abv"));
		newBeer.setIbu(row.getInt("ibu"));
		newBeer.setType(row.getString("type"));
		newBeer.setInfo(row.getString("info"));
		newBeer.setImgUrl(row.getString("img_url"));
		newBeer.setBreweryId(row.getLong("brewery_id"));
		newBeer.setActive(row.getBoolean("is_active"));
		if (row.getBigDecimal("avg_rating") == null) {
			newBeer.setRating(row.getBigDecimal("avg_rating"));
		} else {
			newBeer.setRating(row.getBigDecimal("avg_rating").setScale(2));
		}

		return newBeer;
	}

	@Override
	public Beer getBeerById(Long id) {
		Beer beer = new Beer();
		String sqlGetgetBeerById = "SELECT * FROM beers LEFT JOIN (SELECT beer_id, AVG(rating)AS avg_rating FROM reviews GROUP BY beer_id)AS rating " + 
				"ON rating.beer_id = beers.beer_id WHERE beer_id =? AND is_active = ? GROUP BY beers.beer_id, rating.beer_id, avg_rating ORDER BY name";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetgetBeerById, id, true);
		while(result.next()) {
			beer = mapRowToBeer(result);
		}
		return beer;
	}

	@Override
	public void updateActiveBeerByBrewery(Long beerId, boolean isActive) {
		jdbcTemplate.update("UPDATE beers SET is_active = ? WHERE beer_id = ?", isActive, beerId);
		
	}

	@Override
	public void removeBeer(Long beerId) {
		jdbcTemplate.update("DELETE FROM beers WHERE beer_id = ?", beerId);
		
	}

}
