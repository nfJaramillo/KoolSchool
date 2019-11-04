import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:Kool_School/UI/botonUI.dart';

import 'paginaFilePicker.dart';

class PaginaPdf extends StatefulWidget
{
  @override
   State createState  () => new PaginaPdfEstado();

}

class PaginaPdfEstado extends State<PaginaPdf>
{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  

  /// Atributo que tendra al documento pdf
  PDFDocument _documento;
  /// Lista de las rutas de los pdf
  List <String> _nomrbresPDF;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que llama al metodo cargarPdf(). Esto para que solo se llame una vez cuando de crea esta clase
  PaginaPdfEstado()
  {
    _nomrbresPDF = ["assets/Historia Indigena (Español 1°).pdf",'assets/Las lunas de jupiter (Ciencias 4°).pdf','assets/Las vacunas (Ciencias 5°).pdf','assets/Los sentidos (Naturales 2°).pdf'];
  }
  


  //----------------------------------------------
  // METODOS
  //----------------------------------------------


  /// Metodo que carga el archivo desde un asset y mantiene el thread ahi mientras lo hace. En ese tiempo aparece el circulo de carga azul en la pantalla
  cargarPdf(int pNumeroPdf) async {
    
     _documento = await PDFDocument.fromAsset(_nomrbresPDF[pNumeroPdf]);
     Navigator.of(context).push(new MaterialPageRoute(builder: (context) => PDFViewer(document: _documento)));
  }
 

  /// Metodo que dibujara el visor de pdf junto con un titilo y ayuda de la libreria
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Center(
          
          child: Builder(
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    for(int i =0; i<_nomrbresPDF.length;i++)
                   // Padding(padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02),), 
                    new BotonUI(Colors.amber, new Text(_nomrbresPDF[i].substring(7,_nomrbresPDF[i].length-4)), () => cargarPdf(i)),
                    
                     
                     
                       Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                   new BotonUI(Colors.limeAccent, new Text("Otros"), () => Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) => new FilePickerDemo()))),
                        Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                  ],
                ),
          ),
        ),

    
    );
  }
  
}