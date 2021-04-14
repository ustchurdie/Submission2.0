<?php
require_once('db.php');
if (isset($_POST['search'])){
    $searchq = $_POST['search'];
    $searchq = preg_replace("#[^0-9a-z]#i","",$searchq);
    $query = mysql_query("SELECT * FROM personal_info WHERE FirstName LIKE '%$searchq%' OR SurName LIKE '%$searchq%'") or die("could not search");
    $count = mysql_num_rows($query);
    if($count == 0){
        $output = 'There was no search results!';
    }else{
        while($row = mysql_fetch_array($query)){
            $fname = $row['FirstName'];
            $lname = $row['SurName'];
            $id = $row['id'];

            $output .= '<div>'.$fname.''.$lname.'</div>';
        }
    }
}
mysqli_close($con);
?>