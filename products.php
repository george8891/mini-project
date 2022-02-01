<?php
	require_once 'config.php';
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
	$query="select product_id,product_name,product_description,image,username from products p join users u on p.creator=u.user_id";
	$result=mysqli_query($connect, $query);
	if(mysqli_num_rows($result)>0){
		while($row=mysqli_fetch_assoc($result)){
			$product=htmlspecialchars(mysqli_real_escape_string($connect, $row['product_name']));
			$desc=nl2br($row['product_description']);
			$image=htmlspecialchars(mysqli_real_escape_string($connect, $row['image']));
			$creator=htmlspecialchars(mysqli_real_escape_string($connect, $row['username']));
			echo "<h2>$product</h2>";
			echo "<h3>Created by $creator</h3>";
			echo "<p>$desc</p><br>".'<img style="width:25%; height=25%;" src="'.$image.'"><br><hr>';
		}
	}
	else{
		echo 'Няма добавени продукти!!!';
	}
	
	
	
}
else{
	header('Location: login.php');
}
?>

</body>
</html>

	
