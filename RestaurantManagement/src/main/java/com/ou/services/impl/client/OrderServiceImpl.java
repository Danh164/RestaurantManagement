/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.services.impl.client;

import com.ou.pojos.Order;
import com.ou.repository.client.OrderRepository;
import com.ou.services.client.OrderService;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Danh Nguyen
 */
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderRepository orderRepository;
    @Override
    public List<Object[]> getOrders(String kw, int page) {
        return this.orderRepository.getOrders(kw, page);
    }

    @Override
    public Order getOrderById(Integer id) {
       return this.orderRepository.getOrderById(id);
    }

    @Override
    public boolean updateOrderIsPayment(Order order) {
       return this.orderRepository.updateOrderIsPayment(order);
    }

    @Override
    public boolean checkBooking(LocalDate bookingDate, String lesson, int lobId) {
      return this.orderRepository.checkBooking(bookingDate, lesson, lobId);
    }

    @Override
    public boolean addOrder(Order order) {
        return this.orderRepository.addOrder(order);
    }

    @Override
    public Order getOrderByDate(LocalDate bookingDate, String lesson) {
        return this.orderRepository.getOrderByDate(bookingDate, lesson);
    }

    @Override
    public List<Order> getAmountOrder() {
        return this.orderRepository.getAmountOrder();
    }

    @Override
    public boolean deleteOrder(Order order) {
       return this.orderRepository.deleteOrder(order);
    }

    @Override
    public List<Order> getOrderByUserId(int userId) {
       return this.orderRepository.getOrderByUserId(userId);
    }
    
}
