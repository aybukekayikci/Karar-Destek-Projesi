<?php
include 'vtbaglan.php';


if (isset($_POST['dr'])) {
    header('Location:../kds.php');
}

if (isset($_POST['login'])) {
    
    $kullaniciMail = $_POST['kullaniciMail'];
    $kullaniciSifre = md5($_POST['kullaniciSifre']);
    if ($kullaniciMail && $kullaniciSifre) {
        
       $sorgula = mysqli_query($baglan,"select * from kullanici where kullaniciMail = '$kullaniciMail' and kullaniciSifre = '$kullaniciSifre'");
       $verisay = mysqli_num_rows($sorgula);

       if ($verisay>0) {
           $_SESSION['kullaniciMail'] = $kullaniciMail;
           
           header('Location:../giris.php');

       } else {
           header('Location:../kds.php?login=no');
       }

    }
    
}
?>