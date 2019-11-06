import 'package:Kool_School/paginas/paginaLecturaPdf.dart';
import 'package:Kool_School/paginas/paginaMenu.dart';
import 'package:Kool_School/paginas/paginaQuiz.dart';
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

  List<String> _nombresConOrtografia = ["Historia Indígena (Español 1°)", "Las Lunas de Júpiter (Ciencias 4°)", "Las Vacunas (Ciencias 5°)", "Los Sentidos (Naturales 2°)"  ];

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que llama al metodo cargarPdf(). Esto para que solo se llame una vez cuando de crea esta clase
  PaginaPdfEstado()
  {
    _nomrbresPDF = ["assets/Historia Indigena (Español 1°).pdf",'assets/Las lunas de jupiter (Ciencias 4°).pdf','assets/Las vacunas (Ciencias 5°).pdf','assets/Los sentidos (Naturales 2°).pdf'];
  }
<<<<<<< HEAD


=======
  
>>>>>>> 049ceef4c0e69a73edca8c618ce55f870985d53f


  //----------------------------------------------
  // METODOS
  //----------------------------------------------


  /// Metodo que carga el archivo desde un asset y mantiene el thread ahi mientras lo hace. En ese tiempo aparece el circulo de carga azul en la pantalla
  cargarPdf(int pNumeroPdf) async {
<<<<<<< HEAD

    _documento = await PDFDocument.fromAsset(_nomrbresPDF[pNumeroPdf]);
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new PaginaLecturaPdf(_documento,( () =>Navigator.of(context).push (new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz(quiz[pNumeroPdf])))))));
=======
    
     _documento = await PDFDocument.fromAsset(_nomrbresPDF[pNumeroPdf]);
     Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new PaginaLecturaPdf(_documento,( () =>Navigator.of(context).push (new MaterialPageRoute(builder: (BuildContext context) => new PaginaQuiz(quiz[pNumeroPdf])))))));
>>>>>>> 049ceef4c0e69a73edca8c618ce55f870985d53f
  }

  /// Metodo que dibujara el visor de pdf junto con un titilo y ayuda de la libreria
  @override
  Widget build(BuildContext context) {
    List<int> valuesForColor = [600, 700, 800, 900];
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: Colors.purple[600],
      body: SingleChildScrollView(

        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [

            for(int i =0; i<_nomrbresPDF.length;i++)
            //Padding(padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02))
              new BotonUI3(Colors.amber[valuesForColor[i%4]], new Text(_nombresConOrtografia[i]), () => cargarPdf(i)),

            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
            new BotonUI2(Colors.purple[900], new Text("Otros"), () => Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) => new FilePickerDemo()))),
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
          ],
        ),
      ),
    );
=======
   return Scaffold(
        backgroundColor: Colors.purple[600],
        body: SingleChildScrollView(
          
          child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [

                    for(int i =0; i<_nomrbresPDF.length;i++)
                      //Padding(padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02))
                       new BotonUI3(Colors.amber[valuesForColor[i%4]], new Text(_nombresConOrtografia[i]), () => cargarPdf(i)),
           
                       Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                   new BotonUI2(Colors.purple[900], new Text("Otros"), () => Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) => new FilePickerDemo()))),
                        Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .015), // Añade espacio entre los textos
            ),
                  ],
                ),
          ),
        );
>>>>>>> 049ceef4c0e69a73edca8c618ce55f870985d53f
  }

}

}