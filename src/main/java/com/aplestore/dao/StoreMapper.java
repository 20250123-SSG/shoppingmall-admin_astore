package com.aplestore.dao;

import com.aplestore.dto.StoreDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StoreMapper {
    int selectStoreListCount();

    List<StoreDTO> selectAll(Map<String, Object> map);

    void registStore(StoreDTO dto);

    StoreDTO selectStoreById(int no);

    void updateStore(StoreDTO dto);
    void changeStatus(@Param("id") int id, @Param("status") String status);
}