import 'package:flutter/material.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/UI/preguntaUI.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:Kool_School/UI/textInputUI.dart';

 class PaginaFormulario extends StatelessWidget
 {

   TextEditingController nombreQuizCrtl = new TextEditingController();

   TextEditingController preguntaVoFCrtl = new TextEditingController();

   TextEditingController preguntaRVoFCrtl = new TextEditingController();

   TextEditingController preguntaACrtl = new TextEditingController();

   TextEditingController preguntaRACrtl = new TextEditingController();

   TextEditingController preguntaMCrtl = new TextEditingController();

   TextEditingController preguntaRMCrtl = new TextEditingController();

   GlobalKey<FormState> keyForm = new GlobalKey();


   Widget build(BuildContext context) {
     return new MaterialApp(
          home: new Scaffold(
          appBar: new AppBar(
          title: new Text('Añade tu Quiz'),
         ),
            body: new SingleChildScrollView(
              child: new Container(
                margin: new EdgeInsets.all(20.0),
                child: new Form(
                  key: keyForm,
                  child: formUI(),
                ),
              ),
            ),
       ),
     );

   }


   formItemsDesign(icon, item) {
     return Padding(
       padding: EdgeInsets.symmetric(vertical: 7),
       child: Card(child: ListTile(leading: Icon(icon), title: item)),
     );
   }

   String validateName(String value) {
     String pattern = r'(^[a-zA-Z ]*$)';
     RegExp regExp = new RegExp(pattern);
     if (value.length == 0) {
       return "El nombre es necesario";
     } else if (!regExp.hasMatch(value)) {
       return "El nombre debe de ser a-z y A-Z";
     }
     return null;
   }

   Widget formUI() {
     return  Column(
       children: <Widget>[
         //Aqui van los elementos de nuestro dormulario
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: nombreQuizCrtl,
               decoration: new InputDecoration(
                 labelText: ' ! Pon aquí el Nombre de tu Quiz ! ',
               ),
               validator: validateName,
             )),
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: preguntaVoFCrtl,
               decoration: new InputDecoration(
                 labelText: ' Añadir pregunta Verdadero o Falso ',
               ),
               validator: validateName,
             )),
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: preguntaRVoFCrtl,
               decoration: new InputDecoration(
                 labelText: ' Añadir respuesta pregunta Verdadero o Falso ',
               ),
               validator: validateName,
             )),
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: preguntaACrtl,
               decoration: new InputDecoration(
                 labelText: ' Añadir pregunta Abierta ',
               ),
               validator: validateName,
             )),
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: preguntaRACrtl,
               decoration: new InputDecoration(
                 labelText: ' Añadir respuesta pregunta Abierta ',
               ),
               validator: validateName,
             )),
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: preguntaMCrtl,
               decoration: new InputDecoration(
                 labelText: ' Añadir  pregunta Opción Múltiple ',
               ),
               validator: validateName,
             )),
         formItemsDesign(
             const IconData(59515, fontFamily: 'MaterialIcons'),
             TextFormField(
               controller: preguntaRMCrtl,
               decoration: new InputDecoration(
                 labelText: ' Añadir respuesta pregunta Opción Múltiple ',
               ),
               validator: validateName,
             ))

       ],
     );
   }

 }




