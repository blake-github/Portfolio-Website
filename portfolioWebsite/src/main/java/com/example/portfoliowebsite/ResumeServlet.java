package com.example.portfoliowebsite;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ResumeServlet", value = "/ResumeServlet")
public class ResumeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = request.getServletContext().getRealPath("/WEB-INF/Blake Moore Resume.pdf");
        File file = new File(filePath);
        response.setContentType("application/pdf");
        response.addHeader("Content-Disposition", "inline; filename=resume.pdf");
        response.setContentLength((int) file.length());
        FileInputStream fileInputStream = new FileInputStream(file);
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
        ServletOutputStream servletOutputStream = response.getOutputStream();
        int bytesRead;
        while ((bytesRead = bufferedInputStream.read()) != -1) {
            servletOutputStream.write(bytesRead);
        }
        servletOutputStream.flush();
        bufferedInputStream.close();
        servletOutputStream.close();
    }
}


