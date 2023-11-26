
package pe.edu.vallegrande.servlets;
import pe.edu.vallegrande.db.AccesoDB;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
@WebServlet("/report")
public class report extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String reportPath = getServletContext().getRealPath("WEB-INF/reports/repote.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);

            Connection conn = AccesoDB.getConnection();

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);

            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



