/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.services.client;

import com.ou.pojos.Order;
import java.time.LocalDate;
import java.util.List;

public interface OrderService {

    List<Object[]> getOrders(String kw, int page);

    Order getOrderById(Integer id);

    List<Order> getAmountOrder();

    boolean updateOrderIsPayment(Order order);

    boolean checkBooking(LocalDate bookingDate, String lesson, int lobId);

    boolean addOrder(Order order);

    Order getOrderByDate(LocalDate bookingDate, String lesson);
    
    boolean deleteOrder(Order order);
    
    List<Order> getOrderByUserId(int userId);
}
