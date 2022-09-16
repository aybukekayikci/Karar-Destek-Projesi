<?php 
$baglanti=mysqli_connect('localhost','root','','kdsprojem');
mysqli_query($baglanti,"SET NAMES UTF8"); 
if(!$baglanti) {

echo "Veri tabanına bağlanılamadı ".mysqli_connect_error();

}

mysqli_set_charset($baglanti,"uft");
?>