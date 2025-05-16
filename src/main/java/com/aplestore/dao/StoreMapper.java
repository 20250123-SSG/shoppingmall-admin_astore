package com.aplestore.dao;

import com.aplestore.dto.StoreDTO;
import java.util.List;

public interface StoreMapper {
    List<StoreDTO> selectAll();

    void insert(StoreDTO dto);

    StoreDTO selectById(int id);
}