<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Tracking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("C:/java enterprise and web development/tech/Issue tracking home.png");
            margin: 0;
            padding: 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        header {
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-bottom: 2px solid #3498db;
            animation: fadeInBounce 1s ease-in-out;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: borderGlow 2s ease-in-out infinite;
        }

        @keyframes borderGlow {
            from {
                border-color: rgba(255, 255, 255, 0.2);
            }
            to {
                border-color: rgba(255, 255, 255, 0.4);
            }
        }

        h1 {
            color: #3498db;
            margin-bottom: 10px;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .operation-links {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            animation: slideInPerspective 1s ease-in-out;
        }

        .operation-links a {
            margin: 15px;
            text-decoration: none;
            padding: 15px 30px;
            background-color: #3498db;
            color: #ecf0f1;
            border: 2px solid #3498db;
            border-radius: 5px;
            transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s ease;
            display: inline-block;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            transform: scale(1);
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .operation-links a:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        @keyframes fadeInBounce {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @keyframes slideInPerspective {
            from {
                transform: perspective(800px) translateX(-50px) rotateY(-10deg);
            }
            to {
                transform: perspective(800px) translateX(0) rotateY(0);
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Issue Tracking System</h1>
        <p>Explore and manage your Issues with ease</p>
    </header>
    <div class="operation-links">
        <a href="CreateIssue.jsp">Create a New Issue</a>
        <a href="listIssue.jsp">List All Issues</a>
        <a href="updateIssue.jsp">Update Issue Status</a>
        <a href="deleteIssue.jsp">Delete an Issue</a>
    </div>
</body>
</html>
