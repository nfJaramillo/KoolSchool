import 'package:flutter/material.dart';

import 'package:Kool_School/paginas/paginaLecturaPdf.dart';

import 'package:Kool_School/paginas/paginaMenu.dart';
import 'package:Kool_School/paginas/paginaQuiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:path_provider/path_provider.dart';

import 'paginaFilePicker.dart';

class PaginaNuevaLectura extends StatefulWidget
{
    final List<String> cons;
  
    PaginaNuevaLectura({Key key, this.cons}): super(key: key);


 
   PaginaNuevaLecturaEstado createState() => new PaginaNuevaLecturaEstado();

}

class PaginaNuevaLecturaEstado extends State<PaginaNuevaLectura>
{

   List<String> lista;

  PaginaNuevaLecturaEstado (){
    lista = [];
    //lista = widget.cons;
  }

  moverPdf(int pNumeroPdf){
 
      lista = widget.cons;
  }

 
  cargarPdf(int pNumeroPdf) async {
    //darNumeroArchivos();
    PDFDocument _documento = await PDFDocument.fromPath(widget.cons[pNumeroPdf]);
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new PaginaLecturaPdf(_documento,( () =>Navigator.of(context).push (new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz(quiz[pNumeroPdf])))))));

    

  }
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        backgroundColor: Colors.redAccent,
        body: SingleChildScrollView(
          
          child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    //Padding(padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02)),
                    for(int i =0; i <widget.cons.length;i++)
                      new BotonUI3(Colors.amber, new Text(widget.cons[i]), () => cargarPdf(i)),
           
                       Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                  
                  ],
                ),
          ),
        );
  }

}