import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';


class TextInputUI extends StatefulWidget{

  /// Atributo para guardar lo que va a hacr cuando alguien le de click
  final VoidCallback _onTap;

  String _respuesta;
  
  TextInputUI(this._onTap);
  

  @override
  State createState() => new TextInputValueState();

  String get darRespuesta => _respuesta;

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
                padding: const EdgeInsets.all(75),
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

  void verificarRespuesta(String pRespuesta)
  {
    widget.cambiarRespuesta(pRespuesta);
    widget._onTap();
  }
}

