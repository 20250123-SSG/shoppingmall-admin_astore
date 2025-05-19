package com.aplestore.controller;

import com.aplestore.dto.UserDTO;
import com.aplestore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // 사용자 목록
    @GetMapping("/list")
    public String listUsers(Model model) {
        List<UserDTO> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users/list";
    }

    // 사용자 상세 정보
    @GetMapping("/detail")
    public String userDetail(@RequestParam("id") int id, Model model) {
        UserDTO user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "users/detail";
    }

    // 사용자 등록 폼
    @GetMapping("/insert")
    public String showInsertForm(Model model) {
        model.addAttribute("user", new UserDTO());
        return "users/insert";
    }

    // 사용자 등록 처리
    @PostMapping("/insert")
    public String insertUser(@ModelAttribute UserDTO user) {
        userService.insertUser(user);
        return "redirect:/users/list";
    }

    // 사용자 수정 폼
    @GetMapping("/update")
    public String showUpdateForm(@RequestParam("id") int id, Model model) {
        UserDTO user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "users/update";
    }

    // 사용자 수정 처리
    @PostMapping("/update")
    public String updateUser(@ModelAttribute UserDTO user) {
        userService.updateUser(user);
        return "redirect:/users/list";
    }

    // 사용자 삭제 처리
    @GetMapping("/delete")
    public String deleteUser(@RequestParam("id") int id) {
        userService.deleteUser(id);
        return "redirect:/users/list";
    }

    // 사용자 검색
    @GetMapping("/search")
    public String searchUsers(@RequestParam(required = false) String keyword,
                              @RequestParam(required = false) String status,
                              Model model) {
        List<UserDTO> users = userService.searchUsers(keyword, status);
        model.addAttribute("users", users);
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);
        return "users/list";
    }
}
