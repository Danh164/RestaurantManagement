package com.ou.services.impl.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.pojos.User;
import com.ou.repository.admin.StaffManagementRepository;
import com.ou.services.admin.StaffManagementService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StaffManagementServiceImpl implements StaffManagementService {
    @Autowired
    private StaffManagementRepository staffManagementRepository;
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public List<User> getUsers(String kw) {
        return this.staffManagementRepository.getUsers(kw);
    }

    @Override
    public User getUserById(String id) {
         return this.staffManagementRepository.getUserById(id);
    }

    @Override
    public boolean addOrUpdate(User staff) {
        try {
           if(!staff.getFile().isEmpty()){
               Map r = this.cloudinary.uploader().upload(staff.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                staff.setUserImage((String) r.get("secure_url"));
           }
            return this.staffManagementRepository.addOrUpdate(staff);
        } catch (IOException ex) {
            System.err.println("==== Staff ===" + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(User staff) {
          return this.staffManagementRepository.delete(staff);
    }

    @Override
    public boolean isExistIdCard(User staff) {
        return this.staffManagementRepository.isExistIdCard(staff);
    }
}
