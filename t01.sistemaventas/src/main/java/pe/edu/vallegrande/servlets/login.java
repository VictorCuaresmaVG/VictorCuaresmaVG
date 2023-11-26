package pe.edu.vallegrande.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.SeguridadService;

/**
 * Servlet implementation class login
 */

@WebServlet("/iniciosesion")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		switch(path) {
		case "/iniciosesion":
			inicioSession(request,response);
			break;
			
		}
	}
	private void inicioSession(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// Variables
		String destino, Email, Password;
		EmpleadoModel empleado;
		try {
			// Datos
			Email = request.getParameter("correo");
			Password = request.getParameter("contraseña");
			// Proceso
			SeguridadService seguridad = new SeguridadService();
			empleado = seguridad.validar(Email, Password);
			if(empleado==null) {
				request.setAttribute("error", "Correo o Contraseña incorrecta");
				response.sendRedirect("index.jsp");

			} else {				
				request.getSession().setAttribute("usuario", empleado);
				response.sendRedirect("usuario.jsp");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

	}
}
