import 'package:flutter/material.dart';

class BotonUI extends StatelessWidget {
  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Color del boton
  final Color _elColor;

  /// Texto del boton
  final Text _texto;

  /// Atributo para guardar lo que va a hacr cuando alguien le de click
  final VoidCallback _onTap;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Contructor que recibira el color y texto del boton
  BotonUI(this._elColor, this._texto, this._onTap);

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que construye visualmente el boton
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
          color: _elColor,
          child: new InkWell(
            onTap: () => _onTap(),
            child: new Center(
                child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white, width: 5.0)),
              padding: new EdgeInsets.all(20.0),
              child: new Text(_texto.data,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * .05,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            )),
          )),
    );
  }
}
