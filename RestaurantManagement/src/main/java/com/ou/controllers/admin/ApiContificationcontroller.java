/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.admin;

import com.ou.pojos.Feedback;
import com.ou.repository.client.FeedbackRepository;
import com.ou.repository.impl.client.FeedbackRepositoryImpl;
import com.ou.services.client.FeedbackService;
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
public class ApiContificationcontroller {

    @Autowired
    private FeedbackService feedbackService;

    @PostMapping("api/count-contification")
    @ResponseBody
    public ResponseEntity<Integer> getCountConf() {
        int count = this.feedbackService.countContiRead();
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    @PostMapping("api/username-in-feedback")
    @ResponseBody
    public ResponseEntity<List<Feedback>> getUsernameInFeedback(@RequestBody Map<String, String> params) {
        String kw = params.get("kw");
        List<Feedback> list = this.feedbackService.getUser(kw);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping(path = "/api/feedback-by-username", produces = {
        MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<Feedback>> getFeedbackByUsername(@RequestBody Map<String, String> params,
            HttpSession session) {
        String username = params.get("username");
        List<Feedback> list = this.feedbackService.getFeedbackByUser(username);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping(path = "/api/unread-feedback-by-username", produces = {
        MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<Feedback>> countFeedbackByUsername(
            HttpSession session) {
        List<Feedback> list = this.feedbackService.getUnreadFeedbackByUsername();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @Autowired
    private FeedbackRepository test;

    @PostMapping(path = "/api/read-feedback", produces = {
        MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Boolean> setReadFeedback(@RequestBody Map<String, String> params,
            HttpSession session) {
        String username = params.get("username");
        List<Feedback> list = this.test.getListFeedbackByUsername(username);

        for (Feedback i : list) {
            Feedback f = i;
            f.setFeedIsRead(true);
            this.feedbackService.setRead(f);
        }
        return new ResponseEntity<>(true, HttpStatus.OK);
    }
    
//    update
    @PostMapping("api/get-all-list-feedback")
    @ResponseBody
    public ResponseEntity<List<Feedback>> getListAll() {
        return new ResponseEntity<>(this.feedbackService.getAllFeedBack(), HttpStatus.OK);
    }
}
