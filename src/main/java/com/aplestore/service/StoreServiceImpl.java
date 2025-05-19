package com.aplestore.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.aplestore.common.PageUtil;
import com.aplestore.dao.StoreMapper;
import com.aplestore.dto.StoreDTO;

@Service
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

    private final SqlSessionTemplate sqlSession;
    private final StoreMapper storeMapper;
    private final PageUtil pageUtil;

    @Override
    public Map<String, Object> getStoreList(int page) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        int totalCount = storeMapper.selectStoreListCount();
        Map<String, Object> map = pageUtil.getPageInfo(totalCount, page, 5, 5);
        List<StoreDTO> list = storeMapper.selectAll();
        map.put("list", list);
        return map;
    }

    @Override
    public Map<String, Object> getStoreDetail(int id) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);

        StoreDTO store = storeMapper.selectStoreById(id);

        Map<String, Object> map = new HashMap<>();
        map.put("store", store);

        return map;
    }

    @Override
    public void registStore(StoreDTO storeDTO) {
        System.out.println("#####################");
        System.out.println("#####################");
        System.out.println("#####################");
        System.out.println("#####################");
        System.out.println("#####################");
        System.out.println(storeDTO.getStoreOffDay());
        System.out.println("#####################");
        storeMapper.registStore(storeDTO);
    }
}