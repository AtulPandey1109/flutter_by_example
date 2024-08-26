import 'package:intl/intl.dart';
import 'package:my_login_app/utils/local_database.dart';
import 'package:sqflite/sqflite.dart';

import 'dairy.dart';

class MyDb{
  final table ='DAIRY';

  Future<void> createTable(Database database) async{
    await database.execute( """
      CREATE TABLE IF NOT EXISTS $table(
      "id" INTEGER NOT NULL,
      "title" TEXT NOT NULL,
      "content" TEXT NOT NULL,
      "created_at" TEXT,
      PRIMARY KEY("ID" AUTOINCREMENT)
      );
      """
    );
  }

  Future<int> add({required String title,required String content}) async{
    final db= await LocalDatabase().database;
    return await db.rawInsert(
        '''INSERT INTO $table (TITLE,CONTENT,CREATED_AT) VALUES (?,?,?)''',
        [title,content,DateFormat.yMd().format(DateTime.now())
        ]
    );
  }

  Future<List<Dairy>> fetchDairies() async {
    final db =await LocalDatabase().database;
    final dairies = await db.rawQuery('''
    SELECT * FROM $table ORDER BY created_at
    ''');
    return  dairies.map((dairy)=>Dairy.fromSql(dairy)).toList();
  }

  Future<void> deletePage(int id) async{
    final db = await LocalDatabase().database;
    await db.rawDelete('''
    DELETE FROM $table WHERE id =?
    ''',[id]);
  }
Future<void> update({required int id, String? title, String? content  }) async{
  final db = await LocalDatabase().database;
  int test=await db.update(table,{
    if(title!=null)'title':title,
    if(content!=null) 'content':content
  },
  where: 'id =?',
    whereArgs: [id],
    conflictAlgorithm: ConflictAlgorithm.rollback
  );
}

}