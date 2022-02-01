
<?php
require_once 'config.php';
include_once 'session.php';

$target_dir = "public/uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
$target_file = $target_dir . basename(time().'.'.$imageFileType);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
  $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
  if($check !== false) {
    echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;
  } else {
    echo "File is not an image.";
    $uploadOk = 0;
  }
}

// Check if file already exists
if (file_exists($target_file)) {
  echo "Sorry, file already exists.";
  $uploadOk = 0;
}

// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
  echo "Sorry, your file is too large.";
  $uploadOk = 0;
}

// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
  echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
  } else {
    echo "Sorry, there was an error uploading your file.";
  }
}

	$errors = array();
	$product = filter_input(INPUT_POST, 'product');
	$price = filter_input(INPUT_POST, 'price');
	$price = number_format($price, 2, '.', '');
	$descr = filter_input(INPUT_POST, 'description');
	$category_id = filter_input(INPUT_POST, 'category');
	$file=basename($target_file);
	
	if (empty($product)) $errors[] = "Product should have a name";
	if (empty($descr)) $errors[] = "Product should have a description";
	if (empty($price)) $errors[] = "Product should have a price";
	if (empty($file)) $file="default.png";
	//exit;
	if(count($errors) == 0) 
	{
		$sql = $connect->prepare("INSERT INTO products (product_name, product_description, image, price, category_id) values (?,?,?,?,?)");
		$sql->bind_param('sssdi', $product, $descr, $file, $price, $category_id);
		if ($sql->execute())
		{
			header("Location: $basepath/?p=products");
			exit;
		}
	}
	else
		$smarty->assign("ERROR", $errors[0]);
	//samo edna greshka!





header("Location: $basepath/?p=products");
?>
