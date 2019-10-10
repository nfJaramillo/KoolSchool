 import 'package:flutter/material.dart';
import 'package:hello_world/paginas/paginaQuiz.dart';

class BotonUI extends StatelessWidget
 {
  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Color del boton
  Color elColor;

  /// Texto del boton
  Text texto;

  /// Atributo para guardar lo que va a hacr cuando alguien le de click
  VoidCallback onTap;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Contructor que recibira el color y texto del boton
  BotonUI (Color pColor, Text pTexto, VoidCallback pOnTap)
  {
    elColor = pColor;

    texto = pTexto;

    onTap = pOnTap;
  }

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
 