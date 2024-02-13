<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>
<head>
    <title>Travel Agency Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("feedback3.jpg");
            background-size: cover;
	    background-repeat: no-repeat;
            background-position: center;
            padding: 100px;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            color: #fff;
            padding: 15px;
            text-align: center;
            position: fixed; 
            top: 0; 
            width: 80%;
        }
        .navbar a {
            display: inline-block; 
            color: white;
            text-align: center;
            padding: 14px 25px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        input[type="text"] {
            padding: 8px;
            font-size: 16px;
            display: inline-block; /* Align the search input and button in the same line */
        }
        .navbar button {
            padding: 8px 12px;
            font-size: 16px;
        }
        #content {
            padding: 20px;
        }
        .section {
            margin-bottom: 40px;
            padding: 20px;
            background-color: #fff;
        }
        .feedback-form {
            width: 60%;
            margin: 0 auto;
            background-color: rgba(255,255,255,0.25);
            padding-left: 200px;
            padding:20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
            width: 97%;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #4682B4;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #35648B;
        }
    </style>
</head>
<body>
     <div class="navbar">
            <a href="main.html" style="font-size: 16px;">Home</a>
            <a href="aboutus.html" style="font-size: 16px;">About</a>
            <a href="AC.html" style="font-size: 16px;">AC</a>
            <a href="NON_AC.html" style="font-size: 16px;">NON-AC</a>
            <a href="contactinfose.html" style="font-size: 16px;">Contact</a>
            <a href="feedback.html" style="font-size: 16px;">Feedback</a>
            <a href="review.html" style="font-size: 16px;">Reviews</a>
            <a href="profile.jsp" style="font-size: 16px;">Profile</a>
     </div>
    <div class="feedback-form">
        <center><h2>Travel Agency Feedback</h2></center> <br>
        <form action="Feedback" method="post">
<div class="form-group">
    <label for="name">Name:</label>
    <% String email = (String) session.getAttribute("email"); %>
    <input type="text" id="name" name="name" value="<%= getNameFromDatabase(email) %>" readonly>
</div>

<div class="form-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= email %>" readonly>
</div>

            <div class="form-group">
                <label for="returning_date">Returning Date:</label>
                <input type="date" id="returning-date" name="returning_date">
            </div>
            <div class="form-group">
                <label>Your Overall Experience:</label>
                   <input type="radio" id="excellent" name="experience" value="Excellent">Excellent
                    <input type="radio" id="good" name="experience" value="Good">Good
                    <input type="radio" id="satisfactory" name="experience" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="experience" value="Poor">Poor
            </div>
            
            <div class="form-group">
                <label>Accuracy of the information provided in our website</label>
                    <input type="radio" id="excellent" name="accuracy" value="Excellent">Excellent
                    <input type="radio" id="good" name="accuracy" value="Good">Good
                    <input type="radio" id="satisfactory" name="accuracy" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="accuracy" value="Poor">Poor
            </div>
            
            <div class="form-group">
                <label>Booking process</label>
                    <input type="radio" id="excellent" name="booking" value="Excellent">Excellent
                    <input type="radio" id="good" name="booking" value="Good">Good
                    <input type="radio" id="satisfactory" name="booking" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="booking" value="Poor">Poor
            </div>
            
            <div class="form-group">
                <label>Vehicle condition</label>
                    <input type="radio" id="excellent" name="cond" value="Excellent">Excellent
                    <input type="radio" id="good" name="cond" value="Good">Good
                    <input type="radio" id="satisfactory" name="cond" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="cond" value="Poor">Poor
            </div>
            
            <div class="form-group">
                <label>Vehicle cleanliness</label>
                    <input type="radio" id="excellent" name="cleanliness" value="Excellent">Excellent
                    <input type="radio" id="good" name="cleanliness" value="Good">Good
                    <input type="radio" id="satisfactory" name="cleanliness" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="cleanliness" value="Poor">Poor
            </div>
            
            <div class="form-group">
                <label>Rental rates</label>
                    <input type="radio" id="excellent" name="rates" value="Excellent">Excellent
                    <input type="radio" id="good" name="rates" value="Good">Good
                    <input type="radio" id="satisfactory" name="rates" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="rates" value="Poor">Poor
            </div>
            
            
             <div class="form-group">
                <label>Overall rating for travel agency</label>
                    <input type="radio" id="excellent" name="rating" value="Excellent">Excellent
                    <input type="radio" id="good" name="rating" value="Good">Good
                    <input type="radio" id="satisfactory" name="rating" value="Satisfactory">Satisfactory
                    <input type="radio" id="poor" name="rating" value="Poor">Poor
            </div>
            <div class="form-group">
                <label for="feedback">How can we improve to serve you better?</label>
                <textarea id="feedback" name="feedback" rows="4" placeholder="you can give your suggestions here......"></textarea>
            </div>
            <div class="form-group">
                <center> <input type="submit" value="Submit Feedback"> </center>
            </div>
        </form>
    </div>
<%!
        public String getNameFromDatabase(String email) {
    String name = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelagency", "root", "sunny");

        String query = "SELECT name FROM register WHERE email=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
        }

        // Close connections
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return name;
}

    %>
</body>
</html>
