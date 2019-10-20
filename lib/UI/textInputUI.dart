import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';


class TextInputUI extends StatefulWidget{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Atributo para guardar lo que va a hacer cuando alguien le de click
  final VoidCallback _onTap;

  /// Atributo para la respuesta escrita en el input
  String _respuesta;
  
  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------
  
  /// Constructor que recibe por parametro el metodo que se va a ajecutar luego de darle click en calificar
  TextInputUI(this._onTap);
  

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que crea el estado a cambiar, esto es otra calse, es para que el usuario pueda ur viendo lo que escribe
  @override
  State createState() => new TextInputValueState();
  
  /// Metodo que retorna la respuesta
  String get darRespuesta => _respuesta;

  /// Metodo para cambiar la respuesta
  void cambiarRespuesta(String pRespuesta)
  {
    _respuesta = pRespuesta;
  }


}

class TextInputValueState extends State<TextInputUI> {
  TextEditingController _textInputController = TextEditingController();
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: _textInputController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Escribe tu respuesta aqui'),
                ),
              ),
              new BotonUI(Colors.blue, new Text("Calificar",style: TextStyle(fontSize: 50)),() => verificarRespuesta(_textInputController.text))
             
            ],
          ),
        ));
        
  }

  /// Metodo para cambiar la respuesta despues de escrita por el usuario y llamar al metodo on tap que le llego por parametro a la clase TextInputUI
  void verificarRespuesta(String pRespuesta)
  {
    widget.cambiarRespuesta(pRespuesta);
    widget._onTap();
  }
}

