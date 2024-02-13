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

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve data from request parameters
        String name = request.getParameter("carName");
        String priceHour = request.getParameter("priceHour");
        String type = request.getParameter("carType");
        String noOfCars = request.getParameter("noOfCars");

        try {
            // JDBC connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            // SQL query to insert data
            String query = "INSERT INTO cardetails (CAR_NAME, PRICE_HOUR, TYPE, NO_OF_CARS) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, name);
                pst.setString(2, priceHour);
                pst.setString(3, type);
                pst.setString(4, noOfCars);

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Data inserted successfully!");
                } else {
                    out.println("Failed to insert data.");
                }
            }

            // Close resources
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(out);
        }
    }
}
