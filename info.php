<?php

include 'include.php';

$var ='';

// Create connection
$conn = new mysqli($mysql_host, $mysql_username, $mysql_password, $mysql_database);
// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "select name,email,comment from contact";
$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
	
	$var = "<table border='1'><th>Name</th><th>email</th>";
    // output data of each row
    while($row = $result->fetch_assoc()) 
	{
        //echo "Name: " . $row["name"]. " - email: " . $row["email"]. " " . "<br>";
		$var .= "<tr><td>".$row['name']."</td><td>".$row['email']."</td></tr>";
		
	}
	
	$var .= "</table>";
	
	echo $var;     
} 
else 
{
    echo "0 results";
}
$conn->close();


?>