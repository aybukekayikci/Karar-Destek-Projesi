<?php

include 'vtbaglan.php';
$satisSayi = array();
try{
    $link= new \PDO(   'mysql:host=localhost;dbname=kdsprojem;charset=utf8mb4', //'mysql:host=localhost;dbname=canvasjs_db;charset=utf8mb4',
                        'root', //'root',
                        '', //'',
                        array(
                            \PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                            \PDO::ATTR_PERSISTENT => false
                        )
                    );

    $handle = $link->prepare('SELECT sube.subeAd AS x, COUNT(satis.satisID) AS y
    FROM sube,satis
    WHERE sube.subeID=satis.subeID
    GROUP BY x'); 
    $handle->execute(); 
    $result = $handle->fetchAll(\PDO::FETCH_OBJ);
    foreach($result as $row){
        array_push($satisSayi, array("y"=> $row->y, "label"=> $row->x));
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

    <script>
      window.onload = function () {
      
        var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
    exportFileName: "Şube Satış Sayıları",
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Şube Satış Sayıları"
	},
	data: [{
		type: "pie",
		startAngle: 240,
		yValueFormatString: "##0\"\"",
		// indexLabel: "{label} {y}",
		dataPoints: <?PHP echo json_encode($satisSayi, JSON_NUMERIC_CHECK);
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
       
      var chart = new CanvasJS.Chart("chartContainer2", {
	animationEnabled: true,
	title:{
		text: "Şubelere Göre Planlanan Gerçek Kar"
	},	
	axisY: {
		title: "Planlanan Kar",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "Gerçek Kar",
		titleFontColor: "#C0504E",
		lineColor: "#C0504E",
		labelFontColor: "#C0504E",
		tickColor: "#C0504E"
	},	
	toolTip: {
		shared: true
	},
	legend: {
		cursor:"pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "Planlanan Kar",
		legendText: "Gerçek Kar",
		showInLegend: true, 
		dataPoints:[
			{ label: "Kadıköy", y: 1685766},
			{ label: "Şirinyer", y: 1088276 },
			{ label: "Karabük", y: 447426 },
			{ label: "Çankaya", y: 96400},
			{ label: "Alsancak", y: 1889438},
			{ label: "Balçova", y: 1560000 },
			{ label: "Bornova", y: 1200000 }
		]
	},
	{
		type: "column",	
		name: "Gerçek Kar",
		legendText: "Gerçek Kar",
		axisYType: "secondary",
		showInLegend: true,
		dataPoints:[
			{ label: "Kadıköy", y: 1500000 },
			{ label: "Şirinyer", y: 1000000 },
			{ label: "Karabük", y: 500000 },
			{ label: "Çankaya", y: 90000 },
			{ label: "Alsancak", y: 1600000},
			{ label: "Balçova", y: 1400000},
			{ label: "Bornova", y:1000000 }
		]
	}]
});
chart.render();

function toggleDataSeries(e) {
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
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
      <div class="kutu">
        <div id="chartContainer"></div>
      </div>

      <div class="kutu">
        <div id="chartContainer2"></div>
      </div>
     
    </div>

    <table border="1" class="table-fill">
      <thead>
          <tr>
              <th><b>Şube Adı</b></th>
              <th><b>Şube Adresi</b></th>
              <th><b>Şube Maili</b></th>
              <th><b>Şube İrtibat</b></th>
              <th><b>Şube Yöneticisi</b></th>
              <th><b>Şube Yöneticisi İrtibat</b></th>
              <th><b>Güncelle</b></th>
              <th><b>Sil</b></th>
          </tr>
      </thead>
          
      <?php

      
include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
$sorgu= mysqli_query($baglanti,"select sube.subeAd, sube.subeAdres, sube.subeMail, sube.subeNo, sube.subeYonetici, sube.yoneticiCep, sube.subeID from sube");
while($satir=mysqli_fetch_array($sorgu))
{
	echo '<tr>';
    echo '<td>'.$satir['subeAd'].'</td>';
    echo '<td>'.$satir['subeAdres'].'</td>';
    echo '<td>'.$satir['subeMail'].'</td>';
    echo '<td>'.$satir['subeNo'].'</td>';
    echo '<td>'.$satir['subeYonetici'].'</td>';
    echo '<td>'.$satir['yoneticiCep'].'</td>';

    echo '<td> <a href="subeguncelleformu.php?id='.$satir['subeID'].'" >Güncelle</a></td>';
    echo '<td> <a href="subesil.php?id='.$satir['subeID'].'">Sil</a> </td>';
    echo '<tr>';	
}

?>

    </table>

    
  </body>
</html>