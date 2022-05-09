/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.ou.pojos.Dish;
import com.ou.repository.client.DishRepository;
import com.ou.services.client.DishService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public class DishServiceImpl implements DishService{
    @Autowired
    private DishRepository dishRepository;
    
    @Override
    public List<Dish> getListDish() {
        return this.dishRepository.getListDish();
    }

    @Override
    public Dish getDishById(int id) {
        return this.dishRepository.getDishById(id);
    }
    
}
