package com.ou.services.client;

import com.ou.pojos.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService{
    boolean addUser(User user);
    int isUserByIdCard(String idCart);
    int isUserByUsername(String username);
    List<User> getUsers(String username);
}
