package com.aplestore.service;

import com.aplestore.dto.ProductModelDTO;
import com.aplestore.dto.ProductModelOptionDTO;
import java.util.List;

import com.aplestore.dto.ProductModelOptionDTO;

public interface ProductService {
    //TODO: MultipartFile 객체 (이미지) 추가
    int registProduct(ProductModelOptionDTO product);
    int modifyProduct(ProductModelOptionDTO product);

    List<ProductModelDTO> getAllModels(int offset, int limit, String keyword, String sort);
    int countAllModels(String keyword);
    List<String> suggestKeyword(String keyword);

    List<ProductModelOptionDTO> getProductDetail(Long id);

    int removeModelOption(ProductModelOptionDTO dto);
}
