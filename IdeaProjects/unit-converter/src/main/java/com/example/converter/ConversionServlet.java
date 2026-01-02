package com.example.converter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ConversionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String category = req.getParameter("category");
        String from = req.getParameter("from");
        String to = req.getParameter("to");

        double value;

        // HEIGHT HANDLING
        if ("height".equalsIgnoreCase(category)) {

            String feetStr = req.getParameter("feet");
            String inchesStr = req.getParameter("inches");

            double feet = 0;
            double inches = 0;

            if (feetStr != null && !feetStr.isEmpty()) {
                feet = Double.parseDouble(feetStr);
            }

            if (inchesStr != null && !inchesStr.isEmpty()) {
                inches = Double.parseDouble(inchesStr);
            }

            // Convert height to inches
            value = (feet * 12) + inches;

            // Base unit for height
            from = "in";

        } else {
            value = Double.parseDouble(req.getParameter("value"));
        }

        double result = ConverterUtil.convert(category, from, to, value);

        req.setAttribute("result", result);
        req.setAttribute("category", category);
        req.setAttribute("from", from);
        req.setAttribute("to", to);

        RequestDispatcher rd = req.getRequestDispatcher("result.jsp");
        rd.forward(req, resp);
    }
}
