package com.aplestore.dao;

import com.aplestore.dto.ProductModelDTO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {

    List<ProductModelDTO> getAllModels(
            @Param("offset") int offset,
            @Param("limit") int limit,
            @Param("keyword") String keyword,
            @Param("sort") String sort
    );

    int countAllModels(String keyword);
    List<String> findMatchingModelNames(@Param("keyword") String keyword);
}
