<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>retrieve</title>
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
         form {
            text-align: center;
        }

        /* Style for the input field and button */
        input[type="text"] {
            padding: 8px;
            margin-bottom: 10px;
            width: 200px;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Login Details</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Contact</th>
            <th>Age</th>
        </tr>
        <%
            try {
                ResultSet rs = (ResultSet) request.getAttribute("resultSet2");
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("password") %></td>
                        <td><%= rs.getString("contact") %></td>
                        <td><%= rs.getInt("age") %></td>
                    </tr>
        <%
                }
                rs.close();
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    
    <br><br>
        <form action="register_delete" method="post">
        <b> Name:</b><input type="text" name="name"><br><br>
            <input name="name2" type="submit" value="Remove user">
        </form>
</body>
</html>
