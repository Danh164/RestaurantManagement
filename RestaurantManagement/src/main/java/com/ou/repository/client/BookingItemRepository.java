/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.client;

import com.ou.pojos.Menu;
import com.ou.pojos.Order;
import com.ou.pojos.OrderMenu;
import com.ou.pojos.OrderService;
import java.util.List;

/**
 *
 * @author Danh Nguyen
 */
public interface BookingItemRepository {
    boolean addMenu(OrderMenu orderMenu);
    boolean addService(OrderService orderService);
    boolean deleteOrderService(OrderService orderService);
    boolean deleteOrderMenu(OrderMenu orderMenu);
    boolean bookingIsCompleted(Order order);
    List<OrderMenu> getOrderMenu(Integer ordId);
    List<OrderService> getOderServices(Integer ordId);
}
