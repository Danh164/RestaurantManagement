package com.ou.repository.client;


import com.ou.pojos.Comment;
import java.util.List;

public interface CommentRepository {
    List<Comment> getListCommentByLobbyId(int id, int x);
    int countUserInBill(int user_id, int lob_id);
    int countUserInComment(int user_id, int lob_id);
    boolean saveComment(Comment comment);
    int countCommentByLobId(int lob_id);
    int totalStarsByLobId(int lob_id);
    List<Comment> getListStarDetailByLobId(int lob_id);
}
