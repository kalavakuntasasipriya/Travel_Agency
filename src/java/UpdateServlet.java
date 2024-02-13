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

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve data from request parameters
        int carId = Integer.parseInt(request.getParameter("id"));
        String newCarName = request.getParameter("carName");
        String newPriceHour = request.getParameter("priceHour");
        String newCarType = request.getParameter("carType");
        String newNoOfCars = request.getParameter("noOfCars");

        try {
            // JDBC connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            // SQL query to update data
            String query = "UPDATE cardetails SET CAR_NAME=?, PRICE_HOUR=?, TYPE=?, NO_OF_CARS=? WHERE ID=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, newCarName);
                pst.setString(2, newPriceHour);
                pst.setString(3, newCarType);
                pst.setString(4, newNoOfCars);
                pst.setInt(5, carId);

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Data updated successfully!");
                } else {
                    out.println("Failed to update data.");
                }
            }

            // Close resources
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(out);
        }
    }
}
