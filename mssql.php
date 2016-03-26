<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<title>Connection to MSSQL2012</title>
<style type="text/css">
   TABLE {
    width: 800px; /* Ширина таблицы */
	margin: 20px auto;
    border-collapse: collapse; /* Убираем двойные линии между ячейками */
   }
   TD, TH {
    padding: 3px; /* Поля вокруг содержимого таблицы */
    border: 1px solid black; /* Параметры рамки */
   }
   TH {
    background: #b0e0e6; /* Цвет фона */
   }
  </style>
<body>
<input type="search" name="query" value="Привет"><input type="button" value="Поиск">
<?php
/*
* Соединение с локальным MS SQLEXPRESS сервером
*/
	/*******************************************************************************/
	function FormatErrors( $errors ) // форматирование ошибок
	{
		echo "Error information: ";

		foreach ( $errors as $error )
		{
			echo "<br />SQLSTATE: ".$error['SQLSTATE']."";
			echo "<br />Code: ".$error['code']."";
			echo "<br />Message: ".$error['message']."";
		}
	}

	/*******************************************************************************/
	function ViewTables($table_name, $sql, $conn) {	 
		/* Начало транзакции */
		 if ( sqlsrv_begin_transaction( $conn ) === false ) {
			die( print_r( sqlsrv_errors(),true ));
		}	
		
		if( ($stmt = sqlsrv_query( $conn, $sql) ) !== false ) {
			
			while( $obj = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC )) {
				  $rows[] = $obj; // строки таблицы
				  echo '<br />';
			}
			sqlsrv_commit( $conn );
			echo "Transaction committed.<br />";
			
		} else {
			 sqlsrv_rollback( $conn );
			 echo "Transaction rolled back.<br />";
		}
		// просмотрели таблицу
		$i =0;
		foreach($rows as $r) {
		$i++;
		$info = " $table_name TABLE_$i info ";
			echo "
			<table>
				<thead>
				  <tr>
					<td colspan='2'> $info </td>
					</tr>
				</thead>
			";
			foreach($r as $k=>$v) {
				if ( !is_object($v) ) {
					echo '<tr>';
					echo "<th>$k</th>";
					echo "<td>$v</td>";
					echo '</tr>';
				} else {
					if ( get_class($v) == 'DateTime' ) {
						echo '<tr>';
						echo "<th>$k</th>";
						echo "<td> DateTime: " . $v->format('Y-m-d h:m:s, e, O, P, T') . "</td>";
						echo '</tr>';					
					} else {
						echo '<tr>';
						echo "<th>$k</th>";
						echo "<td>Object</td>";
						echo '</tr>';						
					}

				}
			}
			echo '</table>';
		}
	}	

$serverName = "VAN-NOTEBOOK\SQLEXPRESS12"; // »м¤ сервера задавалось при установке; его также можно увидеть при запуске Management Studio

// $serverName = "<имя_вашего_sql-сервера\имя_инстанции,номер_порта>"; //если instance и port стандартные, то можно не указывать
// $connectionInfo = array("UID" => "<имя_пользователя>", "PWD" => "<пароль>", "Database"=>"<имяБД>");

$connectionInfo = array( "UID"=>"sa", "PWD"=>"b3qkch7hklm" );

$conn = sqlsrv_connect( $serverName, $connectionInfo);
// $conn = sqlsrv_connect( $serverName);

if( $conn === false ) { 
	echo "Connection could not be established.\n";
	die( FormatErrors(sqlsrv_errors()) ); 
	var_dump($conn);
} else {
	echo "<br />";
	$server_info = sqlsrv_server_info ($conn);
	
	echo '
	<table>
		<thead>
		  <tr>
			<td colspan="2"> SQL SERVER INFO </td>
			</tr>
		</thead>
	';
	foreach($server_info as $k=>$v) {
		echo '<tr>';
		echo "<th>$k</th>";
		echo "<td>$v</td>";
		echo '</tr>';
	}
	echo '</table>';
}	


	/* Инициализация параметров */
	 $sql1 = "SELECT * FROM Lin2DBBase.dbo.ssn"; 			// первая таблица
	 $sql2 = "SELECT * FROM Lin2DBBase.dbo.user_account"; 	// вторая таблица
	 $sql3 = "SELECT * FROM Lin2DBBase.dbo.user_info"; 		// третья таблица
	 $sql4 = "SELECT * FROM Lin2DBBase.dbo.user_auth"; 		// четвертая таблица
	 $sql5 = "SELECT * FROM Lin2WorldBase.dbo.builder_account";// пятая таблица
	
	 $querys = array ($sql1, $sql2, $sql3, $sql4, $sql5);
	
	 $table_name1 = "Lin2DBBase.dbo.ssn";
	 $table_name2 = "Lin2DBBase.dbo.user_account";
	 $table_name3 = "Lin2DBBase.dbo.user_info";
	 $table_name4 = "Lin2DBBase.dbo.user_auth";
	 $table_name5 = "Lin2WorldBase.dbo.builder_account";
	 
	 $tables = array ( $table_name1,  $table_name2,  $table_name3, $table_name4,  $table_name5 );
	 
	 $j = 0;
	 foreach( $querys as $q) {
		ViewTables($tables[$j++], $q, $conn);
		// echo $q . " " . $tables[$j++] . "<br />";
	 }
	 


sqlsrv_close( $conn );
?>