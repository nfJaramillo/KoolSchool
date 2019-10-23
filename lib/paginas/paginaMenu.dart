import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/paginas/paginaQuiz.dart';
import 'package:hello_world/utils/lectura.dart';

class PaginaMenu extends StatelessWidget
{
  var lecturas = [(new Lectura("Lectura 1","Primero","Miguel es un niño indígena")),
    (new Lectura("Lectura 2", "Segundo", "Federico es estudiante de Sistemas"))];

  Widget build(BuildContext context) {
    return new Material(
        color: Colors.pink[300],
        child: Column(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.cyan[200], new Text( lecturas[0].darNombre,
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz()))),
                // Boton quiz
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.purple[300], new Text( lecturas[1].darNombre,
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz()))),
                // Boton quiz
              ],
            ),
          ],
        ),
    );
  }
}