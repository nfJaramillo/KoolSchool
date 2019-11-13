

import 'package:Kool_School/paginas/paginaLecturaPdf.dart';

import 'package:Kool_School/paginas/paginaNuevaLectura.dart';

import 'package:Kool_School/paginas/paginaMenu.dart';
import 'package:Kool_School/paginas/paginaQuiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:path_provider/path_provider.dart';

import 'paginaFilePicker.dart';

class PaginaPdf extends StatefulWidget
{
  @override
   PaginaPdfEstado createState() => new PaginaPdfEstado();

}

class PaginaPdfEstado extends State<PaginaPdf>
{


  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  

  /// Atributo que tendra al documento pdf
  PDFDocument _documento;
  /// Lista de las rutas de los pdf
  //List <String> _nomrbresPDF;
  ///numero de arch
  int numeroArchivos;
  ///directorio
  String lolo;  

  List <String> colecciones;

  var ni;

  

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que llama al metodo cargarPdf(). Esto para que solo se llame una vez cuando de crea esta clase
  PaginaPdfEstado()
   {
    


    lolo = "";
    colecciones = [];

    
    //_nomrbresPDF = [];


    
    }
  


  //----------------------------------------------
  // METODOS
  //----------------------------------------------


  /// Metodo que carga el archivo desde un asset y mantiene el thread ahi mientras lo hace. En ese tiempo aparece el circulo de carga azul en la pantalla
  cargarPdf(int pNumeroPdf) async {
    //darNumeroArchivos();
     _documento = await PDFDocument.fromAsset(colecciones[pNumeroPdf]);
     Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new PaginaLecturaPdf(_documento,( () =>Navigator.of(context).push (new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz(quiz[pNumeroPdf])))))));
  }

  darNumeroArchivos() async {
      var ne = await getApplicationDocumentsDirectory();
      int val = await ne.list().length;
      numeroArchivos = val;
      print(numeroArchivos);
  }

  listarPDFs() async {
      
      var ne = await getApplicationDocumentsDirectory();
      
      int num = await ne.list().length;

      for(int i = 0; i<num; i++){

        var nuno = await ne.list().elementAt(i);
        
        
        lolo = nuno.path;
        //print(lolo);

        if(lolo.endsWith(".pdf")){ 
          String nombre =lolo.split('/').last;
          print("Hola aqui esta le nombre: "+nombre);
          colecciones.add(nombre);
        }

      //_nomrbresPDF.add("value");
      }
      //print(lista.length);
      //int ni = await nero.length;
      //print(ni);

      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new PaginaNuevaLectura(cons: colecciones)));
      }

      
  /// Metodo que dibujara el visor de pdf junto con un titilo y ayuda de la libreria
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
                    //for(int i =0; i <colecciones.length;i++)
                      new BotonUI3(Colors.amber, new Text("Lectura"), () => listarPDFs()),
           
                       Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                   new BotonUI2(Colors.limeAccent, new Text("Cargar"), () => Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) => new FilePickerDemo()))),
                        Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                  ],
                ),
          ),
        );
  }
  
}