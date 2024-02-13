import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve data from request parameters
        int carId = Integer.parseInt(request.getParameter("id"));

        try {
            // JDBC connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            // SQL query to delete data
            String query = "DELETE FROM cardetails WHERE ID=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setInt(1, carId);

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Data deleted successfully!");
                } else {
                    out.println("Failed to delete data.");
                }
            }

            // Close resources
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(out);
        }
    }
}
