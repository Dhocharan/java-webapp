<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="vignan.Issues" %>
<%@ page import="helper.Factoryprovider" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>List Issues</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light gray background color */
        }
        h1 {
            color: #333;
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
        .container {
            text-align: center;
            margin-top: 20px;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>List of Issues</h1>
        
        <table class="table table-bordered">
            <thead>
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
            </thead>
            <tbody>
                <% 
                    Session session2 = Factoryprovider.getFactory().openSession();
                    
                    try {
                        session2.beginTransaction();
                        List<Issues> tickets = session2.createQuery("from Issues").getResultList();
                        
                        for (Issues ticket : tickets) {
                %>
                        <tr class="fadeInRow">
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
            </tbody>
        </table>
        
        <div class="mt-2">
            <a href="index.jsp" class="btn btn-primary">Home</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
