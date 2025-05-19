package com.aplestore.service;

import com.aplestore.dto.ProductModelDTO;
import java.util.List;

public interface ProductService {

    List<ProductModelDTO> getAllModels(int offset, int limit, String keyword, String sort);
    int countAllModels(String keyword);
    List<String> suggestKeyword(String keyword);
}
