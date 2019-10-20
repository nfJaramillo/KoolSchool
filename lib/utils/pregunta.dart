 
 
 enum TipoDePregunta {
    vOF, multiple, abierta
  }


class Pregunta{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

   /// Atributo donde se guarda la pregunta
   String _pregunta;
   /// Atributo donde se guarda si la respuesta fue correcta o no
   String _respuesta;
   /// Atributo que representa el tipo de pregunta
   TipoDePregunta _tipoDePregunta;
    /// Atributo que contiene una lista de opciones para Multiple
  List <String> _opciones;

  //----------------------------------------------
  // CONSTRUCTORES
  //----------------------------------------------

  /// Constructor para VoF y Abierta que recibe una pregunta de tipo String, un String para la respuesta y un enum para el tipo de pregunta
  Pregunta.vofYabierta(pPregunta, pRespuesta, pTipoDePregunta)
  {
    _pregunta = pPregunta;
    _respuesta = pRespuesta;
    _tipoDePregunta = pTipoDePregunta;
  }

  /// Constructor para Multiple que recibe una pregunta de tipo String, un String para la respuesta, un enum para el tipo de pregunta y una lista de 4 opciones
  Pregunta.multiple(pPregunta, pRespuesta, pTipoDePregunta, pOpciones)
  {
    _pregunta = pPregunta;
    _respuesta = pRespuesta;
    _tipoDePregunta = pTipoDePregunta;
    _opciones = pOpciones;
  }

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que retorna el texto de la pregunta
  String get darPregunta => _pregunta;

  /// Metodo que retorna la respuesta 
  String get darRespuesta => _respuesta;

  /// Metodo que returna el tipo de pregunta
  TipoDePregunta get darTipoDePregunta => _tipoDePregunta;

  /// Metofo que retorna las opciones
  List <String> get darOpciones =>  _opciones;





}