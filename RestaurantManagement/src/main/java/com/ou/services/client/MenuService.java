/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.services.client;

import com.ou.pojos.Menu;
import java.util.List;

public interface MenuService {
    List<Menu> getListMenu(int sort);
    List<Menu> getListMenuDish();
    Menu getMenuById(Integer id);
}
