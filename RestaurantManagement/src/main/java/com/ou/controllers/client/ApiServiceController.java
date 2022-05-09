/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.ou.pojos.Service;
import com.ou.repository.impl.client.MenuRepositoryImpl;
import com.ou.services.client.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
public class ApiServiceController {
    @Autowired
    private ServiceService serviceService;
    
    @GetMapping("api/service/{id}")
    @ResponseBody
    public ResponseEntity<Service> getService(Model model,
             @PathVariable(value = "id") int id){

        Service service = this.serviceService.getServiceById(id);
        return new ResponseEntity<>(service, HttpStatus.OK);
    }
}
