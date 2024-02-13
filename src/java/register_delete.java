import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class register_delete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve data from request parameters
        String name = request.getParameter("name");

        try {
            // JDBC connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            // SQL query to delete data based on name
            String query = "DELETE FROM Register WHERE name=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, name);

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    response.setContentType("text/html");
                    PrintWriter outSuccess = response.getWriter();
                    outSuccess.println("<script type=\"text/javascript\">");
                    outSuccess.println("alert('You have successfully delete account of customer');");
                    outSuccess.println("window.location='manager.jsp';");
                    outSuccess.println("</script>");
                }

                // Close resources
                con.close();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(out);
        }
    }
}
