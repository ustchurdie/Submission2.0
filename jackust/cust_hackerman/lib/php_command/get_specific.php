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

$searchq = $_POST['search'];
//$searchq = preg_replace("#[^0-9a-z]#i","",$searchq);
$query = mysql_query($con, "SELECT * FROM personal_info WHERE the_row_name = '%$searchq%'");
$result = $query->fetch_assoc();
// fetch the results, since you're expecting a single row, no need to loop
// this returns an associative array
$x=$result['1'];  //2nd column
$y=$result['2'];  //3rd column
mysqli_close($con);
return $result;
?>
