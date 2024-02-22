package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import vignan.Issues;
import helper.Factoryprovider;

@WebServlet("/createIssueServlet")
public class createIssueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public createIssueServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String strPriority = request.getParameter("priority");
        int priority = Integer.valueOf(strPriority);
        String assignedTo = request.getParameter("assignedTo");
        String status = request.getParameter("status");
        String dueDate = request.getParameter("dueDate");
        String category = request.getParameter("category");

        Issues ticket = new Issues(title, description, priority, assignedTo, status, dueDate, category);

        Session session = Factoryprovider.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(ticket);
        tx.commit();
        session.close();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1 style='text-align:center;'>Issue is created successfully</h1>");
        out.println("<h1 style='text-align:center;'><a href='listIssue.jsp'>View all Issues</a></h1>");
    }
}
