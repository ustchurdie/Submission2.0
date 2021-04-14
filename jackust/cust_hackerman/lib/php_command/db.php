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
/*($sql = "insert into mytable1 (username,password,email) values ('john', 12345,'anymail@h.com') ";
$query = mysqli_query($con, $sql);
if($query)
    echo 'data inserted successfully'; 
else 
    echo '<br /> fuck we failed';
    //echo mysqli_error();*/
?>