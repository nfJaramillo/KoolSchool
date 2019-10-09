import 'package:flutter/material.dart';

class PreguntaUI extends StatefulWidget{

Text texto;

PreguntaUI ( Text pTexto)
{
  texto = pTexto;
  print(texto);
}

@override
  State createState() => new PreguntaEstado();
  
}

class PreguntaEstado extends State<PreguntaUI>  with SingleTickerProviderStateMixin{

  
  @override
  Widget build (BuildContext context){
    return new Material(
    color: Colors.white,
    child: new Padding(
      padding: new EdgeInsets.symmetric(vertical: 30),
      child: new Center(
        child: FittedBox(fit: BoxFit.cover, child: new Text(widget.texto.data,style: TextStyle(fontSize: 30))),
      ),
    )
    );
  }
}