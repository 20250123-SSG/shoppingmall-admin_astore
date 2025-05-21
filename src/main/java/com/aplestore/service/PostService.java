package com.aplestore.service;

import com.aplestore.dto.PostDTO;
import java.util.List;
import java.util.Map;

public interface PostService {
    /**
     * boardId + 페이지 번호로 Map<page info, list> 반환
     */
    Map<String,Object> getPostsAndPagingByBoard(Integer boardId, int page);

    PostDTO            findById(Integer id);
    void               createPost(PostDTO post);
    void               updatePost(PostDTO post);
    void               deletePosts(List<Integer> ids);
}
