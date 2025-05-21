package com.aplestore.service;

import com.aplestore.common.PageUtil;
import com.aplestore.dao.PostMapper;
import com.aplestore.dto.PostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostMapper postMapper;
    private final PageUtil   pageUtil;


    @Override
    public PostDTO findById(Integer id) {
        return postMapper.selectById(id);
    }

    @Override
    public void createPost(PostDTO post) {
        postMapper.insertPost(post);
    }

    @Override
    public void updatePost(PostDTO post) {
        postMapper.updatePost(post);
    }

    @Override
    public void deletePosts(List<Integer> ids) {
        postMapper.deleteByIds(ids);
    }


    @Override
    public Map<String,Object> getPostsAndPagingByBoard(
            Integer boardId, int page, String keyword) {

        // 1) 검색어 포함 전체 건수
        int totalCount = postMapper.countByBoardAndSubject(boardId, keyword);

        // 2) 페이지 정보 계산 (display, pagePerBlock 상수로 조정)
        Map<String,Object> pageInfo = pageUtil.getPageInfo(
                totalCount, page, 5, 5);

        int offset  = (Integer) pageInfo.get("offset");
        int display = (Integer) pageInfo.get("display");

        // 3) 검색어 포함 페이징 리스트 조회
        List<PostDTO> list = postMapper
                .selectByBoardAndSubjectWithLimit(
                        boardId, keyword, offset, display);

        // 4) 결과에 합치기
        pageInfo.put("list",    list);
        pageInfo.put("boardId", boardId);
        pageInfo.put("keyword", keyword);
        return pageInfo;
    }
}
