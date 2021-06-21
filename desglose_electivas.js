$(document).ready(function() {
  var c_id, opcion;
  opcion = 4;
      
  $('#tablaUsuarios').DataTable({  
      "ajax":{            
          "url": "bd/crud2.php", 
          "method": 'POST', //usamos el metodo POST
          "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
          "dataSrc":""
      },
      "columns":[
          {"data": "id"},
          {"data": "actividad"},
          {"data": "eje_tematico"},
          {"data": "modalidad"},
          {"data": "horas"},
          {"data": "horasUsadas"},
          {"data": "factor"},
          {"data": "creditos"}
      ]
  });   

  });   