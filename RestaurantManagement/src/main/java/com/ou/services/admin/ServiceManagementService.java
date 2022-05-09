/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.admin;

import com.ou.pojos.Service;
import java.util.List;

/**
 *
 * @author Wall D
 */
public interface ServiceManagementService {

    List<Service> getServicesByKw(String kw);

    Service getServiceById(String id);

    boolean addOrUpdateService(Service service);

    boolean delete(Service service);

    boolean isExistServiceName(Service s);
}
