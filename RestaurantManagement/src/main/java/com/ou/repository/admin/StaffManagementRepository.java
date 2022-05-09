package com.ou.repository.admin;

import com.ou.pojos.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StaffManagementRepository {

    List<User> getUsers(String kw);

    User getUserById(String id);

    public boolean addOrUpdate(User staff);

    boolean delete(User staff);

    boolean isExistIdCard(User staff);
}
