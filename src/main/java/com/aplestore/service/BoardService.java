package com.aplestore.service;


import com.aplestore.dto.BoardDTO;
import java.util.List;

public interface BoardService {
    List<BoardDTO> findAll();
    BoardDTO       findById(Integer id);

}
