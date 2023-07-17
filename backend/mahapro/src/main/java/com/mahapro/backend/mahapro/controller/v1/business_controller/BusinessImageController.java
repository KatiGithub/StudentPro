package com.mahapro.backend.mahapro.controller.v1.business_controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/business/image")
public class BusinessImageController {
    @PostMapping
    public ResponseEntity uploadImage(@RequestParam("image") MultipartFile multipartFile) {
        String fileName = StringUtils.getFilename(multipartFile.getOriginalFilename());
        String extension = StringUtils.getFilenameExtension(fileName);

        System.out.println(fileName);
        System.out.println(extension);

        return new ResponseEntity(HttpStatus.OK);
    }
}
