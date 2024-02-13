<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%
    // Get payment details from request attributes
    String name = (String) request.getAttribute("name");
    String email = (String) request.getAttribute("email");
    String number = (String) request.getAttribute("number");
    String carName = (String) request.getAttribute("car_name");
    String bookingDate = (String) request.getAttribute("bookingdate");
    String chargePerHour = String.valueOf(request.getAttribute("charge_per_hour"));
    String hours = String.valueOf(request.getAttribute("hours"));
    String amount = String.valueOf(request.getAttribute("amount"));

    // Format payment details as text content
    String paymentDetails = "Payment Details:\n" +
            "Name of the customer: " + name + "\n" +
            "Email: " + email + "\n" +
            "Contact Number: " + number + "\n" +
            "Name of the car: " + carName + "\n" +
            "Booking Date: " + bookingDate + "\n" +
            "Charge Per Hour: " + chargePerHour + "\n" +
            "No of Hours: " + hours + "\n" +
            "Amount to be paid: " + amount + "\n";

    // Set response content type as text/plain
    response.setContentType("text/plain");
    response.setHeader("Content-Disposition", "attachment; filename=\"payment_details.txt\"");

    try (PrintWriter out = response.getWriter()) {
        out.println(content);
    } catch (IOException e) {
        e.printStackTrace();
    }
%>
