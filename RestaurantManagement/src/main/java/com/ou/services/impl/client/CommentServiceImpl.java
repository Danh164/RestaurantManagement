/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.client;

import com.ou.pojos.Comment;
import com.ou.repository.client.CommentRepository;
import com.ou.services.client.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;
    
    @Override
    public List<Comment> getListCommentByLobbyId(int id, int x) {
        return this.commentRepository.getListCommentByLobbyId(id, x);
    }

    @Override
    public int countUserInBill(int user_id, int lob_id) {
        return this.commentRepository.countUserInBill(user_id, lob_id);
    }

    @Override
    public int countUserInComment(int user_id, int lob_id) {
        return this.commentRepository.countUserInComment(user_id, lob_id);
    }

    @Override
    public boolean saveComment(Comment comment) {
        Date date = new Date();
        comment.setCreatedDay(date);
        return this.commentRepository.saveComment(comment);
    }

    @Override
    public int countCommentByLobId(int lob_id) {
        return this.commentRepository.countCommentByLobId(lob_id);
    }

    @Override
    public int totalStarsByLobId(int lob_id) {
        return this.commentRepository.totalStarsByLobId(lob_id);
    }

    @Override
    public List<Comment> getListStarDetailByLobId(int lob_id) {
        return this.commentRepository.getListStarDetailByLobId(lob_id);
    }
    
}
