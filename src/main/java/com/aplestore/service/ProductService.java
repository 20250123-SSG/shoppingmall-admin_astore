package com.aplestore.service;

import com.aplestore.dto.ProductModelOptionDTO;

public interface ProductService {
    //TODO: MultipartFile 객체 (이미지) 추가
    int registProduct(ProductModelOptionDTO product);
    int modifyProduct(ProductModelOptionDTO product);
}
