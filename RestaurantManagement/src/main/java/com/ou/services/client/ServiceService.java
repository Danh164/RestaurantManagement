package com.ou.services.client;

import com.ou.pojos.Service;
import java.util.List;

public interface ServiceService {

    List<Service> listService();
    Service getServiceById(int id);
    List<Service> getListServices();
}
