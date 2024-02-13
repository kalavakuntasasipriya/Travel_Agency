<!DOCTYPE html>
<html>
<head>
    
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>




<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
     <style>
        body {
            font-family: Arial, sans-serif;
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f0f0f0;
            border: 1px solid #green;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .popup h3 {
            color: #333;
        }
        .popup button {
            padding: 8px 16px;
            margin-top: 10px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
        /* Styling for background overlay */
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .payment_details {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff; 
            border: 2px solid #ccc; 
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            height: 530px;
        }
        .payment_details h2 {
            text-align: center;
            color: #4682B4; 
        }
        .payment_details p {
            text-align: center;
            color: #333; 
        }
        /* Add CSS to style the button */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 10px;
}

.center-box {
    background-color: green;
    padding: 10px;
    border-radius: 10px;
}

.btn {
    font-size: 18px;
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    background-color: green;
    display: inline-block;
    text-align: center;
}

    </style>
</head>
<body>
    
     <div class="overlay" id="overlay"></div>
    
    <!-- Popup content -->
    <div class="popup" id="popup">
        <center><h1>Hello, <%= session.getAttribute("submittedName") %>!</h1></center>
        <center><h3>Thank You!</h3></center>
        <p>You have successfully booked <u><b> <%= request.getAttribute("car_name")%></b> </u> car.</p>
        <center><p>Have a nice day :)</p></center>
        <center><button onclick="closePopup()">OK</button></center>
    </div>

    <script>
        // JavaScript function to display the popup
        function showPopup() {
            document.getElementById("overlay").style.display = "block";
            document.getElementById("popup").style.display = "block";
        }

        // JavaScript function to close the popup
        function closePopup() {
            document.getElementById("overlay").style.display = "none";
            document.getElementById("popup").style.display = "none";
        }

        // Show the popup when the page loads
        window.onload = function() {
            showPopup();
        };
    </script>

    <div class="payment_details">
        <h2>Payment Details</h2>  <br>
        <p><b>Name of the customer : </b> <%= request.getAttribute("name") %></p>
        <p><b>Email of customer : </b> <%= request.getAttribute("email") %></p>
        <p><b>Contact Number :  </b><%= request.getAttribute("number") %></p>
        <p><b>Name of the car : </b><%= request.getAttribute("car_name") %></p>
        <p><b>Type of the car : </b><%= request.getAttribute("type") %></p>
        <p><b>Booking Date : </b><%= request.getAttribute("bookingdate") %></p>
        <p><b>Charge Per Hour : </b><%= request.getAttribute("charge_per_hour") %></p>
        <p><b>No of Hours : </b><%= request.getAttribute("hours") %></p>
        <p><b>Amount to be paid : </b><%= request.getAttribute("amount") %></p>
        
        <br><br><br>
    <div class="container">
        <div class="center-box">
            <a href="downloadPaymentDetails.jsp" download="payment_details.txt">
                <button type="button" class="btn btn-primary">
                    <i class="fa fa-download"></i> Download
                </button>
            </a>
        </div>
    </div>
    </div>
</body>
</html>
