<?php
include("includes/config.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect data from the form
    $postTitle = $_POST['post_title'];
    $postContent = $_POST['post_content'];

    $sql = "INSERT INTO post (title, content) VALUES (?, ?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("ss", $postTitle, $postContent);

    if ($stmt->execute()) {
        echo "Post submitted successfully!";
    } else {
        echo "Error submitting the post: " . $con->error;
    }

    $stmt->close();
    $con->close();
} else {

    header("Location: forum.php");
    exit();
}
?>
