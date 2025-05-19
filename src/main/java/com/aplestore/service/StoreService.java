package com.aplestore.service;

import java.util.Map;

import com.aplestore.dto.StoreDTO;

public interface StoreService {
    Map<String, Object> getStoreList(int page);

    void createStore(StoreDTO dto);

    Map<String, Object> getStoreDetail(int id);
}