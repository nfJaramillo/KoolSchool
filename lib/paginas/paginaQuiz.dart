import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/UI/preguntaUI.dart';

class PaginaQuiz extends StatefulWidget {
  @override
  State createState() => new PaginaEstadoQuiz();
}

class PaginaEstadoQuiz extends State<PaginaQuiz> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
           new BotonUI(Colors.greenAccent, new Text("Verdadero",style: TextStyle(fontSize: 50)),() => null), // Boton verdadero
           new PreguntaUI(new Text("Pregunta")), // Pregunta
           new BotonUI(Colors.redAccent, new Text("Falso",style: TextStyle(fontSize: 50)),() => null), // Boton falso
          ],
        )
      ],
    );
  }
}
