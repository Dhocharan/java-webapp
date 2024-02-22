<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="vignan.Issues"%>
<%@ page import="helper.Factoryprovider"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Issue</title>
    <style>
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
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #d9534f;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
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
            opacity: 0;
            animation: fadeIn 0.5s forwards;
        }

        th {
            background-color: #f2f2f2;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <h1>Delete Issue</h1>

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
    </table>

    <h2>Delete Issue</h2>
    <form action="deleteIssueServlet" method="post">
        <label for="id">Issue ID:</label>
        <input type="text" name="id" required>
        <input type="submit" value="Delete Issue">
    </form>
</body>
</html>
