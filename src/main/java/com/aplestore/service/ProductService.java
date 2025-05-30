package com.aplestore.service;

import com.aplestore.dto.ProductModelDTO;
import com.aplestore.dto.ProductModelOptionDTO;
import java.util.List;

import com.aplestore.dto.ProductModelOptionDTO;

public interface ProductService {

    int registProduct(ProductModelOptionDTO product);

    List<ProductModelDTO> getAllModels(int offset, int limit, String keyword, String sort);
    int countAllModels(String keyword);
    List<String> suggestKeyword(String keyword);

    List<ProductModelOptionDTO> getProductDetail(Integer id);

    int removeModelOption(ProductModelOptionDTO dto);

    int getModelOptionId(ProductModelOptionDTO product);
    int getModelId(ProductModelOptionDTO product);
    int saveChangeInfo(ProductModelOptionDTO product);
}
