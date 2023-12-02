<?php

echo "Greetings! gfy";

$hostname = 'db'; // Replace with your actual database hostname
$username = 'root'; // Replace with your actual database username
$password = 'user@123'; // Replace with your actual database password
$database = 'csk_bookingappointmentsystem'; // Replace with your actual database name

try {
    $pdo = new PDO("mysql:host=$hostname;dbname=$database;port=3306", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // If the connection is successful, print a success message
    echo "Database connection successful!";
} catch (PDOException $e) {
    // If an error occurs during connection, print the error message
    echo "Error: " . $e->getMessage();
}

?>

