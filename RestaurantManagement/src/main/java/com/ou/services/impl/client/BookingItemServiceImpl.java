/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.ou.pojos.Order;
import com.ou.pojos.OrderMenu;
import com.ou.pojos.OrderService;
import com.ou.repository.client.BookingItemRepository;
import com.ou.services.client.BookingItemService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Danh Nguyen
 */
@Service
public class BookingItemServiceImpl implements BookingItemService{
    @Autowired
    BookingItemRepository bookingItemRepository;
    
    @Override
    public boolean addMenu(OrderMenu orderMenu) {
       return this.bookingItemRepository.addMenu(orderMenu);
    }

    @Override
    public boolean addService(OrderService orderService) {
       return this.bookingItemRepository.addService(orderService);
    }

    @Override
    public List<OrderMenu> getOrderMenu(Integer ordId) {
        return this.bookingItemRepository.getOrderMenu(ordId);
    }

    @Override
    public List<OrderService> getOderServices(Integer ordId) {
        return this.bookingItemRepository.getOderServices(ordId);
    }

    @Override
    public boolean deleteOrderService(OrderService orderService) {
         return this.bookingItemRepository.deleteOrderService(orderService);
    }

    @Override
    public boolean deleteOrderMenu(OrderMenu orderMenu) {
        return this.bookingItemRepository.deleteOrderMenu(orderMenu);
    }

    @Override
    public boolean bookingIsCompleted(Order order) {
        return this.bookingItemRepository.bookingIsCompleted(order);
    }
    
}
