 import 'package:flutter/material.dart';

class BotonUI extends StatelessWidget
 {
  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Color del boton
  final Color elColor;

  /// Texto del boton
  final Text texto;

  /// Atributo para guardar lo que va a hacr cuando alguien le de click
  final VoidCallback onTap;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Contructor que recibira el color y texto del boton
  BotonUI (this.elColor, this.texto, this.onTap);

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que construye visualmente el boton
  @override
  Widget build(BuildContext context) {
    return new Expanded(
                child: new Material(
              color: elColor,
              child: new InkWell(
                 onTap: () => onTap(),
                  child: new Center(
                      child: new Container(
                    child: FittedBox(fit: BoxFit.cover, child: texto),
                  ))),
            ));
  }
   
 }
 