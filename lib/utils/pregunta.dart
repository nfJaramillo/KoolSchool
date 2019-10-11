class Pregunta{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

   /// Atributo donde se guarda la pregunta
   String _pregunta;
   /// Atributo donde se guarda si la respuesta fue correcta o no
   bool _respuesta;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que recibe una pregunta de tipo String y un boolean sobre si la respuesta es corrrecta o no
  Pregunta(pPregunta, pRespuesta)
  {
    _pregunta = pPregunta;
    _respuesta = pRespuesta;
  }

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que retorna el texto de la pregunta
  String get darPregunta => _pregunta;

  /// Metodo que retorna la respuesta 
  bool get darRespuesta => _respuesta;





}