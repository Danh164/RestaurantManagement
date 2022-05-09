/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.controllers.client;

import com.ou.services.client.OrderService;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Danh Nguyen
 */
@Controller
@Transactional
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/order")
    public String order(Model model, @RequestParam(required = false) Map<String, String> params) {
        int p = Integer.parseInt(params.getOrDefault("page", "1"));
        String kw = params.getOrDefault("kw", "");
        model.addAttribute("orders", this.orderService.getOrders(kw, p));
        model.addAttribute("numberPage",
                this.orderService.getAmountOrder().toArray().length);
        return "order";
    }

    @GetMapping("/order/delete")
    public String orderDelete(Model model, @RequestParam(value = "ordId") Integer ordId) {
        if (this.orderService.deleteOrder(this.orderService.getOrderById(ordId)) == true) {
            return "redirect:/order";
        }
        model.addAttribute("err", "đã có lỗi vui lòng thử lại");
        return "redirect:/order";
    }
}
