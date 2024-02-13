import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InventoryServlet")
public class InventoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // JDBC connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            // SQL query to retrieve data
            String query = "SELECT * FROM cardetails";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            // Generate HTML table
            out.println("<html><head><title>Car Details</title></head><body>");
            out.println("<table border='1'><tr><th style='background-color: white; color: black;'>ID</th><th style='background-color: white; color: black;'>Car Name</th><th style='background-color: white; color: black;'>Price Per Hour</th><th style='background-color: white; color: black;'>Car Type</th><th style='background-color: white; color: black;'>Number of Cars</th></tr>");


            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("ID") + "</td>");
                out.println("<td>" + rs.getString("CAR_NAME") + "</td>");
                out.println("<td>" + rs.getString("PRICE_HOUR") + "</td>");
                out.println("<td>" + rs.getString("TYPE") + "</td>");
                out.println("<td>" + rs.getString("NO_OF_CARS") + "</td>");
                out.println("</tr>");
            }

            out.println("</table></body></html>");

            // Close resources
            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
