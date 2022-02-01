<?php
error_reporting(E_ALL & ~E_NOTICE);
require_once 'config.php';
include_once 'session.php';


$basepath = "";

$vars = explode("/", $_GET['p']);
list($page, $var2, $var3) = $vars;
if(empty($page)) $_GET['p'] ="home";
$smarty->assign('PAGE', $page);
$smarty->assign('IMAGEPATH', "/public/img/");
$smarty->assign('UPLOADED', "/public/uploads/");

switch($page){
	default:
	case 'home':break;
	case 'products':
		
		$sql=$connect->prepare("select product_id,product_name,product_description,image,price,category_name from products p join categories c on p.category_id=c.category_id");
		$sql->execute();
		$result=$sql->get_result();
		if($result-> num_rows>0){
			$list = array();
			while($row = $result-> fetch_assoc()){
				$list[] = $row;
			}
			$smarty->assign('LIST', $list);
		}
		
		else{
			echo 'Няма добавени продукти!!!';
		}
	break;
	case 'add_category':
		if(isset($_POST['submit']))
		{
			$errors = array();
			$category = filter_input(INPUT_POST, 'category');
			$descr = filter_input(INPUT_POST, 'description');
			if (empty($category)) $errors[] = "Category should have a name";
			if (empty($descr)) $errors[] = "Category should have a description";
			//exit;
			if(count($errors) == 0) 
			{
				$sql = $connect->prepare("INSERT INTO categories (category_name, category_description) values (?,?)");
				$sql->bind_param('ss', $category, $descr);
				if ($sql->execute())
				{
					header("Location: $basepath/?p=products");
					exit;
				}
			}
			else
				$smarty->assign("ERROR", $errors[0]);
			//samo edna greshka!
		}
	break;
	case 'add_product':
		$errors=array();
		$sql=$connect->prepare("select category_id, category_name from categories");
		
		if(!$sql->execute())
		{
			$errors[] = "Error loading categories";
			$smarty->assign("ERROR", $errors[0]);
		}
		else{
			$result=$sql->get_result();
			$list = array();
			while($row = $result-> fetch_assoc()){
				$list[] = $row;
			}
			$smarty->assign('CATEGORIES', $list);
		}
		
		//add product logic is in upload.php!!
	break;
	case 'edit_product':
		$errors=array();
		$sql=$connect->prepare("select category_id, category_name from categories");
		
		if(!$sql->execute())
		{
			$errors[] = "Error loading categories";
			$smarty->assign("ERROR", $errors[0]);
		}
		else{
			$result=$sql->get_result();
			$list = array();
			while($row = $result-> fetch_assoc()){
				$list[] = $row;
			}
			$smarty->assign('CATEGORIES', $list);
		}
		if(isset($_GET['edit']) && $_GET['edit']!=0)
		{
			$id = intval($_GET['edit']);
			$smarty->assign("EDITID", $id);
			$sql=$connect->prepare("select product_name, product_description, price, category_name from products p join categories c on p.category_id=c.category_id where product_id = $id");
			$sql->execute();
			$result = $sql->get_result();
			if($result-> num_rows>0){
				$list = array();
				while($row = $result-> fetch_assoc()){
					$list[] = $row;
				}
				$smarty->assign('PRODUCT', $list);
			}
		
			else{
				$smarty->assign("ERROR", "Error loading data");
			}
			
			//update logic
			if(isset($_POST['update']))
			{
				$errors = array();
				$product = filter_input(INPUT_POST, 'product');
				$descr = filter_input(INPUT_POST, 'description');
				$price = filter_input(INPUT_POST, 'price');
				$price = number_format($price, 2, '.', '');
				$category_id = filter_input(INPUT_POST, 'category');
				
				if (empty($product)) $errors[] = "Product should have a name";
				if (empty($descr)) $errors[] = "Product should have a description";
				if (empty($price)) $errors[] = "Product should have a price";
				
				if(count($errors) == 0) 
				{
					$sql = $connect->prepare("UPDATE products SET product_name=?, product_description=?, price=?, category_id=? where product_id='$id'");
					$sql->bind_param('ssdi', $product, $descr, $price, $category_id);
					if ($sql->execute())
					{
						header("Location: $basepath/?p=products");
						exit;
					}
				}
				else
					$smarty->assign("ERROR", $errors[0]);

			}
			
		}
	break;
	case 'categories':
		$errors=array();
		$sql=$connect->prepare("select category_id, category_name from categories");
		
		if(!$sql->execute())
		{
			$errors[] = "Error loading categories";
			$smarty->assign("ERROR", $errors[0]);
		}
		else{
			$result=$sql->get_result();
			$list = array();
			while($row = $result-> fetch_assoc()){
				$list[] = $row;
			}
			$smarty->assign('CATEGORIES', $list);
		}
		
		if(isset($_POST['filter'])){
			$id = filter_input(INPUT_POST, 'category');
			$errors=array();
			$sql=$connect->prepare("select * from products where category_id like '$id'");
			$sql->execute();
			$result=$sql->get_result();
			if($result-> num_rows>0){
				$list = array();
				while($row = $result-> fetch_assoc()){
					$list[] = $row;
				}
				$smarty->assign('LIST', $list);
			}
			
			else{
				echo 'Няма намерени продукти!!!';
			}
		}
	break;
}
$smarty->display('templates/wrapper.tpl');











?>
