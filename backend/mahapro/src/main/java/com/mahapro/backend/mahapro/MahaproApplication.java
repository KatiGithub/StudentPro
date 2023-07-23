package com.mahapro.backend.mahapro;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.S3Object;
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
		S3Object object = s3Client.getObject("studentpro-image-bucket", "brand_banner/1.png");

//		displayTextInputStream(object.getObjectContent());
	}

	private static void displayTextInputStream(InputStream input) throws IOException {
		// Read the text input stream one line at a time and display each line.
		BufferedReader reader = new BufferedReader(new InputStreamReader(input));
		String line = null;
		while ((line = reader.readLine()) != null) {
			System.out.println(line);
		}
		System.out.println();
	}
}