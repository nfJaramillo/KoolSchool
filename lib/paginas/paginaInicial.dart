import 'package:flutter/material.dart';
import 'package:hello_world/UI/botonUI.dart';
import 'package:hello_world/paginas/paginaQuiz.dart';

class PaginaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(color: Colors.yellow, // Un material es como una hoja de papel encima de la pantalla
     child: new Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra lo de la columna en el ejer y
        children: <Widget>[
          new Padding(
            padding:  EdgeInsets.all(50), // Añade espacio entre los textos
            ),
           FittedBox(fit:BoxFit.cover, child: new Text("KoolSchool", style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white))),
            new Padding(
            padding:  EdgeInsets.all(50), // Añade espacio entre los textos
            ),
            Expanded(
              child:new Row(
            children: <Widget>[
             // onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz())),
              new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
              new BotonUI(Colors.grey, new Text("Lecturas",style: TextStyle(fontSize: 75,fontWeight: FontWeight.bold)), () => null), 
             new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
              new BotonUI(Colors.purpleAccent, new Text("Preguntas",style: TextStyle(fontSize: 75, fontWeight: FontWeight.bold)), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz()))), // Boton falso
              new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
            
                  ],
                  
              ) ,
            )
          
        ],
      )
    );
  }
}