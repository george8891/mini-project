<?php
require_once 'config.php';
include_once 'session.php';

if(isset($_GET['product']) && intval($_GET['product'])!=0){
	$id=$_GET['product'];
	$sql=$connect->prepare("delete from products where product_id = '$id'");
	$sql->execute();
	header("Location: $basepath/?p=products");
	exit;
	// $sql=$connect->prepare("select * from products p join categories c on p.category_id=c.category_id");
	// $sql->execute();
	// $result=$sql->get_result();
	// if($result-> num_rows>0){
			// $list = array();
			// while($row = $result-> fetch_assoc()){
				// $list[] = $row;
			// }
			// $smarty->assign('LIST', $list);
		// }
		
}