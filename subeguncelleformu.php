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

      //güncellenecek ID'yi alıyoruz

      $guncelleid= isset($dizi['subeID']) ? $dizi['subeID'] : '';
      
      include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
      
      
      $sql="select * from sube ".$guncelleid;
      
      //Sorgumuzu veritabanına gönderiyoruz.
      $sonuc1= mysqli_query($baglanti,$sql);
      
      //Sorgunun sonucunda dönen satır sayısına mysql_num_rows() fonksiyonu ile bakıyoruz
      $satirsay=mysqli_num_rows($sonuc1);
      
      if ($satirsay>0)
      {
          $satir = mysqli_fetch_array($sonuc1);
          //Kayıt bulundu
          //Bu kısımda form içine veritabanında çekilen değerleri yazıyoruz.
      echo '<form action="subeguncelle.php?id='.$guncelleid.'" method="post" name="form">
              <table border="1" class="table-fill">
                  <tr>
                      <td colspan="2">
                  <div align="center"><b>'.$guncelleid.' Nolu Üyeyi Güncelleme</b></div>
                      </td>
                     
                  <tr>
                      <td>Şube Ad:</td>
                      <td><input type="text" name="subeAd" required="required"  value="'.$satir['subeAd'].'"> </td>
                  </tr>
                  <tr>
                      <td>Şube Adresi:</td>
                      <td><input type="text" name="subeAdres"  required="required" value="'.$satir['subeAdres'].'"> </td>
                  </tr>
                  <tr>
                      <td>Şube Maili:</td>
                      <td><input type="mail" name="subeMail"  required="required" value="'.$satir['subeMail'].'"> </td>
                  </tr>
                  <tr>
                    <td>Şube Numarası:</td>
                    <td><input type="text" name="subeNo"  required="required" value="'.$satir['subeNo'].'"> </td>
                </tr>
                  <tr>
                    <td>Şube Yöneticisi:</td>
                    <td><input type="text" name="subeYonetici"  required="required" value="'.$satir['subeYonetici'].'"> </td>
                </tr>
                <tr>
                    <td>Şube Yöneticisi Cep:</td>
                    <td><input type="text" name="yoneticiCep"  required="required" value="'.$satir['yoneticiCep'].'"> </td>
                </tr>

      <td colspan="2"><div align="right"> <a href=sube.php>Listeye Dön</a> <input type="reset" value="Geri Al">&nbsp;&nbsp;<input type="submit" value="Güncelle" />&nbsp;</div></td>
      </tr>
      </table>
      </form>';
      
       
      } else {
      //Kayıt bulunamadı
      echo "Aranılan kayıt bulunamadı";
      }
       
      ?>

    
  </body>
</html>