<?php
$host="localhost";
$dbuser="root";
$dbpass="";
$db="project";

$connect=mysqli_connect($host,$dbuser,$dbpass,$db);

require __DIR__ . '/vendor/autoload.php';
$smarty = new Smarty;
$smarty->setTemplateDir('templates');
$smarty->left_delimiter = '{{';
$smarty->right_delimiter = '}}';
$smarty->assign('PATH', "");