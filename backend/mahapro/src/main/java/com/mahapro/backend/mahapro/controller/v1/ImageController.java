package com.mahapro.backend.mahapro.controller.v1;

import org.apache.commons.io.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Controller
@RequestMapping("/image")
public class ImageController {
    @GetMapping(value = "/{imageId}", produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] getImageFromImageId(@PathVariable("imageId") String imageId) throws IOException {
        InputStream in = new FileInputStream("D:\\dev\\StudentPro\\backend\\images\\" + imageId + ".png");
        return IOUtils.toByteArray(in);
    }
}
