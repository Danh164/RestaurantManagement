package com.ou.repository.client;


import com.ou.pojos.Service;
import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface ServiceRepository {
    List<Service> getListService();
    Service getServiceById(int id);
    List<Service> getListServices();
}
