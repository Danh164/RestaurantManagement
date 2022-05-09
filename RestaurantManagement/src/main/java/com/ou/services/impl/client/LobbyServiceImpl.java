package com.ou.services.impl.client;

import com.ou.pojos.Lobby;
import com.ou.repository.client.LobbyRepository;
import com.ou.services.client.LobbyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LobbyServiceImpl implements LobbyService {
    @Autowired
    private LobbyRepository lobbyRepository;

    @Override
    public int countLobby() {
        return this.lobbyRepository.countLobbby();
    }

    @Override
    public List<Lobby> getLobbies(String kw, int page) {
        return this.lobbyRepository.getLobbies(kw, page);
    }

    @Override
    public List<Lobby> getLobbiesByKw(String kw) {
       return this.lobbyRepository.getLobbiesByKw(kw);
    }

    @Override
    public Lobby getLobbyById(int id) {
        if (id > 0) {
            return this.lobbyRepository.getLobbyById(id);
        }
        return null;
    }
}
