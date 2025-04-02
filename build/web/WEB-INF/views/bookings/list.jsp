<%@ page import="java.util.List" %>
<%@ page import="com.Trips.model.Trip" %>
<%@ page import="com.Trips.dao.Trips" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Trips</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 20px;
            max-width: 800px;
            margin: auto;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background: #28a745;
            color: white;
        }
                button {
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background: #218838;
        }
        </style>
    </head>
    <body>
        <h1>List of Trips</h1>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Department</th>
                    <th>Destination</th>
                    <th>Days</th>
                    <th>Description</th>
                    <th>Special Request</th>
                    <th>Total Students</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        List<Trip> trips = Trips.getAllTrips();
                        for (Trip trip : trips) {
                %>
                <tr>
                    <td><%= trip.getId() %></td>
                    <td><%= trip.getDepartment() %></td>
                    <td><%= trip.getDestination() %></td>
                    <td><%= trip.getDays() %></td>
                    <td><%= trip.getDescription() %></td>
                    <td><%= trip.getSpecialRequest() %></td>
                    <td><%= trip.getTotalStudent() %></td>
                    <td><%= trip.getCreatedAt() %></td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("<tr><td colspan='8'>Error fetching trips: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </body>
</html>

