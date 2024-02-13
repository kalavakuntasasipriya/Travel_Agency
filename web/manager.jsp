<%-- 
    Document   : Retrivejsp
    Created on : 18-Dec-2023, 7:11:49 pm
    Author     : sunny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            background-image: url('back_manager.jpg');
            background-repeat: no-repeat;
            background-size: cover;     
            margin: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
        }
        
        h1 
        {
            font-size: 60px;
            color: white;
            margin-top: 20px;
            text-align: center;
        }

        form 
        {
            margin-top: 10px;
            text-align: center;
        }

        input[type="submit"] 
        {
            font-size: 20px; 
            padding: 10px 15px; 
            background-color: #b3f4a7; 
            color: rgb(33, 32, 32); 
            border: none;
            cursor: pointer;
            margin-top: 50px;
            
        }

        input[type="submit"]:hover 
        {
            background-color:  #f1a753; 
        }
    </style>  
    </head>
    <body>
        <h1>Manager</h1>
        <form  action="cardetails.html" method="post">
            <input name="name1" type="submit" value="View Car Details">
        </form>
        
        <form action="FeedbackServlet" method="post">
            <input name="name2"  type="submit" value="View Feedback">
        </form>
        
        <form action="retrieve_register" method="post">
            <input name="name2" type="submit" value="Login Details">
        </form>
    </body>
</html>
