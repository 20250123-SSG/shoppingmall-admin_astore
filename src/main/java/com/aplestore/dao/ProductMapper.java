package com.aplestore.dao;

import com.aplestore.dto.ProductModelDTO;
import com.aplestore.dto.ProductModelOptionDTO;
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
    List<ProductModelOptionDTO> getProductDetail(Long id);
    int removeModelOption(ProductModelOptionDTO productModelOptionDTO);

    // 상품등록
    Integer selectModelIdIfExists(String modelName);
    int insertModel(ProductModelOptionDTO product);

    int countExistsModel(ProductModelOptionDTO product);
    int insertProduct(ProductModelOptionDTO product);

    // 상품수정
    int selectModelId(ProductModelOptionDTO product);
    int updateProduct(ProductModelOptionDTO product);



}
