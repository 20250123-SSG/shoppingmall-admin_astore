package com.aplestore.service;


import com.aplestore.dao.BoardMapper;
import com.aplestore.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public List<BoardDTO> findAll() {
        return boardMapper.selectAll();
    }

    @Override
    public BoardDTO findById(Integer id) {
        return boardMapper.selectById(id);
    }

}
