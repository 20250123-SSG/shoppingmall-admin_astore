package com.aplestore.service;

import java.util.Map;

import com.aplestore.dto.StoreDTO;

public interface StoreService {
    Map<String, Object> getStoreList(int page);

    void registStore(StoreDTO storeDTO);

    Map<String, Object> getStoreDetail(int id);
}