package com.aplestore.dao;

import com.aplestore.dto.ProductModelDTO;
import com.aplestore.dto.ProductModelOptionDTO;

public interface ProductMapper {

    // 상품등록
    Integer selectModelIdIfExists(String modelName);
    int insertModel(ProductModelOptionDTO product);

    int countExistsModel(ProductModelOptionDTO product);
    int insertProduct(ProductModelOptionDTO product);

    // 상품수정 (조회는 상세조회페이지에서 받아오기. 아니면 번호만 받고 조회해서 가져와도 됨)
    int updateProduct(ProductModelOptionDTO product);

}
