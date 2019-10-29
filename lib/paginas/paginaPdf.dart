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

  /// Atributo booleano que dira si se esta cargando el documento o no
  bool _cargando = false;
  
  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que llama al metodo cargarPdf(). Esto para que solo se llame una vez cuando de crea esta clase
  PaginaPdfEstado()
  {
    cargarPdf();
  }

  

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  cambiarTexto1(String txt) async{
    
      _documento = await PDFDocument.fromAsset('assets/Sentidos.pdf'); 
    
      PDFViewer(document: _documento);
  }
  cambiarTexto2(String txt) async{
    
      _documento = await PDFDocument.fromAsset('assets/LunasJupiter.pdf'); 
    
      PDFViewer(document: _documento);
  }
  cambiarTexto3(String txt) async{
    
      _documento = await PDFDocument.fromAsset('assets/Vacunas.pdf'); 
    
      PDFViewer(document: _documento);
  }

  /// Metodo que carga el archivo desde un asset y mantiene el thread ahi mientras lo hace. En ese tiempo aparece el circulo de carga azul en la pantalla
  cargarPdf() async {
    
     
     _documento = await PDFDocument.fromAsset('assets/Texto Lenguaje Grado 1.pdf');

    setState(() {
      _cargando = false; 
    });
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
                     Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02), // Añade espacio entre los textos
            ),
                    new BotonUI(Colors.green, new Text("Historia Indigena (Español 1°)"), () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>
                                      PDFViewer(document: _documento)))),
                    
                    
                     Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                    new BotonUI(Colors.indigo, new Text("Las lunas de jupiter (Ciencias 4°)"), () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>cambiarTexto2('LunasJupiter')))),
                   
                    Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                  new BotonUI(Colors.blue, new Text("Las vacunas (Ciencias 5°)"), () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>
                                       cambiarTexto3('Vacunas')))),
                          Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                  new BotonUI(Colors.black54, new Text("Los sentidos (Naturales 2°)"), () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>
                                      cambiarTexto1('Sentidos')))),
                     
                     
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