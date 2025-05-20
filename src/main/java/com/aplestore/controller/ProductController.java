package com.aplestore.controller;

import com.aplestore.dto.ProductModelOptionDTO;
import com.aplestore.dto.StoreDTO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aplestore.service.ProductService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/products")
@Controller
public class ProductController {

    private final ProductService productService;

    @GetMapping("")
    public String mainPage() {
        return "products/list";  // 승주님 상품목록 페이지
    }

    @GetMapping("/regist")
    public String registPage() {
        return "products/regist";  // 승주님 상품목록 페이지
    }

    @PostMapping("/regist")
    public String registProduct(ProductModelOptionDTO product, @RequestParam("uploadFile") MultipartFile uploadFile) {
        // DB등록
        int result = productService.registProduct(product);
        if (result == 0) {
            // 등록실패메시지 출력
            log.debug("다시 입력해주십시오. 등록페이지로 돌아갑니다.");
            return "products/regist"; // 등록 페이지로 포워딩
        }

        // 이미지 저장
        String imgPath = "C:/upload/";
        File dir = new File(imgPath);
        if (!dir.exists()) {
            dir.mkdirs();  // 폴더가 없으면 생성
        }

        String newFilename = product.getModelName() + "_" + product.getId().toString() + ".png";
        File saveFile = new File(dir, newFilename);

        try {
            uploadFile.transferTo(saveFile);
        } catch (IOException e) {
            log.debug("파일 저장에 실패하였습니다. ", e);
            e.printStackTrace();
        }
        log.debug("상품등록성공하였습니다. 이미지는 upload폴더를 확인해주세요.");
        return "redirect:/products"; // 중복등록방지를 위해 redirect
    }

}