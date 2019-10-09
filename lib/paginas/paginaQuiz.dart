import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/UI/overlayCorreroIncorrecto.dart';
import 'package:hello_world/UI/preguntaUI.dart';
import 'package:hello_world/utils/pregunta.dart';
import 'package:hello_world/utils/quiz.dart';

class PaginaQuiz extends StatefulWidget {
  @override
  State createState() => new PaginaEstadoQuiz();
}

class PaginaEstadoQuiz extends State<PaginaQuiz> {

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  Pregunta preguntaActual;

  Quiz quiz = new Quiz([
    new Pregunta("KoolSchool es cool?", true),
    new Pregunta("Nuestro grupo de PMC tiene 7 personas?", false),
    new Pregunta("El cielo es azul?", true)]);
  

  String textoDeLaPregunta;

  int numeroDePreguntaActual;

  bool esCorrecto;

  bool overlayVisible = false;

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  @override
  void initState() {
    super.initState();
    preguntaActual = quiz.siguientePregunta;
    textoDeLaPregunta = preguntaActual.pregunta;
    numeroDePreguntaActual = quiz.darNumeroDePreguntaActual;
  }

  void manejarRespuesta(bool respuesta){
    esCorrecto = (preguntaActual.respuesta == respuesta);
    quiz.ganarPunto(esCorrecto);
    this.setState((){
      overlayVisible = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
           new BotonUI(Colors.greenAccent, new Text("Verdadero",style: TextStyle(fontSize: 50)),() => manejarRespuesta(true)), // Boton verdadero
           new PreguntaUI(new Text(textoDeLaPregunta)), // Pregunta
           new BotonUI(Colors.redAccent, new Text("Falso",style: TextStyle(fontSize: 50)),() => manejarRespuesta(false)), // Boton falso
          ],
        ),
        overlayVisible == true ? new OverlayCorreroIncorrecto(
          esCorrecto, 
          () {
             
            if(quiz.darCantidadDePreguntas == numeroDePreguntaActual){
              null;
            }
           
            preguntaActual = quiz.siguientePregunta;
            this.setState((){
              print(preguntaActual.pregunta);
              overlayVisible = false;
              textoDeLaPregunta = preguntaActual.pregunta;
              numeroDePreguntaActual = quiz.darNumeroDePreguntaActual;
            });
          }): new Container()
      ],
    );
  }
}
