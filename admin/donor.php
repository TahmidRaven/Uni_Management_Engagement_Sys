<?php
session_start();
error_reporting(0);
include("includes/config.php");


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['search'])) {
    $searchBloodType = mysqli_real_escape_string($con, $_POST['searchBloodType']);

    $query = "SELECT * FROM donor_details WHERE donor_blood = '$searchBloodType'";
    $result = mysqli_query($con, $query);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Blood Donation</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
    <style>

    </style>
</head>
<body>

<?php include('includes/header.php');?>
<?php if(isset($_SESSION['alogin']) && $_SESSION['alogin']!="") {
    include('includes/menubar.php');
} ?>

<div class="content-wrapper">
    <div class="container">
        <div class="row">
            <h2>Need Blood Donation?</h2>
            <form name="searchDonor" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <div class="col-lg-4 mb-4">
                    <div class="font-italic">Search for Blood Type</div>
                    <div>
                        <select name="searchBloodType" class="form-control" required>
                            <option value="">Select Blood Type</option>
                            <option value="A+">A+</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="B-">B-</option>
                            <option value="O+">O+</option>
                            <option value="O-">O-</option>
                            <option value="AB+">AB+</option>
                            <option value="AB-">AB-</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div><input type="submit" name="search" class="btn btn-primary" value="Search" style="cursor:pointer"></div>
                </div>
            </form>
        </div>

        <?php if(isset($result) && mysqli_num_rows($result) > 0) { ?>
            <div class="row mt-5">
                <h2>Matching Donors</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while($row = mysqli_fetch_assoc($result)) { ?>
                            <tr>
                                <td><?php echo $row['donor_name']; ?></td>
                                <td><?php echo $row['donor_number']; ?></td>
                                <td><?php echo $row['donor_mail']; ?></td>
                       
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        <?php } ?>
    </div>
</div>

<?php include('includes/footer.php');?>
<script src="assets/js/jquery-1.11.1.js"></script>
<script src="assets/js/bootstrap.js"></script>
</body>
</html>