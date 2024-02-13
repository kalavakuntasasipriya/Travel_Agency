<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Feedback</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Feedback Given by customer</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Returning Date</th>
            <th>Experience</th>
            <th>Accuracy</th>
            <th>booking</th>
            <th>cond</th>
            <th>cleanliness</th>
            <th>rates</th>
            <th>rating</th>
            <th>feedback</th>
        </tr>
        <%
            try {
                ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("returning_date") %></td>
                        <td><%= rs.getString("experience") %></td>
                        <td><%= rs.getString("accuracy") %></td>
                        <td><%= rs.getString("booking") %></td>
                        <td><%= rs.getString("cond") %></td>
                        <td><%= rs.getString("cleanliness") %></td>
                        <td><%= rs.getString("rates") %></td>
                        <td><%= rs.getString("rating") %></td>
                        <td><%= rs.getString("feedback") %></td>
                    </tr>
        <%
                }
                rs.close();
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>
