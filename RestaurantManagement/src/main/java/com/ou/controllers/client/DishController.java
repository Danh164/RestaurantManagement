/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.ou.services.client.DishService;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
public class DishController {
    @Autowired
    private DishService dishService;
    
    @RequestMapping("/dish")
    @Transactional
    public String index(Model model,
                        @RequestParam(required = false) Map<String, String> params) {
        int id = Integer.parseInt(params.getOrDefault("id", "0"));
        model.addAttribute("dish", this.dishService.getDishById(id));
        model.addAttribute("listDish", this.dishService.getListDish());
        return "dishDetail";
    }
}
