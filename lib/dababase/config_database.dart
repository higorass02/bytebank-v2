
import 'package:path/path.dart';
import 'package:projeto2/dababase/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (diretorioBancoDeDados) {
      String caminhoDoDiretorioDoDB = join(diretorioBancoDeDados, 'bytebank.db');

      return openDatabase(
        caminhoDoDiretorioDoDB,
        version: 1,
        //onDowngrade: (banco,anterior,atual){ banco.execute('delete CONTACT'); },
        //onUpgrade: (banco,anterior,atual){ banco.execute('delete CONTACT'); },
        //onDowngrade:onDatabaseDowngradeDelete,
        //onUpgrade: (banco,anterior,atual){ banco.execute('drop table CONTACT'); },
        onCreate: (banco,versao){
          banco.execute(ContactDao.tableSql);
        }
      );
    }
  );
}

