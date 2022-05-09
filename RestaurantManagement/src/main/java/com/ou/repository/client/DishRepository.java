package com.ou.repository.client;


import com.ou.pojos.Dish;
import java.util.List;

public interface DishRepository {
    List<Dish> getListDish();
    Dish getDishById(int id);
}
