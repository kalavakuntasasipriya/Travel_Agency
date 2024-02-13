<html>
<head>
	<title>BOOK NOW</title>
	<style>
		body
		{
			margin: 0px;
			padding: 0px;
			background-image: url("book.jpg");
			background-size: cover;
			background-repeat: no-repeat;
                        background-position: center;
                       
		}
		/* form */
		.h1
		{
			text-align: center;
			font-size: 35px;
			color: #4682B4;
		}
		.form
		{
			border-radius: 20px;
			background-color: rgba(255,255,255,0.5);
			padding: 40px;
			width: 400px;
			position: relative;
			right: -80px;
		}	
		.input
		{
			width: 100%;
			margin-top: 10px;
			margin-bottom: 10px;
			border-radius: 10px;
			background-color: white;
			font-size: 15px;
			color: black;
			padding: 5px;
		}
		.submit
		{
			position: relative;
			left: 75px;
			margin-top: 10px;
			margin-bottom: -10px;
			font-size: 17px;
			border-radius: 20px;
			padding: 10px;
			color: black;
			background-color: #AFEEEE;
		}
		.copy
		{
			background-color: black;
			color: white;
			padding: 10px;
			text-align: center;
		}
	</style>
</head>
<body>
	<!-- form -->
	<div class="main">
            <br>
		<h1 class="h1" style="font-size: 50px; color: white;">BOOK  NOW</h1>
		<form class="form" action="bmw" method="post" name="myform" >
                                <span><b>Name:</b></span>
				<input class="input" type="text" name="name"  placeholder="Enter Your Name..." >
                                <span><b>Your Email:</b></span>
				<% String email = (String) session.getAttribute("email"); %>
                                <input class="input" type="email" id="email" name="email" value="<%= email %>" readonly>
                                <span><b>Your Contact:</b></span>
				<input class="input" type="tel" name="number" placeholder="Enter Your Contact Number..." pattern="[6-9]{1}[0-9]{9}">
                                <span><b>Car Name:</b></span>
				<input class="input" value="Maruti Susuki Alto 800" name="car_name"  readonly >
                                <span><b>Type of car:</b></span>
				<input class="input" value="NON-AC" name="type"  readonly >
                                <span><b>Date of booking</b></span>
				<input class="input" type="date" name="bookingdate" >
                                <span><b>Charge per hour</b></span>
                                <input class="input" value="4800" name="charge_per_hour"   readonly >
                                <span><b>No of Hours</b></span>
				<input class="input" type="text" name="hours" >
                             
			<input class="submit" type="reset" value="Refresh" name="submit">
			<input class="submit" type="submit" value="Confirm Booking" name="submit">
		</form>
	</div>
</body>
</html>