<?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$actividad = (isset($_POST['actividad'])) ? $_POST['actividad'] : '';
$eje_tematico = (isset($_POST['eje_tematico'])) ? $_POST['eje_tematico'] : '';
$final = (isset($_POST['termino'])) ? $_POST['termino'] : '';
$horas = (isset($_POST['horas'])) ? $_POST['horas'] : '';
$archivo = (isset($_POST['archivo'])) ? $_POST['archivo'] : '';
$observaciones = (isset($_POST['comentarios'])) ? $_POST['comentarios'] : '';


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['c_id'])) ? $_POST['c_id'] : '';


switch($opcion){
    case 1:
        /*$consulta = "INSERT INTO constancia (actividad) VALUES ('$actividad') ";			
        $consulta = "INSERT INTO denominacion (eje_tematico) VALUES ('$eje_tematico') ";			
        $consulta = "INSERT INTO constancia (fecha_fin, horas, archivo, observaciones, valida, observaciones_encargado, creditos, alumno_id, denominacion_id) VALUES ('$final', '$horas', '$archivo', '$observaciones', 1, '$observaciones', '$horas', 1, 1) ";			

        
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 
        
        $consulta = "SELECT id, actividad FROM constancia ORDER BY user_id DESC LIMIT 1";
        $consulta = "SELECT eje_tematico FROM denominacion ORDER BY user_id DESC LIMIT 1";
        $consulta = "SELECT fecha_fin, horas, archivo, valida, observaciones FROM constancia ORDER BY user_id DESC LIMIT 1";

        
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);     */  
        break;    
    case 2:        
        /*$consulta = "UPDATE constancia SET actividad='$actividad' WHERE id='$id' ";		
        $consulta = "UPDATE denominacion SET eje_tematico='$eje_tematico' WHERE id='$id' ";		
        $consulta = "UPDATE constancia SET fecha_fin='$final', horas='$horas', archivo='$archivo', observaciones='$observaciones', observaciones_encargado='$observaciones', creditos='$horas' WHERE id='$id' ";		
               
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        
        $consulta = "SELECT id, actividad FROM constancia WHERE id='$id' ";       
        $consulta = "SELECT eje_tematico FROM denominacion WHERE id='$id' ";       
        $consulta = "SELECT fecha_fin, horas, archivo, valida, observaciones FROM constancia WHERE id='$id' ";       
        
        
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);*/
        break;
    case 3:
        /*$consulta = "DELETE FROM constancia WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();       */                    
        break;
    case 4:    
        $consulta = "SELECT constancia.id as id, constancia.actividad as actividad, denominacion.eje_tematico as eje_tematico, denominacion.modalidad as modalidad, constancia.horas as horas, constancia.id, denominacion.factor as factor, constancia.id, (denominacion.factor*constancia.creditos) as horasUsadas, constancia.creditos as creditos 
        FROM constancia 
            INNER JOIN denominacion ON constancia.denominacion_id = denominacion.id";
        //$consulta = "SELECT id, actividad, fecha_inicio, fecha_fin, horas, archivo, valida, observaciones FROM constancia";

        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 5:
        $consulta = "SELECT modalidad, ejemplos, factor FROM denominacion";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);//envio el array final el formato json a AJAX
$conexion=null;
$conexion=null;