package com.ou.repository.client;


import com.ou.pojos.LobbyImage;
import java.util.List;

public interface LobbyImageRepository {
    List<LobbyImage> getListImage(int id);
}
