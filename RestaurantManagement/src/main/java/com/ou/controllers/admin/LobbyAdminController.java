/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ou.controllers.admin;

import com.ou.pojos.Lobby;
import com.ou.services.admin.LobbyManagementService;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Danh Nguyen
 */
@Controller
@Transactional
public class LobbyAdminController {

    @Autowired
    private LobbyManagementService lobbyManagementService;

    @GetMapping("/admin/lobby")
    public String lobby(Model model, @RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
        model.addAttribute("lobbies", this.lobbyManagementService.getLobbiesByKw(kw));
        return "lobby-admin";
    }

    @GetMapping("/admin/lobby/add")
    public String addLobby(Model model) {
        model.addAttribute("lobby", new Lobby());
        return "add-lobby";
    }

    @PostMapping("/admin/lobby/add")
    public String addLobbyPost(Model model, @ModelAttribute(value = "lobby") @Valid Lobby lobby,
            BindingResult result) {
        if (!result.hasErrors()) {
            if(lobbyManagementService.isExistLobbyName(lobby.getLobName(), lobby.getId())){
                model.addAttribute("errMsg", "Tên sảnh cưới đã tồn tại!!!");
                return "add-lobby";
            }
            lobby.setLobIsActive(true);
            if (this.lobbyManagementService.addOrUpdate(lobby)) {
                return "redirect:/admin/lobby";
            } else {
                model.addAttribute("errMsg", "Lỗi rồi vui lòng kiểm tra lại thông tin!!!");
            }
        }
        return "add-lobby";
    }

    @GetMapping("/admin/lobby/edit")
    public String editLobby(Model model, @RequestParam(value = "id") String id) {
        model.addAttribute("lobby", this.lobbyManagementService.getLobbyById(id));
        return "edit-lobby";
    }

    @PostMapping("/admin/lobby/edit")
    public String editLobbyPost(Model model, @ModelAttribute(value = "lobby") @Valid Lobby lobby,
            BindingResult result) {
        if (!result.hasErrors()) {
            if(lobbyManagementService.isExistLobbyName(lobby.getLobName(), lobby.getId())){
                model.addAttribute("errMsg", "Tên sảnh cưới đã tồn tại!!!");
                return "edit-lobby";
            }
            lobby.setLobIsActive(true);
            if (this.lobbyManagementService.addOrUpdate(lobby)) {
                return "redirect:/admin/lobby";
            } else {
                model.addAttribute("errMsg", "Lỗi rồi vui lòng kiểm tra lại thông tin!!!");
            }
        }
        return "edit-lobby";
    }

    @GetMapping("/admin/lobby/delete")
    public String deleteLobby(Model model, @RequestParam(value = "id") String id) {
        Lobby lobby = this.lobbyManagementService.getLobbyById(id);
        lobby.setLobIsActive(false);
        lobbyManagementService.delete(lobby);
        return "redirect:/admin/lobby";
    }
}
