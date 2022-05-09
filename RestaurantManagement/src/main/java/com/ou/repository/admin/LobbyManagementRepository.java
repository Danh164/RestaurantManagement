/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ou.repository.admin;

import com.ou.pojos.Lobby;
import java.util.List;

/**
 *
 * @author Wall D
 */
public interface LobbyManagementRepository {
    List<Lobby> getLobbiesByKw(String kw);
    List<Lobby> getLobbies();
    Lobby getLobbyById(String id);
    boolean addOrUpdate(Lobby lobby);
    boolean delete(Lobby lobby);
    boolean isExistLobbyName(String lobName,  int lobId);
}
