package com.java.favorite.dao;

public interface FavoriteDao {

	int favorCheck(String memberCode, String foodCode);

	int favorSwitch(String memberCode, String foodCode, String favorStatus);

}
