<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
header('Content-Type: application/json');

$host='localhost';
$user='root';
$pass='samhui1234';
$db='my_person_contacts';

$final=array(); $response=array();
$con=mysqli_connect($host, $user, $pass, $db);
if($con) 
    echo 'connected successfully to mydb database <br>';
else 
    echo 'connection failed'. mysqli_error($con);
    
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
            array_push($response, array("id"=>$row['id'], "name"=>$row['full_names'], 
                    "gender"=>$row['gender'], "contact"=>$row['contact_no'], "email"=>$row['email'], 
                    "city"=>$row['city'], "country"=>$row['country']));
	    } 
    } 
    //$response['result']=array_values($final);
    echo json_encode($response);    
}
else echo "cannot find anything";

mysqli_close($con);
 // tell browser that its a json data
 //converting array to JSON string
return json_encode($response); 

?>
