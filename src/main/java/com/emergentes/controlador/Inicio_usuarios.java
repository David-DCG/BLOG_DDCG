package com.emergentes.controlador;

import com.emergentes.dao.UsuariosDAO;
import com.emergentes.dao.UsuariosDAOimpl;
import com.emergentes.modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Inicio_usuarios", urlPatterns = {"/inicio_usuarios"})
public class Inicio_usuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UsuariosDAO dao = new UsuariosDAOimpl();
            int id;
            Usuarios user = new Usuarios();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("usuarios", user);
                    request.getRequestDispatcher("formusuarios.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    user = dao.getById(id);
                    System.out.println(user);
                    request.setAttribute("usuarios", user);
                    request.getRequestDispatcher("formusuarios.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath() + "/inicio_usuarios");
                    break;
                case "view":
                    List<Usuarios> lista = dao.getAll();
                    request.setAttribute("mostrarusuario", lista);
                    request.getRequestDispatcher("verusuarios.jsp").forward(request, response);
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
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        Usuarios user = new Usuarios();
        user.setId(id);
        user.setUsuario(usuario);
        user.setPassword(password);
        if (id == 0) {
            try {
                UsuariosDAO dao = new UsuariosDAOimpl();
                dao.insert(user);
                response.sendRedirect(request.getContextPath() + "/inicio_usuarios");
            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
            }

        } else {
            try {
                UsuariosDAO dao = new UsuariosDAOimpl();
                dao.update(user);
                response.sendRedirect(request.getContextPath() + "/inicio_usuarios");
            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
            }
        }
    }
}
