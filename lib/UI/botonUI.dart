 import 'package:flutter/material.dart';

class BotonUI extends StatelessWidget
 {
  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Color del boton
  Color elColor;

  /// Texto del boton
  Text texto;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Contructor que recibira el color y texto del boton
  BotonUI (Color pColor, Text pTexto)
  {
    elColor = pColor;

    texto = pTexto;
  }

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que construye visualmente el boton
  @override
  Widget build(BuildContext context) {
    return new Expanded( // Boton verdadero
                child: new Material(
              color: elColor,
              child: new InkWell(
                  onTap: () => null,
                  child: new Center(
                      child: new Container(
                    child: FittedBox(fit: BoxFit.cover, child: texto),
                  ))),
            ));
  }
   
 }
 