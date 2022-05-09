package com.ou.services.impl.client;

import com.ou.pojos.LobbyImage;
import com.ou.repository.client.LobbyImageRepository;
import com.ou.services.client.LobbyImageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LobbyImageServiceImpl implements LobbyImageService{
    @Autowired
    private LobbyImageRepository lobbyImageRepository;
    
    @Override
    public List<LobbyImage> getListImage(int id) {
        return this.lobbyImageRepository.getListImage(id);
    }
    
}
