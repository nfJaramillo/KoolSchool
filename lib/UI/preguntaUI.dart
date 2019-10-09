import 'package:flutter/material.dart';

class PreguntaUI extends StatefulWidget{

Text texto;

PreguntaUI ( Text pTexto)
{
  texto = pTexto;
}

@override
  State createState() => new PreguntaEstado(texto);
  
}

class PreguntaEstado extends State<PreguntaUI>{

Text texto;

PreguntaEstado ( Text pTexto)
{
  texto = pTexto;
}

  
  @override
  Widget build (BuildContext context){
    return new Material(
    color: Colors.white,
    child: new Padding(
      padding: new EdgeInsets.symmetric(vertical: 30),
      child: new Center(
        child: FittedBox(fit: BoxFit.cover, child: new Text(texto.data,style: TextStyle(fontSize: 30))),
      ),
    )
    );
  }
}