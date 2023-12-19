<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Directory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body {
            padding: 20px;
            background-image: url('assets/img/lib.jpg'); 
            background-size: cover;
            background-repeat: no-repeat;
            color: black; 
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.8); table */
            padding: 15px;
            border-radius: 10px;
        }

        th, td {
            text-align: left;
            font-weight: bold; 
        }

        a {
            text-decoration: none;
            color: #0d6efd;
            font-weight: bold; 
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<?php if(isset($_SESSION['login']) && $_SESSION['login']!="") {
    include('includes/menubar.php');
} ?>
<h1>Course Directory</h1>

<form action="" method="get">
    <label for="courseCode">Search by Course Code:</label>
    <input type="text" id="courseCode" name="courseCode">
    <input type="submit" value="Search">
</form>

<?php
include('includes/config.php');

$itemsPerPage = 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$offset = ($page - 1) * $itemsPerPage;


if (isset($_GET['courseCode'])) {
    $courseCode = $_GET['courseCode'];
    $sql = "SELECT * FROM course WHERE courseCode LIKE '%$courseCode%' LIMIT $itemsPerPage OFFSET $offset";
} else {

    $sql = "SELECT * FROM course LIMIT $itemsPerPage OFFSET $offset";
}

$result = $con->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>YouTube Link</th>
                <th> Resources </th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['courseCode']}</td>
                <td>{$row['courseName']}</td>
                <td><a href='{$row['youtube_link']}' target='_blank'>Watch</a></td>
                <td><a href='{$row['slide_link']}' target='_blank'>Slides</a></td>
            </tr>";
    }

    echo "</table>";


    $totalPages = ceil($result->num_rows / $itemsPerPage);
    echo "<div>";
    for ($i = 1; $i <= $totalPages; $i++) {
        echo "";
    }
    echo "</div>";
} else {
    echo "No courses found.";
}


$con->close();
?>

<?php include('includes/footer.php');?>
<script src="assets/js/jquery-1.11.1.js"></script>
<script src="assets/js/bootstrap.js"></script>

</body>
</html>
