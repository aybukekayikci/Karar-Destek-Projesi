<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8"/>
    <meta name="description" content="Denge Psikiyatri Kliniği"/>
    <meta name="keywords" content="Denge, Psikiyatri, Klinik"/>
    <meta name="googlebot" content="noarchive"/>
    <meta name="revisit-after" content="1 days"/>
    <meta name="robots" content="index,contact"/>
    <link href="giris.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8"/>
    <meta name="description" content="Denge Psikiyatri Kliniği"/>
    <meta name="keywords" content="Denge, Psikiyatri, Klinik"/>
    <meta name="googlebot" content="noarchive"/>
    <meta name="revisit-after" content="1 days"/>
    <meta name="robots" content="index,contact"/>
    <link href="drsayfa.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- yönlendirme -->
<meta http-equiv="refresh" content="5;URL=sube.php">
<!-- yönlendirme -->
  </head>
  <body>
<div class="sidebar">
<img class="logo" src="FRESH.png">
    <a href="giris.php"><i class="fa fa-fw fa-home"></i>  Anasayfa</a>
    <a href="sube.php"><i class="fa fa-fw fa-globe"></i>  Şube</a>
    <a href="urun.php"><i class="fa fa-fw fa-shopping-bag"></i>  Ürünler</a>
    <a href="musteri.php"><i class="fa fa-fw fa-user-o"></i>  Müşteri</a>
    </div>

    <div class="icon-bar">
      <a href="cikis.php"><i class="fa fa-sign-out"></i></a>
      <a href="profilim.html"><i class="fa fa-user-circle"></i></a>
    </div>
    <?php
      $guncelleeid= isset($dizi['subeID']) ? $dizi['subeID'] : '';
         
        $subeAd = $_POST['subeAd'];
        $subeAdres= $_POST['subeAdres'];
        $subeMail = $_POST['subeMail'];
        $subeNo = $_POST['subeNo'];
        $subeYonetici = $_POST['subeYonetici'];
        $yoneticiCep = $_POST['yoneticiCep'];

    
    include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
    
    //güncelleme için SQL sorgumuzu yazıyoruz.
    $sql = "UPDATE sube SET subeAd='$subeAd',  subeAdres='$subeAdres', subeMail='$subeMail', subeNo='$subeNo', subeYonetici='subeYonetici', yoneticiCep='yoneticiCep'  WHERE sube.subeID='$guncelleeid'";
     
    //sorgumuzu çalıştırıyoruz
    $sonuc= mysqli_query($baglanti,$sql);
    if($sonuc>0) 
    { 
    
    echo "Üye Bilgileri Başarıyla güncellendi";
    }
    else
    echo "Bir problem oluştu, verileri kontrol ediniz";
     
    ?>
    <br>
    
    <!-- Geri sayım -->
    <script>
    var i=5; //Geri sayımın başlıyacağı süre
    function saydir()
    {
    i--;
    var eleman= document.getElementById("gerisayim");
     eleman.innerHTML=i+" saniye sonra listeye yönlendirileceksiniz.";
    }
    setInterval("saydir()",1000);
    </script>
    
    
    
    <div id="gerisayim"></div>
    
    <!-- Geri sayım  -->
    <a href=sube.php>Şimdi Git</a>
  </body>
</html>


    
  </body>
</html>