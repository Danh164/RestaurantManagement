/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.ou.pojos.Order;
import com.ou.pojos.User;
import com.ou.services.client.OrderService;
import com.ou.services.client.UserService;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Danh Nguyen
 */
@Controller
@Transactional
public class UserOrderController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    
    @RequestMapping("/user-order")
    public String userOder(Model model, @RequestParam(value = "username") String username){
        User user = this.userService.getUsers(username).get(0);
        List<Order> orders = this.orderService.getOrderByUserId(user.getId());
        model.addAttribute("orders", orders);
        return "user-order";
    }
    
    @GetMapping("/user-order/delete")
    public String orderDelete(Model model, @RequestParam(required = false) Map<String, String> params) {
        int ordId = Integer.parseInt(params.get("ordId"));
        String username = params.get("username");
        if (this.orderService.deleteOrder(this.orderService.getOrderById(ordId)) == true) {
            model.addAttribute("username", username);
            return "redirect:/user-order?username={username}";
        }
        model.addAttribute("err", "đã có lỗi vui lòng thử lại");
        return "redirect:/user-order";
    }
}
