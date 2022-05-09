package com.ou.repository.client;

import com.ou.pojos.Lobby;

import java.util.List;

public interface LobbyRepository {
    int countLobbby();
    List<Lobby> getLobbiesByKw(String kw);
    List<Lobby> getLobbies(String kw, int page);
    Lobby getLobbyById(int id);
}
