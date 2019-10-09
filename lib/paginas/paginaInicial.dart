import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/paginas/paginaQuiz.dart';

class PaginaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(color: Colors.yellow, // Un material es como una hoja de papel encima de la pantalla
    child: new InkWell( // Inkweel es un widget de un boton en toda la pantalla con una animacion cool
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz())),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra lo de la columna en el ejer y
        children: <Widget>[
           FittedBox(fit:BoxFit.cover, child: new Text("KoolSchool", style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white))),
       
          new Row(
            children: <Widget>[
            new BotonUI(Colors.greenAccent, new Text("Verdadero",style: TextStyle(fontSize: 50))), // Boton verdadero
            new BotonUI(Colors.redAccent, new Text("Falso",style: TextStyle(fontSize: 50))), // Boton falso
                  ],
              )
        ],
      )
    )
    );
  }
}