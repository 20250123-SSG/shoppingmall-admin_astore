package com.aplestore.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.aplestore.dto.BoardDTO;

public interface BoardMapper {
    // 전체 게시판 목록
    List<BoardDTO> selectAll();

    // 단일 게시판 조회 (선택적)
    BoardDTO selectById(@Param("id") Integer id);
}
