import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class retrieve_register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // JDBC connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            // SQL query to retrieve data
            String query = "SELECT name, email, password , contact , age FROM Register";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            // Forward the ResultSet to the Display Page (e.g., display.jsp)
            request.setAttribute("resultSet2", rs);
            RequestDispatcher rd = request.getRequestDispatcher("registerdisplay.jsp"); // Replace 'display.jsp' with your display page name
            rd.forward(request, response);

            // Close resources
            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
