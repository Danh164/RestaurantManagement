package com.ou.controllers.client;

import com.ou.services.client.DishService;
import com.ou.services.client.LobbyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.Map;

@Controller
public class HomeController {
    @Autowired
    private LobbyService lobbyService;
    @Autowired
    private DishService dishService;
    
    @RequestMapping("/")
    @Transactional
    public String index(Model model,
//                        @RequestParam(value = "kw", required = false, defaultValue = "") String kw,
                        @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String kw =  params.getOrDefault("kw", "");
        model.addAttribute("lobbies", this.lobbyService.getLobbies(kw, page));
        model.addAttribute("numberPage", 
                this.lobbyService.getLobbiesByKw(kw).toArray().length);
        model.addAttribute("kw", kw);
        model.addAttribute("listDish", this.dishService.getListDish());
        return "index";
    }
}
