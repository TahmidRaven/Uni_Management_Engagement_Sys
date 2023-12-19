<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register to USIS MODIFIED</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <style>
    body {
      background-image: url('assets/img/BracuNcamp.jpg');
      background-size: cover;
      background-position: center;
      color: #FAF9F6;
    }
  </style>
</head>
<body>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6 border rounded p-4">
        <h1 class="text-center mb-4">REGISTRATION</h1>
        <p class="text-center mb-4">Register to explore, engage, and experience.</p>

        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
          <div class="mb-3">
            <label class="form-label">Register As:</label>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="user_type" id="student" value="student" required onchange="showHideFields('student')">
              <label class="form-check-label" for="student">Student</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="user_type" id="faculty" value="faculty" required onchange="showHideFields('faculty')">
              <label class="form-check-label" for="faculty">Faculty</label>
            </div>
          </div>

          <hr>

          <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="text" class="form-control" id="password" name="password" required>
          </div>
          <div class="mb-3">
            <label for="personal_email" class="form-label">Personal Email</label>
            <input type="email" class="form-control" id="personal_email" name="personal_email" required>
          </div>
          <div class="mb-3">
            <label for="nid" class="form-label">NID</label>
            <input type="text" class="form-control" id="nid" name="nid" required>
          </div>
          <div class="mb-3">
            <label for="blood_group" class="form-label">Blood Group</label>
            <select name="blood_group" class="form-control" required>
              <option value="">Select Blood Group</option>
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
          <div class="mb-3">
            <label for="date_of_birth" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" id="date_of_birth" name="date_of_birth" required>
          </div>
          <div class="mb-3">
            <label for="gender" class="form-label">Gender</label>
            <select name="gender" class="form-control" required>
              <option value="">Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
          </div>
          <div class="mb-3">
            <label for="phoneno" class="form-label">Phone Number</label>
            <input type="tel" class="form-control" id="phoneno" name="phoneno" required>
          </div>

          <hr>

          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>

<?php
  include("database.php");
 
?>

<?php
ob_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userType = filter_input(INPUT_POST, "user_type", FILTER_SANITIZE_SPECIAL_CHARS);
    $name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_SPECIAL_CHARS);
    $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_SPECIAL_CHARS);

    $personalEmail = filter_input(INPUT_POST, "personal_email", FILTER_SANITIZE_SPECIAL_CHARS);
    $nid = filter_input(INPUT_POST, "nid", FILTER_SANITIZE_SPECIAL_CHARS);
    $bloodGroup = filter_input(INPUT_POST, "blood_group", FILTER_SANITIZE_SPECIAL_CHARS);
    $dateOfBirth = filter_input(INPUT_POST, "date_of_birth", FILTER_SANITIZE_SPECIAL_CHARS);
    $gender = filter_input(INPUT_POST, "gender", FILTER_SANITIZE_SPECIAL_CHARS);
    $address = filter_input(INPUT_POST, "address", FILTER_SANITIZE_SPECIAL_CHARS);
    $phoneNumber = filter_input(INPUT_POST, "phoneno", FILTER_SANITIZE_SPECIAL_CHARS);

    $password = password_hash(filter_input(INPUT_POST, "password", FILTER_SANITIZE_SPECIAL_CHARS), PASSWORD_DEFAULT);

    $approvalStatus = ($userType === 'faculty') ? 'pending' : 'approved';

    $sql = "INSERT INTO person (user_type, name, username, personal_email, nid, blood_group, date_of_birth, gender, address, phoneno, password, approval_status)
    VALUES ('$userType', '$name', '$username', '$personalEmail', '$nid', '$bloodGroup', '$dateOfBirth', '$gender', '$address', '$phoneNumber', '$password', '$approvalStatus')";

    $stmt = $conn->prepare($sql);

    if ($stmt->execute()) {
        if ($userType === 'faculty') {
            echo "Your registration is pending approval from the admin.";
        }

        $redirectLocation = "newlogin.php";
    } else {
        echo "Error: Could not connect! Sorry " . $stmt->error;
    }

    $stmt->close();
}

if (isset($redirectLocation)) {
    ob_end_flush(); 
    echo "<script>window.location.href='$redirectLocation';</script>";
    die();
}
?>

