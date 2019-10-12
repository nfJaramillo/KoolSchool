import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/UI/overlayCorrectoIncorrecto.dart';
import 'package:hello_world/UI/preguntaUI.dart';
import 'package:hello_world/paginas/paginaPuntuacion.dart';
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

  /// Atributo para la pregunta actual 
  Pregunta _preguntaActual;

  /// Atributo que corre un nuevo quiz con ciertas preguntas
  Quiz quiz = new Quiz([
    new Pregunta("¿Miguel es un niño Indígena?", true),
    new Pregunta("¿Para llegar a Bogotá se demoran 10 días?", false),
    new Pregunta("¿En la Pedrera deben tomar un avión?", true),
    new Pregunta("¿El miercoles la gente del pueblo se reune para ver la llegada y la salida del avión?", false),
    new Pregunta("¿El avión de la Pedrera a Leticia se demora 10 horas?", false),
    new Pregunta("¿Para viajar de la ciudad de Leticia hacia Bogotá deberan tomar otro avión?", true),
    new Pregunta("¿Miguel, su papá y su tío pasan la noche en un hotel pequeño?", true)]);
  

  /// Atributo con el texto dela pregunta actual  z
  String textoDeLaPregunta;

  /// Atributo que guarda el numero dela pregunta actual
  int numeroDePreguntaActual;

  /// Atributo para guardar si la respuesta que dio el usuario es correcta o no, este se actualiza compribandola la respuesta esperada
  bool esCorrecto;

  /// Atributo que dice si el overlay del feedback de la respuesta se muestra en pantalla o no 
  bool overlayVisible = false;

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  //// Metodo inicial que carga la pegunta, su texto y su numero desde el quiz
  @override
  void initState() {
    super.initState();
    _preguntaActual = quiz.siguientePregunta;
    textoDeLaPregunta = _preguntaActual.darPregunta;
    numeroDePreguntaActual = quiz.darNumeroDePreguntaActual;
  }

  /// Metodo que se corre luego de que el usuario responde, este comprueba si la respuesta fue correcta
  void manejarRespuesta(bool respuesta){
    esCorrecto = (_preguntaActual.darRespuesta == respuesta);
    quiz.ganarPunto(esCorrecto);
    this.setState((){
      overlayVisible = true;
    });
  }

  /// Metodo que dibuja los dos botones para resonder, la pregunta, genera el overlay de feedback cuando es necesario, cambia de pregunta y cuando se acaban avanza a la pagina de puntuacion
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
        overlayVisible == true ? new OverlayCorectoIncorrecto(
          esCorrecto, 
          () {
             
             if(quiz.darCantidadDePreguntas == numeroDePreguntaActual+1){ // Verifica que aun queden preguntas por responder 
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new PaginaPuntuacion(quiz.darPuntajeActual, quiz.darCantidadDePreguntas)), (Route route) => route == null); // Avanza a la pagina de puntuacion
              return;
            }
           
            _preguntaActual = quiz.siguientePregunta;
            this.setState((){ // Esta parte actualizara la pregunta cuando se avanze 
              overlayVisible = false;
              textoDeLaPregunta = _preguntaActual.darPregunta;
              numeroDePreguntaActual = quiz.darNumeroDePreguntaActual;
            });
          }): new Container()
      ],
    );
  }
}
