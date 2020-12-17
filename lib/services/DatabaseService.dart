import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database database;

  Future initDb()async{
    database = await openDatabase('rsp_db', version: 1);

    //cek apakah sudah pernah create table dengan sharedpreferences
    // kl belum create table
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(!sharedPreferences.containsKey('initDb')){
      await database.execute('CREATE TABLE login_story (id INTEGER PRIMARY KEY, email TEXT, count INTEGER)');
      print('berhasil init db');
      sharedPreferences.setBool('initDb', true);
    }
  }
}