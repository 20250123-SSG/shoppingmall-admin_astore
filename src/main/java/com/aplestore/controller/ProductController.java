package com.aplestore.controller;

import lombok.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aplestore.service.ProductService;

@RequiredArgsConstructor
@RequestMapping("/product")
@Controller
public class ProductController {

    private final ProductService productService;

}