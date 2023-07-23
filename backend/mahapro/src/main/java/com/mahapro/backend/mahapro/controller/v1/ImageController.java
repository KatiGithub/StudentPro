package com.mahapro.backend.mahapro.controller.v1;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.GetObjectRequest;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private AmazonS3 s3Client;

    @GetMapping(produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] getImageFromImageId(@RequestParam("imageRoute") String imageRoute) throws IOException {

        GetObjectRequest objectRequest = new GetObjectRequest("studentpro-image-bucket", imageRoute+".png");

        InputStream in = s3Client.getObject(objectRequest).getObjectContent();
        return IOUtils.toByteArray(in);
    }
}