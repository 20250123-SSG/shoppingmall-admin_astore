package com.aplestore.service;

import com.aplestore.dto.ProductModelDTO;
import java.util.List;

import com.aplestore.dto.ProductModelOptionDTO;

public interface ProductService {

    int registProduct(ProductModelOptionDTO product);

    List<ProductModelDTO> getAllModels(int offset, int limit, String keyword, String sort);
    int countAllModels(String keyword);
    List<String> suggestKeyword(String keyword);

//    ProductModelOptionDTO getAllModelOption(ProductModelOptionDTO product);
    int saveChangeInfo(ProductModelOptionDTO product);
}
