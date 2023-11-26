package pe.edu.vallegrande.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.spec.SeguridadServiceSpec;

public class SeguridadService implements SeguridadServiceSpec{
	
	public EmpleadoModel validar(String email, String Password) {
        // Preparando los datos
        Connection cn = null;
        EmpleadoModel bean = null;
        // Proceso
        try {
            cn = AccesoDB.getConnection();
            String sql = "Select Id,documentType,documentNumber,names,last_names,phone,email, registration_date,Password,birthdate from client Where email =? and Password =?";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.setString(2, Password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                bean = new EmpleadoModel();
                bean.setId(rs.getInt("Id"));
                bean.setTipoDocumento(rs.getString("documentType"));
                bean.setNumeroDocumento(rs.getInt("documentNumber"));
                bean.setNombres(rs.getString("names"));
                bean.setApellidos(rs.getString("last_names"));
                bean.setCelular(rs.getInt("phone"));
                bean.setEmail(rs.getString("email"));
                bean.setFechaRegistro(rs.getString("registration_date"));
                bean.setPassword(rs.getString("Password"));
                bean.setBirthdate(rs.getString("birthdate"));
            }
            rs.close();
            pstm.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error en el proceso");
        } finally {
            try {
                cn.close();
            } catch (Exception e) {
            }
        }
        return bean;
    }
}
