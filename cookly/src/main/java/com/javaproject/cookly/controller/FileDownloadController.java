package com.javaproject.cookly.controller;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.nio.charset.StandardCharsets;

@RestController
public class FileDownloadController {

    @GetMapping("/downloadText")
    public ResponseEntity<byte[]> downloadTextFile(HttpSession session) {
        
        @SuppressWarnings("unchecked")
        StringBuilder sb = new StringBuilder();
        List<String> marketList = (List<String>) session.getAttribute("temporaryRecipe");
        if (marketList == null) {
            return ResponseEntity.badRequest().build();
        }
        marketList.forEach(item -> sb.append(item).append("\n"));
        
        byte[] contentBytes = sb.toString().getBytes(StandardCharsets.UTF_8);
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        headers.setContentDispositionFormData("attachment", "sample.txt"); // filename for download
        
        return new ResponseEntity<>(contentBytes, headers, HttpStatus.OK);
    }
}
