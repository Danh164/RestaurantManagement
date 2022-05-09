/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.pojos.User;
import com.ou.repository.client.UserRepository;
import com.ou.services.client.UserService;
import com.ou.utils.MD5Util;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Admin
 */
@Service("userDetailsService")
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
 
    @Override
    public boolean addUser(User user) {
        String pass = user.getUserPassword();
        user.setUserPassword(this.passwordEncoder.encode(pass));
        user.setUserRole("USER");
        user.setUserIsActive(true);
        Date date = new Date();
        user.setUserJoinedDate(date);
        try {
            user.setUserDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse(user.getDob()));
        } catch (ParseException ex) {
            Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        user.setUserAddress(user.getUserCommune() + " " + user.getUserDistrict() + " "+ user.getUserCity());
        return this.userRepository.addUser(user);
    }

    @Override
    public int isUserByIdCard(String idCart) {
        return this.userRepository.isUserByIdCart(idCart);
    }

    @Override
    public int isUserByUsername(String username) {
        return this.userRepository.isUserByUsername(username);
    }

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if (users.isEmpty())
            throw new UsernameNotFoundException("User does not exist!!!");
        
        User user = users.get(0);
        
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserRole()));
        
        return new org.springframework.security.core
                .userdetails.User(user.getUserUsename(), user.getUserPassword(), auth);
    }
    
}
