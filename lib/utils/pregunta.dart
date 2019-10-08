class Pregunta{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

   /// Atributo donde se guarda la pregunta
   String pregunta;
   /// Atributo donde se guarda si la respuesta fue correcta o no
   bool respuesta;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que recibe una pregunta de tipo String y un boolean sobre si la respuesta es corrrecta o no
  Question(pPregunta,pRespuesta)
  {
    pregunta = pPregunta;
    respuesta = pRespuesta;
  }


}