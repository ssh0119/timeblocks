import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/repositories/persistable.dart';

const String tableName = 'timeblocks';

class TimeblocksRepository with Persistable {
  static void addTimeblock(Timeblock timeblock) {
    insertRecord(tableName, timeblock.toMap());

  }
}
