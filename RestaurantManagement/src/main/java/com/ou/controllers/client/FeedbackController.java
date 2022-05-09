/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.ou.pojos.Feedback;
import com.ou.pojos.Service;
import com.ou.pojos.User;
import com.ou.services.client.FeedbackService;
import com.ou.services.client.UserService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Admin
 */
@Controller
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/feedback")
    public String feedback() {
        return "feedback";
    }
    
    @PostMapping(path ="/api/feedback",produces = {
        MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Boolean> getService(@RequestBody Map<String, String> params, 
            HttpSession session){
        String content = params.get("content");
        String user_name = params.get("user_name");
        
        List<User> listUser = this.userService.getUsers(user_name);
        User user = listUser.get(0);
        
        Feedback feedback = new Feedback();
        feedback.setFeedContent(content);
        feedback.setUser(user);
//        feedback.setUser();
        if (this.feedbackService.addFeedback(feedback))
            return new ResponseEntity<>(true, HttpStatus.OK);
        return new ResponseEntity<>(false, HttpStatus.BAD_REQUEST);
    }
}
