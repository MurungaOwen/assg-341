/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Trips.controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Trips.util.dbConnection;

public class SaveTrip extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        String department = req.getParameter("department");
        String destination = req.getParameter("destination");
        String days = req.getParameter("days");
        String description = req.getParameter("description");
        String specialRequest = req.getParameter("special_request");
        String totalStudents = req.getParameter("total_students");

        String query = "INSERT INTO trips (department, destination, days, description, special_request, total_students) " +
                       "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = dbConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setString(1, department);
            stmt.setString(2, destination);
            stmt.setInt(3, Integer.parseInt(days));
            stmt.setString(4, description);
            stmt.setString(5, specialRequest);
            stmt.setInt(6, Integer.parseInt(totalStudents));

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Data inserted successfully.");
            } else {
                System.out.println("Error inserting data.");
            }
            res.sendRedirect("dbTrips.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
           System.out.println("db Error");
        } catch (NumberFormatException ex) {
            System.out.println("db Error");
        }
    }
}

