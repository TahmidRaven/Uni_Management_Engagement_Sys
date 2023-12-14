<?php
include("includes/config.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
    $post_id = $_POST['post_id'];
    $comment_content = $_POST['comment_content'];

  
    $insertComment = $con->prepare("INSERT INTO comment (post_id, username, content) VALUES (?, ?, ?)");
  
    $username = 'anonymous';
    $insertComment->bind_param("iss", $post_id, $username, $comment_content);

    if ($insertComment->execute()) {
       
        header("Location: forum.php"); 
        exit();
    } else {
        
        echo "Error: " . $con->error;
    }
} else {
  
    echo "Access denied";
}
$con->close();
?>
