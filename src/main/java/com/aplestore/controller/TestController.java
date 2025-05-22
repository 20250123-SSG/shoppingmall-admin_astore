package com.aplestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class TestController {

    // 대시보드
    @GetMapping({"/testasdf"})
    public String showDashboard() {
        return "main/dashboard";
    }

    // 문의 목록
    @GetMapping("/testinquiries")
    public String showInquiryList() {
        return "inquiries/list";
    }

    // 문의 상세
    @GetMapping("/testinquiries/{id}")
    public String showInquiryDetail(@PathVariable String id) {
        return "inquiries/detail";
    }

    // 주문 목록
    @GetMapping("/testorders")
    public String showOrderList() {
        return "orders/list";
    }

    // 주문 상세
    @GetMapping("/testorders/{id}")
    public String showOrderDetail(@PathVariable String id) {
        return "orders/detail";
    }

    // 상품 목록
    @GetMapping("/testproducts")
    public String showProductList() {
        return "products/list";
    }

    // 상품 등록 폼
    @GetMapping("/testproducts/register")
    public String showProductRegisterForm() {
        return "products/register";
    }

    // 상품 상세
    @GetMapping("/testproducts/{id}")
    public String showProductDetail(@PathVariable String id) {
        return "products/detail";
    }

    // 사용자 목록
    @GetMapping("/testusers")
    public String showUserList() {
        return "users/list";
    }

    // 사용자 상세
    @GetMapping("/testusers/{id}")
    public String showUserDetail(@PathVariable String id) {
        return "users/detail";
    }

    // 관리자 프로필
    @GetMapping("/testadmin/profile")
    public String showAdminProfile() {
        return "admin/profile";
    }
}
