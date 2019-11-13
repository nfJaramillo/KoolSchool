import 'package:sqflite/sqflite.dart';


abstract class TableElement{
  int id;
  final String tableTame;
  TableElement(this.id, this.tableName);

  void createTable();
  Map<String, dynamic> toMap();
}

class Pregunta extends TableElement{

  static final TABLE_NAME="preguntas"
  String enunciado;
  String[] respuestas;
  String correcta;
  Sring tema;
  String tipo;

  Pregunta({this.enunciado, this.respuestas, this.correcta, this.tema, this.tipo}):superid(id,"TABLE_NAME")


  void createTable()
  {
  db.rawUpdate("CREATE TABLE ${TABLE_NAME}(_id integer primary key autoincrement, enunciado varchar(50), respuestas varchar(200), correcta char, tema varchar(30), tipo char")

  }

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{"enunciado":this.enunciado,"respuestas":this.respuestas,"correcta":this.correcta,"tema":this.tema,"tipo":this.tipo};
    if(this.id != null){
      map["_id"] = id;
    }
    return map;
  }

}

Future<Database> open() async {
  try{
    String databasesPath = await getDatabasesPath();
    String path = "$databasesPath/$DB_FILE_NAME";
    var db  = await openDatabase(path,
        version: 1,
        onCreate: (Database database, int version) {
          new Pregunta().createTable(database);
        });
    return db;
  }catch(e){
    print(e.toString());
  }
  return null;
}

Future<List<Ciudad>> getList() async{
  Database dbClient = await db;

  List<Map> maps = await dbClient.query(Ciudad.TABLE_NAME,
      columns: ["_id", "title"]);

  return maps.map((i)=> Ciudad.fromMap(i)).toList();
}
Future<TableElement> insert(TableElement element) async {
  var dbClient = await db;

  element.id = await dbClient.insert(element.tableName, element.toMap());
  print("new Id ${element.id}");
  return element;
}
Future<int> delete(TableElement element) async {
  var dbClient = await db;
  return await dbClient.delete(element.tableName, where: '_id = ?', whereArgs: [element.id]);

}
Future<int> update(TableElement element) async {
  var dbClient = await db;

  return await dbClient.update(element.tableName, element.toMap(),
      where: '_id = ?', whereArgs: [element.id]);
}
}