<?php
session_start();
error_reporting(0);
include("includes/config.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
    $fullname = mysqli_real_escape_string($con, $_POST['fullname']);
    $mobileno = mysqli_real_escape_string($con, $_POST['mobileno']);
    $emailid = mysqli_real_escape_string($con, $_POST['emailid']);
    $age = mysqli_real_escape_string($con, $_POST['age']);
    $gender = mysqli_real_escape_string($con, $_POST['gender']);
    $bloodType = mysqli_real_escape_string($con, $_POST['bloodType']);
    $address = mysqli_real_escape_string($con, $_POST['address']);

    $insertQuery = mysqli_query($con, "INSERT INTO donor_details (donor_name, donor_number, donor_mail, donor_age, donor_gender, donor_blood, donor_address) VALUES ('$fullname', '$mobileno', '$emailid', '$age', '$gender', '$bloodType', '$address')");

    if ($insertQuery) {
        echo "Thank you, Encourage others to donate blood!";
    } else {
        echo "Error in blood donation process.";
    }
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
            <h2>Submit Your Blood Type</h2>
            <form name="donor" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <div class="font-italic">Full Name<span style="color:red">*</span></div>
                        <div><input type="text" name="fullname" class="form-control" required></div>
                    </div>
                    <div class="col-lg-4 mb-4">
                        <div class="font-italic">Mobile Number<span style="color:red">*</span></div>
                        <div><input type="text" name="mobileno" class="form-control" required></div>
                    </div>
                    <div class="col-lg-4 mb-4">
                        <div class="font-italic">Email Id</div>
                        <div><input type="email" name="emailid" class="form-control"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <div class="font-italic">Age<span style="color:red">*</span></div>
                        <div><input type="text" name="age" class="form-control" required></div>
                    </div>
                    <div class="col-lg-4 mb-4">
                        <div class="font-italic">Gender<span style="color:red">*</span></div>
                        <div>
                            <select name="gender" class="form-control" required>
                                <option value="">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4">
                        <div class="font-italic">Blood Group<span style="color:red">*</span></div>
                        <div>
                            <select id="bloodType" name="bloodType" required>
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
                </div>
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="font-italic">Address<span style="color:red">*</span></div>
                        <div><textarea class="form-control" name="address" required></textarea></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <?php if(isset($_SESSION['alogin']) && $_SESSION['alogin']!="") { ?>
                            <div><input type="submit" name="submit" class="btn btn-primary" value="Submit" style="cursor:pointer"></div>
                        <?php } ?>
                    </div>
                </div>
            </form>
            <button onclick="window.location.href = 'donor.php'">Need Blood?</button>
        </div>
    </div>
</div>




<?php include('includes/footer.php');?>
<script src="assets/js/jquery-1.11.1.js"></script>
<script src="assets/js/bootstrap.js"></script>

</body>
</html>
