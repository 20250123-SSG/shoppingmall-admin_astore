package com.aplestore.service;

import com.aplestore.dao.ProductMapper;
import com.aplestore.dto.ProductModelDTO;
import com.aplestore.dto.ProductModelOptionDTO;
import java.util.List;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Slf4j
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

    @Transactional
    @Override
    public int registProduct(ProductModelOptionDTO product) {
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        Integer modelId = mapper.selectModelIdIfExists(product.getModelName());

        if (modelId == null) {
            modelId = mapper.insertModel(product);
        }
        product.setId(modelId);

        int existed = mapper.countExistsModel(product);

        if (existed == 0) {
            return mapper.insertProduct(product);
        } else {
            log.debug("이미 등록된 상품입니다. ");
            return 0;
        }
    }

    public List<String> suggestKeyword(String keyword) {
        return sqlSession.getMapper(ProductMapper.class).findMatchingModelNames(keyword);
    }

    @Override
    public int getModelId(ProductModelOptionDTO product) {
        int id = sqlSession.getMapper(ProductMapper.class).selectModelId(product);
        return id;
    }

    @Override
    public int saveChangeInfo(ProductModelOptionDTO product) {
        return sqlSession.getMapper(ProductMapper.class).updateProduct(product);
    }

    @Override
    public List<ProductModelOptionDTO> getProductDetail(Long id){
        return sqlSession.getMapper(ProductMapper.class).getProductDetail(id);
    }

    @Override
    public int removeModelOption(ProductModelOptionDTO dto){
        return sqlSession.getMapper(ProductMapper.class).removeModelOption(dto);
    }
}
