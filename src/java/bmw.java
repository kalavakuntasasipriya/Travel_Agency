import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class bmw extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String car_name = request.getParameter("car_name");
        String type = request.getParameter("type");
        String bookingdate = request.getParameter("bookingdate");
        String charge_per_hour = request.getParameter("charge_per_hour");
        String hours = request.getParameter("hours");

        
        
        int chargePerHour = 0;
        int hoursValue = 0;
        int amount = 0;

        
        try {
            chargePerHour = Integer.parseInt(charge_per_hour);
            hoursValue = Integer.parseInt(hours);
            amount = chargePerHour * hoursValue;
            
        } catch (NumberFormatException e) {
            // Handle parsing errors
            e.printStackTrace();
            // Optionally, you may send an error response here
        }
        
        String submittedName = request.getParameter("name");

        // Store the name in a session attribute
        request.getSession().setAttribute("submittedName", submittedName);

        
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("number", number);
        request.setAttribute("car_name", car_name);
        request.setAttribute("type", type);
        request.setAttribute("bookingdate", bookingdate);
        request.setAttribute("charge_per_hour", charge_per_hour);
        request.setAttribute("hours", hours);
        request.setAttribute("amount", amount);
        // Forward the request to another JSP page
        request.getRequestDispatcher("/success.jsp").forward(request, response);



        Connection con = null;

        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            con.setAutoCommit(false); // Disable auto-commit

            String query = "INSERT INTO book (name, email, number, car_name, type,bookingdate, charge_per_hour, hours, amount) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = con.prepareStatement(query);

 preparedStatement.setString(1, name);
preparedStatement.setString(2, email);
preparedStatement.setString(3, number);
preparedStatement.setString(4, car_name);
preparedStatement.setString(5, type);
preparedStatement.setString(6, bookingdate);
preparedStatement.setInt(7, chargePerHour);
preparedStatement.setInt(8, hoursValue);
preparedStatement.setInt(9, amount);
            

            int status = preparedStatement.executeUpdate();

      String carName = request.getParameter("car_name");

// Perform a SQL UPDATE query to decrement the count of available cars for the selected car name
String sql = "UPDATE cardetails SET no_of_cars = no_of_cars - 1 WHERE car_name = ?";

try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");
     PreparedStatement pstmt = conn.prepareStatement(sql)) {
    
    pstmt.setString(1, carName);
    pstmt.executeUpdate();
    // Optionally, insert booking details into the 'book' table
    // Commit the transaction if required
} catch (SQLException e) {
    // Handle exceptions
    e.printStackTrace();
}

            if (status == 1) {
                System.out.println("Inserted...");
                con.commit(); // Commit the transaction
            } else {
                System.out.println("Not...");
                con.rollback(); // Rollback the transaction if not successful
            }

        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            e.printStackTrace();
            try {
                if (con != null) {
                    con.rollback(); // Rollback the transaction
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (con != null) {
                    con.close(); // Close the connection in the finally block
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
