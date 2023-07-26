package com.mahapro.backend.mahapro;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.S3Object;
import com.mahapro.backend.mahapro.shared.utils.ParameterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.function.Consumer;

@SpringBootApplication
public class MahaproApplication implements CommandLineRunner {

	@Autowired
	AmazonS3 s3Client;

	public static void main(String[] args) {
		SpringApplication.run(MahaproApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		for (String arg : args) {
			String[] parts = arg.split("=", 2);
			String key = parts[0].substring(parts[0].indexOf("--"));
			String value = parts[1];

			ParameterUtils.addParameter(key, value);
		}
	}
}