import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:hyrule/domain/business/dao_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }

  @override
  Future<void> deleteEntry({required Entry entry}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Entry>> getSavedEntries() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveEntry({required Entry entry}) {
    throw UnimplementedError();
  }
}
