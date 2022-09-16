<?php
session_start();
 
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: kds.php");
    exit;
}
 
require_once "vtbaglan.php";
 
$username = $password = "";
$username_err = $password_err = $login_err = "";
 
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter username.";
    } else{
        $username = trim($_POST["username"]);
    }
    
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    if(empty($username_err) && empty($password_err)){
        $sql = "SELECT kullaniciMail, sifre FROM kullanici WHERE kullaniciMail = ?";

        if($stmt = mysqli_prepare($baglanti, $sql)){
            mysqli_stmt_bind_param($stmt, "s", $param_username);
            
            $param_username = $username;
            
            if(mysqli_stmt_execute($stmt)){
                mysqli_stmt_store_result($stmt);
                
                if(mysqli_stmt_num_rows($stmt) == 1){
                    mysqli_stmt_bind_result($stmt, $username,  $hashed_password);
                    if(mysqli_stmt_fetch($stmt)){
                        if($password = $hashed_password){
                                                    
                            session_start();
                            
                            $_SESSION["loggedin"] = true;
                            $_SESSION["username"] = $username;                            
                            
                            header("location: giris.php");
                        } else{
                            $login_err = "Invalid username or password.";
                        }
                    }
                } else{
                    $login_err = "Invalid username or password.";
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            mysqli_stmt_close($stmt);
        }
    }
    
    mysqli_close($baglanti);
}
?>

<!DOCTYPE html>
    <head>
        <title>Fresh Decor</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body{
    margin: 0;
    padding: 0;
    font-family: Georgia, 'Times New Roman', Times, serif;
    background: #d89e58;
}
.box{
    width: 300px;
    padding: 40px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #191919;
    border-radius: 24px;
    text-align: center;
}


img.yuvarlak {
    height: 200px;
    width: 200px;
}

.box input[type="text"],.box input[type="password"]{
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #d6b937;
    padding: 14px 10px;
    width: 200px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s;
}
.box input[type=text]:focus,.box input[type="password"]:focus{
    width: 280px;
    border-color: #643c1b;
}
.box input[type="submit"]{
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #643c1b;
    padding: 14px 40px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s;
    cursor: pointer;
}



.box input[type="submit"]:hover{
    background: #caa173;
}
#cbox{
    color: #757575;
}


        </style>
    </head>
    <body>
        <form class="box" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <img src="FRESH.png" alt="" class="yuvarlak" />
            <h2><font face="Monospace" color="white">Yönetici Paneli</font></h2>

            <input type="text" name="username" placeholder="Mail Adresi:">
                                <span class="invalid-feedback">
            <input type="password" name="password" placeholder="Şifre:">
                                <span class="invalid-feedback">
            <input type="submit" name="giris" value="Giriş">
            <input type="submit" name="sifreU" value="Şifremi Unuttum">
        </form>
    </body>
</html>
