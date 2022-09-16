<?php
require_once "vtbaglan.php";
$query_ilk_chart = mysqli_query($baglanti, "SELECT sube.subeAd, gelir.y2021
FROM gelir
LEFT JOIN sube ON gelir.subeID = sube.subeID");
$array_ilk_chart = Array();
while($result = $query_ilk_chart  -> fetch_assoc()){
    $array_ilk_chart [] = $result['y2021'];
    $array_sube_adi [] = $result['subeAd'];
}


$query_calisan = mysqli_query($baglanti, "SELECT sube.subeAd, gider.y2021
FROM gider
LEFT JOIN sube ON gider.subeID = sube.subeID");
$array_calisan = Array();
while($result = $query_calisan  -> fetch_assoc()){
    $array_calisan_sayi [] = $result['y2021'];
    $array_mevki_adi [] = $result['subeAd'];
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
	title:{
		text: "Şubelerin Yıllık Oranları"
	},	
	axisY: {
		title: "Şubeler Toplam Gelir",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "Şubeler Toplam Gider",
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
		name: "Şubeler Toplam Gelir",
		legendText: "Şubeler Toplam Gelir",
		showInLegend: true, 
		dataPoints:[
			<?PHP
                        foreach(array_combine($array_ilk_chart, $array_sube_adi) as $value => $label){
                            echo '{ label: "'. $label.'", y:'.$value.' },';
                        }
                        ?>
		]
	},
	{
		type: "column",	
		name: "Şubeler Toplam Gider",
		legendText: "Şubeler Toplam Gider",
		axisYType: "secondary",
		showInLegend: true,
		dataPoints:[
			<?PHP
                        foreach(array_combine($array_calisan_sayi, $array_mevki_adi) as $value => $label){
                            echo '{ label: "'. $label.'", y:'.$value.' },';
                        }
                        ?>
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
  <div class="guncelUrun" >
        <h1>Güncel Ürün Sayısı </h1>
        <table id="customers">
  <tr>
    <th>Ürün Sayısı</th>
    <th>Tarih</th>
  </tr>
  <?php
include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
$sorgu= mysqli_query($baglanti,"SELECT guncelurunsayisi.sayi, guncelurunsayisi.tarih
FROM guncelurunsayisi");
while($satir=mysqli_fetch_array($sorgu))
{
	echo '<tr>';
    echo '<td>'.$satir['sayi'].'</td>';
    echo '<td>'.$satir['tarih'].'</td>';
    echo '<tr>';	
}
?>
</table>
    </div>
    <div class="guncelSube"  >
        <h1>Güncel Şube Sayısı </h1>
        <table id="customers">
  <tr>
    <th>Şube Sayısı</th>
    <th>Tarih</th>
  </tr>
  <?php
include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
$sorgu= mysqli_query($baglanti,"SELECT guncelsubesayisi.sayi, guncelsubesayisi.tarih
FROM guncelsubesayisi");
while($satir=mysqli_fetch_array($sorgu))
{
	echo '<tr>';
    echo '<td>'.$satir['sayi'].'</td>';
    echo '<td>'.$satir['tarih'].'</td>';
    echo '<tr>';	
}
?>

</table>
    </div>
    <div class="guncelMusteri"  >
        <h1>Güncel Müşteri Sayısı </h1>
        <table id="customers">
  <tr>
    <th>Müşteri Sayısı</th>
    <th>Tarih</th>
  </tr>
  <?php
include("vtbaglan.php"); //vtbaglan.php sayfasındaki tüm kodları bu sayfaya çağırdık
$sorgu= mysqli_query($baglanti,"SELECT guncelmusterisayisi.sayi, guncelmusterisayisi.tarih
FROM guncelmusterisayisi");
while($satir=mysqli_fetch_array($sorgu))
{
	echo '<tr>';
    echo '<td>'.$satir['sayi'].'</td>';
    echo '<td>'.$satir['tarih'].'</td>';
    echo '<tr>';	
}
?>

</table>
    </div>
</div>

<div class="alt">
    <div id="chartContainer" style="width:1050px; height: 250px; padding-top:60px; padding-left:240px; float: left; background-color: transparent;"></div>
  </div>




</body>
</html>