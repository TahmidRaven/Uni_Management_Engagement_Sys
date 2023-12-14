<?php
session_start();
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{

//Code for Insertion
if(isset($_POST['submit']))
{
$coursecode=$_POST['coursecode'];
$coursename=$_POST['coursename'];
$department=$_POST['department'];
$seatlimit=$_POST['seatlimit'];
$youtube_link=$_POST['youtube_link'];
$slide_link=$_POST['slide_link'];
$ret=mysqli_query($con,"insert into course(courseCode,courseName,department,noofSeats) values('$coursecode','$coursename','$department','$seatlimit')");
if($ret)
{
echo '<script>alert("Course Created Successfully !!")</script>';
echo '<script>window.location.href=course.php</script>';
}else {
echo '<script>alert("Error : Course not created!!")</script>';
echo '<script>window.location.href=course.php</script>';
}
}

//Code for Insertion
if(isset($_GET['del']))
{
mysqli_query($con,"delete from course where id = '".$_GET['id']."'");
echo '<script>alert("Course deleted!!")</script>';
echo '<script>window.location.href=course.php</script>';
      }
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Admin | Course</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Course  </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           Course 
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>


                        <div class="panel-body">
                       <form name="dept" method="post">
   <div class="form-group">
    <label for="coursecode">Course Code  </label>
    <input type="text" class="form-control" id="coursecode" name="coursecode" placeholder="Course Code" required />
  </div>

 <div class="form-group">
    <label for="coursename">Course Name  </label>
    <input type="text" class="form-control" id="coursename" name="coursename" placeholder="Course Name" required />
  </div>

<div class="form-group">
    <label for="department">Department</label>
    <input type="text" class="form-control" id="department" name="department" placeholder="Department" required />
  </div> 

<div class="form-group">
    <label for="seatlimit">Seat limit  </label>
    <input type="text" class="form-control" id="seatlimit" name="seatlimit" placeholder="Seat limit" required />
  </div>   

  <div class="form-group">
    <label for="youtube_link">Youtube Link  </label>
    <input type="text" class="form-control" id="youtube_link" name="youtube_link" placeholder="youtube_link" required />
  </div> 

  <div class="form-group">
    <label for="slide_link">Resources  </label>
    <input type="text" class="form-control" id="slide_link" name="slide_link" placeholder="slide_link" required />
  </div> 

 <button type="submit" name="submit" class="btn btn-default">Submit</button>
</form>
                            </div>
                            </div>
                    </div>
                  
                </div>
                <font color="red" align="center"><?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?></font>
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Manage Course
                        </div>
         
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Course Code</th>
                                            <th>Course Name </th>
                                            <th>Department</th>
                                            <th>Seat limit</th>
                                             <th>Creation Date</th>
                                             <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<?php
$sql=mysqli_query($con,"select * from course");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{
?>


                                        <tr>
                                            <td><?php echo $cnt;?></td>
                                            <td><?php echo htmlentities($row['courseCode']);?></td>
                                            <td><?php echo htmlentities($row['courseName']);?></td>
                                            <td><?php echo htmlentities($row['department']);?></td>
                                             <td><?php echo htmlentities($row['noofSeats']);?></td>
                                            <td><?php echo htmlentities($row['creationDate']);?></td>
                                            <td>
                                            <a href="edit-course.php?id=<?php echo $row['id']?>">
<button class="btn btn-primary"><i class="fa fa-edit "></i> Edit</button> </a>                                        
  <a href="course.php?id=<?php echo $row['id']?>&del=delete" onClick="return confirm('Are you sure you want to delete?')">
                                            <button class="btn btn-danger">Delete</button>
</a>
                                            </td>
                                        </tr>
<?php 
$cnt++;
} ?>

                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                 
                </div>
            </div>





        </div>
    </div>
  
  <?php include('includes/footer.php');?>

    <script src="../assets/js/jquery-1.11.1.js"></script>

    <script src="../assets/js/bootstrap.js"></script>
</body>
</html>
<?php } ?>
