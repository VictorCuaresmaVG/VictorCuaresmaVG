package pe.edu.vallegrande.prueba;

import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.SeguridadService;
import pe.edu.vallegrande.service.spec.SeguridadServiceSpec;

public class PruebaEmpleado implements SeguridadServiceSpec{ 
    public static void main(String[] args) {
        try {
            // Datos de consulta
            String email = "victor.cuaresma@gmail.com";
            String Password = "SALHUANA1130";
            // Proceso
            SeguridadServiceSpec service = new SeguridadService();
            EmpleadoModel bean = service.validar(email, Password);
            String reporte = "Datos incorrectos.";
            if (bean != null) {
                reporte = "Datos correctos. Hola Como estas " + bean.getNombres() +" "+ bean.getApellidos() +".";
            }
            // Reporte
            System.out.println(reporte);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

	@Override
	public EmpleadoModel validar(String email, String Password) {
		// TODO Auto-generated method stub
		return null;
	}

}
