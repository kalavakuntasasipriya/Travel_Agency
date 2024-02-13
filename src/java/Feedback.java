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

public class Feedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String returning_date = request.getParameter("returning_date");
        String experience = request.getParameter("experience");
        String accuracy = request.getParameter("accuracy");
        String booking = request.getParameter("booking");
        String cond = request.getParameter("cond");
        String cleanliness = request.getParameter("cleanliness");
        String rates = request.getParameter("rates");
        String rating = request.getParameter("rating");
        String feedback = request.getParameter("feedback");

        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            String query = "INSERT INTO feedback (name, email, returning_date, experience, accuracy, booking, cond, cleanliness, rates, rating, feedback) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, returning_date);
            preparedStatement.setString(4, experience);
            preparedStatement.setString(5, accuracy);
            preparedStatement.setString(6, booking);
            preparedStatement.setString(7, cond);
            preparedStatement.setString(8, cleanliness);
            preparedStatement.setString(9, rates);
            preparedStatement.setString(10, rating);
            preparedStatement.setString(11, feedback);

            int status = preparedStatement.executeUpdate();

            if (status == 1) {
                
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Thank you for your valuable feedback!');");
                out.println("window.location.href = 'main.html';"); 
                out.println("</script>");
            }

        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (con != null) {
                    con.close(); // Close the connection in the finally block
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
