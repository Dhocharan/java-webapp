<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="vignan.Issues" %>
<%@ page import="helper.Factoryprovider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Issues</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
     <script>
        function showPopup(issueUpdated) {
            alert(issueUpdated);
        }
    </script>
</head>
<body>
    <h1>Update Issues</h1>
    
    <h2>List of Issues</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Priority</th>
            <th>Assigned To</th>
            <th>Status</th>
            <th>Due Date</th>
            <th>Category</th>
        </tr>
        
        <% 
        Session session2 = Factoryprovider.getFactory().openSession();
            
            try {
                session2.beginTransaction();
                List<Issues> tickets = session2.createQuery("from Issues").getResultList();
                
                for (Issues ticket : tickets) {
        %>
                <tr>
                   <td><%= ticket.getId() %></td>
            <td><%= ticket.getTitle() %></td>
            <td><%= ticket.getDescription() %></td>
            <td><%= ticket.getPriority() %></td>
            <td><%= ticket.getAssignedTo() %></td>
            <td><%= ticket.getStatus() %></td>
            <td><%= ticket.getDueDate() %></td>
            <td><%= ticket.getCategory() %></td>
                </tr>
        <%
                }
                session2.getTransaction().commit();
            } finally {
                session2.close();
            }
        %>
    </table>
    
    <h2>Update Issues</h2>
    <form action="updateIssueServlet" method="post">
        <label for="id">Issue ID:</label>
        <input type="text" name="id" required>

        <label for="title">Title:</label>
        <input type="text" name="title" required>

        <label for="description">Description:</label>
        <input type="text" name="description" required>

        <label for="priority">Priority:</label>
        <input type="text" name="priority" required>

       
        <label for="assignedTo">Assigned To:</label>
        <input type="text" name="assignedTo" required>

        <label for="status">Status:</label>
        <input type="text" name="status" required>

        <label for="dueDate">Due Date:</label>
        <input type="text" name="dueDate" required>

        <label for="category">Category:</label>
        <input type="text" name="category" required>
    

        <input type="submit" value="Update Ticket">
    </form>
</body>
</html>