import 'package:flutter/material.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/UI/preguntaUI.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:Kool_School/UI/textInputUI.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/utils/quiz.dart';
import 'package:Kool_School/paginas/PaginaMenu.dart';

class PaginaFormulario extends StatefulWidget {

  PaginaFormularioState createState() => PaginaFormularioState();

}

class PaginaFormularioState extends State<PaginaFormulario> {

  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController preguntaCtrl = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Añadir Quiz'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(60.0),
            child: new Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            nuevoQuiz = true;
            save();
          },
          label: Text('Añadir pregunta'),
          icon: Icon(Icons.navigation),
          backgroundColor: Colors.green,
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

  String pregunta = '';
  String VoF ='';
  String rta;
  TextEditingController abiertaCtrl = new TextEditingController();
  TextEditingController op1Ctrl = new TextEditingController();
  TextEditingController op2Ctrl = new TextEditingController();
  TextEditingController op3Ctrl = new TextEditingController();
  TextEditingController op4Ctrl = new TextEditingController();
  List <Pregunta> preguntas;

  bool nuevoQuiz = false;

  Quiz quiz;


  Widget formUI() {
    return Column(
      children: <Widget>[
        if(nuevoQuiz == false)
          formItemsDesign(
              const IconData(58169, fontFamily: 'MaterialIcons',
                  matchTextDirection: true),
              TextFormField(
                controller: nameCtrl,
                decoration: new InputDecoration(
                  labelText: 'Pon aquí el Nombre del Quiz',
                ),
                validator: validateName,
              )),

        formItemsDesign(
            const IconData(0xe147, fontFamily: 'MaterialIcons'),
            TextFormField(
              controller: preguntaCtrl,
              decoration: new InputDecoration(
                labelText: 'Pregunta que desea añadir',
              ),
              validator: validatePregunta,
              maxLength: 200,
            )),
        formItemsDesign(
            null,
            Column(children: <Widget>[
              Text("Tipo pregunta"),
              RadioListTile<String>(
                title: const Text('Verdadero o falso'),
                value: 'VoF',
                groupValue: pregunta,
                onChanged: (value) {
                  setState(() {
                    pregunta = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Pregunta abierta'),
                value: 'a',
                groupValue: pregunta,
                onChanged: (value) {
                  setState(() {
                    pregunta = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Opción múltiple'),
                value: 'oM',
                groupValue: pregunta,
                onChanged: (value) {
                  setState(() {
                    pregunta = value;
                  });
                },
              ),
            ])),

        if ( pregunta == 'VoF')// Si es pregunta de VERDADERO O FALSO
          new Column(
              children: <Widget>[
                formItemsDesign(
                    null,
                    Column(children: <Widget>[
                      Text("Seleccionar respuesta correcta"),
                      RadioListTile<String>(
                        title: const Text('Verdadero'),
                        value: 'V',
                        groupValue: VoF,
                        onChanged: (value) {
                          setState(() {
                            VoF = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Falso'),
                        value: 'F',
                        groupValue: VoF,
                        onChanged: (value) {
                          setState(() {
                            VoF = value;
                          });
                        },
                      ),
                    ]))
              ]
          ),

        if( pregunta == 'a')
          new Column(
              children: <Widget>[
                formItemsDesign(
                  null,
                  Column(children: <Widget>[
                    Text('Ingresar respuesta correcta'),
                    TextFormField(
                      controller: abiertaCtrl,
                      decoration: new InputDecoration(
                        labelText: 'Ingresar respuesta correcta',
                      ),
                      validator: validateName,
                    )
                  ]
                  ),
                ),
              ]
          ),

        if( pregunta == 'oM')
          new Column(
              children: <Widget>[
                formItemsDesign(
                    null,
                    Column(children: <Widget>[
                      Text('Seleccionar e ingresar opciones de respuesta'),
                      RadioListTile<String>(
                        title: TextFormField(
                          controller: op1Ctrl,
                          decoration: new InputDecoration(
                            labelText: 'Ingresar opción de respuesta',
                          ),
                        ),
                        value: 'op1',
                        groupValue: rta,
                        onChanged: (value) {
                          setState(() {
                            rta = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: TextFormField(
                          controller: op2Ctrl,
                          decoration: new InputDecoration(
                            labelText: 'Ingresar opción de respuesta',
                          ),
                        ),
                        value: 'op2',
                        groupValue: rta,
                        onChanged: (value) {
                          setState(() {
                            rta = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: TextFormField(
                          controller: op3Ctrl,
                          decoration: new InputDecoration(
                            labelText: 'Ingresar opción de respuesta',
                          ),
                        ),
                        value: 'op3',
                        groupValue: rta,
                        onChanged: (value) {
                          setState(() {
                            rta = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: TextFormField(
                          controller: op4Ctrl,
                          decoration: new InputDecoration(
                            labelText: 'Ingresar opción de respuesta',
                          ),
                        ),
                        value: 'op4',
                        groupValue: rta,
                        onChanged: (value) {
                          setState(() {
                            rta = value;
                          });
                        },
                      ),
                    ]

                    )
                )
              ]
          ),

        GestureDetector(
            onTap: () {
              save();
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PaginaMenu(quiz)));

            }, child: Container(
          margin: new EdgeInsets.all(30.0),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            gradient: LinearGradient(colors: [
              Color(0xFF0EDED2),
              Color(0xFF03A0FE),
            ],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text("Guardar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          padding: EdgeInsets.only(top: 16, bottom: 16),
        ))
      ]
      ,
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

  String validatePregunta(String value) {
    String patttern = r'(^[a-zA-z]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "La pregunta es necesaria";
    }
    return null;
  }

  save() {

    if(pregunta == 'VoF') {
      preguntas = [
        new Pregunta.vofYabierta(
            preguntaCtrl.text, VoF, TipoDePregunta.vOF, [
          " Muy Bien Has Acertado ",
          " Qué mal, estudia mejor la próxima vez"
        ])
      ];
    }

    if( pregunta == 'a'){
      preguntas = [
        new Pregunta.vofYabierta(
            preguntaCtrl.text, abiertaCtrl.text, TipoDePregunta.abierta, [
          " Muy Bien Has Acertado ",
          " Qué mal, estudia mejor la próxima vez"
        ]
        )
      ];
    }

    if( pregunta == 'oM'){
      if( rta == 'op1'){
        preguntas = [
          new Pregunta.multiple(
              preguntaCtrl.text, op1Ctrl.text, TipoDePregunta.multiple, [
            op1Ctrl.text, op2Ctrl.text, op3Ctrl.text, op4Ctrl.text
          ] ,
              [  " Muy Bien Has Acertado ",
                " Qué mal, estudia mejor la próxima vez"]
          )
        ];
      }
      else if( rta == 'op2'){
        preguntas = [
          new Pregunta.multiple(
              preguntaCtrl.text, op2Ctrl.text, TipoDePregunta.multiple, [
            op1Ctrl.text, op2Ctrl.text, op3Ctrl.text, op4Ctrl.text
          ] ,
              [  " Muy Bien Has Acertado ",
                " Qué mal, estudia mejor la próxima vez"]
          )
        ];
      }
      else if( rta == 'op3'){
        preguntas = [
          new Pregunta.multiple(
              preguntaCtrl.text, op3Ctrl.text, TipoDePregunta.multiple, [
            op1Ctrl.text, op2Ctrl.text, op3Ctrl.text, op4Ctrl.text
          ] ,
              [  " Muy Bien Has Acertado ",
                " Qué mal, estudia mejor la próxima vez"]
          )
        ];
      }
      else
        preguntas = [
          new Pregunta.multiple(
              preguntaCtrl.text, op4Ctrl.text, TipoDePregunta.multiple, [
            op1Ctrl.text, op2Ctrl.text, op3Ctrl.text, op4Ctrl.text
          ] ,
              [  " Muy Bien Has Acertado ",
                " Qué mal, estudia mejor la próxima vez"]
          )
        ];
    }

    quiz = new Quiz({nameCtrl.text},preguntas);
  }



}
