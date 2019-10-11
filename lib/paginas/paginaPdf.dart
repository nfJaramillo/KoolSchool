import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

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
        appBar: AppBar(
          title: Text('Texto Lenguaje Grado 1'),
        ),
        body: Center(
        child: _cargando
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: _documento)),
    );
  }
  
}