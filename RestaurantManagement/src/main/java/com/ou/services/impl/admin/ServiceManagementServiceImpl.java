/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.pojos.Service;
import com.ou.repository.admin.ServiceManagementRepository;
import com.ou.services.admin.ServiceManagementService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Wall D
 */
@org.springframework.stereotype.Service
public class ServiceManagementServiceImpl implements ServiceManagementService {

    @Autowired
    private ServiceManagementRepository ServiceManagementRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Service> getServicesByKw(String kw) {
        return this.ServiceManagementRepository.getServicesByKw(kw);
    }

    @Override
    public Service getServiceById(String id) {
        return this.ServiceManagementRepository.getServiceById(id);
    }

    @Override
    public boolean addOrUpdateService(Service service) {
        try {
            if (!service.getFile().isEmpty()) {
                Map r = this.cloudinary.uploader().upload(service.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                service.setSerImage((String) r.get("secure_url"));
            }
            return this.ServiceManagementRepository.addOrUpdate(service);
        } catch (IOException ex) {
            System.err.println("==== SERVICE ===" + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(Service service) {
        return this.ServiceManagementRepository.addOrUpdate(service);
    }

    @Override
    public boolean isExistServiceName(Service s) {
        return this.ServiceManagementRepository.isExistServiceName(s);
    }

}
