package com.ou.repository.client;

import com.ou.pojos.User;
import java.util.List;

public interface UserRepository {
    boolean addUser(User user);
    int isUserByIdCart(String idCart);
    int isUserByUsername(String username);
    List<User> getUsers(String username);
}
