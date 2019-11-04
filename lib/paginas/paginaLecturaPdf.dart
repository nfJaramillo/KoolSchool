import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PaginaLecturaPdf extends StatelessWidget
{
  final PDFDocument _documento;
 final VoidCallback _onTap;
  

  PaginaLecturaPdf (this._documento, this._onTap);

 
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title:  Text('Example'), 
          
          actions: <Widget>[

            // text
            new Center(
             child: new Text(
              "Quiz    ",  textAlign: TextAlign.center,
               style: new TextStyle(
               fontSize: MediaQuery.of(context).size.width * .016,
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),
             ),
            ),

            // action button
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () => _onTap(),
            ),
         
   
            ]
        ),
        body: Center(
        child:
        PDFViewer(document: _documento)),
        
    );
  }

}