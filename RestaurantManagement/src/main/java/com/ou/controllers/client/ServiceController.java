package com.ou.controllers.client;

import com.ou.services.client.DishService;
import com.ou.services.client.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.Map;

@Controller
public class ServiceController {
    @Autowired
    private ServiceService serviceService;
    
    @Autowired
    private DishService dishService;
    
    @RequestMapping("/service")
    @Transactional
    public String service(Model model,
                        @RequestParam(required = false) Map<String, String> params) {

        model.addAttribute("listService", this.serviceService.listService());
        model.addAttribute("listDish", this.dishService.getListDish());

        return "service";
    }
}
