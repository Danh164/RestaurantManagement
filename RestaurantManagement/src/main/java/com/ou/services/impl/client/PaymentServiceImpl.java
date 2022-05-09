/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.services.impl.client;

import com.ou.pojos.Bill;
import com.ou.repository.client.PaymentRepository;
import com.ou.services.client.PaymentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Danh Nguyen
 */
@Service
public class PaymentServiceImpl implements PaymentService{
    @Autowired
    PaymentRepository paymentRepository;
    
    @Override
    public List<Object[]> getOrderInfo(String id) {
         return this.paymentRepository.getOrderInfo(id);
    }

    @Override
    public List<Object[]> getMenuOrder(String id) {
        return this.paymentRepository.getMenuOrder(id);
    }

    @Override
    public List<Object[]> getServiceOrder(String id) {
       return this.paymentRepository.getServiceOrder(id);
    }

    @Override
    public boolean createBill(Bill bill) {
       return this.paymentRepository.createBill(bill);
    }
    
}
