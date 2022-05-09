/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.ou.pojos.Service;
import com.ou.repository.client.ServiceRepository;
import com.ou.services.client.ServiceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Admin
 */
@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService{
    @Autowired
    private ServiceRepository serviceRepository;
            
    @Override
    public List<Service> listService() {
        return this.serviceRepository.getListService();
    }
    
    @Override
    public Service getServiceById(int id) {
        return this.serviceRepository.getServiceById(id);
    }

    @Override
    public List<Service> getListServices() {
       return this.serviceRepository.getListServices();
    }
}
