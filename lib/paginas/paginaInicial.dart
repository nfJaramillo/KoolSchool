import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(color: Colors.yellow, // Un material es como una hoja de papel encima de la pantalla
    child: new InkWell( // Inkweel es un widget de un boton en toda la pantalla con una animacion cool
      onTap: () => null,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra lo de la clumna en el ejer y
        children: <Widget>[
          new Text("KoolSchool", style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white)),
          new Text("Toca para iniciar!",style: TextStyle(fontSize: 50))
        ],
      )
    )
    );
  }
}