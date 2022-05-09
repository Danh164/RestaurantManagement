package com.ou.services.client;

import com.ou.pojos.Lobby;

import java.util.List;


public interface LobbyService {
    int countLobby();
    List<Lobby> getLobbiesByKw(String kw);
    List<Lobby> getLobbies(String kw, int page);
    Lobby getLobbyById(int id);
}
