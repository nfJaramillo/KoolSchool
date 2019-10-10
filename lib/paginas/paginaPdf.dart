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
   PDFDocument documento;

  bool cargando = false;
  
  PaginaPdfEstado()
  {
    cargarPdf();
  }

  cargarPdf() async {
    
  
     documento = await PDFDocument.fromAsset('assets/Texto Lenguaje Grado 1.pdf');

    setState(() {
      cargando = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: Text('Texto Lenguaje Grado 1'),
        ),
        body: Center(
        child: cargando
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: documento)),
    );
  }
  
}