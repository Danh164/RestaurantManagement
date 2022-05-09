/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.repository.client;

import com.ou.pojos.Order;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Danh Nguyen
 */
public interface OrderRepository {
    List<Object[]> getOrders(String kw, int page);
    Order getOrderById(Integer id);
    Order getOrderByDate(LocalDate bookingDate, String lesson);
    List<Order> getAmountOrder();
    List<Order> getOrderByUserId(int userId);
    boolean updateOrderIsPayment(Order order);
    boolean checkBooking(LocalDate bookingDate, String lesson, int lobId);
    boolean addOrder(Order order);
    boolean deleteOrder(Order order);
}
