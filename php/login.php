<?php
   include("cadastro.php");
   session_start();

 	$user_check = $_SESSION['login_user'];
   
   if(!isset($_SESSION['login_user'])){
      header("location: logado.html");
   }
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $email = mysqli_real_escape_string($db,$_POST['email']);
      $senha = mysqli_real_escape_string($db,$_POST['senha']); 
      $sql = "SELECT us_email FROM usuario WHERE us_email = \"$email\" and us_senha = \"$senha\"";
echo $sql;
$conexao = mysqli_connect("localhost","root","root","duchy"); 
      $result = mysqli_query($conexao,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
         session_register("email");
         $_SESSION['login_user'] = $email;
         header("location: logado.html");

      } else {
         $error = "O seu login está inválido";
         header("location: erro.html");
      }
   }
?>