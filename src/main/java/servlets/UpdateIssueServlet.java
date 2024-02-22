package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import helper.Factoryprovider;
import vignan.Issues;

@WebServlet("/updateIssueServlet")
public class UpdateIssueServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve data from the form
        Long ticketId = Long.parseLong(request.getParameter("id")); // assuming "id" is the ticket ID parameter
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String strPriority = request.getParameter("priority");
        int priority = Integer.valueOf(strPriority);
        String assignedTo = request.getParameter("assignedTo");
        String status = request.getParameter("status");
        String dueDate = request.getParameter("dueDate");
        String category = request.getParameter("category");

        Session session = Factoryprovider.getFactory().openSession();

        try {
            // Begin a transaction
            session.beginTransaction();

            // Retrieve the ticket with the given ID from the database
            Issues ticket = session.get(Issues.class, ticketId);

            // Update the ticket's information
            if (ticket != null) {
                ticket.setTitle(title);
                ticket.setDescription(description);
                ticket.setPriority(priority);
                ticket.setAssignedTo(assignedTo);
                ticket.setStatus(status);
                ticket.setDueDate(dueDate);
                ticket.setCategory(category);

                // Save the updated ticket to the database
                session.merge(ticket);
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<h1 style='text-align:center;'>Issue Not Found</h1>");
                out.println("<h1 style='text-align:center;'><a href='listIssue.jsp'>View all Issues</a></h1>");
            }

            // Commit the transaction
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        // Redirect to a success page or a list of tickets
        response.sendRedirect("listIssue.jsp");
    }
}
