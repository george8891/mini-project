<?php
	require_once 'db.php';
	include_once 'session.php';
?>
<html>
<head>
<title>kontrolno 2</title>
</head>
<body>
<?php
include_once 'menu.php';
if(isset($_COOKIE['user'])&&isset($_SESSION['rank']) && $_SESSION['rank']=='admin'){
	$user = $_COOKIE['user'];
}
else{
	header('Location: login.php');
}
?>

<form action="" method="POST">
	Product name: <input type="text" name="pr_name"><br>
	Description: <textarea name="pr_description"></textarea><br>
	Image link: <input type="text" name="image"><br>
	<input type="submit" name="submit" value="Add new product!">
</form>

<?php
if(isset($_POST['submit'])){
	if(isset($_POST['pr_name']) && isset($_POST['pr_description']) && isset($_POST['image'])){
		$product=htmlspecialchars(mysqli_real_escape_string($connect, $_POST['pr_name']));
		$description=htmlspecialchars(mysqli_real_escape_string($connect, $_POST['pr_description']));
		$image=htmlspecialchars(mysqli_real_escape_string($connect, $_POST['image']));
		$creator=$_SESSION['userid'];
		
		$query="insert into products (product_name, product_description, image,creator) values ('$product','$description','$image','$creator')";
		$insert=mysqli_query($connect, $query);
		if($insert) echo 'New product inserted! <br>';
		else echo 'Problem, call IT! <br>';
	}
	
	
	
	
}
?>
</body>
</html>

