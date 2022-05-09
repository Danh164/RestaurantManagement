package com.ou.controllers.client;

import com.ou.services.client.MenuService;
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
public class MenuController {
    @Autowired
    private MenuService menuService;
    
    @RequestMapping("/menu")
    @Transactional
    public String Menu(Model model, 
            @RequestParam(required = false) Map<String, String> params){
        int sort = Integer.parseInt(params.getOrDefault("sort", "0"));
        model.addAttribute("listMenu", this.menuService.getListMenu(sort));
        model.addAttribute("listDish", this.menuService.getListMenuDish());
        return "menu";
    }
    
}
