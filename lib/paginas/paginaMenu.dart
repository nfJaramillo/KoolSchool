import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/paginas/paginaQuiz.dart';
import 'package:hello_world/utils/pregunta.dart';
import 'package:hello_world/utils/quiz.dart';

class PaginaMenu extends StatelessWidget
{
  //----------------------------------------------
  // ATRIBUTOS QUIZ
  //----------------------------------------------
   final Quiz _quiz1 = new Quiz([
    new Pregunta.vofYabierta(
      "¿Miguel es un niño Indígena?",
      "Verdadero",
      TipoDePregunta.vOF,
      [" Muy Bien Has Acertado ", " Que mal, estudia mejor la próxima vez"],
    ),
    new Pregunta.multiple(
      "¿Miguel quiere acompañar a su papá en un viaje a?",
      "a",
      TipoDePregunta.multiple,
      ["Bogotá", "Cali", "Medellin", "Cartagena"],
      [
        "Muy Bien! Efectivamente quieren ir a la Capital de nuestra Colombia ",
        "Oh oh! No es la correcta, nunca hablamos de Cali !",
        "Oh oh! No es la correcta, nunca hablamos de Medellín !",
        "Oh oh! No es la correcta, nunca hablamos de Cartagena !",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Cuantos días se demoran en llegar Bogotá? (Escriba solo el numero de dias)",
      "5",
      TipoDePregunta.abierta,
      [
        "Asi es! son 5 días! ",
        "Parece que no recordaste bien el número, puedes anotar en un cuaderno, escribir nos ayuda a memorizar !",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿El miércoles la gente del pueblo se reune para ver la llegada y la salida del avión?",
      "Falso",
      TipoDePregunta.vOF,
      [
        " Es cierto porque no es el miércoles sino otro día! ",
        " Oh no! Entendiste el día que no era",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿El avión de la Pedrera a Leticia se demora 10 horas?",
      "Falso",
      TipoDePregunta.vOF,
      [
        " Así es! Son menos de 10 horas !",
        " Parece que no recordaste bien el número, puedes anotar en un cuaderno, escribir nos ayuda a memorizar !",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Para viajar de la ciudad de Leticia hacia Bogotá deberan tomar otro avión?",
      "Verdadero",
      TipoDePregunta.vOF,
      [
        " Vaya! Que buen lector eres, efectivamente tienen que tomar otro vuelo",
         "Oh no! no recordaste que deben tomar otro vuelo, revisa la lectura con cuidado! ",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Miguel, su papá y su tío pasan la noche en un hotel pequeño?",
      "Verdadero",
      TipoDePregunta.vOF,
      [
        "Sin duda, el hotel que escogieron era un hotel pequeño",
        "Oh no! tal vez no te fijaste bien en el adjetivo, revisa la lectura con cuidado",
      ],
    )
  ]);





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
                new BotonUI(Colors.cyan[200], new Text("Lectura 1",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz(_quiz1)))),
                // Boton quiz
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.purple[300], new Text( "Lectura 2",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz(_quiz1)))),
                // Boton quiz
              ],
            ),
          ],
        ),
    );
  }
}