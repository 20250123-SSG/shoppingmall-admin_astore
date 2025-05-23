package com.aplestore.service;

import com.aplestore.dto.PostDTO;
import java.util.List;
import java.util.Map;

public interface PostService {
    PostDTO            findById(Integer id);
    void               createPost(PostDTO post);
    void               updatePost(PostDTO post);
    void               deletePosts(List<Integer> ids);
    Map<String,Object> getPostsAndPagingByBoard(
            Integer boardId,
            int page,
            String keyword
    );
}
