<?php

$servername = "db";
$port = 3306;
$username = "root";
$password = "user@123";
$dbname = "csk_bookingappointmentsystem";

$conn = mysqli_connect($servername, $username, $password, $dbname, $port);

if (!$conn)
{
    die("Connection failed: " . mysqli_connect_error());        
}

?>

