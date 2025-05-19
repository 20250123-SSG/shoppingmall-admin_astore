package com.aplestore.service;

import com.aplestore.dao.ProductMapper;
import com.aplestore.dto.ProductModelOptionDTO;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {
    private final SqlSessionTemplate sqlSession;

    @Transactional
    @Override
    public int registProduct(ProductModelOptionDTO product) {
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        log.debug("selectModel 전: {}", product);
        Integer modelId = mapper.selectModelIdIfExists(product.getModelName());
        log.debug("selectModel 후: {}", modelId);
        if (modelId == null){
            System.out.println("=== DEBUG 확인용 ===");
            log.debug("insertModel시킬 데이터: {}", product); //TODO
            modelId = mapper.insertModel(product);
        }
        product.setId(modelId);

        int existed = mapper.countExistsModel(product);

        if (existed == 0){
            return mapper.insertProduct(product);
        } else {
            log.debug("이미 등록된 상품입니다. ");
            return 0;
        }
    }






    @Override
    public int modifyProduct(ProductModelOptionDTO product) {
        return sqlSession.getMapper(ProductMapper.class).updateProduct(product);
    }
}