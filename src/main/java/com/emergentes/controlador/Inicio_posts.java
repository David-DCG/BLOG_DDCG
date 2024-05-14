package com.emergentes.controlador;

import com.emergentes.dao.PostsDAO;
import com.emergentes.dao.PostsDAOimpl;
import com.emergentes.modelo.Posts;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Inicio_posts", urlPatterns = {"/inicio_posts"})
public class Inicio_posts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PostsDAO dao = new PostsDAOimpl();
            int id;
            Posts pos = new Posts();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("posts", pos);
                    request.getRequestDispatcher("formposts.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pos = dao.getById(id);
                    System.out.println(pos);
                    request.setAttribute("posts", pos);
                    request.getRequestDispatcher("formposts.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath() + "/inicio_posts");
                    break;
                case "view":
                    List<Posts> lista = dao.getAll();
                    request.setAttribute("mostrarpost", lista);
                    request.getRequestDispatcher("verposts.jsp").forward(request, response);
                default:
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");
        Posts pos = new Posts();
        pos.setId(id);
        pos.setFecha(fecha);
        pos.setTitulo(titulo);
        pos.setContenido(contenido);
        if (id == 0) {
            try {
                PostsDAO dao = new PostsDAOimpl();
                dao.insert(pos);
                response.sendRedirect(request.getContextPath() + "/inicio_posts");
            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
            }

        } else {
            try {
                PostsDAO dao = new PostsDAOimpl();
                dao.update(pos);
                response.sendRedirect(request.getContextPath() + "/inicio_posts");
            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
            }
        }
    }
}
