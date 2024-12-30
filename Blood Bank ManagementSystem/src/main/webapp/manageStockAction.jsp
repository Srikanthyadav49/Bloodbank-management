<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("incdec");
String units = request.getParameter("units");

try {
    // Parse units to integer
    int units1 = Integer.parseInt(units);

    // Debugging: Print values
    out.println("Blood Group: " + bloodgroup + "<br>");
    out.println("Increment/Decrement: " + incdec + "<br>");
    out.println("Units: " + units1 + "<br>");

    // Establish database connection
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();

    // Update query based on increment or decrement
    int result;
    if ("inc".equals(incdec)) {
        result = st.executeUpdate("UPDATE stock SET units = units + " + units1 + " WHERE bloodgroup = '" + bloodgroup + "'");
    } else {
        result = st.executeUpdate("UPDATE stock SET units = units - " + units1 + " WHERE bloodgroup = '" + bloodgroup + "'");
    }

    // Check if any rows were affected
    if (result > 0) {
        response.sendRedirect("manageStock.jsp?msg=valid");
    } else {
        out.println("<center><font color='red'>No rows were updated. Please check the blood group and try again.</font></center>");
    }
} catch (Exception e) {
    e.printStackTrace(); // Print the error for debugging
    response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>
