<?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$actividad = (isset($_POST['actividad'])) ? $_POST['actividad'] : '';
$eje = (isset($_POST['eje'])) ? $_POST['eje'] : '';
$mod = (isset($_POST['mod'])) ? $_POST['mod'] : '';
$horas = (isset($_POST['horas'])) ? $_POST['horas'] : '';
$cre = (isset($_POST['cre'])) ? $_POST['cre'] : '';
//$observaciones = (isset($_POST['comentarios'])) ? $_POST['comentarios'] : '';


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['c_id'])) ? $_POST['c_id'] : '';


switch($opcion){
    case 1:
        $consulta = "INSERT INTO constancia (actividad, eje_tematico, modalidad, horas, cre) VALUES ('$actividad', '$eje', '$mod', '$horas', '$cre', 1, '$horas', 1, 1) ";			
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 
        
        $consulta = "SELECT id, actividad, eje_tematico, modalidad, horas, cre FROM constancia ORDER BY user_id DESC LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);       
        break;    
    /*case 4:    
        $consulta = "SELECT id, actividad, eje_tematico, modalidad, horas, archivo, valida, observaciones FROM constancia";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 5:
        $consulta = "SELECT modalidad, ejemplos, factor FROM denominacion";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;*/
}

print json_encode($data, JSON_UNESCAPED_UNICODE);//envio el array final el formato json a AJAX
$conexion=null;