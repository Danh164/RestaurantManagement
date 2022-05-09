package com.ou.controllers.client;

import com.ou.pojos.Comment;
import com.ou.pojos.Lobby;
import com.ou.pojos.User;
import com.ou.services.client.CommentService;
import com.ou.services.client.LobbyService;
import com.ou.services.client.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiCommentController {

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LobbyService lobbyService;

//    lay danh sach binh luan
    @PostMapping("api/get-list-comment-by-lob-id")
    @ResponseBody
    public ResponseEntity<List<Comment>> getListCommentByLobId(@RequestBody Map<String, String> params) throws ParseException {
        String lob_id = params.get("lob_id");
        String x = params.get("x");
        List<Comment> listCmt = this.commentService.getListCommentByLobbyId(Integer.parseInt(lob_id),Integer.parseInt(x));

        return new ResponseEntity<>(listCmt, HttpStatus.OK);
    }
//kiem tra username co con quyen binh luan luan khong
    @PostMapping("api/check-username-in-bill")
    @ResponseBody
    public ResponseEntity<Boolean> isUserInBill(@RequestBody Map<String, String> params) {
        String username = params.get("username");
        String lob_id = params.get("lob_id");
        List<User> listUser = this.userService.getUsers(username);
        User user = listUser.get(0);
        boolean flag;

        if (this.commentService.countUserInBill(user.getId(), Integer.parseInt(lob_id)) - 
                this.commentService.countUserInComment(user.getId(), Integer.parseInt(lob_id))> 0) {
            flag = true;
        } else {
            flag = false;
        }
        return new ResponseEntity<>(flag, HttpStatus.OK);
    }

//    luu binh luan
    @PostMapping("api/save-comment")
    @ResponseBody
    public ResponseEntity<Boolean> saveComment(@RequestBody Map<String, String> params) {
        String username = params.get("username");
        String lob_id = params.get("lob_id");
        String stars = params.get("stars");
        String content = params.get("content");
        List<User> listUser = this.userService.getUsers(username);
        User user = listUser.get(0);
        Lobby lobby = this.lobbyService.getLobbyById(Integer.parseInt(lob_id));

        Comment comment = new Comment();
        comment.setCmtContent(content);
        comment.setUser(user);
        comment.setCmtStar(Integer.parseInt(stars));
        comment.setLobby(lobby);

        boolean flag = this.commentService.saveComment(comment);
        return new ResponseEntity<>(flag, HttpStatus.OK);
    }
    
//    tong so binh luan theo lob_id
    @PostMapping("api/count-comment-by-lob-id")
    @ResponseBody
    public ResponseEntity<Integer> countCommentByLobId(@RequestBody Map<String, String> params) throws ParseException {
        String lob_id = params.get("lob_id");
        return new ResponseEntity<>(this.commentService.countCommentByLobId(Integer.parseInt(lob_id)), HttpStatus.OK);
    }
        
//    tong sao theo lob_id
    @PostMapping("api/total-stars-by-lob-id")
    @ResponseBody
    public ResponseEntity<Integer> totalStarsByLobId(@RequestBody Map<String, String> params) throws ParseException {
        String lob_id = params.get("lob_id");
        return new ResponseEntity<>(this.commentService.totalStarsByLobId(Integer.parseInt(lob_id)), HttpStatus.OK);
    }
    

//    lay danh sach sao
    @PostMapping("api/get-list-star-detail")
    @ResponseBody
    public ResponseEntity<List<Comment>> totalStarsDetailByLobId(@RequestBody Map<String, String> params) throws ParseException {
        String lob_id = params.get("lob_id");
        return new ResponseEntity<>(this.commentService.getListStarDetailByLobId(Integer.parseInt(lob_id)), HttpStatus.OK);
    }
}
