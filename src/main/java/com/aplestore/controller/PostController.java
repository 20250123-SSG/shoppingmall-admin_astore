package com.aplestore.controller;

import com.aplestore.dto.PostDTO;
import com.aplestore.dto.UserDTO;
import com.aplestore.service.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {

    private final PostService postService;

    @GetMapping("/list.page")
    public void postListPage(@RequestParam(value = "page", defaultValue = "1") int page , Model model){
        Map<String, Object> map = postService.getPostsAndPaging(page);

        model.addAttribute("list",map.get("list"));
        model.addAttribute("page",map.get("page"));
        model.addAttribute("totalPage",map.get("totalPage"));
        model.addAttribute("beginPage",map.get("beginPage"));
        model.addAttribute("endPage",map.get("endPage"));

    }
    @GetMapping("/detail.page")
    public void postDetailPage(int no, Model model){

        Map<String, Object> map = postService.getPostDetail(no);
        model.addAttribute("post", map.get("post")); // ${board.boardTitle} ..
    }

//    @GetMapping("/regist.page")
//    public void postregistPage(){}
//
//    @PostMapping("/regist.do")
//    public String registPost(@RequestParam String postSubject,
//                               @RequestParam String postContent, HttpSession session, RedirectAttributes redirectAttributes) {
//        PostDTO post = new PostDTO();
//        post.setPostSubject(postSubject);
//        post.setPostContent(postContent);
//
//        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
//
//        int result = postService.registPost(post, Integer.parseInt(loginUser.getUserId()));
//
//        redirectAttributes.addFlashAttribute("message", result > 0 ? "등록 성공" : "등록 실패");
//        return "redirect:/post/list.page";
//
//    }
//    @GetMapping("/modify.page") //   /menu/modify.page?code=xx
//    public void postModifyPage(int no, Model model){
//        model.addAttribute("menu", postService.getPostDetail(no));
//        //return "menu/modify";
//    }
//    @PostMapping("/modify.do")
//    public String modifyPost(PostDTO post, RedirectAttributes redirectAttributes){
//        int result = postService.modifyPost(post);
//
//        String message = null;
//        if(result > 0){
//            message = "수정되었습니다.";
//        }else{
//            message = "실패하였습니다.";
//        }
//        redirectAttributes.addFlashAttribute("message", message);
//
//        return "redirect:/post/detail.page?no=" + post.getId();
//
//    }
@GetMapping("/modify.page")
public String showEditForm(@RequestParam("no") Integer id, Model model) {
    PostDTO post = postService.findById(id);
    model.addAttribute("post", post);
    return "post/modify";   // /WEB-INF/views/post/edit.jsp
}

    /** 6.2 수정 처리 */
    @PostMapping("/edit")
    public String doEdit(@ModelAttribute PostDTO postDTO,
                         RedirectAttributes ra) {
        postService.updatePost(postDTO);
        ra.addFlashAttribute("msg", "글이 수정되었습니다.");
        return "redirect:/post/list.page";
    }

    @GetMapping("/list")
    public String list(Model m){
        m.addAttribute("postList", postService.findAll());
        return "posts/list.page";
    }
    @PostMapping("/delete")
    public String delete(@RequestParam("postIds") List<Integer> ids,
                         RedirectAttributes ra){
        postService.deletePosts(ids);
        ra.addFlashAttribute("msg", "삭제 완료");
        return "redirect:/post/list.page";
    }



    // 2) 글쓰기 폼
    @GetMapping("/regist.page")
    public String showRegistForm() {
        return "post/regist";  // /WEB-INF/views/post/regist.jsp
    }

    // 3) 글쓰기 처리
    @PostMapping("/regist")
    public String doRegist(@ModelAttribute PostDTO postDTO,
                           RedirectAttributes ra) {
        // 상태 기본값 설정
        postDTO.setPostStatus("1");
        postService.createPost(postDTO);
        ra.addFlashAttribute("msg", "새 글이 등록되었습니다.");
        return "redirect:/post/list.page";
    }
}
