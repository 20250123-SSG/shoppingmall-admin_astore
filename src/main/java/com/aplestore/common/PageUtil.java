package com.aplestore.common;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class PageUtil {
    /**
     *
     * @param totalCount        게시글 총 개수
     * @param page              현재 페이지 번호
     * @param display           한 페이지당 게시글 개수
     * @param pagePerBlock      페이징 바의 숫자
     */
    public Map<String,Object> getPageInfo(int totalCount, int page, int display, int pagePerBlock){

        int totalPage = (int)Math.ceil((double)totalCount / display);

        int beginPage = (page - 1) / pagePerBlock * pagePerBlock + 1;

        int endPage = Math.min(beginPage + pagePerBlock - 1, totalPage);

        int offset = (page - 1) * pagePerBlock;

        Map<String, Object> pageMap = new HashMap<String, Object>();

        pageMap.put("totalCount", totalCount);
        pageMap.put("page", page);
        pageMap.put("display", display);
        pageMap.put("pagePerBlock", pagePerBlock);
        pageMap.put("totalPage", totalPage);
        pageMap.put("beginPage", beginPage);
        pageMap.put("endPage", endPage);
        pageMap.put("offset", offset);

        return pageMap;
    }
}
