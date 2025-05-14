<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Philosophical Athens - Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url("BracuNCamp.jpg") center/cover no-repeat fixed;
            font-family: 'Arial', sans-serif;
            color: lavender;
        }

        .content {
            text-align: center;
            padding: 50px;
        }

        .custom-title {
            font-size: 3em;
            margin-bottom: 20px;
            color: cyan;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 30px;
            color: cyan;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-size: 1.2em;
            margin-bottom: 5px;
            color: rgb(220, 231, 238);
        }

        input {
            padding: 10px;
            margin-bottom: 20px;
            width: 230px;
        }

        button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4285f4;
            color: #f8efef;
            border: none;
            cursor: pointer;
        }

        .footer {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            
        }

        .footer a {
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <div class="content">
        <h1 class="custom-title">Welcome to USIS MODIFIED</h1>
        <p>EXPLORE ENGAGE & EXPERIENCE</p>
        <form>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
    </div>

    <div class="footer">
        <a href="https://www.bracu.ac.bd/" target="_blank"><img src="website-icon.png" alt="BRAC University"></a>
        <a href="https://www.facebook.com/BRACUniversity/" target="_blank"><img src="facebook-icon.png" alt="BRACU Facebook"></a>
    </div>
</body>
</html>
