<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Profile Page</title>
</head>
<body>
    <h2>Customer Profile Information</h2>

    <%-- Retrieve email from session --%>
    <% String email = (String) session.getAttribute("email"); %>

    <%-- Database Connection --%>
    <% 
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

            String query = "SELECT name, email, contact, age FROM register WHERE email=?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String userEmail = rs.getString("email");
                String contact = rs.getString("contact");
                int age = rs.getInt("age");

                // Display retrieved user details
                out.println("<p>Name: " + name + "</p>");
                out.println("<p>Email: " + userEmail + "</p>");
                out.println("<p>Contact: " + contact + "</p>");
                out.println("<p>Age: " + age + "</p>");
            } else {
                out.println("<p>User details not found.</p>");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            // Close resources in the finally block
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                out.println("Error closing resources: " + ex.getMessage());
            }
        }
    %>
    <a href="index.html"><button style="width:75px;height:35px;background-color: lightgreen; color: red;"><b>Log Out</b></button></a> 
</body>
</html>
