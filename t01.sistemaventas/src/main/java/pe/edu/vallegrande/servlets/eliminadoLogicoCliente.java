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
 * Servlet implementation class eliminadoLogicoCliente
 */
@WebServlet("/eliminadoLogicoCliente")
public class eliminadoLogicoCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String id = request.getParameter("id");
		String state = request.getParameter("estado");
		String inactivo="I";
		try {
			
			Integer convertir = Integer.parseInt(id);
			connection = AccesoDB.getConnection();

			if (!state.equals(inactivo)) {
				String sql = "UPDATE client SET state = 'I' WHERE Id = ?";

				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, convertir);
				preparedStatement.executeUpdate();

				response.sendRedirect("clientes.jsp");
			} else {
				String sql = "UPDATE client SET state = 'A' WHERE Id = ?";

				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, convertir);
				preparedStatement.executeUpdate();

				response.sendRedirect("Eliminados.jsp");
			}
			

		} catch (SQLException e) {
			response.getWriter().write("Error: " + e.getMessage());
		}
	}

}
