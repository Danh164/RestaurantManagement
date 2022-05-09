package com.ou.repository.client;


import com.ou.pojos.Menu;
import java.util.List;

public interface MenuRepository {
    List<Menu> getListMenu(int sort);
    List<Menu> getListMenuDish();
    Menu getMenuById(Integer id);
}
