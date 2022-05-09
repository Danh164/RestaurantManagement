/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.impl.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.pojos.Lobby;
import com.ou.repository.admin.LobbyManagementRepository;
import com.ou.services.admin.LobbyManagementService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Wall D
 */
@Service
public class LobbyManagementServiceImpl implements LobbyManagementService {

    @Autowired
    private LobbyManagementRepository lobbyManagementRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Lobby> getLobbiesByKw(String kw) {
        return this.lobbyManagementRepository.getLobbiesByKw(kw);
    }

    @Override
    public Lobby getLobbyById(String id) {
        return this.lobbyManagementRepository.getLobbyById(id);
    }

    @Override
    public boolean addOrUpdate(Lobby lobby) {
        try {
            if (!lobby.getFile().isEmpty()) {
                Map r = this.cloudinary.uploader().upload(lobby.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                lobby.setLobImage((String) r.get("secure_url"));
            }
            return this.lobbyManagementRepository.addOrUpdate(lobby);
        } catch (IOException ex) {
            System.err.println("==== ADD Lobby ===" + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(Lobby lobby) {
        return this.lobbyManagementRepository.delete(lobby);
    }

    @Override
    public List<Lobby> getLobbies() {
        return this.lobbyManagementRepository.getLobbies();
    }

    @Override
    public boolean isExistLobbyName(String lobName, int lobId) {
        return this.lobbyManagementRepository.isExistLobbyName(lobName, lobId);
    }

}
