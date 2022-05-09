package com.ou.repository.client;

import com.ou.pojos.Feedback;
import java.util.List;

public interface FeedbackRepository {
    boolean addListCoef(Feedback feedback);
    int countContiRead();
    List<Feedback> getUser(String kw);
    List<Feedback> getFeedbackByUsername(String username);
    List<Feedback> getUnreadFeedbackByUsername();
    List<Feedback> getListFeedbackByUsername(String username);
    boolean setRead(Feedback f);
//    update
    List<Feedback> getAllFeedBack();
}
