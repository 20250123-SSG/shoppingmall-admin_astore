package com.aplestore.service;


import java.util.List;
import com.aplestore.dao.BoardMapper;
import com.aplestore.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

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
