/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.ou.pojos.Feedback;
import com.ou.pojos.User;
import com.ou.services.client.UserService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
public class ApiUserController {
    @Autowired
    private UserService userService;
    
    @PostMapping(path ="/api/get-user-by-username",produces = {
        MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<User> getService(@RequestBody Map<String, String> params, 
            HttpSession session){
        String user_name = params.get("user_name");
        List<User> users = this.userService.getUsers(user_name);
        User user = users.get(0);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
}
