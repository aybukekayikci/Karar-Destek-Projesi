<?php

include 'vtbaglan.php';
$cinsiyetSayi = array();
try{
    $link= new \PDO(   'mysql:host=localhost;dbname=kdsprojem;charset=utf8mb4', //'mysql:host=localhost;dbname=canvasjs_db;charset=utf8mb4',
                        'root', //'root',
                        '', //'',
                        array(
                            \PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                            \PDO::ATTR_PERSISTENT => false
                        )
                    );

    $handle = $link->prepare('SELECT cinsiyet.cinsiyetAd AS x, COUNT(musteri.cinsiyetID) AS y
    FROM musteri,cinsiyet
    WHERE cinsiyet.cinsiyetID=musteri.cinsiyetID
    GROUP BY x'); 
    $handle->execute(); 
    $result = $handle->fetchAll(\PDO::FETCH_OBJ);
    foreach($result as $row){
        array_push($cinsiyetSayi, array("y"=> $row->y, "label"=> $row->x));
    }
    $link = null;
}
catch(\PDOException $ex){
    print($ex->getMessage());
}
?>


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

<style>
.cokmusteri #customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width:400px;
  margin-left:270px;
  
}

.cokmusteri #customers td, #customers th {
  border: 1px solMusteriAd #ddd;
  padding: 8px;
}

.cokmusteri #customers tr:nth-child(even){background-color: #f2f2f2;}

.cokmusteri #customers tr:hover {background-color: #ddd;}

.cokmusteri #customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #52371ba6;
  color: white;

}
.cokmusteri h1{
  margin-left:275px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  font-style: initial;
  margin-top: 50px;
  margin-bottom: 10px;
}
.orta{
    display: flex;

}
</style>

<script>
        window.onload = function () {

    var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
    exportFileName: "Müşteri Cinsiyet Sayıları",
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Müşteri Cinsiyet Sayıları"
	},
	data: [{
		type: "pie",
		startAngle: 240,
		yValueFormatString: "##0\"\"",
		// indexLabel: "{label} {y}",
		dataPoints: <?PHP echo json_encode($cinsiyetSayi, JSON_NUMERIC_CHECK);
      // foreach(array_combine($array_oran, $array_sube_ad) as $value => $label){
      //   echo '{ label: "'. $label.'", y:'.$value.' },';
      // }
      ?>
	}]
});
    chart.render();
    
    function explodePie(e) {
        for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
            if(i !== e.dataPointIndex)
                e.dataSeries.dataPoints[i].exploded = false;
        }
    }
     
    }
    </script>
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

<div class="orta">
    <div id="chartContainer" style="width:600px; height: 250px; padding-top:40px; padding-left:140px; float: left; background-color: transparent;"></div>
    <div class="cokmusteri">
        <h1>En çok alışveriş yapan müşteriler</h1>
        <table id="customers">
  <tr>
    <th>Müşteri Adı</th>
    <th>Müşteri Soyadı</th>
    <th>Satış Sayısı</th>

  </tr>
  <?php

      
include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
$sorgu= mysqli_query($baglanti,"SELECT musteri.musteriAd, musteri.musteriSoyad, COUNT(satis.satisID) 
FROM satis, musteri 
WHERE musteri.musteriID=satis.musteriID 
GROUP BY musteri.musteriID
ORDER BY COUNT(satis.satisID) DESC
LIMIT 4");
while($satir=mysqli_fetch_array($sorgu))
{
	echo '<tr>';
    echo '<td>'.$satir['musteriAd'].'</td>';
    echo '<td>'.$satir['musteriSoyad'].'</td>';
    echo '<td>'.$satir['COUNT(satis.satisID)'].'</td>';
    echo '<tr>';	
}

?>
</table>
    </div>

</div>
    


    
  </body>
</html>