package com.aplestore.service;

import java.util.List;

import com.aplestore.dto.StoreDTO;

public interface StoreService {
    List<StoreDTO> getStoreList();

    void createStore(StoreDTO dto);

    StoreDTO getById(int id);
}