package pe.edu.vallegrande.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.db.AccesoDB;

/**
 * Servlet implementation class actualizarDatos
 */
@WebServlet("/actualizarDatos")
public class actualizarDatos extends HttpServlet {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection cn = null;
		PreparedStatement pstm;

		String id = request.getParameter("id");
		String nombres = request.getParameter("nombres");
		String apellidos = request.getParameter("apellidos");
		String tipoDocumento = request.getParameter("tipoDocumento");
		String numeroDocumento = request.getParameter("numeroDocumento");
		String email = request.getParameter("email");
		String contraseña = request.getParameter("contraseña");
		String celular = request.getParameter("celular");
		String birthdate = request.getParameter("birthdate");
		try {
			cn = AccesoDB.getConnection();
			String sql = "Update client Set names = ? , last_names = ? , documentType = ?, documentNumber = ?, email = ?, Password = ?, phone = ?, birthdate =?  Where id=? ";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, nombres);
			pstm.setString(2, apellidos);
			pstm.setString(3, tipoDocumento);
			pstm.setString(4, numeroDocumento);
			pstm.setString(5, email);
			pstm.setString(6, contraseña);
			pstm.setString(7, celular);
			pstm.setString(8, birthdate);
			pstm.setString(9, id);
			pstm.executeUpdate();
			response.sendRedirect("clientes.jsp");

		} catch (SQLException e) {
			response.sendRedirect("RegistrarCliente.jsp");

		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}

	}

}
