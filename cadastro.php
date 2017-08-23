<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Duchy</title>
</head>

<body>

<?php
	echo "Funciona?";
// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
	$nome= $_POST ["nomec"];//atribuição do campo "nome" vindo do formulário para variavel
	$email= $_POST ["emailc"];//atribuição do campo "email" vindo do formulário para variavel
	$senha= $_POST ["senhac"];//atribuição do campo "senha" vindo do formulário para variavel
 	$login= $_POST ["login"];
 	echo "<br>", $nome, "<br>", $email, "<br>", $senha,  "<br>", $login;
//Gravando no banco de dados ! conectando com o localhost - mysql
 	$conexao = mysqli_connect("localhost","root","root","duchy"); 
	if (!$conexao) {
		die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysqli_connect_error()); //TODO: direcionar p página de erro
	} else {

		$query = "SELECT us_email from usuario where us_email=\"$email\"";
		echo "<br>", $query;
	    if ($result = mysqli_query($conexao,$query)) {
	        $row = $result->fetch_row();
	        if ($row[0] == null || $row[0] == "") {
	            //Query que realiza a inserção dos dados no banco de dados na tabela indicada acima
	    	    $query = "INSERT INTO usuario (us_email, us_senha, us_nome, us_user) VALUES (\"$email\", \"$senha\", \"$nome\", \"$login\")";
	    	    echo "<br>", $query;
	    	    if($result = mysqli_query($conexao,$query))
	    	        echo "Seu cadastro foi realizado com sucesso!"; //TODO: direcionar p pag de Cadastro realizado com sucesso
	            else
	                echo "bosta."; //TODO: direcionar p página de erro
	        } else {
	            echo "<br>Email já cadastrado: \"", $row[0],"\"."; //TODO: direcionar p página de erro (avisar q o email já está cadastrado)
	        }
	    } else {
	        echo "bug ao consultar o BD.";    //TODO: direcionar p página de erro
	    }
	    $result->close();
	    mysqli_close($conexao);

 	}
?>

</body>
</html>