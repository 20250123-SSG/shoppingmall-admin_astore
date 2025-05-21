package com.aplestore.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.aplestore.dto.PostDTO;

public interface PostMapper {
    // (1) 해당 게시판의 전체 글 개수
    int countByBoard(@Param("boardId") Integer boardId);

    // (2) 페이징 적용한 리스트 조회
    List<PostDTO> selectByBoardWithLimit(
            @Param("boardId") Integer boardId,
            @Param("offset")  int offset,
            @Param("limit")   int limit
    );

    // (3) 단일 글 조회
    PostDTO selectById(@Param("id") Integer id);

    // (4) 새 글 등록
    int insertPost(PostDTO post);

    // (5) 글 수정
    int updatePost(PostDTO post);

    // (6) 다중 삭제
    int deleteByIds(@Param("ids") List<Integer> ids);
}
