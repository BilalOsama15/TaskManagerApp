import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:task_manager/Models/Task_model.dart';
class DBHelper {

  static Database? _db ;

  Future<Database?> get db async {
    if(_db != null){
      return _db!;
    }

    _db = await initDatabase();
    return _db;
  }

  initDatabase()async{
     String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'task.db');
    var db = await openDatabase(dbPath , version: 1 , onCreate: _onCreate,);
    
    return await db ;
  }

  _onCreate (Database db , int version )async{
    await db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, description TEXT,dueDate TEXT,priority TEXT,status TEXT)');
  }

    insert(task task)async{
   // print(cart.toMap());
    var dbClient = await db ;
     await dbClient!.insert('tasks', task.toMap());
     print(task.status);
     
  }
Future<List<task>?> getAllTask() async {
 try {
    var dbClient = await db;
    if (dbClient == null) {
      print("akjshd");
      // Handle the case where dbClient is null (e.g., database not properly initialized)
      return null;
    }
    final List<Map<String, dynamic>> queryResult = await dbClient.query('tasks');
    return queryResult.map((e) => task.fromMap(e)).toList();
  } catch (e) {
    print('Error while fetching tasks data: $e');
    return null;
  }
}
 Future<List<task>?> getTaskByStatus(String status) async {
 try {
    var dbClient = await db;
    if (dbClient == null) {
      print("Database not properly initialized");
      return null;
    }
    final List<Map<String, dynamic>> queryResult =
        await dbClient.query('tasks', where: 'status = ?', whereArgs: [status]);
    return queryResult.map((e) => task.fromMap(e)).toList();
  } catch (e) {
    print('Error while fetching tasks data: $e');
    return null;
  }
}

//   Future<int> delete(int id)async{
//     var dbClient = await db ;
//     return await dbClient!.delete(
//       'carts',
//       where: 'id = ?',
//       whereArgs: [id]
//     );
//   }
// Future<int> deleteall()async{
//     var dbClient = await db ;
//     return await dbClient!.delete(
//       'carts',
//     );
//   }
  Future<int> updateTask(task task, int id)async{
    var dbClient = await db ;
    return await dbClient!.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [id]
    );
  }
   Future<int> updateStatus(bool newStatus, int id)async{
    try {
    var dbClient = await db;
    if (dbClient == null) {
      return 0; // Handle the case where dbClient is null
    }

    final Map<String, dynamic> updateData = {
      'status': newStatus ? 'completed' : 'pending',
    };

    return await dbClient.update(
      'tasks',
      updateData,
      where: 'id = ?',
      whereArgs: [id],
    );
  } catch (e) {
    print('Error while updating task status: $e');
    return 0; // Handle the error case
  }
  }
}