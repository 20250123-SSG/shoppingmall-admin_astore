package com.aplestore.service;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.aplestore.dao.StoreMapper;
import com.aplestore.dto.StoreDTO;

@Service
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

    private final StoreMapper storeMapper;

    @Override
    public List<StoreDTO> getStoreList() {
        return storeMapper.selectAll();
    }

    @Override
    public void createStore(StoreDTO dto) {
        storeMapper.insert(dto);
    }

    @Override
    public StoreDTO getById(int id) {
        return storeMapper.selectById(id);
    }
}