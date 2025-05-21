package com.aplestore.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.aplestore.dto.PostDTO;

public interface PostMapper {

    // (3) 단일 글 조회
    PostDTO selectById(@Param("id") Integer id);

    // (4) 새 글 등록
    int insertPost(PostDTO post);

    // (5) 글 수정
    int updatePost(PostDTO post);

    // (6) 다중 삭제
    int deleteByIds(@Param("ids") List<Integer> ids);


    int countByBoardAndSubject(
            @Param("boardId")  Integer boardId,
            @Param("keyword")  String keyword
    );

    List<PostDTO> selectByBoardAndSubjectWithLimit(
            @Param("boardId")  Integer boardId,
            @Param("keyword")  String keyword,
            @Param("offset")   int offset,
            @Param("limit")    int limit
    );
}
