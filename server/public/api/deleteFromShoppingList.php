<?php
require_once('functions.php');
require_once('db_connection.php');
set_exception_handler('error_handler');

startUp();

$json_input = file_get_contents('php://input');
$obj = json_decode($json_input, true);
// var_dump("obj is ", $obj);
// $ingredient = $obj['ingredients_desc'];


$query = "DELETE FROM `shopping_list` WHERE id = '$obj'";
var_dump("query is ", $query);

$result = mysqli_query($conn, $query);
var_dump("affected rows ", mysqli_affected_rows($result));

if (!$result) {
  throw new Exception(mysqli_connect_error());
} else if (!mysqli_num_rows($result) && !empty($_GET['id'])) {
  throw new Exception('Invalid ID: ' . $_GET['id']);
};

$output = [];
while ($row = mysqli_fetch_assoc($result)) {
  $output[] = $row;
};

print(json_encode($output))
?>
