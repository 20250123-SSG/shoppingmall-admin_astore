package com.aplestore.controller;

import java.util.Map;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import com.aplestore.dto.LoginDTO;
import com.aplestore.service.LoginService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public String mainPage() {
        return "main/login";
    }

    @PostMapping(value = "/login", consumes = "application/json", produces = "application/json")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> payload, HttpSession session) {

        String userId = payload.get("username");
        String pwd = payload.get("password");

        LoginDTO user = loginService.login(userId, pwd);
        if (user != null) {
            session.setAttribute("loginMember", user);
            session.setMaxInactiveInterval(30 * 60); //session time
            return ResponseEntity.ok(Map.of("success", true));
        } else {
            return ResponseEntity
                    .ok(Map.of(
                            "success", false,
                            "message", "아이디 또는 비밀번호가 일치하지 않습니다."
                    ));
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "main/dashboard";
    }
}
