<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
header('Content-Type: application/json');

$host='localhost';
$user='root';
$pass='samhui1234';
$db='food';

$final=array(); $response=array();
$con=mysqli_connect($host, $user, $pass, $db);
/*if($con) 
    echo 'connected successfully to mydb database <br>';
else 
    echo 'connection failed'. mysqli_error($con);*/
    
if (isset($_POST['index'])){ //gets specific info from flutter request
    $sql_stmt  = $_POST['index'];
    //SQL select query 
    $result = mysqli_query($con,$sql_stmt);
    //execute SQL statement 
    if (!$result)     
        die("Database access failed") ;
    //output error message if query execution failed 
    
    $rows = mysqli_num_rows($result); 
    // get number of rows returned
    $i=0; 
    if ($rows){
        while($row = mysqli_fetch_array($result)) {         
            array_push($response, array("id"=>$row['1'], "name"=>$row['name'], 
                    "foodDescription"=>$row['food_description'], "imageUrl"=>$row['image_url']));
	    }
    } 
    echo json_encode(array_reverse($response));    
}
else echo "cannot find anything";

mysqli_close($con);
 // tell browser that its a json data
 //converting array to JSON string
?>
