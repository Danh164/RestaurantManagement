package com.ou.services.client;

import com.ou.pojos.Feedback;
import java.util.List;

public interface FeedbackService {
    boolean addFeedback(Feedback feedback);
    int countContiRead();
    List<Feedback> getUser(String kw);
    List<Feedback> getFeedbackByUser(String username);
    List<Feedback> getUnreadFeedbackByUsername();
    boolean setRead(Feedback f);
//    update
    List<Feedback> getAllFeedBack();
}
