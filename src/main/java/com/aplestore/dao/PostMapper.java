package com.aplestore.dao;

import com.aplestore.dto.PostDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;
@Mapper
public interface PostMapper {
    int selectPostListCount();
    List<PostDTO> selectPostList(Map<String, Object> map);

    PostDTO selectPostByNo(int no);


    //int insertPost(PostDTO post);
    //int updatePost(PostDTO post);

    List<PostDTO> selectAll();
    int deleteByIds(@Param("ids") List<Integer> ids);

    // 단일 조회 (수정 폼용)
    PostDTO selectById(@Param("id") Integer id);
    int insertPost(PostDTO post);
    int updatePost(PostDTO post);
}