package com.techelevator.clebrews.model;

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
	public List<Beer> allBeer() {
		List<Beer> allBeers = new ArrayList<>();
		String sqlSelectAllBeers = "SELECT * FROM beers ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBeers);
		
		while(results.next()) {
			allBeers.add(mapRowToBeer(results));
		}
		return allBeers;
	}

	@Override
	public Beer getBeerByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Beer getBeerByBrewery(Long breweryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean searchForBeerByName(String name) {
		String sqlSearchForBeer = "SELECT * " +
									 "FROM beer " +
									 "WHERE UPPER(name) = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForBeer, name.toUpperCase());
		if(results.next()) {
			return true;
		} else {
		return false;
		}
	}

	@Override
	public void saveBeer(Beer newBeer) {
		jdbcTemplate.update("SELECT INTO beers(name, abv, ibu, type, info, img_url, brewery_id) VALUES (?,?,?,?,?,?,?)",
				newBeer.getName(), newBeer.getAbv(), newBeer.getIbu(), newBeer.getType(), newBeer.getInfo(), newBeer.getImgUrl(), newBeer.getBreweryId());
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

		return newBeer;
	}

}
