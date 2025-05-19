package com.aplestore.dao;

import com.aplestore.dto.StoreDTO;
import java.util.List;

public interface StoreMapper {
    int selectStoreListCount();

    List<StoreDTO> selectAll();

    void registStore(StoreDTO dto);

    StoreDTO selectStoreById(int no);
}