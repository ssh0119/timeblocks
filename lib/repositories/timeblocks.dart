import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/repositories/persistable.dart';

const String tableName = 'timeblocks';

class TimeblocksRepository with Persistable {
  Future<int> addTimeblock(Timeblock timeblock) async {
    int id = await insertRecord(tableName, timeblock.toMap());

    return id;
  }

  Future<List<Timeblock>> list() async {
    List<Map> results = await fetchAll(tableName);

    return results.map(
      (result) {
        return Timeblock.fromDB(
          name: result['name'],
          id: result['id'],
        );
      },
    ).toList();
  }

  int removeTimeblock(int id) {
    // ...

    return id;
  }

  Timeblock updateTimeblock(Timeblock timeblock) {
    // ...
    return timeblock;
  }
}
