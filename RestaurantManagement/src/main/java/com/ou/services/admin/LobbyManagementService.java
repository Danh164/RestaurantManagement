/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.services.admin;

import com.ou.pojos.Lobby;
import java.util.List;

/**
 *
 * @author Wall D
 */
public interface LobbyManagementService {
     List<Lobby> getLobbiesByKw(String kw);
     Lobby getLobbyById(String id);
     boolean addOrUpdate(Lobby lobby);
     boolean delete(Lobby lobby);
     List<Lobby> getLobbies();
     boolean isExistLobbyName(String lobName, int lobId);
}