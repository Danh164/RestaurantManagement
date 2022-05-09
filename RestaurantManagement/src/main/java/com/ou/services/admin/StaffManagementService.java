package com.ou.services.admin;

import com.ou.pojos.User;
import java.util.List;

public interface StaffManagementService {

    public List<User> getUsers(String kw);

    User getUserById(String id);

    public boolean addOrUpdate(User staff);

    boolean delete(User staff);

    boolean isExistIdCard(User staff);
}
