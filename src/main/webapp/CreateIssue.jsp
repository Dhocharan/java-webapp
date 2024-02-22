<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Issue</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #00c6fb, #005bea);
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            animation: backgroundAnimation 10s infinite alternate-reverse;
        }

        h1 {
            color: #fff;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        form {
            max-width: 800px;
            margin: 70px;
            padding: 50px;
            background-color: rgba(255, 255, 255, 0.8); /* Increased transparency */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            opacity: 30;
            color: #333;
            animation: fadeInLabel 1s ease-in-out forwards;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease-in-out;
            background-color: rgba(255, 255, 255, 0.9); /* Increased transparency */
            opacity: 0.9; /* Set initial opacity to make it more visible */
            animation: fadeInInput 1s ease-in-out forwards;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #007bff;
            animation: inputFocus 0.3s ease-in-out;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out, transform 0.2s ease-in-out;
            opacity: 0;
            animation: fadeInSubmit 1s ease-in-out forwards;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        @keyframes backgroundAnimation {
            0% {
                background-color: #00c6fb;
            }
            100% {
                background-color: #005bea;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInLabel {
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInInput {
            to {
                opacity: 0.9; /* Adjusted to make it more visible */
            }
        }

        @keyframes fadeInSubmit {
            to {
                opacity: 1;
            }
        }

        @keyframes inputFocus {
            0%, 100% {
                transform: translateX(0);
            }
            25%, 75% {
                transform: translateX(-5px);
            }
            50% {
                transform: translateX(5px);
            }
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }
            25%, 75% {
                transform: translateX(-10px);
            }
            50% {
                transform: translateX(10px);
            }
        }

        .shake {
            animation: shake 0.5s ease-in-out;
        }
    </style>
</head>
<body>
    <h1>Create a New Issue</h1>
    <form id="createIssueForm" action="createIssueServlet" method="post" onsubmit="return validateForm()">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>

        <label for="description">Description:</label>
        <input type="text" id="description" name="description" required>

        <label for="priority">Priority:</label>
        <select id="priority" name="priority" required>
            <option value="1">High</option>
            <option value="2">Medium</option>
            <option value="3">Low</option>
        </select>

        <label for="assignedTo">Assigned To:</label>
        <input type="text" id="assignedTo" name="assignedTo">

        <label for="status">Status:</label>
        <select id="status" name="status" required>
            <option value="open">Open</option>
            <option value="inProgress">In Progress</option>
            <option value="closed">Closed</option>
        </select>

        <label for="dueDate">Due Date:</label>
        <input type="date" id="dueDate" name="dueDate">

        <label for="category">Category:</label>
        <input type="text" id="category" name="category">

        <input type="submit" value="Create Issue">
    </form>

    <script>
        function validateForm() {
            var title = document.getElementById('title').value;
            var description = document.getElementById('description').value;
            var priority = document.getElementById('priority').value;

            if (!title || !description || !priority) {
                // Add a shake animation for empty required fields
                document.getElementById('createIssueForm').classList.add('shake');
                setTimeout(function () {
                    document.getElementById('createIssueForm').classList.remove('shake');
                }, 500);
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
