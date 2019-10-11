import 'package:flutter/material.dart';
import 'package:hello_world/paginas/paginaInicial.dart';


class PaginaPuntuacion extends StatelessWidget {

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

   final int puntos;
   final int preguntasTotales;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  PaginaPuntuacion(this.puntos, this.preguntasTotales);

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Tu puntaje fue de: \n", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .05),),
          new Text(puntos.toString() +" Correctas" + " / " + preguntasTotales.toString() + " Totales", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .05)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: MediaQuery.of(context).size.width * .2,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new PaginaInicial()), (Route route) => route == null)
          )
        ],
      )
    );
  }
}