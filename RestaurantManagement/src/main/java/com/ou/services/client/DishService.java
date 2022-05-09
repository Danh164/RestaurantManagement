package com.ou.services.client;

import com.ou.pojos.Dish;

import java.util.List;

public interface DishService {

    List<Dish> getListDish();
    Dish getDishById(int id);
}
