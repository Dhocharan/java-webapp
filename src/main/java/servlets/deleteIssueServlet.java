package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import helper.Factoryprovider;
import vignan.Issues;

@WebServlet("/deleteIssueServlet")
public class deleteIssueServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve data from the form
        Long ticketId = Long.parseLong(request.getParameter("id"));

        Session session = Factoryprovider.getFactory().openSession();

        try {
            // Begin a transaction
            session.beginTransaction();

            // Retrieve the ticket with the given ID from the database
            Issues ticket = session.get(Issues.class, ticketId);

            // Delete the ticket if found
            if (ticket != null) {
                session.delete(ticket);
            } else {
                // Ticket not found
                response.setContentType("text/html");
                response.getWriter().println("<h1 style='text-align:center;'>Issue Not Found</h1>");
                response.getWriter().println("<h1 style='text-align:center;'><a href='deleteIssue.jsp'>Go back</a></h1>");
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
