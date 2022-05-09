/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.controllers.client;

import com.ou.pojos.Lobby;
import com.ou.pojos.LobbyImage;
import com.ou.services.client.CoefficientService;
import com.ou.services.client.CommentService;
import com.ou.services.client.LobbyImageService;
import com.ou.services.client.LobbyService;
import com.ou.utils.RandomUtil;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
public class LobbyController {
    @Autowired
    private LobbyService lobbyService;
    
    @Autowired
    private CoefficientService coefficientService;
    
    @Autowired
    private LobbyImageService lobbyImageService;

    
    @RequestMapping("/lobby-detail")
    @Transactional
    public String lobbyDetail(Model model,
            @RequestParam(required = false) Map<String, String> params){
        int id = Integer.parseInt(params.getOrDefault("id", "1"));
        model.addAttribute("detail", this.lobbyService.getLobbyById(id));
        model.addAttribute("listCoeff", this.coefficientService.getListCoef());
        List<Lobby> lobbies = this.lobbyService.getLobbiesByKw("");
        int idInLobbies = 0;
        for(int i =0; i <lobbies.toArray().length; i ++)
            if(lobbies.get(i).getId() == id)
                idInLobbies = i;
        
        List<Lobby> lobbiesRandom = new LinkedList<>();
        Integer[]  index = RandomUtil.getListRandom(lobbies.toArray().length, 3, idInLobbies);
        for(int i =0; i< index.length; i ++)
            lobbiesRandom.add(lobbies.get(index[i]));
        
        model.addAttribute("lobbies", lobbiesRandom);
        
//        danh sach anh
        model.addAttribute("listImage", this.lobbyImageService.getListImage(id));
        return "lobby-detail";
    }
}
