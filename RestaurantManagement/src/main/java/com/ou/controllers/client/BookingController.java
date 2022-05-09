/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.controllers.client;

import com.ou.pojos.Order;
import com.ou.pojos.OrderMenu;
import com.ou.services.admin.LobbyManagementService;
import com.ou.services.client.BookingItemService;
import com.ou.services.client.CoefficientService;
import com.ou.services.client.LobbyService;
import com.ou.services.client.MenuService;
import com.ou.services.client.OrderService;
import com.ou.services.client.ServiceService;
import com.ou.services.client.UserService;
import java.time.LocalDate;
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
public class BookingController {

    @Autowired
    private LobbyManagementService lobbyManagementService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private ServiceService serviceService;
    @Autowired
    private CoefficientService coefficientService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private LobbyService lobbyService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookingItemService bookingItemService;

    @GetMapping("/booking")
    public String booking(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("lobby", this.lobbyManagementService.getLobbies());
        model.addAttribute("lobbies", this.lobbyService.getLobbies("", page));
        model.addAttribute("numberPage", 
                this.lobbyService.getLobbiesByKw("").toArray().length);
        int lobId = 0;
        String username = params.getOrDefault("username", "999999");
        LocalDate bookingDate = LocalDate.now().plusDays(1);
        String lesson = "";
        if (params.get("lobId") != null) {
            lobId = Integer.parseInt(params.get("lobId"));
        }
        if (params.get("lesson") != null) {
            lesson = params.get("lesson");
        }
        if (params.get("bookingDate") != null && params.get("bookingDate") != "") {
            bookingDate = LocalDate.parse(params.get("bookingDate"));
            if (bookingDate.isAfter(LocalDate.now().plusDays(1)) == false) {
                String errMsg = "Vui lòng chọn từ ngày: " + LocalDate.now().plusDays(1);
                model.addAttribute("errMsg", errMsg);
                return "booking";
            }
        }
        if (lesson != "" && lobId != 0) {
            if (this.orderService.checkBooking(bookingDate, lesson, lobId) == true) {
                Order order = new Order();
                order.setLob(this.lobbyService.getLobbyById(lobId));
                order.setOrdBookingDate(bookingDate);
                order.setOrdBookingLesson(lesson);
                order.setOrdCreatedDate(LocalDate.now());
                order.setOrdIsPayment(false);
                order.setUser(this.userService.getUsers(username).get(0));
                String typeDate = "";
                String dow = bookingDate.getDayOfWeek().name();
                if (dow == "SATURDAY" || dow == "SUNDAY") {
                    typeDate = "cuoi tuan";
                } else {
                    typeDate = "ngay thuong";
                }
                order.setCoef(this.coefficientService.getCoefficient(lesson, typeDate));
                this.orderService.addOrder(order);
                Order order2 = this.orderService.getOrderByDate(bookingDate, lesson);
                model.addAttribute("ordId", order2.getId());
                return "redirect:/booking-item";
            }
            model.addAttribute("errMsg", "Rất tiếc sảnh này đã có người đặt!!!");
        }
        return "booking";
    }

    @GetMapping("/booking-item")
    public String bookingItem(Model model, @RequestParam(value = "ordId") Integer ordId) {
        model.addAttribute("menu", this.menuService.getListMenu(1));
        model.addAttribute("order", this.orderService.getOrderById(ordId));
        model.addAttribute("services", this.serviceService.getListServices());
        model.addAttribute("orderMenu", this.bookingItemService.getOrderMenu(ordId));
        model.addAttribute("orderService", this.bookingItemService.getOderServices(ordId));
        return "booking-item";
    }

    @GetMapping("/booking-menu")
    public String bookingMenu(Model model, @RequestParam(value = "menuId") Integer menuId,
            @RequestParam(value = "amount") Integer amount,
            @RequestParam(value = "ordId") Integer ordId) {
        OrderMenu orderMenu = new OrderMenu();
        orderMenu.setAmountTable(amount);
        orderMenu.setMenu(this.menuService.getMenuById(menuId));
        orderMenu.setOrd(this.orderService.getOrderById(ordId));
        this.bookingItemService.addMenu(orderMenu);
        model.addAttribute("ordId", ordId);
        return "redirect:/booking-item";
    }

    @GetMapping("/booking-menu-delete")
    public String bookingMenuDelete(Model model, @RequestParam(value = "menuId") Integer menuId,
            @RequestParam(value = "ordId") Integer ordId) {
        OrderMenu om = new OrderMenu();
        om.setOrd(this.orderService.getOrderById(ordId));
        om.setMenu(this.menuService.getMenuById(menuId));
        this.bookingItemService.deleteOrderMenu(om);
        model.addAttribute("ordId", ordId);
        return "redirect:/booking-item";
    }

    @GetMapping("/booking-service")
    public String bookingService(Model model, @RequestParam(value = "serId") Integer serId,
            @RequestParam(value = "ordId") Integer ordId) {
        com.ou.pojos.OrderService os = new com.ou.pojos.OrderService();
        os.setOrd(this.orderService.getOrderById(ordId));
        os.setSer(this.serviceService.getServiceById(serId));
        this.bookingItemService.addService(os);
        model.addAttribute("ordId", ordId);
        return "redirect:/booking-item";
    }

    @GetMapping("/booking-service-delete")
    public String bookingServiceDelete(Model model, @RequestParam(value = "serId") Integer serId,
            @RequestParam(value = "ordId") Integer ordId) {
        com.ou.pojos.OrderService os = new com.ou.pojos.OrderService();
        os.setOrd(this.orderService.getOrderById(ordId));
        os.setSer(this.serviceService.getServiceById(serId));
        this.bookingItemService.deleteOrderService(os);
        model.addAttribute("ordId", ordId);
        return "redirect:/booking-item";
    }

    @GetMapping("/booking-complete")
    public String bookingComplete(Model model, @RequestParam(value = "ordId") Integer ordId) {
        Order order = this.orderService.getOrderById(ordId);
        if (this.bookingItemService.bookingIsCompleted(order) == true) {
            model.addAttribute("id", ordId);
            return "redirect:/payment";
        }
        model.addAttribute("ordId", ordId);
        model.addAttribute("error", "ERROR");
        return "redirect:/booking-item";
    }
}
