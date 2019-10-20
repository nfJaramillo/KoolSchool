import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';


class TextInputUI extends StatefulWidget{

  /// Atributo para guardar lo que va a hacr cuando alguien le de click
  final VoidCallback _onTap;
  
  TextInputUI(this._onTap);
  

  @override
  State createState() => new TextInputValueState();


}

class TextInputValueState extends State<TextInputUI> {
  TextEditingController _textInputController = TextEditingController();
  String _showText = "";

  _onPressed() {
    setState(() {
      _showText = _textInputController.text;
    });
  }

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
              new BotonUI(Colors.blue, new Text("Calificar",style: TextStyle(fontSize: 50)), widget._onTap)
             
            ],
          ),
        ));
  }
}

