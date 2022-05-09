/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.services.client;

import com.ou.pojos.Bill;
import java.util.List;

/**
 *
 * @author Danh Nguyen
 */
public interface PaymentService {

    List<Object[]> getOrderInfo(String id);

    List<Object[]> getMenuOrder(String id);

    List<Object[]> getServiceOrder(String id);

    boolean createBill(Bill bill);
}
