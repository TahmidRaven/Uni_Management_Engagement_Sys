<?php
session_start();
include('includes/config.php');
error_reporting(0);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forum</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('assets/img/library.jpg');
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            opacity: 0.9;
        }

        .post {
            border: 1px solid #ccc;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }

        .comment {
            margin-left: 20px;
            padding: 5px;
            border-left: 1px solid #ccc;
        }

        form {
            margin-top: 20px;
        }

        input,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <div class="container">
        <h1>Forum</h1>

  
        <form action="" method="get">
            <label for="sort_option">Sort By:</label>
            <select name="sort_option" id="sort_option">
                <option value="latest">Latest Posts First</option>
                <option value="oldest">Oldest Posts First</option>
            </select>
            <button type="submit">Sort</button>
        </form>

        <?php
        include("includes/config.php");

    
        $sortOption = isset($_GET['sort_option']) ? $_GET['sort_option'] : 'latest';
        $sortOrder = ($sortOption == 'oldest') ? 'ASC' : 'DESC';

        $sql = "SELECT post.*, COALESCE('Anonymous') AS author
        FROM post
        LEFT JOIN admin ON post.username = admin.username
        ORDER BY post.post_date $sortOrder";

        $result = $con->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div class='post'>";
                echo "<h2>{$row['title']}</h2>";
                echo "<p>By Anonymous on {$row['post_date']}</p>";
                echo "<p>{$row['content']}</p>";

            
                
                $post_id = $row['post_id'];
                $commentSql = "SELECT * FROM comment WHERE post_id = $post_id ORDER BY comment_date ASC";
                $commentResult = $con->query($commentSql);

                if ($commentResult->num_rows > 0) {
                    echo "<div class='comments-section'>";
                    while ($commentRow = $commentResult->fetch_assoc()) {
                        echo "<div class='comment'>";
                        echo "<p>Comment by {$commentRow['username']} on {$commentRow['comment_date']}</p>";
                        echo "<p>{$commentRow['content']}</p>";
                        echo "</div>";
                    }
                    echo "</div>";
                }

           
                echo "<form action='submit_comment.php' method='post'>";
                echo "<input type='hidden' name='post_id' value='$post_id'>";
                echo "<label for='comment_content'>Add Comment:</label>";
                echo "<textarea name='comment_content' rows='4' required></textarea>";
                echo "<button type='submit'>Submit Comment</button>";
                echo "</form>";

                echo "</div>";
            }
        } else {
            echo "No posts found.";
        }
        $con->close();
        ?>

        <form action="submit_post.php" method="post">
            <h2>New Post</h2>
            <label for="post_title">Title:</label>
            <input type="text" name="post_title" required>

            <label for="post_content">Content:</label>
            <textarea name="post_content" rows="4" required></textarea>

            <button type="submit">Submit Post</button>
        </form>
    </div>

    <?php include('includes/footer.php');?>
    <script src="assets/js/jquery-1.11.1.js"></script>
    <script src="assets/js/bootstrap.js"></script>


</body>
</html>
<?php  ?>
