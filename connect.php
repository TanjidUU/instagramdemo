<?php

	$servername = 'instademo.mysql.database.azure.com';
	$user 		= 'Tanjidu';
	$pass 		= '113601masum*';
	$db 		= 'insta_db';
	$conn 		= mysqli_connect($servername, $user, $pass, $db);
	
	if(!$conn){
		die("").'<br>';
	}
?>