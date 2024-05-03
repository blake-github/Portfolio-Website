package com.example.portfoliowebsite;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import java.net.URL;

@WebServlet(name = "PortfolioServlet", value = "/PortfolioServlet")
public class PortfolioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            String path = request.getServletContext().getRealPath("/WEB-INF/workData.xml");
            Document doc = builder.parse(new File(path));
            NodeList projects = doc.getElementsByTagName("project");
            StringBuilder sb = new StringBuilder();
            sb.append("<html><head><title>My Portfolio</title>");
            sb.append("<style>");
            sb.append("body {");
            sb.append("  font-family: Arial, sans-serif;");
            sb.append("  background-color: #121212;");
            sb.append("  color: #fff;");
            sb.append("}");
            sb.append(".container {");
            sb.append("  max-width: 800px;");
            sb.append("  margin: 0 auto;");
            sb.append("  padding: 20px;");
            sb.append("}");
            sb.append(".project-link {");
            sb.append("  display: block;");
            sb.append("  margin-bottom: 20px;");
            sb.append("  padding: 20px;");
            sb.append("  background: linear-gradient(to right, #007BFF, #00BFFF);");
            sb.append("  color: #fff;");
            sb.append("  text-decoration: none;");
            sb.append("  border-radius: 10px;");
            sb.append("  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);");
            sb.append("  transition: transform 0.3s ease;");
            sb.append("}");
            sb.append(".project-link:hover {");
            sb.append("  transform: translateY(-5px);");
            sb.append("}");
            sb.append("</style>");
            sb.append("</head><body>");

            sb.append("<div class='container'>");
            for (int i = 0; i < projects.getLength(); i++) {
                Node project = projects.item(i);
                if (project.getNodeType() == Node.ELEMENT_NODE) {
                    Element projectElement = (Element) project;
                    String name = projectElement.getElementsByTagName("name").item(0).getTextContent();
                    String link = projectElement.getElementsByTagName("link").item(0).getTextContent();
                    sb.append("<a href='").append(link).append("' class='project-link'>").append(name).append("</a><br/>");
                }
            }
            sb.append("</div>");
            sb.append("</body></html>");
            response.getWriter().write(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
