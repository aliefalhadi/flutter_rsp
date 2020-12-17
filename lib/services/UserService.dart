import 'package:flutterstarter/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

import '../locator.dart';

class UserService{
  Database database = locator<DatabaseService>().database;

  Future getDataByEmail(String email) async{
    List<Map> list = await database.rawQuery('SELECT * FROM login_story where email= ?',[email]);
    print(list);
    return list;
  }

  Future<bool> addData(List data) async{
    try{
      await database.rawInsert('INSERT INTO login_story(email, count) VALUES(?, ?)', data);
      return true;
    }catch(e) {
      return false;
    }
  }


  Future<bool> updateLoginCount(List data) async{
    try{
      await database.rawUpdate('UPDATE login_story SET count = ? WHERE email = ?', data);
      return true;
    }catch(e) {
      return false;
    }
  }
}