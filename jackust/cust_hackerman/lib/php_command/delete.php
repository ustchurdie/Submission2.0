<?php

$host='localhost';
$user='root';
$pass='samhui1234';
$db='mydb';

$con=mysqli_connect($host, $user, $pass, $db);

if($con)
    echo 'connected successfully to mydb database';
else 
    echo 'connection failed'. mysqli_error($con);
mysqli_query($con, "DELETE FROM persons WHERE LASTname ='Griffin'");
mysqli_close($con);
?>