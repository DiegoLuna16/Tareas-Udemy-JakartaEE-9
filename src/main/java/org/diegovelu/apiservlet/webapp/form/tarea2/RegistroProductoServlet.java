package org.diegovelu.apiservlet.webapp.form.tarea2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/crear")
public class RegistroProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String nombre = req.getParameter("nombre");
        Integer precio = null;
        try{
            precio = Integer.parseInt(req.getParameter("precio"));
        } catch (NumberFormatException e){}
        String fabricante = req.getParameter("fabricante");
        Map<String,String> errores = new HashMap<>();

        if(nombre == null || nombre.isEmpty()){
            errores.put("nombre", "El nombre no puede estar vacio!");
        }
        if(precio == null || precio < 0){
            errores.put("precio","El precio no puede estar vacio!");
        }
        if(fabricante == null || fabricante.isEmpty()){
            errores.put("fabricante","El fabricante no puede ser vacio!");
        }

        if(errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("   <head>");
                out.println("      <meta charset=\"UTF-8\">");
                out.println("      <title>Resultados del formulario</title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("      <h1>Resultados del Formulario</h1>");
                out.println("      <ul>");
                out.println("        <li>Nombre: "+nombre+"</li>");
                out.println("        <li>Precio: "+precio+"</li>");
                out.println("        <li>Fabricante: "+fabricante+"</li>");
                out.println("      </ul>");
                out.println("   </body>");
                out.println("</html>");
            }
        }else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            }

    }
}
