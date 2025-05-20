package com.aplestore.service;

import com.aplestore.dao.ProductMapper;
import com.aplestore.dto.ProductModelDTO;
import java.util.List;
import lombok.RequiredArgsConstructor;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

    private final SqlSessionTemplate sqlSession;

    @Override
    public List<ProductModelDTO> getAllModels(int offset, int limit, String keyword, String sort) {
        return sqlSession.getMapper(ProductMapper.class).getAllModels(offset, limit, keyword, sort);
    }

    @Override
    public int countAllModels(String keyword) {
        return sqlSession.getMapper(ProductMapper.class).countAllModels(keyword);
}

    public List<String> suggestKeyword(String keyword) {
        return sqlSession.getMapper(ProductMapper.class).findMatchingModelNames("%" + keyword + "%");
    }

    }