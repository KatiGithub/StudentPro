package com.mahapro.backend.mahapro.service.impl;

import com.mahapro.backend.mahapro.service.ImageService;
import com.mahapro.backend.mahapro.shared.utils.MathUtils;
import com.mahapro.backend.mahapro.shared.utils.ParameterUtils;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

@Service
public class ImageServiceImpl implements ImageService  {

    private final String imageLocation;

    public ImageServiceImpl() {
        this.imageLocation = "D:\\dev\\StudentPro\\backend\\images\\";
//        this.imageLocation = ParameterUtils.getParameterValue("imageLocation");
    }

    @Override
    public InputStream getImage(String route) throws FileNotFoundException {
        String[] parts = route.split("/", 2);
        String imageType = parts[0];
        String key = parts[1];

        String f_imageLocation = imageLocation;

        Integer subfolder = MathUtils.findMaxDivision(Integer.parseInt(parts[1]), 1000);

        f_imageLocation = f_imageLocation.concat(imageType+"\\"+subfolder.toString()+"\\"+key+".png");
        InputStream inputStream = new FileInputStream(f_imageLocation);

        return inputStream;
    }
}
