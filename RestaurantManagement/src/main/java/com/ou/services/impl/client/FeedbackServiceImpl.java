/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.ou.pojos.Feedback;
import com.ou.repository.client.FeedbackRepository;
import com.ou.services.client.FeedbackService;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class FeedbackServiceImpl implements FeedbackService{  
    @Autowired
    private FeedbackRepository feedbackRepository; 
    
    @Override
    public boolean addFeedback(Feedback feedback) {
        feedback.setFeedCreatedDate(LocalDate.now());
        feedback.setFeedIsRead(Boolean.FALSE);
        return this.feedbackRepository.addListCoef(feedback);
    }

    @Override
    public int countContiRead() {
        return this.feedbackRepository.countContiRead();
    }

    @Override
    public List<Feedback> getUser(String kw) {
        return this.feedbackRepository.getUser(kw);
    }

    @Override
    public List<Feedback> getFeedbackByUser(String username) {
        return this.feedbackRepository.getFeedbackByUsername(username);
    }

    @Override
    public List<Feedback> getUnreadFeedbackByUsername() {
        return this.feedbackRepository.getUnreadFeedbackByUsername();
    }

    @Override
    public boolean setRead(Feedback f) {
        return this.feedbackRepository.setRead(f);
    }

//    update
    @Override
    public List<Feedback> getAllFeedBack() {
        return this.feedbackRepository.getAllFeedBack();
    }
}
