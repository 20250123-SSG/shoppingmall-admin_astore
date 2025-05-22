package com.aplestore.service;

import java.util.Map;

import com.aplestore.dto.StoreDTO;

public interface StoreService {
    Map<String, Object> getStoreList(int page);

    Map<String, Object> getStoreDetail(int id);

    void registStore(StoreDTO storeDTO);

    void updateStore(StoreDTO dto);

    void softDeleteStore(int id);

}