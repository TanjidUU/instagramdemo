<?php

	$servername = 'instademo.mysql.database.azure.com';
	$user 		= 'Tanjid';
	$pass 		= '113601tanjid*';
	$db 		= 'insta_db';
	$conn 		= mysqli_connect($servername, $user, $pass, $db);
	
	if(!$conn){
		die("").'<br>';
	}
?>