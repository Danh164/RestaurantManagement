/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.services.impl.client;

import com.ou.pojos.Coefficient;
import com.ou.pojos.Menu;
import com.ou.repository.client.MenuRepository;
import com.ou.services.client.MenuService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService{
    @Autowired
    private MenuRepository menuRepository;

    @Override
    public List<Menu> getListMenu(int sort) {
        return this.menuRepository.getListMenu(sort);
    }

    @Override
    public List<Menu> getListMenuDish() {
        return this.menuRepository.getListMenuDish();
    }

    @Override
    public Menu getMenuById(Integer id) {
        return this.menuRepository.getMenuById(id);
    }
}
